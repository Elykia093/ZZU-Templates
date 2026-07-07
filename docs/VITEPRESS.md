# VitePress 站点

本仓库的在线文档使用 VitePress 2.0 next 通道构建。当前锁定版本为 `2.0.0-alpha.18`，不是 `latest` 稳定通道；截至 2026-07-07 检查，npm 的 `latest` 仍是 `1.6.4`，`next` 指向 `2.0.0-alpha.18`。

## 版本选择

- `package.json` 固定 `vitepress@2.0.0-alpha.18`，避免 `next` 标签后续漂移导致构建结果不可复现。
- 当前 VitePress 依赖链要求 Node.js `^20.19.0 || >=22.12.0`，本仓库在 `package.json` 的 `engines.node` 中写明这一点。
- 如果后续 2.0 发布稳定版，先更新依赖和锁文件，再运行构建验证并同步本页说明。

## 命令

开发预览：

```shell
npm run docs:dev
```

生产构建：

```shell
npm run docs:build
```

本地预览构建产物：

```shell
npm run docs:preview
```

## 目录

- `docs/.vitepress/config.mts`: VitePress 站点配置、导航、侧边栏和搜索。
- `docs/index.md`: 文档站首页。
- `docs/*.md`: 项目使用、维护、发布和 FAQ 文档。

## 维护规则

- 新增文档优先放在 `docs/`，并在 `docs/.vitepress/config.mts` 的侧边栏补入口。
- 不把模板源码移动到 `docs/`；模板实际维护入口仍在 `templates/`。
- 构建产物 `.vitepress/dist/` 和缓存目录不提交。
- 发布前至少运行 `npm run docs:build` 和 `python scripts/check_project.py`。
