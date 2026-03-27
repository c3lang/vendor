module curl_test;
import curl;
import std::io;

fn void test_init_cleanup() @test
{
	curl::Curl* hcur = curl::easy_init();
	assert (hcur != null);
	curl::easy_cleanup(hcur);
}

fn void test_easy_setopt() @test
{
	curl::Curl* hcur = curl::easy_init();
	assert (hcur != null);
	defer curl::easy_cleanup(hcur);

	curl::CurlResult res = curl::easy_setopt(hcur, curl::CurlOption.URL, "https://example.com");
	assert (res == curl::CurlResult.OK);
}