module main

import rand

pub struct Buffer {
mut:
	data []u8
}

// Create a new Buffer with byte_length bytes.
pub fn Buffer.alloc(byte_length int) Buffer {
	return Buffer{
		data: []u8{len: byte_length}
	}
}

// Create a new Buffer with byte_length bytes, filled with fill.
pub fn Buffer.alloc_fill(byte_length int, fill u8) Buffer {
	return Buffer{
		data: []u8{len: byte_length, init: fill}
	}
}

// Create a new Buffer with byte_length bytes, but the contents are random.
pub fn Buffer.alloc_unsafe(byte_length int) Buffer {
	return Buffer{
		data: rand.bytes(byte_length) or { []u8{len: byte_length} }
	}
}

// Compares two buffers.
// If a[i] < b[i], result[i] = -1
//
// If a[i] > b[i], result[i] = 1
//
// If a[i] == b[i], result[i] = 0
pub fn Buffer.compare(a Buffer, b Buffer) ![]i8 {
	if a.data.len != b.data.len {
		return error('Buffers have different lengths')
	}
	mut result := []i8{len: a.data.len}
	for i in 0 .. a.data.len {
		if a.data[i] < b.data[i] {
			result[i] = -1
		} else if a.data[i] > b.data[i] {
			result[i] = 1
		} else {
			result[i] = 0
		}
	}
	return result
}

// Merges multiple buffers into one.
pub fn Buffer.concat(buffers ...Buffer) Buffer {
	mut length := 0
	for buffer in buffers {
		length += buffer.data.len
	}
	mut data := []u8{len: 0, cap: length}
	for buffer in buffers {
		data << buffer.data
	}
	return Buffer{
		data: data
	}
}

// Gives an overview of the buffer.
pub fn (buffer Buffer) str() string {
	mut datastr := ''
	mut iterations := buffer.data.len
	if iterations > 50 {
		iterations = 50
	}
	for i in 0 .. iterations {
		datastr += ' ${buffer.data[i]:02x}'
	}
	if iterations < buffer.data.len {
		datastr += ' ... ' + (buffer.data.len - iterations).str() + ' more bytes'
	}
	return '<Buffer${datastr}>'
}
