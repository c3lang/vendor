module tracy;

fn void frame_mark(ZString str) @inline
{
	$if $feat(TRACY_ENABLE):
	emit_frame_mark_start(str);
	$endif
}

macro ZoneContext begin_zone(ZString name, uint color = 0)
{
	$if $feat(TRACY_ENABLE):
		SourceLocationData data = {
			.name = name,
			.color = color,
			.file = $$FILE,
			.function = $$FUNC,
			.line = $$LINE,
		};
		return emit_zone_begin(&data, 1);
	$else
		return {};
	$endif
}

fn void ZoneContext.end(&self)
{
	$if $feat(TRACY_ENABLE):
	if (self.active && self.id)
	{
		emit_zone_end(*self);
	}
	$endif
}

macro @tracy(ZString name, uint color = 0; @body()) @builtin
{
	$if $feat(TRACY_ENABLE):
	ZoneContext ctx = begin_zone(name, color);
	defer ctx.end();
	$endif
	@body();
}

macro message(String fmt, ...) => @pool()
{
	$if $feat(TRACY_ENABLE):
	ZString str = string::tformat_zstr(fmt, ...$vaarg);
	emit_message(str, (usz)str.len(), 0);
	$endif
}
