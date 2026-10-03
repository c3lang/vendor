# libpcap.c3i

C3 bindings for libpcap

## Example Usage

### Find available interfaces
```c3
import libpcap;
import std::io;

fn void main() {
    Pcap_if_t* alldevs;
    char[1024] errbuf;

    int ret = pcap::findalldevs(
        &alldevs,
        &errbuf[0]
    );

    if (ret == -1) {
        io::printfn("failed to find interfaces: %s", &errbuf[0]);
        return;
    }

    Pcap_if_t* dev = alldevs;

    while (dev != null) {
        io::printfn("interface: %s", dev.name);
        dev = dev.next;
    }

    pcap::freealldevs(alldevs);
}
```

### Capture packets with a BPF filter 
>Note: requires elevated privileges
```c3
import libpcap;
import std::io;

fn void main() {
    char[1024] errbuf;

    Pcap_t* pcap = pcap::open_live(
        "enp4s0",
        65535,
        1,
        1000,
        &errbuf[0]
    );

    if (pcap == null) {
        io::printfn("failed to open interface: %s", &errbuf[0]);
        return;
    }

    Bpf_program filter;

    int ret = pcap::compile(
        pcap,
        &filter,
        "tcp port 443",
        1,
        0
    );

    if (ret == -1) {
        io::printfn("failed to compile filter");
        return;
    }

    ret = pcap::setfilter(pcap, &filter);

    if (ret == -1) {
        io::printfn("failed to set filter: %s", pcap::geterr(pcap));
        return;
    }

    while (true) {
        char* data;
        Pcap_pkthdr* header;

        int out = pcap::next_ex(pcap, &header, &data);

        if (out == 0) continue;

        if (out == -1) {
            io::printfn("capture error: %s", pcap::geterr(pcap));
            break;
        }

        io::printfn(
            "captured packet: %d bytes",
            header.len
        );
    }

    pcap::close(pcap);
}
```

### Open offline capture
```c3
import libpcap;
import std::io;

fn void main() {
    char[1024] errbuf;

    Pcap_t* pcap = pcap::open_offline(
        "capture.pcap",
        &errbuf[0]
    );

    if (pcap == null) {
        io::printfn("failed to open capture: %s", &errbuf[0]);
        return;
    }

    io::printfn("capture opened successfully");

    pcap::close(pcap);
}
```
