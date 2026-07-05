# ZZU-Templates 发布与格式复核

本文件同时作为维护文档和 draft release notes 模板使用。`.github/workflows/release.yml` 会把 `{{VERSION}}` 替换为本次版本后写入 draft release。

## 发布资产

| 资产 | 用途 | 公开前人工检查 |
| --- | --- | --- |
| `zzu-resume-template-{{VERSION}}.pdf` | 简历示例 PDF | 打开检查字体、图片、间距和页数。 |
| `zzu-thesis-template-{{VERSION}}.pdf` | 默认论文示例 PDF | 检查封面、目录、页码、图表、参考文献和附录。 |
| `zzu-thesis-bachelor-{{VERSION}}.pdf` | 本科论文变体 | 检查封面字段、页眉页脚、页码和前置页。 |
| `zzu-thesis-guomoruo-{{VERSION}}.pdf` | 郭沫若题字版 | 检查题字图片位置、封面版式和前置页。 |
| `zzu-thesis-blind-{{VERSION}}.pdf` | 盲审版 | 检查身份字段隐藏范围和盲审页可读性。 |
| `zzu-thesis-promaster-{{VERSION}}.pdf` | 专业硕士变体 | 检查专业硕士封面字段和前置页。 |
| `zzu-word-thesis-templates-{{VERSION}}.zip` | Word 论文模板包 | 确认包含当前 6 个 `.docx`，并用 Word/WPS 打开或导出抽查。 |
| `zzu-templates-source-{{VERSION}}.zip` | 交接用源码包 | 确认包含根文档、`archive/README.md`、`archive/original/`、`docs/`、`scripts/`、`templates/`，且不含 `dist/`、`.git/`、缓存产物。 |

## 本地检查

最小检查：

```shell
make check
```

更完整的聚合层检查：

```shell
make project-check
```

没有 `make` 时：

```shell
python scripts/check_project.py
python scripts/package_release.py --check --version test-local
```

生成 release zip：

```shell
python scripts/package_release.py --version v0.1.0
```

只验证 release zip 结构、不保留 `dist/`：

```shell
python scripts/package_release.py --check --version v0.1.0
```

## 发布前 checklist

- [ ] `python scripts/check_project.py` 通过。
- [ ] `python scripts/package_release.py --check --version <version>` 通过。
- [ ] 有 TeX 环境时，`make resume`、`make thesis`、`make thesis-variants` 通过。
- [ ] 没有 TeX 环境时，已用 GitHub Actions 生成 PDF，并下载检查产物。
- [ ] draft release 中所有 PDF 都能打开。
- [ ] Word zip 包含当前 6 个 `.docx` 模板，且每个模板至少完成打开或导出冒烟检查。
- [ ] 源码 zip 包含 `README.md`、`Makefile`、`archive/README.md`、`archive/original/`、`docs/`、`scripts/`、`templates/`。
- [ ] README、FAQ、release notes 和许可证边界说明没有承诺官方合规。

## 格式人工复核

本仓库不是郑州大学官方模板来源。构建通过只说明示例能生成，不能说明格式合规；Word 完整性检查只说明 `.docx` 没有 ZIP 层损坏，不能说明样式、分页或元数据合规。

正式使用或公开发布前，至少人工复核：

- 学校、研究生院、本科生院、学院和专业当年最新格式文件。
- 封面字段、学位类型、学院/专业名称、导师和日期。
- 本科、专业硕士、郭沫若题字版和盲审版的变体差异。
- 前置页、正文、附录的页码格式和起始页。
- 目录层级、图表目录、交叉引用和书签。
- 正文字体字号、行距、标题层级、缩进和段前段后。
- 图题、表题、跨页表、图片清晰度。
- 参考文献排序、作者格式、中英文混排和引用样式。
- 盲审版是否隐藏姓名、学号、导师、致谢、发表成果和简历等身份信息。
- Word 模板的文档属性、批注、修订记录、隐藏文本、样式和分页。
- 简历模板的字体授权、校徽/图片资源和 PDF 字体嵌入。

## 上游同步后 checklist

- [ ] `docs/MAINTAINING.md` 中来源 commit 已更新。
- [ ] 上游是否新增、删除或改名入口文件、Makefile target、图片、字体或 LICENSE 已复核。
- [ ] 根 `Makefile`、build workflow、release workflow 仍覆盖需要构建的入口。
- [ ] `make project-check` 或 `python scripts/check_project.py` 通过。
- [ ] 有 TeX 环境时，LaTeX 主入口和变体都能构建；否则用 GitHub Actions 产物替代本地编译证据。
- [ ] README、FAQ、项目地图和模板目录索引仍与实际入口一致。

## 已知风险

- `templates/thesis` 上游在当前快照中没有声明 LICENSE。
- `templates/thesis/zzubib.bst` 有参考文献排序风险。
- `templates/resume` 代码带 MIT License，但内置字体授权仍需单独确认。
- `templates/word` 是本地二进制模板，Git 不能展示可读 diff。
- 学校和学院格式要求可能按年份、学位类型或专业变化。

## 发布决定

完成 checklist 前保持 draft。维护者接受剩余格式和授权风险后，再手动公开发布。
