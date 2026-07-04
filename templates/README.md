# 模板索引

本目录保存 `ZZU-Templates` 当前收录的模板包。各子目录尽量保留自身 README、构建方式和独立使用能力。

| 目录 | 对外名称 | 类型 | 主入口 |
| --- | --- | --- | --- |
| `resume/` | `ZZU-Resume-Template` | LaTeX 简历 | `resume.tex` |
| `thesis/` | `ZZU-Thesis-Template` | LaTeX 论文 | `main.tex` |
| `word/` | `ZZU-Word-Thesis-Templates` | Word 论文模板 | `*.docx` |

## 边界

- `resume/` 和 `thesis/` 通过 `git subtree` 导入，修改内部文件前先考虑后续上游同步成本。
- `word/` 是本地二进制模板集合，不走 subtree。
- 根层自动化、仓库文档和维护检查优先放在模板目录外；只有模板自身独立运行需要时，才把逻辑放进对应子目录。

使用说明见 `../docs/USAGE.md`，常见问题见 `../docs/FAQ.md`，项目地图见 `../docs/PROJECT_MAP.md`，维护流程见 `../docs/MAINTAINING.md`。
