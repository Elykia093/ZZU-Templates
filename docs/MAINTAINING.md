# ZZU-Templates 维护说明

本仓库用于接手维护郑州大学模板项目。当前合并 `ZZU-Resume-Template` 和 `ZZU-Thesis-Template` 两条线，并补充一组本地收集的 Word 论文模板。两个上游 LaTeX 模板通过 `git subtree` 导入到 `templates/` 下，根目录维护聚合层文档、统一 Makefile、检查脚本、发布打包脚本、原始素材备份和 GitHub Actions workflow。

## 命名约定

| 用途 | 对外名称 | 仓库内目录 |
| --- | --- | --- |
| 合并总仓库 | `ZZU-Templates` | 根目录 |
| 简历模板 | `ZZU-Resume-Template` | `templates/resume` |
| 论文模板 | `ZZU-Thesis-Template` | `templates/thesis` |
| Word 论文模板 | `ZZU-Word-Thesis-Templates` | `templates/word` |
| 原始资料归档 | 无对外发布名 | `archive/README.md`, `archive/original/新建文件夹` |

对外展示名统一使用 `ZZU-` 大写前缀；仓库内目录保持小写，避免跨平台大小写差异。

## 来源

| 目录 | 上游来源 | 当前导入 fork | 当前导入提交 |
| --- | --- | --- | --- |
| `templates/resume` | `https://github.com/M0rtzz/zzu-resume-template.git` | `https://github.com/Elykia093/zzu-resume-template.git` | `940934c5b7c45703fb57c875390e475c1b8e950e` |
| `templates/thesis` | `https://github.com/tuxify/zzuthesis.git` | `https://github.com/Elykia093/zzuthesis.git` | `7565f04df6ee5c935021b2d91582c60b5a2d5064` |
| `templates/word` | 本地桌面 Word 模板 | 无 | 2026-07-04 本地导入 |
| `archive/original/新建文件夹` | `D:\Tianxuan3\Desktop\新建文件夹` | 无 | 2026-07-05 原样备份 |
| `archive/original/郑州大学硕士学位论文模板.zip` | `D:\Tianxuan3\Desktop\郑州大学硕士学位论文模板.zip` | 无 | 2026-07-05 原样备份 |
| `archive/original/MasterThesis` | `D:\Tianxuan3\Desktop\MasterThesis` | 无 | 2026-07-06 原样备份 |
| `archive/original/word-templates/郑大毕业论文（设计）模板-V2.docx` | `D:\Tianxuan3\Downloads\郑大毕业论文（设计）模板-V2.docx` | 无 | 2026-07-06 原样备份 |
| `archive/original/word-templates/collected-docx` | `D:\Tianxuan3` 中检索到的相关 `.docx` | 无 | 2026-07-06 原样备份 |
| `archive/original/word-templates/collected-doc` | `D:\Tianxuan3` 中检索到的相关 `.doc` | 无 | 2026-07-06 原样备份 |
| `archive/original/word-templates/course-report-templates` | `D:\Tianxuan3` 中检索到的课程论文/课程设计模板 | 无 | 2026-07-06 原样备份 |

补充素材：

