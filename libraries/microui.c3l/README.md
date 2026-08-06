# ![microui](https://user-images.githubusercontent.com/3920290/75171571-be83c500-5723-11ea-8a50-504cc2ae1109.png)
A *tiny*, portable, immediate-mode UI library bindings written in C3.

## Features
* Tiny: around `1100 sloc` of C3
* Works within a fixed-sized memory region: no additional memory is allocated
* Built-in controls: window, scrollable panel, button, slider, textbox, label,
  checkbox, wordwrapped text
* Works with any rendering system that can draw rectangles and text
* Designed to allow the user to easily add custom controls
* Simple layout system

## Example
![example](https://user-images.githubusercontent.com/3920290/75187058-2b598800-5741-11ea-9358-38caf59f8791.png)
```c3
if (mu::begin_window(ctx, "My Window", mu::rect(10, 10, 140, 86)))
{
  mu::layout_row(ctx, 2, (int[]) { 60, -1 }, 0);

  mu::label(ctx, "First:");
  if (mu::button(ctx, "Button1"))
  {
    printf("Button1 pressed\n");
  }

  mu::label(ctx, "Second:");
  if (mu::button(ctx, "Button2"))
  {
    mu::open_popup(ctx, "My Popup");
  }

  if (mu::begin_popup(ctx, "My Popup"))
  {
    mu::label(ctx, "Hello world!");
    mu::end_popup(ctx);
  }

  mu::end_window(ctx);
}
```

## Notes
The library expects the user to provide input and handle the resultant drawing
commands, it does not do any drawing itself.

The user can do so by utilizing the functions from renderer.c3i for rendering the drawings of the components such as text, windows, buttons etc. The functions in microui.c3i provide the necessary functionalities to the components.