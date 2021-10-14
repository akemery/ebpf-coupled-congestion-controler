all: message.o client.o server.o server client

message.o: message.c
	gcc -c  message.c -I../bpf_cubic -o message.o 

client.o: client.c
	gcc -c  client.c  -I../bpf_cubic -o client.o 

server.o: server.c
	gcc -c  server.c -I../bpf_cubic  -o server.o 

server: message.o server.o
	gcc -g message.o server.o -o server -L../.output  -lebpfcc -lbpf -lelf -lz

client: message.o client.o
	gcc -g message.o client.o -o client -L../.output  -lebpfcc -lbpf -lelf -lz
	

clean:
	rm *.o
	rm client
	rm server
