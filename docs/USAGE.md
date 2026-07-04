# ZZU-Templates 使用说明

本仓库把郑州大学相关模板集中到 `templates/` 下。选择模板时先看写作场景，再进入对应目录编辑示例文件。

## 选择模板

| 场景 | 推荐目录 | 入口文件 |
| --- | --- | --- |
| 简历 | `templates/resume` | `resume.tex` |
| LaTeX 学位论文 | `templates/thesis` | `main.tex` |
| 本科论文变体 | `templates/thesis` | `main-bachelor.tex` |
| 郭沫若题字版封面 | `templates/thesis` | `main-guomoruo.tex` |
| 盲审版 | `templates/thesis` | `main-blind.tex` |
| 专业硕士封面字段 | `templates/thesis` | `main-promaster.tex` |
| Word 论文模板 | `templates/word` | 对应 `.docx` 文件 |

正式提交前应以所在学院当年的格式通知为准。本仓库只能提供模板起点，不能保证覆盖所有学院和年份的细则。

## 环境要求

LaTeX 模板需要 TeX Live、MacTeX 或 MiKTeX，并能在命令行使用 `xelatex` 和 `latexmk`。Windows 用户建议安装 TeX Live 或 MiKTeX 后重新打开终端，让 PATH 生效。

Word 模板不需要 LaTeX 环境，可以直接用 Microsoft Word、WPS 或 LibreOffice 打开。不同办公软件对样式和分页的渲染可能略有差异，最终版建议用学校或学院要求的软件检查。

## 根目录命令

在仓库根目录可以运行：

```shell
make resume
make thesis
make thesis-variants
make thesis-a3
make word-check
make release-package
make check
make all
make clean
```

`make check` 当前只做 Word 模板完整性检查，适合没有 TeX 环境时快速确认二进制模板没有损坏。完整 LaTeX 验证需要运行 `make resume`、`make thesis` 和 `make thesis-variants`。

## 简历模板

编辑 `templates/resume/resume.tex` 后，在根目录运行：

```shell
make resume
```

也可以进入模板目录独立构建：

```shell
cd templates/resume
make
```

生成结果默认是 `templates/resume/resume.pdf`。

## 论文模板

默认论文入口是 `templates/thesis/main.tex`，正文内容拆在 `templates/thesis/data/`，参考文献在 `templates/thesis/ref/refs.bib`。

根目录构建默认论文：

```shell
make thesis
```

构建全部变体：

```shell
make thesis-variants
```

进入论文目录后也可以使用原模板自己的 Makefile：

```shell
cd templates/thesis
make thesis
make variants
make a3cover
```

如果只改正文，通常优先编辑 `data/` 下的章节文件；如果要改封面、页眉页脚、参考文献样式或文档类选项，再修改 `main*.tex`、`.cls` 或 `.bst` 文件。

## Word 模板

Word 模板位于 `templates/word/`。选取最接近学院要求的 `.docx` 后另存为自己的论文文件。

仓库提供只读完整性检查：

```shell
python scripts/check_word_templates.py
```

这条命令只能证明 `.docx` 文件是可读取的 Word ZIP 包，不能证明版式符合最新要求。

## GitHub Actions

`.github/workflows/build.yml` 是手动构建 workflow，会检查 Word 模板并编译简历、论文主入口和论文变体，最终上传 PDF artifact。

`.github/workflows/release.yml` 是 tag 发布 workflow。推送 `v*` tag 后，它会构建示例 PDF、打包 Word 模板 zip 和源码 zip，并创建 draft release。

## 发布包

维护者本地也可以生成 release 包：

```shell
python scripts/package_release.py --version v0.1.0
```

生成文件在 `dist/`：

- `zzu-word-thesis-templates-v0.1.0.zip`
- `zzu-templates-source-v0.1.0.zip`

发布前仍应先运行 `make check`，并在有 TeX 环境的机器或 GitHub Actions 中确认 LaTeX 示例可以编译。
