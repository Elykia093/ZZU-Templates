# 原始资料归档

`archive/` 只保存原始来源材料和来源索引，用于后续复核、追溯和重新比对。这里不是当前模板的维护入口；实际可维护模板仍在 `templates/`。

## 当前归档

| 路径 | 来源 | 备份日期 | 规模 | 用途 |
| --- | --- | --- | --- | --- |
| `archive/original/新建文件夹/` | `D:\Tianxuan3\Desktop\新建文件夹` | 2026-07-05 | 147 files, 15 directories, 7.37 MiB | 本地 LaTeX 论文补充素材原样备份 |
| `archive/original/郑州大学硕士学位论文模板.zip` | `D:\Tianxuan3\Desktop\郑州大学硕士学位论文模板.zip` | 2026-07-05 | 905,169 bytes, 22 zip entries | 独立硕士学位论文模板资料包原样备份 |
| `archive/original/MasterThesis/` | `D:\Tianxuan3\Desktop\MasterThesis` | 2026-07-06 | 22 files, 8 directories, 1.02 MiB | 独立硕士学位论文模板展开目录原样备份 |
| `archive/original/word-templates/郑大毕业论文（设计）模板-V2.docx` | `D:\Tianxuan3\Downloads\郑大毕业论文（设计）模板-V2.docx` | 2026-07-06 | 144,110 bytes | Word 本科毕业论文模板原件 |
| `archive/original/word-templates/collected-docx/` | `D:\Tianxuan3` 中检索到的相关 docx | 2026-07-06 | 11 files, 38.91 MiB | Word 论文、翻译和答辩相关原始资料 |
| `archive/original/word-templates/collected-doc/` | `D:\Tianxuan3` 中检索到的相关 doc | 2026-07-06 | 4 files, 1.54 MiB | Word 论文流程和旧版毕业论文模板原始资料 |
| `archive/original/word-templates/course-report-templates/` | `D:\Tianxuan3` 中检索到的课程报告模板 | 2026-07-06 | 4 files, 13.79 MiB | 课程论文/课程设计模板参考资料 |
| `archive/original/modified-code-originals-2026-07-06/` | Git 历史和本地归档中定位到的改动文件原件/候选 | 2026-07-06 | 22 files, 7 directories, 0.79 MiB | 本地改动代码、论文变体、VitePress 文档和 Word 模板的原件对照备份 |

`新建文件夹` 是来源目录原名，为了保留原始路径语义没有重命名。后续如果需要更友好的名称，优先在本文件补索引说明，不直接改动原始备份目录。

## 内容索引

