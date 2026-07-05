\ProvidesClass{../Common/Template/MasterThesis}
[2023/04/10  lijianyong@zzuli.edu.cn]
%------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
%------------------------------------------------------------------------
\newif\if@betterformat\@betterformatfalse
\newif\if@singlepage\@singlepagefalse
\DeclareOption{betterformat}{\@betterformattrue}
\DeclareOption{单面打印}{\@singlepagetrue}
\ProcessOptions\relax
\if@singlepage
  \LoadClass[zihao=-4,a4paper,UTF8,scheme=plain,oneside]{ctexbook}
\else
  \LoadClass[zihao=-4,a4paper,UTF8,scheme=plain,twoside]{ctexbook}
\fi
\RequirePackage{amsmath,amsthm}%\newtheoremstyle
\RequirePackage{bbding}%说明文档中使用了其中的五角星符号
\RequirePackage{booktabs}%三线表格
\RequirePackage{calc}%算术运算
\RequirePackage{changepage}%调整版权页版心宽度
\RequirePackage{environ}%\Collect@Body收集环境内容
\RequirePackage[shortlabels]{enumitem}%列表环境
\RequirePackage{etoolbox}%\robustify
\RequirePackage[stable,bottom,perpage,hang]{footmisc}%脚注数字格式修改
\RequirePackage{geometry}%页边距设置
\RequirePackage{graphicx}%图形支持
\RequirePackage{hyperref}%超链接、书签
\hypersetup{linktoc=all,bookmarksnumbered=true,bookmarksopen=true,
  bookmarksopenlevel=1,breaklinks=true,plainpages=false,hidelinks}
\urlstyle{same}%在hyperref中引用了url包，这里为url包的设置命令
\RequirePackage{longtable}%长表格，可替换supertabular
\RequirePackage{multirow}%跨行表格
\RequirePackage[numbers,super,sort&compress]{natbib}%参考文献引用
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{tabularx}%表格宽度控制
\RequirePackage{tikz}%\circle
\RequirePackage{titletoc}%目录格式
\RequirePackage{unicode-math}%\allowdisplaybreaks,公式环境增强
\unimathsetup{math-style=ISO,bold-style=ISO,
  nabla=upright,partial=upright}
