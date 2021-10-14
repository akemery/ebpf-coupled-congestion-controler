### Intro

The aim of this project is to be able to couple congestion controllers  of several tcp connection using eBPF. 

### Build

#### Clone the repo and fetch lastest libbpf

```
git clone git@github.com:akemery/ebpf-coupled-congestion-controler.git
git submodule init && git submodule update
```

#### Build eBPF code

To build the eBPF code execute the following commands.

```
cd bpf_cubic && ./configure && make
```

#### Try with an exemple client and server

The eBPF code expose to the application an API with the following function:

* void load_bpf_cubic(void); to load the eBPF cubic congestion controller as kernel module.
      This function will automatically set bpf_cubic as the default congestion controller.
      
* void unload_bpf_cubic(void); to unload the eBPF cubic congestion controller.

* New functions will come soon to control the behavior of the congestion controller. 

You could try it by running the minimal client and server example in client_server_example folder.


##### start the server

 

```
cd ../client_server_example
sudo ./server -s localhost -p 1234 -P 5678 -S send_log_file_path -R recv_log_file_path
```
The server calls load_bpf_cubic(void) to set bpf_cubic as default congestion controller. When the transfer ends
it calls  unload_bpf_cubic(void) to unload bpf_cubic.

##### start the client

The client does nothing because the test is done in the same host. Otherwise, the client will do the same.

In another terminal run the following command:

```
./client -s localhost -p 1234 -P 5678 -S ../send_log_file_path -R ../recv_log_file_path -i <src_file> -o <dst_file> -f
```

The client does nothing because the test is done in the same host. Otherwise, the client will do the same.
