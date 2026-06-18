# ZZU-Thesis-Template

郑州大学本科毕业设计(论文)和研究生学位论文(含 硕士和博士) LaTeX 模版。 本科毕业设计（论文）和研究生学位论文（含硕士和博士） 分别根据《郑州大学材料科学与工程学院本科毕业设计（论文）基本规范》和《郑州大学学位论文写作规范格式》的规范要求制定。该模板主要完成于 2012 年上半年，在上传至 Github 前进行了部分调整，以保证正常编译运行。

## 1. 字体配置

采用 ctex 宏包中的字体配置。

## 2. 模板编译

该模板分别在 Windows 和 Linux 平台安装的 TeXLive 2019 下测试通过。

### 2.1 模板文件的生成

  `latexmk -xelatex main`

可选入口：

| 入口 | 类文件 | 用途 |
| --- | --- | --- |
| `main.tex` | `zzuthesis.cls` | 默认郑大学位论文模板 |
| `main-bachelor.tex` | `zzubachelor.cls` | 本科封面与页眉页脚修订版 |
| `main-guomoruo.tex` | `zzuname.cls` | 郭沫若题字版封面 |
| `main-blind.tex` | `MS.cls` | 盲审版入口，隐藏封面身份并跳过身份附页 |
| `main-promaster.tex` | `zzupromaster.cls` | 专业硕士封面字段 |

可选入口可分别编译：

  `latexmk -xelatex main-bachelor`

  `latexmk -xelatex main-guomoruo`

  `latexmk -xelatex main-blind`

  `latexmk -xelatex main-promaster`

### 2.2 A3 封面文件的生成

  `xelatex spine`

  `xelatex a3cover`

### 2.3 自动运行脚本(Makefile)

* `make all`       等于 `make thesis && make a3cover`(默认选项)；
* `make thesis`    生成论文 main.pdf；
* `make variants`  生成 main-bachelor.pdf、main-guomoruo.pdf、main-blind.pdf 和 main-promaster.pdf；
* `make a3cover`   生成封面 a3cover.pdf；
* `make clean`     清理中间文件；

## 3. 注意事项

* `main-bachelor.tex`、`main-guomoruo.tex`、`main-blind.tex`、`main-promaster.tex` 及其类文件来自本地补充素材整理，用于保留本科、郭沫若题字版、盲审版和专业硕士封面字段。
* 盲审版默认隐藏封面作者、导师、学号和 PDF 作者信息，并跳过致谢、个人简历等身份附页；正文仍需提交前人工复核。
* 正式论文使用前仍需按学院当年格式要求复核封面、页眉页脚、参考文献、图表目录和页码。