| 文件 / 目录 | 说明 | 当前映射 |
| --- | --- | --- |
| `original/新建文件夹/zzuthesis.zip` | 郭沫若题字版、盲审版相关素材来源 | `templates/thesis/main-guomoruo.tex`, `templates/thesis/main-blind.tex`, `templates/thesis/zzuname.cls`, `templates/thesis/MS.cls`, `templates/thesis/figures/zzuname.png` |
| `original/新建文件夹/zzuthesis-本科.7z` | 本科封面与页眉页脚修订版来源 | `templates/thesis/main-bachelor.tex`, `templates/thesis/zzubachelor.cls` |
| `original/新建文件夹/zzuthesis-专业硕士.7z` | 专业硕士封面字段变体来源 | `templates/thesis/main-promaster.tex`, `templates/thesis/zzupromaster.cls` |
| `original/新建文件夹/zzuthesis/` | `zzuthesis.zip` 的展开目录 | 只作原始资料对照 |
| `original/新建文件夹/zzuthesis-本科/` | `zzuthesis-本科.7z` 的展开目录 | 只作原始资料对照 |
| `original/新建文件夹/zzuthesis-专业硕士/` | `zzuthesis-专业硕士.7z` 的展开目录 | 只作原始资料对照 |
| `original/郑州大学硕士学位论文模板.zip` | 顶层目录为 `MasterThesis/` 的独立硕士论文模板 zip | 只作原始资料对照，尚未合入维护模板 |
| `original/MasterThesis/` | 独立硕士论文模板展开目录，含 `Common/Template/MasterThesis.cls` | 只作原始资料对照，尚未合入维护模板 |
| `original/word-templates/郑大毕业论文（设计）模板-V2.docx` | 当前 Word 本科毕业论文模板的已定位原始来源之一 | 只作原始资料对照；当前维护副本其余 5 个 Word 模板的未处理原件本次未在 `D:\Tianxuan3` 检索到 |
| `original/word-templates/collected-docx/论文模板-20250429.docx` | 早期 Word 论文模板候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑大毕业论文0513.docx` | Word 毕业论文版本候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑大毕业论文0514.docx` | Word 毕业论文版本候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑大毕业论文0528.docx` | Word 毕业论文版本候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑大毕业论文0602.docx` | Word 毕业论文版本候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑州大学外文文献和翻译模版.docx` | 外文文献和翻译模板候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑州大学外文文献和翻译0513.docx` | 外文文献和翻译版本候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑州大学外文文献和翻译0514.docx` | 外文文献和翻译版本候选 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑州大学答辩情况及成绩评定表.docx` | 答辩情况和成绩评定表 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑州大学毕业论文答辩记录.docx` | 毕业论文答辩记录表 | 只作原始资料对照 |
| `original/word-templates/collected-docx/郑州大学本科生毕业论文答辩记录.docx` | 本科生毕业论文答辩记录表 | 只作原始资料对照 |
| `original/word-templates/collected-doc/郑州大学2026届本科毕业论文模板使用情况说明-20260503.doc` | 2026 届本科毕业论文模板使用情况说明 | 只作原始资料对照 |
| `original/word-templates/collected-doc/01-2023毕业论文模版（有说明）.doc` | 2023 版毕业论文模版及说明候选 | 只作原始资料对照 |
| `original/word-templates/collected-doc/04-2中期答辩记录表.doc` | 中期答辩记录表 | 只作原始资料对照 |
| `original/word-templates/collected-doc/06小组答辩记录.doc` | 小组答辩记录表 | 只作原始资料对照 |
| `original/word-templates/course-report-templates/2022级力学与工程概论课程论文格式模板.docx` | 课程论文格式模板参考件 | 不作为毕业论文模板来源，只作格式参考 |
| `original/word-templates/course-report-templates/2022级力学与工程概论课程论文格式模板.doc` | 课程论文格式模板参考件 | 不作为毕业论文模板来源，只作格式参考 |
| `original/word-templates/course-report-templates/结构分析程序应用课程设计报告模板(1).docx` | 课程设计报告模板参考件 | 不作为毕业论文模板来源，只作格式参考 |
| `original/word-templates/course-report-templates/计算力学程序设计报告模板.doc` | 课程设计报告模板参考件 | 不作为毕业论文模板来源，只作格式参考 |
| `original/modified-code-originals-2026-07-06/git-baselines/` | `origin/main`、当前 `HEAD`、新增文件快照和 `templates/thesis` subtree 导入点的基线 zip | 当前本地改动文件的 Git 原件备份或新增文件快照 |
| `original/modified-code-originals-2026-07-06/local-source-candidates/` | 论文变体和已定位 Word 模板原件候选副本 | `MANIFEST.csv` 记录当前维护文件到原件/候选的映射；其余 5 个学院 Word 模板未找到同名未处理原件 |

## 维护规则

- `archive/original/` 视为只读原始备份；除非重新备份来源，不在其中编辑模板正文、类文件、图片或压缩包。
- 新的原始资料应放入 `archive/original/<date>-<short-name>/` 或保留来源目录原名，并在本文件补充来源、日期、规模和用途。
- 从原始资料合入模板时，只修改 `templates/` 下的维护副本，并在 `docs/MAINTAINING.md` 记录来源和验证命令。
- 发布源码包会包含 `archive/`，用于交接复核；正式发布前仍需人工确认授权边界和学校/学院当年格式要求。
