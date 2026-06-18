# ZZU-Templates 维护说明

本仓库用于接手维护郑州大学模板项目。当前合并 `ZZU-Resume-Template` 和 `ZZU-Thesis-Template` 两条线，两个来源仓库通过 `git subtree` 导入到 `templates/` 下，根目录维护聚合层能力。

## 命名约定

| 用途 | 对外名称 | 仓库内目录 |
| --- | --- | --- |
| 合并总仓库 | `ZZU-Templates` | 根目录 |
| 简历模板 | `ZZU-Resume-Template` | `templates/resume` |
| 论文模板 | `ZZU-Thesis-Template` | `templates/thesis` |

对外展示名统一使用 `ZZU-` 大写前缀；仓库内目录保持小写，避免跨平台大小写差异。

## 来源

| 目录 | 来源仓库 | 当前导入提交 | 上游来源 |
| --- | --- | --- | --- |
| `templates/resume` | `https://github.com/Elykia093/zzu-resume-template.git` | `940934c5b7c45703fb57c875390e475c1b8e950e` | `M0rtzz/zzu-resume-template` |
| `templates/thesis` | `https://github.com/Elykia093/zzuthesis.git` | `7565f04df6ee5c935021b2d91582c60b5a2d5064` | `tuxify/zzuthesis` |

## 同步上游

从 fork 同步简历模板：

```shell
git subtree pull --prefix=templates/resume https://github.com/Elykia093/zzu-resume-template.git master
```

从 fork 同步论文模板：

```shell
git subtree pull --prefix=templates/thesis https://github.com/Elykia093/zzuthesis.git master
```

如果希望直接跟原上游同步，把 URL 换成：

- `https://github.com/M0rtzz/zzu-resume-template.git`
- `https://github.com/tuxify/zzuthesis.git`

## 维护边界

- 根目录维护聚合层：总 README、统一 Makefile、CI、接手说明、已知问题。
- `templates/resume` 保持 `ZZU-Resume-Template` 自身可独立构建。
- `templates/thesis` 保持 `ZZU-Thesis-Template` 自身可独立构建。
- 尽量避免把聚合层逻辑写进模板目录，减少后续 subtree 同步冲突。
- 如果必须修改模板内部，先记录修改原因、影响范围和验证命令。

## 验证清单

本地完整验证需要 TeX Live 或同等发行版：

```shell
make resume
make thesis
make thesis-a3
```

最小静态检查：

```shell
git status --short
git log --oneline --graph --decorate -n 20
```

## 已知风险

- `templates/thesis/zzubib.bst` 的排序策略可能与常见 LaTeX 模板习惯不同，正式使用前需要确认学校或学院要求。
- `templates/thesis` 的格式规范来自较早版本，可能不完全匹配最新学院要求。
- `templates/thesis` 上游未声明许可证，发布合并仓库时应在 README 中明确说明。
- `templates/resume` 的代码是 MIT License，但字体文件的授权来源需要额外确认。
- 本仓库根层 CI 只验证能否编译示例文件，不能证明内容满足各学院最新格式规范。
