# spng-c3
A c3 binding for libspng/spng.c, a simple PNG file reader and writer. It has a lighter footprint and simpler interface than libpng but is still secure.

https://libspng.org/

The binding data was generated with GNOME's girtools and converted with pyramid. Most of the interface is methods attached to a spng::Context object. This should be allocated with spng::new or spng::new2, and freed with spng::Context.free rather than using c3 memory allocation.

## Usage

The binding is one file, compile it along with any other source files. The module name is 'spng'. There are two ways to link.

Firstly, you can add "spng" and "z" to project.json as a linked libraries. Most linux distros include libspng by default.

Secondly, given that libspng is designed to be small and portable, it is written as only one C file. You can simply add that one file to the project as a c-source file.

By default, spng uses zlib. This is a very common library and almost every linux distro will already have it installed. It is possible to use 'miniz' as an alternative,.

### Example code
```
fn bool load_png (String path) {
	spng::Context *spng = spng::new (0);

	if (spng) {
		defer spng.free ();
		CFile fpPNG = libc::fopen (path.zstr_tcopy (), "rb");

		if (fpPNG) {
			defer libc::fclose (fpPNG);
			spng::Ihdr pngHdr;
			spng.set_png_file (fpPNG);
			spng.get_ihdr (&pngHdr);

			spng::Format spngFmt;
			int width = pngHdr.width;
			int height = pngHdr.height;

			switch (pngHdr.color_type) {
				case ColorType.GRAYSCALE:
					spngFmt = Format.G8;
					break;

				case ColorType.TRUECOLOR:
				case ColorType.INDEXED:
					spngFmt = Format.RGB8;
					break;

				case ColorType.TRUECOLOR_ALPHA:
					spngFmt = Format.RGBA8;
					break;
			}

      		usz size;
			spng.decoded_image_size (spngFmt, &size);
			char* pixels = libc::malloc (size);

			if (pixels) {
				spng.decode_image (pixels, size, spngFmt, 0);
        		libc::free (pixels);
				return true;
			}
		}
	}

	return false;
}
```
This example simply reads an image into a buffer and throws it away again. In practice the resulting array of pixel data (with a known format and size) would be used by another graphics API; OpenGL, Vulkan, SDL, Cairo or similar.

While this example only reads an image, libspng can also write PNG files. Full documentation is available [here](https://libspng.org/docs/).

