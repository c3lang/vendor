module microui_test;
import microui::mu;

mu::MuContext ctx;

fn void test_init_and_types() @test
{
  mu::init(&ctx);
  assert(ctx.frame == 0 && ctx.commandlist.idx == 0);
  
  mu::MuVec2 v = mu::vec2(10, 20);
  assert(v.x == 10 && v.y == 20);
  
  mu::MuRect r = mu::rect(10, 20, 100, 50);
  assert(r.x == 10 && r.y == 20 && r.w == 100 && r.h == 50);
  
  mu::MuColor c = mu::color(255, 128, 64, 255);
  assert(c.r == 255 && c.g == 128 && c.b == 64 && c.a == 255);
}

fn void test_inputs() @test
{
  mu::init(&ctx);
  int left = (int)mu::MuMouseButton.LEFT;
  int backspace = (int)mu::MuKey.BACKSPACE;
  
  mu::input_mousemove(&ctx, 100, 200);
  assert(ctx.mouse_pos.x == 100 && ctx.mouse_pos.y == 200);
  
  mu::input_mousedown(&ctx, 100, 200, left);
  assert(ctx.mouse_down & left != 0);
  
  mu::input_mouseup(&ctx, 100, 200, left);
  assert(ctx.mouse_down & left == 0);
  
  mu::input_scroll(&ctx, 10, -20);
  assert(ctx.scroll_delta.x == 10 && ctx.scroll_delta.y == -20);
  
  mu::input_keydown(&ctx, backspace);
  assert(ctx.key_down & backspace != 0);
  
  mu::input_keyup(&ctx, backspace);
  assert(ctx.key_down & backspace == 0);
  
  mu::input_text(&ctx, "abc");
  assert(ctx.input_text_written == 3);
  assert(ctx.input_text[0] == 'a' && ctx.input_text[1] == 'b' && ctx.input_text[2] == 'c');
}
