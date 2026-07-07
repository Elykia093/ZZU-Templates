import { defineConfig } from 'vitepress'

export default defineConfig({
  lang: 'zh-CN',
  title: 'ZZU-Templates',
  description: '郑州大学模板合集文档',
  cleanUrls: true,
  lastUpdated: true,
  themeConfig: {
    nav: [
      { text: '使用', link: '/USAGE' },
      { text: '维护', link: '/MAINTAINING' },
      { text: '发布', link: '/RELEASE' },
      { text: 'GitHub', link: 'https://github.com/Elykia093/ZZU-Templates' }
    ],
    sidebar: [
      {
        text: '文档',
        items: [
          { text: '首页', link: '/' },
          { text: '使用说明', link: '/USAGE' },
          { text: '常见问题', link: '/FAQ' },
          { text: '项目地图', link: '/PROJECT_MAP' },
          { text: '候选模板来源', link: '/TEMPLATE_CANDIDATES' },
          { text: '维护说明', link: '/MAINTAINING' },
          { text: '发布复核', link: '/RELEASE' },
          { text: 'VitePress 站点', link: '/VITEPRESS' }
        ]
      }
    ],
    search: {
      provider: 'local'
    },
    outline: {
      level: [2, 3]
    },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/Elykia093/ZZU-Templates' }
    ],
    footer: {
      message: '非官方模板整理项目；正式提交前以学校和学院最新要求为准。',
      copyright: 'Copyright © 2026'
    }
  }
})