| 目录/文件 | 用途 | 合入位置 |
| --- | --- | --- |
| `archive/original/新建文件夹/zzuthesis.zip` | 郭沫若题字版与盲审版类文件 | `templates/thesis/main-guomoruo.tex`, `templates/thesis/main-blind.tex`, `templates/thesis/zzuname.cls`, `templates/thesis/MS.cls`, `templates/thesis/figures/zzuname.png` |
| `archive/original/新建文件夹/zzuthesis-本科.7z` | 本科封面与页眉页脚修订版 | `templates/thesis/main-bachelor.tex`, `templates/thesis/zzubachelor.cls` |
| `archive/original/新建文件夹/zzuthesis-专业硕士.7z` | 专业硕士封面字段变体 | `templates/thesis/main-promaster.tex`, `templates/thesis/zzupromaster.cls` |
| `archive/original/郑州大学硕士学位论文模板.zip` | 独立硕士学位论文模板资料包，顶层目录为 `MasterThesis/` | 尚未合入维护模板，仅作原始资料对照 |
| `archive/original/MasterThesis` | 独立硕士学位论文模板展开目录，含 `Common/Template/MasterThesis.cls` | 尚未合入维护模板，仅作原始资料对照 |
| `archive/original/word-templates/郑大毕业论文（设计）模板-V2.docx` | 已定位的 Word 本科毕业论文模板原件 | `templates/word/郑大毕业论文（设计）模板-V2.docx` 的来源对照 |
| `archive/original/word-templates/collected-docx/*.docx` | 论文模板候选、毕业论文版本、外文文献和翻译、答辩记录相关原件 | 尚未合入维护模板，仅作原始资料对照 |
| `archive/original/word-templates/collected-doc/*.doc` | 旧版毕业论文模板、模板使用情况说明和答辩记录相关原件 | 尚未合入维护模板，仅作原始资料对照 |
| `archive/original/word-templates/course-report-templates/*` | 课程论文/课程设计模板参考件 | 不作为毕业论文模板来源，只作格式参考 |
| `D:\Tianxuan3\Desktop\*.docx` | Word 版论文模板 | `templates/word/*.docx` |

本次在 `D:\Tianxuan3` 中只定位到 `郑大毕业论文（设计）模板-V2.docx` 与当前维护副本直接对应的未处理 Word 原件；`templates/word/` 其余 5 个 `.docx` 的未处理原件尚未定位到。`collected-docx/`、`collected-doc/` 和 `course-report-templates/` 是补充收集资料，不等同于已采用的维护模板来源。

## 同步上游

从当前导入 fork 同步简历模板：

```shell
git subtree pull --prefix=templates/resume https://github.com/Elykia093/zzu-resume-template.git master
```

从当前导入 fork 同步论文模板：

```shell
git subtree pull --prefix=templates/thesis https://github.com/Elykia093/zzuthesis.git master
```

如果希望直接跟原上游同步，把 URL 换成：

- `https://github.com/M0rtzz/zzu-resume-template.git`
- `https://github.com/tuxify/zzuthesis.git`

## 维护边界

- 根目录维护聚合层：总 README、统一 Makefile、CI、接手说明、已知问题。
- `docs/USAGE.md` 维护使用说明，`docs/FAQ.md` 维护常见问题，`docs/PROJECT_MAP.md` 维护项目地图和入口索引，`docs/RELEASE.md` 维护发布和格式复核，`templates/README.md` 维护模板目录索引。
- `scripts/` 放只读检查或维护辅助脚本；脚本默认不得改动模板文件。
- `templates/resume` 保持 `ZZU-Resume-Template` 自身可独立构建。
- `templates/thesis` 保持 `ZZU-Thesis-Template` 自身可独立构建。
- `templates/word` 是本地补充的二进制 Word 模板集合，不走 subtree；更新时保留来源记录，先清理文档元数据，再验证能正常打开或导出。
- `archive/README.md` 维护原始资料索引；`archive/original/新建文件夹` 是原始素材备份，除非重新备份来源，不在其中维护模板正文。
- 尽量避免把聚合层逻辑写进模板目录，减少后续 subtree 同步冲突。
- 如果必须修改模板内部，先记录修改原因、影响范围和验证命令。

## 验证清单

本地完整验证需要 TeX Live 或同等发行版：

```shell
make resume
make thesis
make thesis-variants
make thesis-a3
```

最小静态检查：

```shell
make check
make project-check
git status --short
git log --oneline --graph --decorate -n 20
```

Word 模板最小检查：

```shell
python scripts/check_word_templates.py
```

没有 `make` 时可以直接运行：

