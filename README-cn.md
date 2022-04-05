# nvim-config

这是我的 Neovim 配置，因为不喜欢在 lua 文件里写 vimscript, 所以目前是用 lua 和 vimscript 混合完成的。主要用来写 C++ 。

**没有什么特别的功能，不喜欢很多快捷键，越简单越好。**

现在只有这个中文的 README, 因为写英文太麻烦了。

# 特性说明

- 🌈 ALE 诊断（非 LSP）
- ✨ 语法高亮
- 🌲 文件树
- 🚀 cpp, lua, sh, python 编译运行
- 📖 打开新文件添加模板
- 🍎 只能用在 macOS

# 安装

1. 需要先安装：
  - GCC （Homebrew 版）
  - cppcheck （可选，推荐安装）

2. 运行命令，以前的 nvim 配置会自动备份在 `~/.config/nvim.bak` 。

  ```sh
  sh -c "$(wget -O- https://raw.githubusercontent.com/FZRKexEr/nvim-config/main/install.sh)"
  ```

  国内网络：

  ```sh
  sh -c "$(wget -O- https://ghproxy.com/https://raw.githubusercontent.com/FZRKexEr/nvim-config/main/install-cn.sh)"
  ```

3. 修改 `template` 文件夹内的模板。

# 快捷键

- `Space + r` 运行当前文件
- `Control + n` 打开文件树
