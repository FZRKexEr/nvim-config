# nvim-config

[英文文档 | README in English](README-en.md)

这是我的 Neovim 配置，主要用来写 C++, 参加 Competitive Programming 。

**没有什么特别的功能，不喜欢很多快捷键，越简单越好。**

## 特性说明

- 🌈 ALE 诊断（非 LSP）
- ✨ 语法高亮
- 🚀 cpp, lua, sh, python 编译运行
- 📖 打开新文件添加模板
- 👑 Codeforces / Atcoder 样例拉取+测试

## 安装

1. 需要先安装：

    - neovim >= 0.5
    - curl
    - git
    - oj (可选，强烈推荐)

2. 运行命令，以前的 nvim 配置会自动备份在 `~/.config/nvim.bak` 。

  ```sh
  sh -c "$(wget -O- https://raw.githubusercontent.com/FZRKexEr/nvim-config/main/install.sh)"
  ```

3. 修改 `~/.config/nvim/template/` 文件夹内的模板。

## 快捷键

- `Space + r` 运行当前文件
- `Space + t` 获取 Codeforces / Atcoder 的样例数据，并运行代码检查结果。（需要安装 oj）
- `:SubmitCode` 提交代码到 Atcoder 。（需要安装 oj）

## 安装 [oj](https://github.com/online-judge-tools/oj)
 
```shell
pip3 install online-judge-tools
```

不需要配置，安装后会自动识别。

用法: 把题目 URL 注释在代码顶部, URL 两端需要留空格或者换行符,(代码中的第一个网址会被认为是题目的 URL)。然后就可以测试样例/提交代码了。不能提交 Codeforces 代码（可以测样例），详见 [https://github.com/online-judge-tools/api-client/issues/127](https://github.com/online-judge-tools/api-client/issues/127) 。

注意：如果配合使用 oj 作者的另一个工具 [template-generator](https://github.com/online-judge-tools/template-generator)，使用 oj-prepare 生成比赛/题目目录，会自动记录网址，即使不把网址注释在代码里，也可以正常提交代码。

## 关于 ALE

推荐安装几个 linters (会自动识别，不需要配置):

- [cppcheck](https://github.com/danmar/cppcheck)
- [vint](https://github.com/Vimjas/vint)
- [markdownlint](https://github.com/DavidAnson/markdownlint)
- [pylint](https://github.com/PyCQA/pylint)
- [hdl-checker](https://github.com/suoto/hdl_checker)
