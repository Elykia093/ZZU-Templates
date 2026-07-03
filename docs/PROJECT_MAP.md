# ZZU-Templates 项目地图

本仓库是郑州大学模板项目的聚合层：模板目录尽量保持可独立使用，根目录补充统一文档、验证入口和维护记录。

## 范围

| 区域 | 路径 | 用途 | 来源 / 更新方式 |
| --- | --- | --- | --- |
| 聚合文档 | `README.md`, `docs/` | 总览、维护说明、项目地图 | 本仓库维护 |
| 统一命令 | `Makefile`, `scripts/` | 根层构建入口和只读检查脚本 | 本仓库维护 |
| CI workflow | `.github/workflows/build.yml` | 手动构建和静态检查 | 本仓库维护 |
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
| 清理构建产物 | `make clean` | 转到各模板目录执行清理 |
| 手动 CI | `.github/workflows/build.yml` | 仅 `workflow_dispatch`，不是自动发布流水线 |

## 维护边界

- 优先把聚合层改动放在根文档、`scripts/`、`.github/` 和根 `Makefile`。
- 尽量避免直接修改 subtree 管理的模板内部文件；如必须修改，先在 `docs/MAINTAINING.md` 记录原因、影响范围和验证命令。
- 不添加会暗示覆盖全部上游内容的根许可证；`templates/thesis` 上游许可证仍未知。
- Word 文件按二进制模板处理：保留来源说明，替换前清理元数据，替换后运行 Word 完整性检查。
- 构建通过只能证明示例能编译，不能证明模板符合学校或学院最新格式要求。

## 当前已知风险

- `templates/thesis` 上游未声明许可证。
- `templates/thesis/zzubib.bst` 有参考文献排序风险，正式论文使用前需要人工复核。
- `templates/resume` 代码是 MIT License，但内置字体授权仍需单独确认。
- `templates/word` 在 Git 中没有可读 diff，仍需按学院当年要求人工复核格式。
- 本机未安装 TeX Live、`latexmk` 或 `xelatex` 时，只能做 Word 完整性和静态检查，不能本地完整编译 LaTeX。
