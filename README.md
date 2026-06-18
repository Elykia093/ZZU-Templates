# ZZU-Templates

郑州大学模板合集仓库，用于接手维护并统一整理现有模板项目。当前收录两个 LaTeX 模板，后续也可以扩展到 Typst、Word、Markdown、PPT 等其他格式。

- `templates/resume`: `ZZU-Resume-Template`，来源于 `Elykia093/zzu-resume-template`。
- `templates/thesis`: `ZZU-Thesis-Template`，来源于 `Elykia093/zzuthesis`。

两个模板以 `git subtree` 导入，保留原仓库历史。根目录只放聚合层文档、统一构建入口和维护说明，模板自身仍在各自目录中独立工作。

## 命名约定

对外展示名统一使用大写前缀和 Pascal/Kebab 混合格式：

| 用途 | 名称 |
| --- | --- |
| 合并总仓库 | `ZZU-Templates` |
| 简历模板 | `ZZU-Resume-Template` |
| 论文模板 | `ZZU-Thesis-Template` |

仓库内部目录继续使用小写路径，减少跨平台大小写差异带来的维护成本。

## 目录

```text
.
├── templates/
│   ├── resume/   # ZZU-Resume-Template
│   └── thesis/   # ZZU-Thesis-Template
├── docs/
│   └── MAINTAINING.md
├── Makefile
└── README.md
```

## 构建

需要本机已安装 TeX Live 或同等 LaTeX 发行版，并能使用 `xelatex`、`latexmk`。根目录提供统一入口：

```shell
make resume
make thesis
make thesis-variants
make thesis-a3
make all
make clean
```

也可以进入模板目录独立构建：

```shell
cd templates/resume
make
```

```shell
cd templates/thesis
make thesis
make variants
make a3cover
```

## 模板说明

### ZZU-Resume-Template

入口文件是 `templates/resume/resume.tex`，默认使用 XeLaTeX、内置字体、FontAwesome 和郑大相关图片资源。适合直接替换个人信息并生成简历 PDF。

### ZZU-Thesis-Template

入口文件是 `templates/thesis/main.tex`，模板类是 `templates/thesis/zzuthesis.cls`。默认文档类参数为 `master`，可按需要切换为 `bachelor`、`master` 或 `doctor`。

正文内容拆分在 `templates/thesis/data/`，参考文献在 `templates/thesis/ref/refs.bib`，参考文献样式为 `templates/thesis/zzubib.bst`。

论文模板还保留了几种可选入口：

| 入口 | 类文件 | 用途 |
| --- | --- | --- |
| `templates/thesis/main.tex` | `zzuthesis.cls` | 默认郑大学位论文模板 |
| `templates/thesis/main-bachelor.tex` | `zzubachelor.cls` | 本科封面与页眉页脚修订版 |
| `templates/thesis/main-guomoruo.tex` | `zzuname.cls` | 郭沫若题字版封面 |
| `templates/thesis/main-blind.tex` | `MS.cls` | 盲审版入口，隐藏封面身份并跳过身份附页 |
| `templates/thesis/main-promaster.tex` | `zzupromaster.cls` | 专业硕士封面字段 |

## 维护状态

当前导入来源：

- `Elykia093/zzu-resume-template` `master`, commit `940934c5b7c45703fb57c875390e475c1b8e950e`
- `Elykia093/zzuthesis` `master`, commit `7565f04df6ee5c935021b2d91582c60b5a2d5064`
- 本地补充素材：`D:\Tianxuan3\Desktop\新建文件夹` 下的 `zzuthesis.zip`、`zzuthesis-本科.7z`、`zzuthesis-专业硕士.7z`，用于补入本科、郭沫若题字版、盲审版和专业硕士变体。

已知注意点：

- `zzuthesis` 上游未声明 LICENSE；合并仓库不能替它补授权结论。
- `zzuthesis` 上游有未关闭 issue 提到 `zzubib.bst` 参考文献排序风险，正式论文使用前需要复核。
- `zzuthesis` 的格式规范较旧，不同学院和年份可能有封面、页码、参考文献等差异。
- `zzu-resume-template` 带 MIT License，但内置字体的实际授权仍需自行确认。

更多维护流程见 `docs/MAINTAINING.md`。
