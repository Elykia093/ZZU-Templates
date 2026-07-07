# 候选模板来源

本页整理 2026-07-06 检索到、但尚未作为新模板导入的候选来源。按上轮清单，本次排除：

- 郑州大学本科毕业论文（设计）官方 Word 模板：已由现有 Word 模板线处理。
- `latexstudio/zzuthesis-1`：较老的 `zzuthesis` 镜像/衍生仓库。
- `lusongno1/-latex-`：较老的毕业论文 LaTeX 模板。

## 纳入观察

| 来源 | 类型 | 许可证 | 最近状态 | 处理建议 |
| --- | --- | --- | --- | --- |
| [郑州大学研究生院资料下载](https://gs.zzu.edu.cn/xwgz/cyzlxz.htm) | 官方写作规范、封皮、原创性声明 | 官方资料，未声明开源许可证 | 页面列出 2024-04-25 的学位论文规范资料 | 作为研究生论文格式基准来源；只引用规范入口，不把官方附件混入开源模板代码。 |
| [fylimas/zzuthesis](https://github.com/fylimas/zzuthesis) | LaTeX 学位论文模板 | 未声明 | GitHub API 显示 2024-03-20 最后推送；仓库描述标注不再维护 | 仅作格式和实现对照；不建议直接导入代码。 |
| [tuxify/zzuthesis](https://github.com/tuxify/zzuthesis) | LaTeX 学位论文模板 | 未声明 | GitHub API 显示 2023-05-31 最后推送，2026-06-05 仍有页面活动 | 已是当前 `templates/thesis` 的主要上游参考；后续只做上游同步和风险复核。 |
| [M0rtzz/zzu-resume-template](https://github.com/M0rtzz/zzu-resume-template) | LaTeX 简历模板 | MIT | GitHub API 显示 2026-01-11 最后推送，2026-06-23 仍有页面活动 | 已是当前 `templates/resume` 的主要上游参考；同步时继续保留 MIT 说明并单独核字体授权。 |
| [zouchenzhen/zzu-beamer-template](https://github.com/zouchenzhen/zzu-beamer-template) | LaTeX Beamer 演示模板 | Apache-2.0 | GitHub API 显示 2026-05-14 最后推送 | 若后续开放 Beamer/PPT 类模板，优先作为新候选；导入前需本地编译和素材授权复核。 |
| [M0rtzz/zzu-beamer-theme](https://github.com/M0rtzz/zzu-beamer-theme) | LaTeX Beamer 主题 | 未声明 | GitHub API 显示 2026-03-29 最后推送 | 作为视觉和结构参考；未补许可证前不直接导入。 |
| [ZZUTUG/ZZU-Beamer](https://github.com/ZZUTUG/ZZU-Beamer) | LaTeX Beamer 主题集合 | LPPL-1.3c | GitHub API 显示 2021-11-28 最后推送，仓库为 template repository | 可作历史 Beamer 参考；导入前需确认与当前学校视觉规范是否仍匹配。 |
| [liu-qilong/college-beamer](https://github.com/liu-qilong/college-beamer) | 多高校 Beamer 模板集合 | CC-BY-4.0 | GitHub API 显示 2026-03-22 最后推送，2026-07-06 仍有页面活动 | 只作横向参考；不是郑大专用模板，不能替代郑大来源。 |

## 导入门槛

- 优先导入有明确许可证、可本地编译、来源可追溯的模板。
- 官方规范只作为格式基准，不等同于开源授权。
- 无许可证仓库只能作人工参考，不能直接复制代码或素材。
- Beamer/PPT 类模板当前不在主仓已收录范围内；若后续新增，应单独建目录、记录来源、补构建命令和发布检查。
- 每次导入前都要记录上游 URL、commit、许可证、素材授权、验证命令和未确认风险。
