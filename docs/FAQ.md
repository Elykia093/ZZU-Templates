# ZZU-Templates FAQ

## 这个仓库是官方模板吗？

不是。本仓库是郑州大学相关模板的整理与维护仓库，包含上游 LaTeX 模板和本地收集的 Word 模板。正式论文提交前必须以学校、研究生院、本科生院或所在学院最新通知为准。

## 为什么本地跑不了 `make thesis`？

通常是没有安装 LaTeX 发行版，或者 `xelatex` / `latexmk` 不在 PATH 中。先在终端检查：

```shell
xelatex --version
latexmk --version
```

如果命令不存在，安装 TeX Live、MacTeX 或 MiKTeX 后重新打开终端。

## 没有 TeX 环境还能检查什么？

可以运行：

```shell
make check
```

它会检查 `templates/word/*.docx` 是否能作为 Word ZIP 包读取。这个检查不依赖 LaTeX，但覆盖面也只限 Word 文件完整性。

## GitHub Actions 通过是否代表格式一定正确？

不代表。Actions 只能证明示例文件能编译、Word 文件包没有损坏。封面字段、页码、参考文献、学院自定义要求和当年格式细则仍需要人工复核。

## 应该改 `templates/thesis` 里的哪些文件？

写论文正文时优先改：

- `templates/thesis/data/*.tex`
- `templates/thesis/ref/refs.bib`
- `templates/thesis/main.tex`

只有在需要改模板结构时，再改 `.cls`、`.bst` 或 `.sty` 文件。改这些文件前应先搜索引用并记录验证命令，因为它们会影响多个入口。

## Word 模板为什么没有可读 diff？

`.docx` 是 ZIP 格式的二进制文档，Git 很难展示有意义的逐行差异。替换 Word 模板时应保留来源说明，清理文档元数据，然后运行：

```shell
python scripts/check_word_templates.py
```

必要时再用 Word 或 WPS 打开并导出 PDF 做人工版面检查。

## 论文模板的许可证是什么？

聚合仓库不能替上游补授权结论。当前已知：`templates/resume` 上游代码带 MIT License，但内置字体授权仍需单独确认；`templates/thesis` 上游未声明 LICENSE。对外发布和二次分发时应保留这些限制说明。

## 参考文献排序要注意什么？

`templates/thesis/zzubib.bst` 有已知排序风险。正式论文使用前，应对照学校或学院要求检查参考文献排序、作者格式、期刊格式和中英文条目格式。

## 为什么 release 是 draft？

`release.yml` 创建 draft release，是为了让维护者在公开发布前检查 PDF、Word zip、源码 zip、release notes 和已知风险。确认无误后再手动发布。

## 怎么新增一个模板？

优先放到 `templates/<name>/`，并同步更新：

- `README.md`
- `templates/README.md`
- `docs/PROJECT_MAP.md`
- `docs/MAINTAINING.md`
- `.github/workflows/build.yml` 或 `release.yml`，如果需要构建或发布

如果模板来自独立 Git 仓库，优先使用 `git subtree` 导入并记录来源、导入 fork 和 commit。
