module main

pub fn Buffer.from_uint8array(array []u8) Buffer {
	return Buffer{
		data: array
	}
}

pub fn Buffer.from_uint16learray(array []u16) Buffer {
	mut data := []u8{len: array.len * 2}
	for i in 0..array.len {
		data[i * 2] = u8(array[i] & 0xff)
		data[i * 2 + 1] = u8(array[i] >> 8)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_uint16bearray(array []u16) Buffer {
	mut data := []u8{len: array.len * 2}
	for i in 0..array.len {
		data[i * 2] = u8(array[i] >> 8)
		data[i * 2 + 1] = u8(array[i] & 0xff)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_uint32learray(array []u32) Buffer {
	mut data := []u8{len: array.len * 4}
	for i in 0..array.len {
		data[i * 4] = u8(array[i] & 0xff)
		data[i * 4 + 1] = u8((array[i] >> 8) & 0xff)
		data[i * 4 + 2] = u8((array[i] >> 16) & 0xff)
		data[i * 4 + 3] = u8((array[i] >> 24) & 0xff)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_uint32bearray(array []u32) Buffer {
	mut data := []u8{len: array.len * 4}
	for i in 0..array.len {
		data[i * 4] = u8((array[i] >> 24) & 0xff)
		data[i * 4 + 1] = u8((array[i] >> 16) & 0xff)
		data[i * 4 + 2] = u8((array[i] >> 8) & 0xff)
		data[i * 4 + 3] = u8(array[i] & 0xff)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_uint64learray(array []u64) Buffer {
	mut data := []u8{len: array.len * 8}
	for i in 0..array.len {
		data[i * 8] = u8(array[i] & 0xff)
		data[i * 8 + 1] = u8((array[i] >> 8) & 0xff)
		data[i * 8 + 2] = u8((array[i] >> 16) & 0xff)
		data[i * 8 + 3] = u8((array[i] >> 24) & 0xff)
		data[i * 8 + 4] = u8((array[i] >> 32) & 0xff)
		data[i * 8 + 5] = u8((array[i] >> 40) & 0xff)
		data[i * 8 + 6] = u8((array[i] >> 48) & 0xff)
		data[i * 8 + 7] = u8((array[i] >> 56) & 0xff)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_uint64bearray(array []u64) Buffer {
	mut data := []u8{len: array.len * 8}
	for i in 0..array.len {
		data[i * 8] = u8((array[i] >> 56) & 0xff)
		data[i * 8 + 1] = u8((array[i] >> 48) & 0xff)
		data[i * 8 + 2] = u8((array[i] >> 40) & 0xff)
		data[i * 8 + 3] = u8((array[i] >> 32) & 0xff)
		data[i * 8 + 4] = u8((array[i] >> 24) & 0xff)
		data[i * 8 + 5] = u8((array[i] >> 16) & 0xff)
		data[i * 8 + 6] = u8((array[i] >> 8) & 0xff)
		data[i * 8 + 7] = u8(array[i] & 0xff)
	}
	return Buffer{
		data: data
	}
}