# nvim-config

这是我的 Neovim 配置，因为不喜欢在 lua 文件里写 vimscript, 所以目前是用 lua 和 vimscript 混合完成的。

**没有什么特别的功能，不喜欢很多快捷键，越简单越好。**

现在只有这个中文的 README, 因为写英文太麻烦了。

# 特性说明

- ~~🌈 LSP 诊断，补全~~ ale 诊断
- ✨ 语法高亮
- 🌲 文件树
- 🚀 cpp, lua, sh, python 编译运行

# 安装

需要先安装：
- nodejs

运行命令, 以前的 nvim 配置会自动备份在 `~/.config/nvim.bak` 。

```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/FZRKexEr/nvim-config/main/install.sh)"
```

# 快捷键
- `<Space>r` 运行当前文件
- `<C-n>` 打开文件树
- `<Space>a` 复制当前文件到系统剪贴板 

