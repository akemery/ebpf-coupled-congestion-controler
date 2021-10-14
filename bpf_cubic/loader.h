#ifndef LOAD2_H
#define LOAD2_H
int load_bpf_prog2(uint8_t *prog_buff, int f_sz, int is_server);
int unload_bpf_cc2(void);
int load_structops_prog_from_file(char *path);
void unload_bpf_cubic(void);
void load_bpf_cubic(void);
#endif
