# ZZU-Templates

郑州大学模板合集仓库，用于接手维护并统一整理现有模板项目。当前收录两个 LaTeX 模板和一组 Word 论文模板；本阶段不新增 Typst、Markdown、PPT 等其他模板格式。

- `templates/resume`: `ZZU-Resume-Template`，来源于 `M0rtzz/zzu-resume-template`。
- `templates/thesis`: `ZZU-Thesis-Template`，来源于 `tuxify/zzuthesis`。
- `templates/word`: `ZZU-Word-Thesis-Templates`，来源于本地桌面收集的郑大 Word 论文模板。
- `archive/`: 本地原始资料归档；其中 `archive/original/新建文件夹` 是 LaTeX 补充素材的原样备份。

两个 LaTeX 模板以 `git subtree` 导入，保留原仓库历史。根目录维护聚合层文档、统一构建入口、静态检查脚本、原始素材备份和维护说明，模板自身仍在各自目录中独立工作。

## 命名约定

对外展示名统一使用大写前缀和 Pascal/Kebab 混合格式：

| 用途 | 名称 |
| --- | --- |
| 合并总仓库 | `ZZU-Templates` |
| 简历模板 | `ZZU-Resume-Template` |
| 论文模板 | `ZZU-Thesis-Template` |
| Word 论文模板 | `ZZU-Word-Thesis-Templates` |

仓库内部目录继续使用小写路径，减少跨平台大小写差异带来的维护成本。

## 目录

```text
.
├── templates/
│   ├── README.md # 模板索引
│   ├── resume/   # ZZU-Resume-Template
│   ├── thesis/   # ZZU-Thesis-Template
│   └── word/     # ZZU-Word-Thesis-Templates
├── archive/
│   ├── README.md # 原始资料索引和维护边界
│   └── original/ # 本地原始素材备份
├── docs/
│   └── ...      # 使用、FAQ、项目地图、维护和发布说明
├── scripts/
│   └── ...      # 只读检查和发布打包脚本
├── .github/
│   └── workflows/
│       ├── build.yml
│       └── release.yml
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
make word-check
make project-check
make release-package
make check
make all
make clean
```

`make word-check` 会验证 `templates/word/*.docx` 是否都是可读取的 Word ZIP 包；`make check` 当前等价于 `make word-check`，用于没有完整 TeX 环境时做最小静态检查。

`make project-check` 会运行更完整的聚合层质量检查，包括 Python 语法检查、Word 完整性检查、release zip 结构 dry-run、Markdown 本地链接和关键文件存在性检查。

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

## 使用文档

- `docs/USAGE.md`: 模板选择、构建命令、Word 模板检查和发布包说明。
- `docs/FAQ.md`: 常见问题、格式复核、许可证边界和维护注意点。
- `docs/PROJECT_MAP.md`: 项目结构、入口和维护边界。
- `docs/MAINTAINING.md`: 上游同步、验证、发布和已知风险。
- `docs/RELEASE.md`: 发布资产、发布前 checklist、格式人工复核和 draft release notes 模板。
- `archive/README.md`: 原始资料归档索引和只读边界。

## 模板说明

模板目录索引见 `templates/README.md`，项目级结构和维护边界见 `docs/PROJECT_MAP.md`。

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

### ZZU-Word-Thesis-Templates

Word 模板放在 `templates/word/`，适合不使用 LaTeX 的毕业论文或学院定制场景。当前包含：

- `郑大毕业论文（设计）模板-V2.docx`
- `郑大-国际教育学院-留学生毕业论文模板-V2.docx`
- `郑大-外国语与国际关系学院-俄语专业论文模板-V2.docx`
- `郑大-外国语与国际关系学院-德语专业论文模板-V2.docx`
- `郑大-外国语与国际关系学院-英语专业论文模板-V2.docx`
- `郑大-文科类学院论文模板-V2.docx`

## 发布

推送 `v*` tag 会触发 `.github/workflows/release.yml`，生成 draft release。发布资产包括：

- 简历和论文示例 PDF。
- `zzu-word-thesis-templates-<version>.zip`
- `zzu-templates-source-<version>.zip`

本地可用以下命令预先生成 zip 包：

```shell
make release-package
```

只验证 zip 结构、不保留 `dist/` 产物时可以运行：

```shell
python scripts/package_release.py --check --version test-local
```

发布前需要人工检查生成 PDF、Word 模板、许可证说明和当年学院格式要求。

## 维护状态

当前上游与导入记录：

- 上游：`M0rtzz/zzu-resume-template`；当前通过 fork `Elykia093/zzu-resume-template` `master` 导入，commit `940934c5b7c45703fb57c875390e475c1b8e950e`
- 上游：`tuxify/zzuthesis`；当前通过 fork `Elykia093/zzuthesis` `master` 导入，commit `7565f04df6ee5c935021b2d91582c60b5a2d5064`
- 原始备份：`D:\Tianxuan3\Desktop\新建文件夹` 已原样复制到 `archive/original/新建文件夹`。
- 原始备份：`D:\Tianxuan3\Desktop\郑州大学硕士学位论文模板.zip` 已原样复制到 `archive/original/郑州大学硕士学位论文模板.zip`。
- 原始备份：`D:\Tianxuan3\Desktop\MasterThesis` 已原样复制到 `archive/original/MasterThesis`。
- Word 原件备份：`D:\Tianxuan3\Downloads\郑大毕业论文（设计）模板-V2.docx` 已原样复制到 `archive/original/word-templates/郑大毕业论文（设计）模板-V2.docx`。
- Word 原件备份：`D:\Tianxuan3` 中检索到的 11 个论文、翻译和答辩相关 `.docx` 已复制到 `archive/original/word-templates/collected-docx/`。
- Word 原件备份：`D:\Tianxuan3` 中检索到的 4 个论文流程和旧版毕业论文 `.doc` 已复制到 `archive/original/word-templates/collected-doc/`。
- 参考资料备份：`D:\Tianxuan3` 中检索到的 4 个课程论文/课程设计模板已复制到 `archive/original/word-templates/course-report-templates/`，只作格式参考，不作为毕业论文模板来源。
- 本地补充素材：`archive/original/新建文件夹` 下的 `zzuthesis.zip`、`zzuthesis-本科.7z`、`zzuthesis-专业硕士.7z`，用于补入本科、郭沫若题字版、盲审版和专业硕士变体。
- 本地补充素材：`D:\Tianxuan3\Desktop` 下的 6 个 Word 论文模板，复制到 `templates/word/` 后清理了 Word 文档元数据。

已知注意点：

- `zzuthesis` 上游未声明 LICENSE；合并仓库不能替它补授权结论。
- `zzuthesis` 上游有未关闭 issue 提到 `zzubib.bst` 参考文献排序风险，正式论文使用前需要复核。
- `zzuthesis` 的格式规范较旧，不同学院和年份可能有封面、页码、参考文献等差异。
- `zzu-resume-template` 带 MIT License，但内置字体的实际授权仍需自行确认。
- `templates/word` 是二进制 Word 文件，不保留可读 diff；正式使用前仍需按所在学院最新格式要求复核。

更多维护流程见 `docs/MAINTAINING.md`。
