
# 使用方法
   安装nim与gcc环境

   安装依赖
   nimble install argparse nigui -y

   编译
   nim c -d:release genbypass.nim

   生成可执行文件，查看帮助，可以从剪贴板，或从文件输入shellcode

```
genbypass

generate bypass code

Usage:
  genbypass [options] 

Options:
  -f, --file=FILE            input shell code file, hex string format
  -c, --clipboard            get shell code from clipboard
  -g, --google               if host can connect google, then quit.
  -s, --sleep=SLEEP          sleep x seconds then start shellcode. (default: 180)
  -h, --help                 Show this help
```
   使用-g参数，添加google访问检测
   
   -s 200 指定执行shellcode前等待200秒。
