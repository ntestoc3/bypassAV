
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
  -h, --help                 Show this help
```

