module main

pub fn Buffer.from_int8array(array []i8) Buffer {
	mut data := []u8{len: array.len}
	for i in 0 .. array.len {
		if array[i] < 0 {
			data[i] = u8(256 + array[i])
		} else {
			data[i] = u8(array[i])
		}
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_int16learray(array []i16) Buffer {
	mut data := []u8{len: array.len * 2}
	for i in 0 .. array.len {
		data[i * 2] = u8(array[i])
		data[i * 2 + 1] = u8(array[i] >> 8)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_int16bearray(array []i16) Buffer {
	mut data := []u8{len: array.len * 2}
	for i in 0 .. array.len {
		data[i * 2 + 1] = u8(array[i])
		data[i * 2] = u8(array[i] >> 8)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_int32learray(array []int) Buffer {
	mut data := []u8{len: array.len * 4}
	for i in 0 .. array.len {
		data[i * 4] = u8(array[i])
		data[i * 4 + 1] = u8(array[i] >> 8)
		data[i * 4 + 2] = u8(array[i] >> 16)
		data[i * 4 + 3] = u8(array[i] >> 24)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_int32bearray(array []int) Buffer {
	mut data := []u8{len: array.len * 4}
	for i in 0 .. array.len {
		data[i * 4 + 3] = u8(array[i])
		data[i * 4 + 2] = u8(array[i] >> 8)
		data[i * 4 + 1] = u8(array[i] >> 16)
		data[i * 4] = u8(array[i] >> 24)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_int64learray(array []i64) Buffer {
	mut data := []u8{len: array.len * 8}
	for i in 0 .. array.len {
		data[i * 8] = u8(array[i])
		data[i * 8 + 1] = u8(array[i] >> 8)
		data[i * 8 + 2] = u8(array[i] >> 16)
		data[i * 8 + 3] = u8(array[i] >> 24)
		data[i * 8 + 4] = u8(array[i] >> 32)
		data[i * 8 + 5] = u8(array[i] >> 40)
		data[i * 8 + 6] = u8(array[i] >> 48)
		data[i * 8 + 7] = u8(array[i] >> 56)
	}
	return Buffer{
		data: data
	}
}

pub fn Buffer.from_int64bearray(array []i64) Buffer {
	mut data := []u8{len: array.len * 8}
	for i in 0 .. array.len {
		data[i * 8 + 7] = u8(array[i])
		data[i * 8 + 6] = u8(array[i] >> 8)
		data[i * 8 + 5] = u8(array[i] >> 16)
		data[i * 8 + 4] = u8(array[i] >> 24)
		data[i * 8 + 3] = u8(array[i] >> 32)
		data[i * 8 + 2] = u8(array[i] >> 40)
		data[i * 8 + 1] = u8(array[i] >> 48)
		data[i * 8] = u8(array[i] >> 56)
	}
	return Buffer{
		data: data
	}
}