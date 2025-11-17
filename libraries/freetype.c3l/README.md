# FreeType bindings

It is tested only on arm macos.

To make it work on other systems you need to add your platform to `manifest.json`, something like this:

```json
"macos-aarch64": {
  // Extra flags to the linker for this target:
  "link-args": [
    "-I/opt/homebrew/opt/freetype/include/freetype2",
    "-L/opt/homebrew/opt/freetype/lib"
  ],
  // C3 libraries this target depends on:
  "dependencies": [],
  // The external libraries to link for this target:
  "linked-libraries": [
    "freetype"
  ]
}
```

`link-args` and `linked-libraries` can be found with this commands.

```bash
$ freetype-config --libs
-L/opt/homebrew/opt/freetype/lib -lfreetype
$ freetype-config --cflags
-I/opt/homebrew/opt/freetype/include/freetype2
```

Note that `-L/opt/homebrew/opt/freetype/lib` goes to `link-args` and not to `linked-libraries`.

Here is a simple program that draws text in the terminal:

```cpp
import freetype;
import std::io;

fn int main() {
    mem::@report_heap_allocs_in_scope() {
        ft::Library library;
        defer ft::doneFreeType(library);
        ft::Face face;
        defer ft::doneFace(face);
        CInt err;

        // init freetype lib
        err = ft::initFreeType(&library);
        if (err != 0) {
            io::printfn("init free type err: %s", ft::CINT_TO_ERROR[err]);
            return -1;
        }

        // load face
        err = ft::newFace(library, "/Library/Fonts/Arial Unicode.ttf", 0, &face);
        if (err != 0) {
            io::printfn("can't load font: %s", ft::CINT_TO_ERROR[err]);
            return -1;
        }

        // set font size
        err = ft::setPixelSizes(face, 80, 0);
        if (err != 0) {
            io::printfn("can't set pixel sizes: %s", ft::CINT_TO_ERROR[err]);
            return -1;
        }

        err = ft::loadChar(face, 'A', ft::LOAD_RENDER);
        if (err != 0) {
            io::printfn("can't load char: %s", ft::CINT_TO_ERROR[err]);
            return -1;
        }

        char[1024][1024] pixels;

        for (int x = 0; x < face.glyph.bitmap.width; x++) {
            for (int y = 0; y < face.glyph.bitmap.rows; y++) {
                pixels[y][x] |= face.glyph.bitmap.buffer[y * face.glyph.bitmap.width + x];
            }
        }

        for (int y = 0; y < face.glyph.bitmap.rows; y++) {
            for (int x = 0; x < face.glyph.bitmap.width; x++) {
                if (pixels[y][x] == 0) {
                    io::printf(" ");
                } else if (pixels[y][x] < 128) {
                    io::printf("+");
                } else {
                    io::printf("*");
                }
            }
            io::printf("\n");
        }


    };

    return 0;
}
```

You should get something like this:
```
                      +********+
                      **********
                     +**********+
                     +***********
                     ************+
                    +************+
                    **************
                   +******+*******+
                   +******++*******
                   *******++*******+
                  +*******  *******+
                  ********  ********
                 +*******+  +*******+
                 +*******+   ********
                 ********    +*******+
                +*******+    +*******+
                +*******+     ********
                ********      +*******+
               +*******+      +********
               ********        ********+
              +*******+        +*******+
              +*******+         ********+
              ********          +*******+
             +*******+          +********
             ********+           ********+
            +********            +********
            +*******+            +********+
            ********              ********+
           +*******+              +********
           +*******+               ********+
           ********                +********
          +*******+                +********+
          ********+                 ********+
         +********                  +********
         +***********************************+
         *************************************
        +*************************************+
        **************************************+
       +***************************************+
       +***************************************+
       ********+                       *********
      +********                        +********+
      +*******+                         ********+
     +********+                         +********+
     +********                          +********+
     ********+                           *********
    +********                            +********+
    +*******+                            +*********
    ********+                             +********+
   +********                              +********+
   ********+                               *********
  +********+                               +********+
  +********                                +*********
  ********+                                 +********+
 +********                                  +********+
 ********+                                   *********
+********+                                   +********+
```