\RequirePackage{xparse}%CTEX包中会重复调用
\RequirePackage{metalogo}%XeLaTeX Logo
\RequirePackage{xspace}%TeXLive Logo
\RequirePackage{xcolor}%颜色
\RequirePackage{listings}
% \RequirePackage{emptypage}
%------------------------------------------------------------------------
% 图文件、子源文件目录设置
%------------------------------------------------------------------------
\graphicspath{{../Common/Figures}{../Common/Template}{../Common/Demo}}
\providecommand*\input@path{}
\newcommand{\addinputpath}[1]{%
  \expandafter\def\expandafter\input@path\expandafter{\input@path{#1}}}
\addinputpath{../Common/TexFiles}
\addinputpath{../Common/Demo/}
%------------------------------------------------------------------------
% 自定义命令
%------------------------------------------------------------------------
\lstdefinestyle{lstStyleBase}{%
  basicstyle=\small\ttfamily,aboveskip=\medskipamount,
  belowskip=\medskipamount,lineskip=0pt,boxpos=c,showlines=false,
  extendedchars=true,upquote=true,tabsize=2,showtabs=false,
  showspaces=false,showstringspaces=false,
  numbers=none,linewidth=\linewidth,xleftmargin=4pt,xrightmargin=0pt,
  resetmargins=false,breaklines=true,breakatwhitespace=false,
  breakindent=0pt,breakautoindent=true,columns=flexible,keepspaces=true,
  gobble=0,framesep=3pt,rulesep=1pt,framerule=1pt,
  backgroundcolor=\color{gray!5},stringstyle=\color{green!40!black!100},
  keywordstyle=\bfseries\color{blue!50!black},
  commentstyle=\color{black!50}}
\lstdefinestyle{lstStyleShell}{%
  style=lstStyleBase,frame=l,rulecolor=\color{purple},language=bash}
\lstdefinestyle{lstStyleLaTeX}{%
  style=lstStyleBase,frame=l,rulecolor=\color{violet},
  language=[LaTeX]TeX}
\lstnewenvironment{latex}{\lstset{style=lstStyleLaTeX}}{}
\lstnewenvironment{shell}{\lstset{style=lstStyleShell}}{}
\DeclareRobustCommand{\BibTeX}{B\kern-.05em%
  \hbox{$\m@th$\csname S@\f@size\endcsname\fontsize\sf@size\z@
    \math@fontsfalse\selectfont I\kern-.025emB}\kern-.08em\-\TeX}
\def\TeXLive{\TeX{} Live\xspace}
\newcommand{\equationname}{公式}
\newcommand{\reffig}[1]{\mbox{\figurename~\ref{#1}}}
\newcommand{\reftab}[1]{\mbox{\tablename~\ref{#1}}}
\newcommand{\refequ}[1]{\mbox{\equationname~\ref{#1}}}
\newcommand{\refcite}[2][等]{#1\cite{#2}}
\newcommand{\refcha}[1]{第\mbox{\ref{#1}}章}
\newcommand{\refsec}[1]{第\mbox{\ref{#1}}节}
\newcommand{\refsubsec}[1]{第\mbox{\ref{#1}}小节}
% 定义与Word中相同的Windows字体，加粗程度与Word相同
\newCJKfontfamily\winsongti{SimSun}[AutoFakeBold={3}]
\newCJKfontfamily\winfangsong{FangSong}[AutoFakeBold={3}]
\newCJKfontfamily\winheiti{SimHei}[AutoFakeBold={3}]
\newCJKfontfamily\winkaiti{KaiTi}[AutoFakeBold={3}]
\newCJKfontfamily\winlisu{LiSu}[AutoFakeBold={3}]
\newCJKfontfamily\winyouyuan{YouYuan}[AutoFakeBold={3}]
\newCJKfontfamily\winyahei{Microsoft YaHei}
\newCJKfontfamily\winyaheibold{Microsoft YaHei Bold}
\if@betterformat
  \newCJKfontfamily\gbkaiti{KaiTi}[AutoFakeBold={3}]
  \newcommand{\egbkai}{\fontspec{KaiTi}[AutoFakeBold={3}]}
\else
  \newCJKfontfamily\gbkaiti{楷体_GB2312.ttf}[AutoFakeBold={3}]
  \newcommand{\egbkai}{\fontspec{楷体_GB2312.ttf}[AutoFakeBold={3}]}
\fi
\newcommand{\arialbd}{\fontspec{arialbd.ttf}}
\newcommand{\eheiti}{\fontspec{simhei.ttf}}
\newcommand{\esongti}{\fontspec{simsun.ttc}}
\newcommand{\yugothr}{\fontspec{YuGothR.ttc}}
% % 清除空白双页页眉页脚
\if@singlepage\relax\else
\let\@ClearBlankPageHeaderFooter\cleardoublepage
\newcommand{\@ClearBlankPageFooterHeader}{
  \clearpage{\pagestyle{empty}\@ClearBlankPageHeaderFooter}}
\let\cleardoublepage\@ClearBlankPageFooterHeader\fi
% 孤行控制
\widowpenalty=4000  %尾行分页所产生的惩罚值，默认150
\clubpenalty=4000   %首行分页的惩罚值，默认150
%------------------------------------------------------------------------
% 各级字号（拼音表示）
%------------------------------------------------------------------------
\def\@MSWordFontSizeConvert#1#2{\expandafter%
  \newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr#2}\selectfont}}
\@MSWordFontSizeConvert{chuhao}{42bp}
\@MSWordFontSizeConvert{xiaochu}{36bp}
\@MSWordFontSizeConvert{yihao}{26bp}
\@MSWordFontSizeConvert{xiaoyi}{24bp}
\@MSWordFontSizeConvert{erhao}{22bp}
\@MSWordFontSizeConvert{xiaoer}{18bp}
\@MSWordFontSizeConvert{sanhao}{16bp}
\@MSWordFontSizeConvert{xiaosan}{15bp}
\@MSWordFontSizeConvert{sihao}{14bp}
\@MSWordFontSizeConvert{xiaosijia}{13bp}
\@MSWordFontSizeConvert{xiaosi}{12bp}
\@MSWordFontSizeConvert{dawu}{11bp}
\@MSWordFontSizeConvert{wuhao}{10.5bp}
\@MSWordFontSizeConvert{xiaowu}{9bp}
\@MSWordFontSizeConvert{liuhao}{7.5bp}
\@MSWordFontSizeConvert{xiaoliu}{6.5bp}
\@MSWordFontSizeConvert{qihao}{5.5bp}
\@MSWordFontSizeConvert{bahao}{5bp}
%------------------------------------------------------------------------
%                                全局样式
%------------------------------------------------------------------------
% 纸张要求及页面设置
%------------------------------------------------------------------------
% 纸    张  A4（210×297），幅面白色
% 页面设置  上、下3.8cm，左、右3.2cm，页眉、页脚3.0cm，装订线0cm
% 篇    眉  宋体10.5磅居中，Abstract 部分用Times New Roman体10.5磅
% 页    码  宋体10.5磅居中
%------------------------------------------------------------------------
% 纸张、页面设置
%------------------------------------------------------------------------
\def\@SizePaper{a4paper}
\def\@MarginTop{38mm}
% \def\@MarginTop{6998293 sp}
\def\@MarginBottom{38mm}
% \def\@MarginBottom{7401536 sp}
\def\@MarginLeft{32mm}
\def\@MarginRight{32mm}
\def\@SepHeader{486386 sp}
% \def\@SkipFoot{1297413 sp}
\def\@HeaderUnderLineWidth{27423646 sp}
\def\@HeaderUnderLineOffset{-93934 sp}
\def\@HeaderUnderLineHeight{51309 sp}
\def\@HeaderUnderLineSep{189451 sp}
\geometry{\@SizePaper,top=\@MarginTop,bottom=\@MarginBottom,
  left=\@MarginLeft,right=\@MarginRight,headsep=\@SepHeader}
% 全文段落前后间距为0
\parskip=0pt
%------------------------------------------------------------------------
% 其他设置
%------------------------------------------------------------------------
% 浮动体设置
\setlength{\floatsep}{12bp \@plus4\p@\@minus\p@}
\setlength{\intextsep}{12bp \@plus4\p@\@minus\tw@\p@}
\setlength{\textfloatsep}{12bp \@plus4\p@\@minus2\p@}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.50}
\renewcommand{\floatpagefraction}{0.80}
% 设置图表样式
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
\DeclareCaptionLabelSeparator{LabelSeparator@Caption}{\hspace{\ccwd}}
\DeclareCaptionFont{Font@Caption}{\wuhao[1.5]}
\captionsetup{font=Font@Caption,labelsep=LabelSeparator@Caption,
  figureposition=bottom,tableposition=top}
\captionsetup[table]{belowskip={6bp},aboveskip=6bp}
\captionsetup[figure]{belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{font=Font@Caption,skip=6bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
% 设置普通表格样式
\let\Old@tabular\@tabular
\def\Original@tabular{\wuhao[1.5]\Old@tabular}%
% 设置长表格样式
\let\@tabular\Original@tabular
\let\Original@array\LT@array
\def\LT@array{\wuhao[1.5]\Original@array}
\newcolumntype{Z}{>{\centering\arraybackslash}X}
\newcommand\Xhline[1]{\noalign{\ifnum0=`}\fi\arrayrulewidth#1%
  \ifx\hline\LT@hline\let\@xhline\LT@@hline\fi
  \hrule\@height\arrayrulewidth\futurelet\reserved@a\@xhline}
% 设置公式环境
\renewcommand\theequation{
  \ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}
\allowdisplaybreaks[4]
\newtheoremstyle{theorem}{0.5ex}{0.5ex}{\rm}{} {\rm}{}{1em}{}
\renewenvironment{proof}[1][\proofname]{\par\pushQED{\qed}%
  \topsep 0pt\trivlist\item[\hskip\labelsep\heiti#1\@addpunct{\quad}]\ignorespaces}{\popQED\endtrivlist\@endpefalse}
\theoremstyle{theorem}
\newtheorem{definition}{\rm\heiti 定义}[chapter]
\newtheorem{theorem}{\rm\heiti 定理}[chapter]
\newtheorem{lemma}[theorem]{\rm\heiti 引理}
\newtheorem{corollary}[theorem]{\rm\heiti 推论}
% 列表带圈数字设置
\newcommand*{\Circled@Number}[1]{%
  \lower.7ex\hbox{\tikz\draw
    (0pt, 0pt) circle (.5em) node {\makebox[1em][c]{\small #1}};}}
\robustify{\Circled@Number}
\setlist[enumerate,1]{label=(\arabic*)}
\setlist[enumerate,2]{label=\arabic*)}
\setlist[enumerate,3]{label=\Circled@Number{\arabic*}}
\setlist{leftmargin=*, nosep}
\setlist[1]{labelindent=\parindent}
\let\zzu@footnotesize\footnotesize
\renewcommand\footnotesize{\zzu@footnotesize\xiaowu[1.5]}
%% 脚注带圈数字设置
\interfootnotelinepenalty=10000
\newcommand\thu@circled[1]{%
  \yugothr\symbol{\the\numexpr#1+"245F\relax}}
\renewcommand{\thefootnote}{\thu@circled{\c@footnote}}
\renewcommand{\thempfootnote}{\thu@circled{\c@mpfootnote}}
\def\footnoterule{%
  \vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\footnotemargin=13.5bp
\long\def\@makefntext#1{\begingroup
  \def\@makefnmark{\hbox{\normalfont\@thefnmark}}
  \xiaowu\ifFN@hangfoot\bgroup
    \setbox\@tempboxa\hbox{\ifdim\footnotemargin>\z@
        \hb@xt@\footnotemargin{\@makefnmark\hss}\else\@makefnmark\fi}
    \leftmargin\wd\@tempboxa\rightmargin\z@\linewidth\columnwidth
    \advance\linewidth -\leftmargin \parshape \@ne \leftmargin \linewidth
    \xiaowu\@setpar{{\@@par}}\leavevmode
    \llap{\box\@tempboxa}\parskip\hangfootparskip\relax
    \parindent\hangfootparindent\relax\else\parindent1em\noindent
    \ifdim\footnotemargin>\z@
      \hb@xt@ \footnotemargin{\hss\@makefnmark}\else\ifdim\footnotemargin=\z@
        \llap{\@makefnmark}\else\llap{\hb@xt@ -\footnotemargin{\@makefnmark\hss}}\fi\fi\fi\footnotelayout#1\ifFN@hangfoot
    \par\egroup\fi\endgroup}
% 正文英数Times New Roman
\setmainfont{Times New Roman}
%无标号标题
\newcommand{\Chapter@NoNumber}[1]{%
  \chapter*{#1}
  \@mkboth{#1}{}
  \addcontentsline{toc}{chapter}{#1}}
% CTEX汉化设置
\ctexset{
  figurename={图},tablename={表},bibname={参考文献},proofname={证明},
  punct=quanjiao,space=auto,autoindent=true}
%------------------------------------------------------------------------
%                              页眉页脚样式
%------------------------------------------------------------------------
% 无页眉、无页脚
\def\ps@EmptyPage{%
  \let\@oddhead\@empty\let\@evenhead\@empty
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
% 页眉5号居中下加0.5pt单线、页脚页码5号居中，中文宋体，英文Times New Roman
\def\ps@HeaderPageNumber{%
  \def\@oddhead{%
    \vbox to \headheight{%
      \vfill\hb@xt@\textwidth{\rm\wuhao\hfill\leftmark\hfill}
      \vskip\@HeaderUnderLineSep\hspace*{\@HeaderUnderLineOffset}\hbox{%
        \vrule width \@HeaderUnderLineWidth
        height \@HeaderUnderLineHeight depth 0 sp}}}
  \let\@evenhead=\@oddhead
  \def\@oddfoot{\rm\wuhao\hfil\thepage\hfil}
  \let\@evenfoot=\@oddfoot}
%------------------------------------------------------------------------
%                             样式及页面生成
%------------------------------------------------------------------------
%                                  封面
%------------------------------------------------------------------------
% 从主文档中获取中文封面填表信息
\def\Get@TitleField#1{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef%
    \csname #1@field\endcsname{##1}}\csname #1\endcsname{}}
\Get@TitleField{schoolcode}
\Get@TitleField{id}
\Get@TitleField{secretlevel}
\Get@TitleField{protitle}
\Get@TitleField{ctitle}
\Get@TitleField{cauthor}
\Get@TitleField{csupervisor}
\Get@TitleField{csubject}
\Get@TitleField{cmajor}
\Get@TitleField{cdate}
\Get@TitleField{ccosupervisor}
\Get@TitleField{coprotitle}
\Get@TitleField{ecosupervisor}
\Get@TitleField{ckeyword}
% 校徽Logo小页
\newcommand{\@UniversityEmblemMP}[2]{%
  \vspace*{#2}\noindent
  \begin{minipage}{0.286\textwidth}
    \begin{flushleft}
      \hspace*{#1}\includegraphics[scale=1.0]{UniversityEmblem}
    \end{flushleft}
  \end{minipage}}
% 代码标签
\newcommand{\@CodeLabel}[1]{\makebox[6em][s]{#1}}
% 代码文字
\newcommand{\@CodeText}[1]{%
  \underline{\makebox[7.5em][s]{\hss#1\hss}}}
% 代码行
\newcommand{\@CodeLine}[2]{\@CodeLabel{#1}~\@CodeText{#2}}
% 代码小页
\newcommand{\@CodeMP}[2]{%
  \hspace*{#1}\begin{minipage}{0.618\textwidth}\vspace*{#2}%
    \begin{flushright}\gbkaiti\sihao%
      \@CodeLine{学校代码}{\schoolcode@field}\\[444779sp]
      \@CodeLine{学号或申请号}{\id@field}\\[444779sp]
      \@CodeLine{密级}{\secretlevel@field}\\
    \end{flushright}\end{minipage}}
% 校名Logo小页
\newcommand{\@UniversityName}[2]{%
  \par\vspace{#2}\noindent\hspace*{#1}%
  \begin{minipage}{0.86\textwidth}\begin{center}%
      \includegraphics{UniversityName}\end{center}\end{minipage}}
% 论文类型行
\newcommand{\@ThesisTypeLine}[2]{%
  \par\vspace*{#2}\noindent\hspace*{#1}%
  \ziju{0.5}\xiaochu[1]\winheiti 硕士学位论文\ziju{0}}
% 论文题目小页
\newcommand{\@ThesisTitleMP}[2]{%
  \par\vspace{#2}\noindent\hspace*{#1}%
  \begin{minipage}[t][4000000 sp][c]{\textwidth}\centering%
    \gbkaiti\erhao[1.5] \ctitle@field\end{minipage}}
% 名称标签
\newcommand{\@NameLabel}[1]{\makebox[7em][s]{#1}}
% 作者姓名小页
\newcommand{\@AuthorNameMP}[1]{%
  \par\vspace{#1}%
  \gbkaiti\sanhao[1.25]%
  \newcommand{\@tmp@indentoftitle}{\par \vspace{738098 sp} \hspace*{3110161 sp}}
  \@tmp@indentoftitle
  \@NameLabel{作者姓名}：\cauthor@field
  \@tmp@indentoftitle
  \@NameLabel{导师姓名}：\csupervisor@field\hspace{\ccwd}\protitle@field
  \ifx\ccosupervisor@field\@empty\@tmp@indentoftitle
  \else\@tmp@indentoftitle\hspace{8418372sp}
    \ccosupervisor@field\hspace{\ccwd}\coprotitle@field\@tmp@indentoftitle\fi
  \@NameLabel{学科门类}：\csubject@field
  \@tmp@indentoftitle
  \@NameLabel{专业名称}：\cmajor@field
  \@tmp@indentoftitle
  \@NameLabel{完成时间}：\cdate@field}
% 封面生成
\newcommand{\Make@ChineseTitlePage}{%
  \thispagestyle{EmptyPage}
  \@UniversityEmblemMP{702549 sp}{-2756261 sp}
  \@CodeMP{2535650 sp}{-807662 sp}
  \@UniversityName{
    \if@betterformat 1924794 sp
    \else 2726607 sp\fi}{4709985 sp}
  \@ThesisTypeLine{
    \if@betterformat 3539009 sp
    \else 4340822 sp\fi}{2069546 sp}
  \@ThesisTitleMP{11841 sp}{2352354 sp}
  \@AuthorNameMP{4884321 sp}}
%------------------------------------------------------------------------
%                                英文扉页
%------------------------------------------------------------------------
% 从主文档中获取英文封面填表信息
\Get@TitleField{etitle}
\Get@TitleField{eauthor}
\Get@TitleField{esupervisor}
\Get@TitleField{emajor}
\Get@TitleField{edepartment}
\Get@TitleField{edate}
% 英文扉页生成
\newcommand{\Make@EnglishTitlePage}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \thispagestyle{EmptyPage}
  \vspace*{3086480sp}
  \begin{center}
    \renewcommand{\baselinestretch}{1.5}
    \sanhao A thesis(dissertation) submitted to\par
    Zhengzhou University\par
    for the degree of Master\par
    \vspace{4136357sp}
    \bf\etitle@field\rm\par
    \vspace{8252979sp}
    By \eauthor@field\par
    \ifx\ccosupervisor@field\@empty Supervisor: \esupervisor@field\par
    \else Supervisor: \esupervisor@field\par
      Co-supervisor: \ecosupervisor@field\par\fi
    \emajor@field\par
    \edepartment@field\par
    \edate@field
  \end{center}}
%------------------------------------------------------------------------
%                                 版权页
%------------------------------------------------------------------------
% 版权页生成
\newcommand{\Make@CopyrightPage}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \thispagestyle{EmptyPage}
  % \phantomsection
  \begin{adjustwidth}{-7mm}{-7mm}% 调整版心宽度左右各加宽7mm
    \vspace*{-1120920 sp}\sanhao\bf\winsongti
    \begin{center}
      学位论文原创性声明
    \end{center}
    \rm\xiaosi[1.9475]\vskip 1704950 sp
    本人郑重声明：所呈交的学位论文，
    是本人在导师的指导下，独立进行研究所取得的成果。除文中已经注明
    引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的
    科研成果。对本文的研究作出重要贡献的个人和集体，均已在文中以明
    确方式标明。本声明的法律责任由本人承担。
    \vskip 2061817 sp
    学位论文作者签名：\hspace{11252627 sp} 导师签名：\par
    \vskip 1540825 sp
    \hspace*{17562294 sp}
    日期：\hspace{2608905 sp}年\hspace{2em}月\hspace{2em}日\par
    \vskip 5666666 sp
    \sanhao\bf\winsongti
    \begin{center}
      学位论文使用授权声明
    \end{center}
    \rm\xiaosi[1.9475]\vskip 1704950 sp \hskip 2em
    本人完全了解郑州大学有关保留、使用学位论文的规定，同意学校保留
    或向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅
    和借阅；本人授权郑州大学可以将本学位论文的全部或部分编入有关数
    据库进行检索，可以采用影印、缩印或者其他复制手段保存论文和汇编
    本学位论文。保密论文在解密后应遵守此规定。
    \vskip 2061817 sp
    学位论文作者签名：\hspace{11252627 sp} 导师签名：\par
    \vskip 1540825 sp
    \hspace*{17562294 sp}
    日期：\hspace{2608905 sp}年\hspace{2em}月\hspace{2em}日
  \end{adjustwidth}}
%------------------------------------------------------------------------
%                                中文摘要
%------------------------------------------------------------------------
% 转换半角逗号分隔关键词为中文分号分隔关键词
\def\ckeywords@field@separator{；}
\def\Convert@KeywordsCommaT@Semicolon#1{%
  \define@key{Dumb}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1@field\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{%
    \@for\reserved@a:=##1\do{%
      \expandafter\ifx\csname #1@field\endcsname\@empty\else
        \expandafter\g@addto@macro\csname #1@field\endcsname{%
          \ignorespaces\csname #1@field@separator\endcsname}\fi
      \expandafter\expandafter\expandafter\g@addto@macro%
      \expandafter\csname #1@field\expandafter\endcsname%
      \expandafter{\reserved@a}}}}
\Convert@KeywordsCommaT@Semicolon{ckeywords}
% 关键词列表盒子
\newbox\Keywords@Box
\newcommand\Generate@Keywords@Box[2]{%
  \begingroup
  \setbox\Keywords@Box=\hbox{#1}
  \noindent\hangindent\wd\Keywords@Box\hangafter1%
  \box\Keywords@Box#2\par
  \endgroup}
% 从主文档获取中文摘要内容
\newcommand{\CnAbstract@Env}[1]{\long\gdef\Get@CnAbstractBody{#1}}
\newenvironment{cabstract}{\Collect@Body\CnAbstract@Env}{}
% 中文摘要样式
\newcommand{\CnAbstract@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format=\xiaoer[1]\centering\bf\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      name=\relax,
      aftername=\hskip\ccwd,
      afterskip={18bp},
      afterindent=true,
      lofskip=0pt,
      lotskip=0pt}}}
% 中文摘要生成
\newcommand{\Make@CnAbstract}{%
  \CnAbstract@Style               % 摘要环境样式
  % \pagestyle{HeaderPageNumber}
  \pagenumbering{Roman}
  \Chapter@NoNumber{摘\hskip\ccwd 要}
  \xiaosi[1.8]\winsongti
  \Get@CnAbstractBody
  \vskip12bp
  \Generate@Keywords@Box{\bf\winsongti 关键词：}{\ckeywords@field}}
%------------------------------------------------------------------------
%                                英文摘要
%------------------------------------------------------------------------
% 英文关键词分隔符
\def\ekeywords@field@separator{; }
% 从主文档获取英文摘要内容
\newcommand{\EnAbstract@Env}[1]{\long\gdef\Get@EnAbstractBody{#1}}
\newenvironment{eabstract}{\Collect@Body\EnAbstract@Env}{}
\Convert@KeywordsCommaT@Semicolon{ekeywords}
% 英文摘要标题
\newcommand{\EnAbstract@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format=\xiaoer[1]\centering\bf\arialbd,
      nameformat=\relax,
      titleformat=\relax,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      name=\relax,
      aftername=\hskip\ccwd,
      afterskip={18bp},
      afterindent=true,
      lofskip=0pt,
      lotskip=0pt}}}
% 英文摘要生成
\newcommand{\Make@EnAbstract}{%
  % \EnAbstract@Style
  \xiaosi[1.8]\winsongti
  \Chapter@NoNumber{ABSTRACT}
  \Get@EnAbstractBody
  \vskip12bp
  \Generate@Keywords@Box{\bf{Key Words:\enskip}}{\ekeywords@field}}
%------------------------------------------------------------------------
%                                  目录
%------------------------------------------------------------------------
% 目录页样式
\newcommand{\Tableofcontents@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    contentsname={目录},
    chapter={
      format=\sanhao[1]\centering\bf\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      name=\relax,
      aftername=\hskip\ccwd,
      afterskip={18bp},
      afterindent=true,
      lofskip=0pt,
      lotskip=0pt}}}
% 目录项目样式
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\titlecontents{chapter}[\z@]{\vspace{6bp}\sihao[1]}
{{\thecontentslabel}\quad}{}
{\hspace{.5em}\titlerule*{.}\xiaosi\contentspage}
\titlecontents{section}[2\ccwd]{\vspace{6bp} \xiaosi[1]}
{\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*{.}\xiaosi\contentspage}
\titlecontents{subsection}[4\ccwd]{\vspace{6bp} \wuhao[1]}
{\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*{.}\xiaosi\contentspage}
\titlecontents{figure}[\z@]{\wuhao[1.524]}
{\makebox[3.5em][l]{\figurename~\thecontentslabel\quad}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[\z@]{\wuhao[1.524]}
{\makebox[3.5em][l]{\tablename~\thecontentslabel\quad}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
% 目录生成
\newcommand{\maketableofcontents}{
  \Tableofcontents@Style
  \chapter*{\contentsname}
  \@mkboth{\contentsname}{}
  \@starttoc{toc}}
%------------------------------------------------------------------------
%                                插图清单
%------------------------------------------------------------------------
% 插图清单页样式
\newcommand{\Listoffigures@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    listfigurename={插图清单},
    chapter={
      format=\sanhao[1]\raggedright\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      afterindent=true,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      name=\relax,
      lofskip=0pt,
      lotskip=0pt}}}
% 插图清单生成
\renewcommand{\listoffigures}{%
  \Listoffigures@Style
  \Chapter@NoNumber{\listfigurename}
  \@starttoc{lof}}
%------------------------------------------------------------------------
%                                表格清单
%------------------------------------------------------------------------
% 表格清单页样式
\newcommand{\Listoftables@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    listtablename={表格清单},
    chapter={
      format=\sanhao[1]\raggedright\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      afterindent=true,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      name=\relax,
      lofskip=0pt,
      lotskip=0pt}}}
% 表格清单生成
\renewcommand{\listoftables}{%
  \Listoftables@Style
  \Chapter@NoNumber{\listtablename}%
  \@starttoc{lot}}
%------------------------------------------------------------------------
%                             主要符号对照表
%------------------------------------------------------------------------
% 主要符号对照表页样式
\newcommand{\Denotation@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format=\sanhao[1]\raggedright\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      afterindent=true,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      name=\relax,
      lofskip=0pt,
      lotskip=0pt}}}
%  主要符号对照表环境
\newenvironment{denotation}[1]{%
  \Denotation@Style
  \Chapter@NoNumber{主要符号对照表}
  \noindent\begin{list}{}{%
      \wuhao[1.524]
      \renewcommand\makelabel[1]{##1\hfil}
      \setlength{\labelwidth}{#1}
      \setlength{\labelsep}{0.5cm}
      \setlength{\itemindent}{2em}
      \setlength{\leftmargin}{\labelwidth+\labelsep}
      \setlength{\rightmargin}{0cm}
      \setlength{\parsep}{0cm}
      \setlength{\itemsep}{0cm}
      \setlength{\listparindent}{0cm}
      \setlength{\topsep}{\z@}}}{\end{list}}
%------------------------------------------------------------------------
%                                  正文
%------------------------------------------------------------------------
% 一级标题
\newcommand{\FirstLevel@Title}{%
  \ctexset{
    chapter={
      format={\sanhao[1]\raggedright\winheiti},
      numberformat=\eheiti,
      titleformat=\relax,
      pagestyle={HeaderPageNumber},
      beforeskip={15bp},
      name={,},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      afterindent=true,
      lofskip=0pt,
      lotskip=0pt},
    paragraph/afterindent=true,
    subparagraph/afterindent=true}}
% 二级标题
\newcommand{\SecondaryLevel@Title}{%
  \ctexset{
    section={
      afterindent=true,
      beforeskip={24bp},
      afterskip={6bp},
      format={\heiti\sihao[1]},
      numberformat=\eheiti}}}
\newcommand{\Tertiary@Title}{%
  % 三级标题
  \ctexset{
    subsection={
        afterindent=true,
        indent={0pt},
        beforeskip={12bp},
        afterskip={6bp},
        format={\heiti\xiaosijia[1]},
        numberformat=\eheiti}}}
% 四级标题
\newcommand{\FourLevel@Title}{%
  \ctexset{
    subsubsection={
        afterindent=true,
        indent={0pt},
        beforeskip={12bp},
        afterskip={6bp},
        format={\heiti\xiaosi[1]},
        numberformat=\eheiti}}}
%------------------------------------------------------------------------
%                                参考文献
%------------------------------------------------------------------------
% 参考文献页样式
\newcommand{\Bibliography@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format=\sanhao[1]\raggedright\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      afterindent=true,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      name=\relax,
      lofskip=0pt,
      lotskip=0pt}}}
% 参考文献环境
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\renewenvironment{thebibliography}[1]{%
  \Bibliography@Style
  \Chapter@NoNumber{\bibname}
  \wuhao[1.524]
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \renewcommand{\makelabel}[1]{##1\hfill}
    \settowidth\labelwidth{1.1cm}
    \setlength{\labelsep}{0.4em}
    \setlength{\itemindent}{\z@}
    \setlength{\leftmargin}{\labelwidth+\labelsep}
    \addtolength{\itemsep}{-0.7em}
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\frenchspacing\clubpenalty4000%
  \@clubpenalty \clubpenalty\widowpenalty4000%
  \interlinepenalty4000%
  \sfcode`\.\@m}{%
  \def\@noitemerr{%
    \@latex@warning{Empty `thebibliography' environment}}%
  \endlist\frenchspacing}
%------------------------------------------------------------------------
%                                  附录
%------------------------------------------------------------------------
% 附录页样式
\newcommand{\Appendix@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format={\sanhao[1]\raggedright\winheiti},
      numberformat=\rm},
    appendixname={附录}}
  \renewcommand{\chaptermark}[1]{%附录页眉样式
    \@mkboth{\appendixname\thechapter\hskip\ccwd##1}{}}}
\let\Alpha@appendix\appendix
% 附录环境
\renewenvironment{appendix}{%
  \Appendix@Style
  \Alpha@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
  \renewcommand\theequation{%
    \ifnum \c@chapter>\z@ \thechapter\fi\@arabic\c@equation}}{}
%------------------------------------------------------------------------
%                 个人简历、在学期间发表的学术论文与研究成果
%------------------------------------------------------------------------
% 个人简历页样式
\newcommand{\Resume@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format=\sanhao[1]\raggedright\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      afterindent=true,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      name=\relax,
      lofskip=0pt,
      lotskip=0pt}}}
% 个人简历环境
\newenvironment{resume}[1][个人简历、在学期间发表的学术论文与研究成果]{%
  \Resume@Style
  \Chapter@NoNumber{#1}\wuhao[1.524]}{}
% 个人简历项目
\newcommand{\resumeitem}[1]{%
  \vspace{2em}{\sihao\heiti{#1}}\vspace{.5em}\par}
%------------------------------------------------------------------------
%                                  致谢
%------------------------------------------------------------------------
% 致谢页样式
\newcommand{\Ack@Style}{%
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \ctexset{
    chapter={
      format=\sanhao[1]\raggedright\winheiti,
      nameformat=\relax,
      titleformat=\relax,
      afterindent=true,
      pagestyle={HeaderPageNumber},
      beforeskip={9bp},
      aftername=\hskip\ccwd,
      afterskip={18bp},
      name=\relax,
      lofskip=0pt,
      lotskip=0pt}}}
% 致谢环境
\newenvironment{ack}{%
  \Ack@Style
  \Chapter@NoNumber{致\hskip\ccwd 谢}
  \fangsong\xiaosi[1.524]}{}
%------------------------------------------------------------------------
%                                全文合成
%------------------------------------------------------------------------
\renewcommand{\frontmatter}{%
  \hypersetup{%
    pdftitle={\ctitle@field},
    pdfauthor={\cauthor@field},
    pdfsubject={郑州大学硕士学位论文},
    pdfkeywords={\ckeywords@field},
    pdfcreator={MasterThesis}}
  \pdfbookmark[-1]{\ctitle@field}{ctitle}
  \Make@ChineseTitlePage
  \Make@EnglishTitlePage
  \Make@CopyrightPage
  \pagestyle{HeaderPageNumber}
  \Make@CnAbstract
  \EnAbstract@Style
  \Make@EnAbstract
  \maketableofcontents
  \listoffigures
  \listoftables}
\renewcommand\mainmatter{
  \if@singlepage\clearpage\else\cleardoublepage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \renewcommand{\chaptermark}[1]{\@mkboth{\thechapter\hskip\ccwd##1}{}}
  \FirstLevel@Title
  \SecondaryLevel@Title
  \Tertiary@Title
  \FourLevel@Title}
\renewcommand{\backmatter}{
  \Bibliography@Style
  \bibliographystyle{../Common/Template/zzubib.bst}}
%------------------------------------------------------------------------
\AtEndOfClass{\sloppy}
\endinput