```shell
python -m py_compile scripts/check_project.py scripts/check_word_templates.py scripts/package_release.py
python scripts/check_project.py
python scripts/package_release.py --check --version test-local
```

如果本机安装 Microsoft Word，可逐个打开或导出 PDF 检查版面。

GitHub Actions 中的 `Build ZZU-Templates` workflow 当前为手动触发，执行聚合层质量检查并编译简历、论文主入口和论文变体。它不能替代学院格式人工复核，也不是自动发布流水线。

## 上游同步后 checklist

同步 `templates/resume` 或 `templates/thesis` 后，至少复核：

- `docs/MAINTAINING.md` 中来源 commit 是否更新。
- 上游是否新增、删除或改名入口文件、Makefile target、图片、字体或 LICENSE。
- 根 `Makefile`、`.github/workflows/build.yml`、`.github/workflows/release.yml` 是否仍覆盖所有需要构建的入口。
- `make project-check` 或 `python scripts/check_project.py` 是否通过。
- 有 TeX 环境时，`make resume`、`make thesis`、`make thesis-variants` 是否通过。
- 没有 TeX 环境时，手动触发 `Build ZZU-Templates` workflow，用 CI 产物检查 PDF。
- `docs/RELEASE.md` 中封面、页码、参考文献、盲审和许可证风险是否需要补充。
- README、FAQ、项目地图和模板目录索引是否仍与实际入口一致。

## 发布流程

本地生成 release zip：

```shell
make release-package
```

或指定版本：

```shell
python scripts/package_release.py --version v0.1.0
```

只验证 release zip 结构和必需文件、不长期保留 `dist/`：

```shell
python scripts/package_release.py --check --version v0.1.0
```

产物写入 `dist/`：

- `zzu-word-thesis-templates-<version>.zip`
- `zzu-templates-source-<version>.zip`

推送 `v*` tag 会触发 `.github/workflows/release.yml`。该 workflow 会：

1. 运行 Word 模板完整性检查。
2. 生成 Word 模板 zip 和源码 zip。
3. 编译简历 PDF、论文主入口 PDF 和论文变体 PDF。
4. 创建 draft release 并上传 `dist/*`。

release notes 来自 `docs/RELEASE.md`，workflow 会把 `{{VERSION}}` 替换为本次版本。GitHub Actions 仍默认创建 draft release，不自动公开发布。

## 发布前 checklist

- `python scripts/check_project.py` 通过。
- `python scripts/package_release.py --check --version <version>` 通过。
- 有 TeX 环境时，`make resume`、`make thesis`、`make thesis-variants` 通过；没有 TeX 环境时，用 GitHub Actions 产物替代本地 LaTeX 编译证据。
- draft release 中所有 PDF 都能打开。
- Word zip 包含当前 6 个 `.docx` 模板，且每个模板至少能打开或导出抽查。
- 源码 zip 包含 `README.md`、`Makefile`、`archive/README.md`、`archive/original/`、`docs/`、`scripts/`、`templates/`，不包含 `dist/`、`.git/`、`__pycache__/`。
- README、FAQ、`docs/RELEASE.md`、release notes 和许可证边界说明仍准确，没有承诺官方合规。
- 学校或学院当年格式要求已人工对照，无法确认的项目已写入发布风险。

## 已知风险

- `templates/thesis/zzubib.bst` 的排序策略可能与常见 LaTeX 模板习惯不同，正式使用前需要确认学校或学院要求。
- `templates/thesis` 的格式规范来自较早版本，可能不完全匹配最新学院要求。
- `templates/thesis` 上游未声明许可证，发布合并仓库时应在 README 中明确说明。
- `templates/resume` 的代码是 MIT License，但字体文件的授权来源需要额外确认。
- `templates/word` 来自本地桌面文件，许可证和最新学院格式要求仍需人工确认。
- 本仓库根层手动 workflow 只验证 Word 文件包完整性和 LaTeX 示例编译，不能证明内容满足各学院最新格式规范。
