# ZZU-Templates 项目地图

本仓库是郑州大学模板项目的聚合层：模板目录尽量保持可独立使用，根目录补充统一文档、验证入口和维护记录。

## 范围

| 区域 | 路径 | 用途 | 来源 / 更新方式 |
| --- | --- | --- | --- |
| 聚合文档 | `README.md`, `docs/` | 总览、使用说明、FAQ、维护说明、项目地图、发布和格式复核 | 本仓库维护 |
| 统一命令 | `Makefile`, `scripts/` | 根层构建入口、只读检查脚本、发布打包脚本、聚合层质量检查 | 本仓库维护 |
| 文档站配置 | `package.json`, `docs/.vitepress/`, `docs/index.md` | VitePress 2.0 文档站、导航和本地搜索 | 本仓库维护 |
| 候选来源整理 | `docs/TEMPLATE_CANDIDATES.md` | 外部候选模板来源、许可证状态、更新状态和导入门槛 | 本仓库维护 |
| 原始资料索引 | `archive/README.md` | 原始资料来源、内容索引和只读边界 | 本仓库维护 |
| 原始备份 | `archive/original/新建文件夹/` | `D:\Tianxuan3\Desktop\新建文件夹` 的原样备份 | 本地只读备份 |
| 原始备份 | `archive/original/郑州大学硕士学位论文模板.zip` | `D:\Tianxuan3\Desktop\郑州大学硕士学位论文模板.zip` 的原样备份 | 本地只读备份 |
| 原始备份 | `archive/original/MasterThesis/` | `D:\Tianxuan3\Desktop\MasterThesis` 的原样备份 | 本地只读备份 |
| 原始备份 | `archive/original/word-templates/` | 已定位 Word 模板、论文、翻译、答辩和课程报告参考原件备份 | 本地只读备份 |
| CI workflow | `.github/workflows/build.yml` | 手动构建和静态检查 | 本仓库维护 |
| Release workflow | `.github/workflows/release.yml` | tag 发布 draft release 和 release assets | 本仓库维护 |
| 简历模板 | `templates/resume/` | LaTeX 简历模板 | 从简历模板 fork 通过 `git subtree` 导入 |
| 论文模板 | `templates/thesis/` | LaTeX 论文模板及变体 | 从论文模板 fork 通过 `git subtree` 导入，并补入本地变体 |
| Word 模板 | `templates/word/` | 非 LaTeX 场景的 Word 论文模板 | 本地二进制模板集合 |

## 入口

| 入口 | 命令 / 文件 | 说明 |
| --- | --- | --- |
| 构建简历 | `make resume` | 转到 `templates/resume/Makefile` |
| 构建论文 | `make thesis` | 生成 `templates/thesis/main.pdf` |
| 构建论文变体 | `make thesis-variants` | 生成本科、郭沫若题字、盲审、专业硕士变体 |
| 构建 A3 封面 | `make thesis-a3` | 在 `templates/thesis/` 内生成封面文件 |
| 检查 Word 模板 | `make word-check` 或 `python scripts/check_word_templates.py` | 验证所有 `.docx` 都是可读取的 Word ZIP 包 |
| 聚合层质量检查 | `make project-check` 或 `python scripts/check_project.py` | 运行 Python 语法、Word 完整性、release dry-run、Markdown 本地链接和关键文件检查 |
| 打包发布 zip | `make release-package` 或 `python scripts/package_release.py` | 生成 Word 模板 zip 和源码 zip 到 `dist/` |
| 验证 release zip 结构 | `python scripts/package_release.py --check --version <version>` | 使用临时目录生成并验证 zip，不长期保留 `dist/` |
| VitePress 开发预览 | `npm run docs:dev` | 启动 `docs/` 文档站 |
| VitePress 生产构建 | `npm run docs:build` | 生成 `docs/.vitepress/dist/` |
| 清理构建产物 | `make clean` | 转到各模板目录执行清理 |
| 手动 CI | `.github/workflows/build.yml` | 仅 `workflow_dispatch`，不是自动发布流水线 |
| Draft release | `.github/workflows/release.yml` | 推送 `v*` tag 或手动触发，生成 PDF/zip release assets |

## 维护边界

- 优先把聚合层改动放在根文档、`scripts/`、`.github/` 和根 `Makefile`。
- 尽量避免直接修改 subtree 管理的模板内部文件；如必须修改，先在 `docs/MAINTAINING.md` 记录原因、影响范围和验证命令。
- 不添加会暗示覆盖全部上游内容的根许可证；`templates/thesis` 上游许可证仍未知。
- Word 文件按二进制模板处理：保留来源说明，替换前清理元数据，替换后运行 Word 完整性检查。
- `archive/original/word-templates/course-report-templates/` 只作格式参考，不作为毕业论文模板来源。
- `archive/README.md` 是原始资料索引；`archive/original/` 只保存原始来源备份，模板实际维护入口仍在 `templates/`。
- Release workflow 默认创建 draft release，公开前必须人工检查 PDF、Word zip、源码 zip 和格式风险说明。
- `docs/RELEASE.md` 是发布资产、格式复核和 release notes 模板入口，不是官方合规证明。
- 构建通过只能证明示例能编译，不能证明模板符合学校或学院最新格式要求。

## 当前已知风险

- `templates/thesis` 上游未声明许可证。
- `templates/thesis/zzubib.bst` 有参考文献排序风险，正式论文使用前需要人工复核。
- `templates/resume` 代码是 MIT License，但内置字体授权仍需单独确认。
- `templates/word` 在 Git 中没有可读 diff，仍需按学院当年要求人工复核格式。
- 本机未安装 TeX Live、`latexmk` 或 `xelatex` 时，只能做 Word 完整性和静态检查，不能本地完整编译 LaTeX。
