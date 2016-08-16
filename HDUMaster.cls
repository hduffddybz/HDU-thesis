% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{HDUMaster}[2016/08/16 1.0 Hangzhou Dianzi University Thesis Template for Master Candidate]

\newif\iflib\libfalse
\DeclareOption{forlib}{\libtrue}
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\newif\ifsmd\smdfalse
\DeclareOption{smd}{\smdtrue}
\ProcessOptions

 \iflib
 \LoadClass[a4paper,twoside,openany]{ctexbook}
 \else
 \LoadClass[a4paper,twoside]{ctexbook}
 \fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
%------------------------ Page layout ----------------------------------
\RequirePackage{fancyhdr,hyperref}
\hypersetup{pdfencoding=auto}  %%% 邓东升修改
\hypersetup{citecolor=magenta,linkcolor=blue}
\RequirePackage[top=3truecm,bottom=2.9truecm,left=2.8truecm,right=2.5truecm,
            %includehead,%includefoot,
           xetex]{geometry}    % 页面设置%

\newtoks\Ctitle			 %论文题目
\newtoks\Cmajor          %学科专业中文名
\newtoks\Emajor          %学科专业英文名
\newtoks\Especiality      %研究方向
\newtoks\Cspeciality      %研究方向
\newtoks\Cdate			 %中文日期
\newtoks\Edate           %英文日期
\newtoks\Etitle          %英文题目
\newtoks\Cauthor		 %作者中文名
\newtoks\Eauthor         %作者英文名
\newtoks\Esupervisor     %指导教师英文名
\newtoks\Csupervisor     %指导教师中文名
\newtoks\Schoolname      %学院英文名
%\newtoks\StudentNumber  %学号,硕士用

%===============================================页眉设置=====================================================%
\renewcommand{\headrulewidth}{0.5pt}    %在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。

\let\ps@oldplain\ps@plain

 \fancyhf{}  %清除以前对页眉页脚的设置
 \fancyhead[COE]{\songti\zihao{5}\ifsmd 杭州电子科技大学硕士专业学位论文\else 杭州电子科技大学硕士学位论文\fi}   %偶数页页眉居中位置的设置. 不填则为空.
 %\fancyhead[CO]{\@title}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
 \fancyfoot[C]{-\,\thepage\,-}                     %页面下侧的设置. 大括号内置空, 表示什么也不填. 反之, 没有此命令的话, 会在页脚出现页码
 \newcommand{\fancyfancy}{\fancypagestyle{plain}{%
  \fancyhf{}
   \fancyhead[COE]{\songti\zihao{5}\ifsmd 杭州电子科技大学硕士专业学位论文\else 杭州电子科技大学硕士学位论文\fi}  %偶数页页眉居中位置的设置. 不填则为空.
 %\fancyhead[CO]{\@title}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
 \fancyfoot[C]{-\,\thepage\,-} }} 

