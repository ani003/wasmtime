#include <setjmp.h>

#include "SignalHandlers.hpp"
#include <cstdio>

extern "C"
int WasmtimeCallTrampoline(void *vmctx, void (*body)(void*, void*), void *args) {
  jmp_buf buf;
  void *volatile prev;
  if (setjmp(buf) != 0) {
    LeaveScope(prev);
    return 0;
  }
  prev = EnterScope(&buf);
  body(vmctx, args);
  LeaveScope(prev);
  return 1;
}

extern "C"
int WasmtimeCall(void *vmctx, void (*body)(void*)) {
  printf("WasmtimeCall C impl START\n");
  jmp_buf buf;
  void *volatile prev;
  if (setjmp(buf) != 0) {
    LeaveScope(prev);
    return 0;
  }
  prev = EnterScope(&buf);
  printf("EXEC BODY\n");
  body(vmctx);
  printf("EXEC BODY END\n");
  LeaveScope(prev);
  return 1;
}

extern "C"
void Unwind() {
  jmp_buf *buf = (jmp_buf*) GetScope();
  longjmp(*buf, 1);
}
