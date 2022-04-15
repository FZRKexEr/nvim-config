# nvim-config

这是我的 Neovim 配置，因为不喜欢在 lua 文件里写 vimscript, 所以目前是用 lua 和 vimscript 混合完成的。主要用来写 C++ 。

**没有什么特别的功能，不喜欢很多快捷键，越简单越好。**

现在只有这个中文的 README, 因为写英文太麻烦了。

## 特性说明

- 🌈 ALE 诊断（非 LSP）
- ✨ 语法高亮
- 🚀 cpp, lua, sh, python 编译运行
- 📖 打开新文件添加模板
- 🖊 自动为 markdown 中文/英文/数字之间添加空格。
- 👑 Codeforces / Atcoder 样例拉取+测试

## 安装

1. 需要先安装：

  - g++-11

2. 运行命令，以前的 nvim 配置会自动备份在 `~/.config/nvim.bak` 。

  ```sh
  sh -c "$(wget -O- https://raw.githubusercontent.com/FZRKexEr/nvim-config/main/install.sh)"
  ```

3. 修改 `template` 文件夹内的模板。

## 快捷键

- `Space + r` 运行当前文件
- `Space + t` 获取 Codeforces / Atcoder 的样例数据，并运行代码检查结果。（需要安装 oj）
- `:SubmitCode` 提交代码到 Atcoder. （需要安装 oj）

## 关于 oj

建议阅读：[online-judge-tools/oj](https://github.com/online-judge-tools/oj)

1. 不使用 oj-prepare 生成目录：
  代码中的第一个网址会被认为是题目的 url，建议把 url 注释在代码顶部（url 两端需要留空格）。不能提交 Codeforces 代码（可以测样例），详见 [https://github.com/online-judge-tools/api-client/issues/127](https://github.com/online-judge-tools/api-client/issues/127) 。

2. 使用 oj-prepare 生成目录：
  oj-prepare 会自动 download 样例并记录网址，即使不把网址注释在代码里，也可以正常提交代码。

## 关于 ALE

推荐安装几个 linters :

- [cppcheck](https://github.com/danmar/cppcheck)
- [vint](https://github.com/Vimjas/vint)
- [markdownlint](https://github.com/DavidAnson/markdownlint)
- [pylint](https://github.com/PyCQA/pylint)
- [hdl-checker](https://github.com/suoto/hdl_checker)
