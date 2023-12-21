pub fn Buffer.from_utf8(str string) Buffer {
	return Buffer{
		data: str.bytes()
	}
}