module libpcap_test;
import libpcap;
import std::io;

fn void test_lib_version() @test
{
    ZString version = pcap::lib_version();
    assert(version != null);
    io::printfn("libpcap: %s", version);
}

fn void test_open_dead() @test
{
    io::printn("Creating a dead pcap handle...");
    Pcap_t* pcap = pcap::open_dead(1, 65535); // 1 - DLT_EN10MB
    assert(pcap != null);
    io::printn("Dead handle created.");

    pcap::close(pcap);
    io::printn("Handle closed.");
}

fn void test_datalink_val_to_name() @test
{
    ZString name = pcap::datalink_val_to_name(1); // 1 - DLT_EN10MB
    assert(name != null);
    io::printfn("DLT 1 name: %s", name);
}

fn void test_statustostr() @test
{
    ZString msg = pcap::statustostr(0);
    assert(msg != null);
    io::printfn("Status 0: %s", msg);
}

fn void test_compile_filter() @test
{
    io::printn("Compiling a BPF filter against a dead handle...");
    Pcap_t* pcap = pcap::open_dead(1, 65535);
    assert(pcap != null);

    Bpf_program filter;
    int ret = pcap::compile(pcap, &filter, "tcp port 443", 1, 0);
    assert(ret == 0);
    io::printn("Filter compiled successfully.");

    pcap::freecode(&filter);
    pcap::close(pcap);
}