%%%=== 封面 ===%%%
\def\maketitle{%
  \null
  \thispagestyle{empty}%
  %\vspace*{-2cm}
  \begin{center}\leavevmode
    \par
    \vspace*{5mm} %插入空白
    {\kaishu \zihao{-2} 
    \includegraphics[width=0.9\textwidth]{HDUlogo.eps}
    \\[16mm]   \ifsmd  \ziju{0.5} \textbf{硕士专业学位论文}\else \ziju{1} \textbf{硕士学位论文}\fi}\\
    \vspace{2cm}
    {\kaishu \zihao{2}题~目：\underline{\the\Ctitle} \par}%
    \vspace{4cm}
     %\vfill
    {\kaishu\zihao{3}
    \ifsmd 
    \begin{tabular}{cp{5.5cm}c}
      \raisebox{-3ex}[0pt]{\makebox[4.8cm][s]{研~究~生 }} & {\kaishu {}\raisebox{-3ex}[0pt]{\underline{\hspace{8em}}\the\Cauthor}\hfill{}} & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[4.8cm][s]{专~业 }} & {\kaishu {}\raisebox{-3ex}[0pt]{\the\Cmajor}\hfill{}} &\\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[4.8cm][s]{指~导~教~师 }} & {\kaishu
      {}\raisebox{-3ex}[0pt]{\the\Csupervisor}\hfill{}} & \\[3ex] % \cline{2-2}
      \raisebox{-3ex}[0pt]{\zihao{-4}\makebox[4.8cm][s]{完~成~日~期 }} & {\songti 	{}\raisebox{-3ex}[0pt]{\underline{\centerline{\the\Cdate}\hspace{2em}}}\hfill{}} & \\[3ex]
     \end{tabular}    
    \else  
    \begin{tabular}{cp{5.5cm}c}
      \raisebox{-3ex}[0pt]{\makebox[2cm][s]{研~究~生}} & {\kaishu {}\raisebox{-3ex}[0pt]{\underline{\centerline{\the\Cauthor}\hspace{2em}}}\hfill{}} & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[2cm][s]{专~业}} & {\kaishu 
	  {}\raisebox{-3ex}[0pt]{\underline{\centerline{\the\Cmajor}\hspace{2em}}}\hfill{}} & \\[3ex]      	
      \raisebox{-3ex}[0pt]{\makebox[2cm][s]{指~导~教~师}} & {\kaishu
      	{}\raisebox{-3ex}[0pt]{\underline{\centerline{\the\Csupervisor}\hspace{2em}}}\hfill{}} & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[2cm][s]{完~成~日~期}} & {\kaishu
		{}\raisebox{-3ex}[0pt]{\zihao{-4}\underline{\centerline{\the\Cdate}\hspace{2em}}}\hfill{}} & \\[3ex]
     \end{tabular}
     \fi
    }
    \par
  \end{center}%
  \null
  \iflib
  \else
  \newpage
  \thispagestyle{empty}
  \cleardoublepage
  \fi
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\heiti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\bfseries\zihao{-4}\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{
    \newpage
    \chapter[\cnabstractname]{\songti \zihao{3}\ziju{2}{\centerline{\cnabstractname}}}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh
    \songti\zihao{-4}
    \@afterheading}
    {\par}

\newenvironment{enabstract}{
    \newpage
    \chapter[\enabstractname]{\ziju{2}{\centerline\enabstractname}}
    \songti\zihao{-4}
    \@afterheading}
    {\par}
%%------------------------常用宏包-----------------------------------
\RequirePackage{amsmath,amssymb}% AMSLaTeX宏包.
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
\RequirePackage{cite} % 参考文献引用, 得到形如 [3-7] 的样式.
\RequirePackage{url}
\RequirePackage{enumerate}
\RequirePackage[toc, page]{appendix}
%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
%\theorempreskip{0pt}
%\theorempostskip{0pt}
%\theoremseparator{\hspace{1em}}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}

%%%---  Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{}\begin{thebibliography}{#1}}
  {\end{thebibliography}}

%%%--- \upcite ----------------------------------------
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使参考文献引用以上标出现

%%%%%%%--判断是否需要彩色链接-----------------------------
  \iflib
  \hypersetup{allcolors=black}
  \else
  \fi
%%%%%%%-------------------------------------------------
%%%%%%%--判断是否需要彩色链接-----------------------------
  \ifprint
  \hypersetup{allcolors=black}
  \else
  \fi
%%%%%%%-------------------------------------------------
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
            \parsep 0pt
            \topsep \parsep
            \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
     \else \global\advance\@listdepth\@ne \fi
  \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
  \csname @list\romannumeral\the\@listdepth\endcsname
  \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
  \@trivlist
  \parskip\parsep \parindent\listparindent
  \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
  \advance\@totalleftmargin \leftmargin
  \parshape \@ne \@totalleftmargin \linewidth
  \ignorespaces}

\makeatother
%---------------------------------------------------
\renewcommand{\contentsname}{目\qquad 录}
\newcommand\acknowledgement{\backmatter\chapter[致谢]{\ziju{2}致谢}}
%%% ---- 章节标题设置 ----- %%%%
\CTEXsetup[nameformat={\zihao{3}\bfseries\raggedright},titleformat={\zihao{3}\bfseries\raggedright},%
                 number={\arabic{chapter}},name={,},afterskip={30pt},beforeskip={20pt}]{chapter}
\CTEXsetup[format+={\zihao{4}\heiti\raggedright}]{section}
\CTEXsetup[format+={\zihao{-4}\heiti\raggedright}]{subsection}
\CTEXsetup[format={\zihao{-4}\kaishu\raggedright}]{subsubsection}
\CTEXoptions[bibname={\large 参考文献}]
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}
\RequirePackage[font=small,textfont=it]{caption}


%%%=== 图片路径=== %%%
\graphicspath{{figures/}}        % 图片放在 figures 文件夹.

\allowdisplaybreaks
\endlinechar `\^^M
\endinput
