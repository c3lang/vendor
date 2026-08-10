module tracy;

const int TRACY_CALLSTACK_DEPTH @weak = 3;

fn void frame_mark(ZString str) @inline
{
	$if $defined($feat(TRACY_ENABLE)):
	emit_frame_mark_start(str);
	$endif
}

macro ZoneContext begin_zone(ZString name, uint color = 0)
{
	$if $defined($feat(TRACY_ENABLE)):
	SourceLocationData data = {
		.name = name,
		.color = color,
		.file = $$FILE,
		.function = $$FUNC,
		.line = $$LINE,
	};

	return emit_zone_begin(&data, 1);
	$endif
}

fn void ZoneContext.end(&self)
{
	$if $defined($feat(TRACY_ENABLE)):
	if (self.active && self.id)
	{
		emit_zone_end(*self);
	}
	$endif
}

macro @tracy(ZString name, uint color = 0; @body()) @builtin
{
	$if $defined($feat(TRACY_ENABLE)):
	ZoneContext ctx = begin_zone(name, color);
	defer ctx.end();
	$endif
	@body();
}

macro message(MessageSeverity severity, String fmt, ...) => @pool()
{
	$if $defined($feat(TRACY_ENABLE)):
	ZString str = string::tformat_zstr(fmt, ...$vaarg);
	emit_log_string(severity, 0, TRACY_CALLSTACK_DEPTH, (usz)str.len(), str);
	$endif
}
