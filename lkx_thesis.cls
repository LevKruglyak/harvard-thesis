\ProvidesClass{lkx_thesis}[Senior Thesis Class]
\LoadClass[11pt, letterpaper]{report}
\usepackage[portrait, margin=1in, includefoot]{geometry}

% General utility packages
\usepackage{moresize} % Extra stuff like \HUGE
\usepackage{etoolbox} % Safer macro patching
\usepackage{xcolor}
\usepackage{xstring}
\usepackage{xparse}

\usepackage{amsmath}

% Diagrams
\usepackage{graphicx}
\usepackage{import}

% Better font
\usepackage[T1]{fontenc}
\usepackage{mlmodern}

% Page Style
\usepackage[twoside]{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{0.5in}
\fancyhf{}
\fancyhf[rh]{\thepage}
\fancyhf[lh]{\textsc{\nouppercase\leftmark}}

% Title Page
\usepackage{titling}
\renewcommand\maketitlehooka{\null\mbox{}\vfill}
\renewcommand\maketitlehookd{\vfill\null}

\def\@title{}
\def\@author{}
\def\@advisor{}
\def\@university{}
\def\@degree{}
\def\@subject{}

\renewcommand{\title}[1]{\def\@title{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\subject}[1]{\def\@subject{#1}}

\providecommand{\lkxtitle}{
	\begin{titlepage}
		\begin{center}
			\vfill
			{\HUGE\scshape \@title}\\[4em]

			{\Large \scshape by}\\[2em]
			{\huge \@author}\\[3in]

			{
			\Large
			{\scshape advised by\\[1em]}
			{\@advisor}\\[1em]
			\noindent\rule{1in}{0.6pt}\\[1em]
			A thesis presented to \\[1em]
			\textsc{\@university}\\[1em]
			in partial fulfillment of the \\
			requirements for the degree of\\[1em]

			\textsc{\@degree}\\
			in the subject of \textsc{\@subject}
			}
			\vfill
		\end{center}
	\end{titlepage}}

% Chapter
\makeatletter
\def\@makechapterhead#1{
	{\parindent \z@ \center \normalfont
			\ifnum \c@secnumdepth >\m@ne
				\bfseries \HUGE --\!-- \thechapter \hskip 8\p@--\!--\
			\fi
			\interlinepenalty\@M
			\vskip 5\p@ \huge #1\par\nobreak
			\vskip 40\p@}}

\def\@makeschapterhead#1{
	{\parindent \z@ \centering \normalfont
			\interlinepenalty\@M
			\vskip 5\p@ \bfseries \huge #1\par\nobreak
			\addcontentsline{toc}{chapter}{#1} % Add unnumbered chapters to TOC
			\markboth{#1}{#1} % Add unnumbered chapter names to header
			\vskip 40\p@}}
\makeatother

% Index
\usepackage{imakeidx}
\makeindex[intoc]
\newcommand{\lkxindex}[1]{
	\renewcommand{\indexname}{#1}
	\printindex}

% Table of Contents
\newcommand{\lkxtoc}[1]{
	\renewcommand{\contentsname}{#1}
	\setcounter{tocdepth}{1}
	\tableofcontents
	\pagebreak}

% Bibliography
\usepackage[
	style=alphabetic,
	natbib=true,
	backref=true,
	backrefstyle=three
]{biblatex}
\bibliography{thesis}{}

\newcommand{\lkxrefs}[1]{
	\renewcommand\bibname{#1}
	\printbibliography[title=#1]
}

% References
\usepackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	citecolor=blue,
	filecolor=blue,
	urlcolor=blue
}

\usepackage[capitalize,nameinlink,noabbrev]{cleveref}
\renewcommand{\chapterautorefname}{Chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Section}

% Appendices
\usepackage[toc]{appendix}
\AtBeginEnvironment{appendices}{\crefalias{chapter}{appendix}}
