module tinyfd_test;
import tinyfd;
import std::io;

fn void test_silent_verbose() @test
{
	bool original_silent = tinyfd::silent;
	tinyfd::silent = true;
	assert (tinyfd::silent == true);
	tinyfd::silent = false;
	assert (tinyfd::silent == false);
	tinyfd::silent = original_silent;
}

fn void test_beep() @test @if(false) // makes a beep, little annoying
{
	tinyfd::beep();
}

fn void test_notifyPopup() @test @if(false)
{
	tinyfd::notifyPopup("Test", "Test", "info");
}