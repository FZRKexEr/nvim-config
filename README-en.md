# nvim-config

> This article is translated in DeepL, writing the documentation is too much trouble for me, so there may be some mistakes.

This is my Neovim configuration, mainly used for writing C++, participating in Competitive Programming.

**No special features, don't like a lot of shortcuts, the simpler the better.**
## Feature Description

- 🌈 ALE diagnostics (not LSP)
- ✨ Syntax highlighting
- 🚀 cpp, lua, sh, python compile and run
- 📖 open new file to add template
- 👑 Codeforces / Atcoder sample pulling + testing

## Installation

1. needs to be installed first.

    - neovim >= 0.5
    - curl
    - git
    - oj (optional, highly recommended) 

2. Run the command, the previous nvim configuration will be automatically backed up in `~/.config/nvim.bak`.

  ```sh
  sh -c "$(wget -O- https://raw.githubusercontent.com/FZRKexEr/nvim-config/main/install.sh)"
  ```

3. modify the template in the `~/.config/nvim/template/` folder.

## Shortcuts and commands

- `Space + r` Run the current file
- `Space + t` Get sample data for Codeforces / Atcoder and run the code to check the results. (requires oj to be installed)
- `:SubmitCode` submits the code to Atcoder. (Requires oj installation)

- `Shift + h` Move to left buffer
- `Shift + l` Move to the right buffer
- `Space + q` Close the current buffer

## Install [oj](https://github.com/online-judge-tools/oj)
 
```shell
pip3 install online-judge-tools
```

No need to configure, it will be recognized automatically after installation.

Usage: Comment out the title URL at the top of the code, leaving spaces or line breaks at both ends of the URL, (the first URL in the code will be considered as the title URL). Then you can test the sample/commit the code. Codeforces code cannot be submitted (samples can be tested), see [https://github.com/online-judge-tools/api-client/issues/127](https://github.com/online-judge-tools/api-client/issues/127).

Note: If you use another tool from the oj's authors [template-generator](https://github.com/online-judge-tools/template-generator), using oj-prepare to generate the contest/problem directory, the URL will be automatically recorded, even if It is possible to submit code normally without commenting the URLs in the code.

> URL recognition function is referenced from: [online-judge-toolsをVimから呼んで楽をする](https://maguroguma.hatenablog.com/entry/2020/08/19/090000)

## About ALE

ALE can check code syntax errors with a native compiler, which is sufficient for Competitive Programming. However, it is recommended to install a few linters (ALE will recognize them automatically, no configuration is needed):

- [cppcheck](https://github.com/danmar/cppcheck)
- [vint](https://github.com/Vimjas/vint)
- [markdownlint](https://github.com/DavidAnson/markdownlint)
- [pylint](https://github.com/PyCQA/pylint)
- [hdl-checker](https://github.com/suoto/hdl_checker)


Translated with www.DeepL.com/Translator (free version)
