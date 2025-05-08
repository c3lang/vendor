import std::io;
import libc;
import lz4;

fn void test_version_string() @test {
    lz4::version_string();
}

fn void test_version_number() @test {
    lz4::version_number();
}

fn void test_compress_and_decompres() @test {
    ZString input = "This is a test string to compress using LZ4!";
    int originalSize = (int) libc::strlen(input) + 1; 

    int maxCompressedSize = lz4::compress_bound(originalSize); 

    char* compressedData = (char*) malloc(maxCompressedSize);
    defer free(compressedData);
    if (compressedData == null)
    {
        abort("memalloc failed");
    }

    int compressedSize = lz4::compress_default(input, compressedData, originalSize, maxCompressedSize);
    if (compressedSize <= 0)
    {	
		abort("compression failed");
    }

    char *decompressedData = (char *)malloc(originalSize);  
    defer free(decompressedData);
    if (!decompressedData) {
        abort("memalloc failed");
    }

    int decompressedSize = lz4::decompress_safe(compressedData, decompressedData, compressedSize, originalSize);
    
    assert(decompressedSize == originalSize);
}
