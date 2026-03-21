module box2d_test;
import box2d;
import std::io;

fn void test_version() @test
{
	b2::B2Version version = b2::getVersion();
	assert (version.major >= 3);
}

fn void test_world_create() @test
{
	io::printn("Starting box2d world creation...");
	b2::B2WorldDef def = b2world::defaultDef();
	io::printn("Default Def obtained.");
	b2::B2WorldId world = b2world::create(&def);
	io::printn("World created.");
	assert (world.isValid());
	b2world::destroy(world);
	io::printn("World destroyed.");
}