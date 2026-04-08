module lz4_test;
import lz4;
import std::io;
import libc;

fn void test_version_string() @test
{
	lz4::version_string();
}

fn void test_version_number() @test
{
	lz4::version_number();
}

fn void test_compress_decompress() @test
{
	ZString input = "Hello C3 World! LZ4 compression test.";
	int srcSize = (int)libc::strlen(input) + 1;
	int maxDstSize = lz4::compress_bound(srcSize);

	char* compressed = (char*)malloc(maxDstSize);
	defer free(compressed);

	int compressedSize = lz4::compress_default((char*)input, compressed, srcSize, maxDstSize);
	assert (compressedSize > 0);

	char* decompressed = (char*)malloc(srcSize);
	defer free(decompressed);

	int decompressedSize = lz4::decompress_safe(compressed, decompressed, compressedSize, srcSize);
	assert (decompressedSize == srcSize);
	assert (libc::strcmp(input, (ZString)decompressed) == 0);
}