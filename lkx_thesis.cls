\ProvidesClass{lkx_thesis}[Senior Thesis Class]
\LoadClass[12pt, letterpaper]{report}
\usepackage[portrait, margin=1in, includefoot]{geometry}

% General utility packages
\usepackage{moresize} % Extra stuff like \HUGE
\usepackage{etoolbox} % Safer macro patching
\usepackage{xcolor}
\usepackage{xstring}
\usepackage{xparse}

% Diagrams
\usepackage{graphicx}
\usepackage{import}

% Better font
\usepackage[T1]{fontenc}
\usepackage{mlmodern}
\usepackage{microtype}

% Math packages
\usepackage{amsmath} % Needs to be loaded before hyperref
\usepackage{amssymb}

% Enumerate spacing
\usepackage{enumitem}
\setlist[enumerate]{itemsep=0em}
\setlist[itemize]{itemsep=0em}

% Consistent bold math
\usepackage{bm}
\let\oldbfseries\bfseries
\renewcommand{\bfseries}{\oldbfseries\boldmath
}
% \everymath{\bm}}

% Page Style
\usepackage[twoside]{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{15pt}
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
			{\HUGE\scshape \@title}\\[44pt]

			{\Large \scshape by}\\[22pt]
			{\huge \@author}\\[2.8in]

			{
			\large
			{\scshape advised by\\[11pt]}
			{\@advisor}\\[1em]
			\noindent\rule{1in}{0.6pt}\\[11pt]
			A thesis presented to \\[11pt]
			\textsc{\@university}\\[11pt]
			in partial fulfillment of the \\
			requirements for the degree of\\[11pt]

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
				\bfseries\boldmath \HUGE --\!-- \thechapter \hskip 8\p@--\!--\
			\fi
			\interlinepenalty\@M
			\vskip 5\p@ \LARGE #1\par\nobreak
			\vskip 40\p@}}

\def\@makeschapterhead#1{
	{\parindent \z@ \centering \normalfont
			\interlinepenalty\@M
			\vskip 5\p@ \bfseries\LARGE #1\par\nobreak
			\addcontentsline{toc}{chapter}{#1} % Add unnumbered chapters to TOC
			\markboth{#1}{#1} % Add unnumbered chapter names to header
			\vskip 40\p@}}
\makeatother


% Section / Subsection Sizes
\newcommand{\lkxsectionstyle}{\bfseries\large}
\newcommand{\lkxsubsectionstyle}{\bfseries}

\usepackage{titlesec}
\titleformat{\section}{
	\normalfont\lkxsectionstyle}{\thesection}{1em}{}
\titleformat{\subsection}{
	\normalfont\lkxsubsectionstyle}{\thesubsection}{1em}{}
% \newcommand{\sectionbreak}{\clearpage} % TODO: section pagebreaks

% Index
\usepackage{imakeidx}
\makeindex
\newcommand{\lkxindex}[1]{
	\renewcommand{\indexname}{#1}
	\printindex}

% Table of Contents
\usepackage[titles]{tocloft}
\setlength{\cftbeforechapskip}{4pt}

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
\usepackage{appendix}
\BeforeBeginEnvironment{appendices}{
\setcounter{tocdepth}{0}
\crefalias{chapter}{appendix}}

% Math Environments
\usepackage{amsthm}

\newcommand{\lkxtheoremstyle}{\bfseries}
\newcommand{\lkxtheoremnotestyle}{\scshape}

\newtheoremstyle{lkx_theorem}
{}{}{\slshape}{}{}{.}{ }
{{{\lkxtheoremstyle\thmname{#1}\thmnumber{ #2}}}\thmnote{ \lkxtheoremnotestyle  ({#3}\index{#3 (Theorem)})}}

\theoremstyle{lkx_theorem}
\newtheorem{theorem}[equation]{Theorem}
\renewcommand{\theoremautorefname}{Theorem}
\crefformat{theorem}{\normalfont{#2Theorem~#1#3}}

\newtheorem{lemma}[equation]{Lemma}
\newcommand{\lemmaautorefname}{Lemma}
\crefformat{lemma}{\normalfont{#2Lemma~#1#3}}

\newtheorem{conjecture}[equation]{Conjecture}
\newcommand{\conjectureautorefname}{Conjecture}
\crefformat{conjecture}{\normalfont{#2Conjecture~#1#3}}

\newtheorem{open}[equation]{Open Problem}
\newcommand{\openautorefname}{Open Problem}
\crefformat{open}{\normalfont{#2Open Problem~#1#3}}

\newtheorem{corollary}[equation]{Corollary}
\newcommand{\corollaryautorefname}{Corollary}
\crefformat{corollary}{\normalfont{#2Corollary~#1#3}}

\newtheorem{proposition}[equation]{Proposition}
\newcommand{\propositionautorefname}{Proposition}
\crefformat{proposition}{\normalfont{#2Proposition~#1#3}}

\newtheoremstyle{lkx_definition}
{}{}{\slshape}{}{}{.}{ }
{{{\lkxtheoremstyle\thmname{#1}\thmnumber{ #2}}}\thmnote{ \lkxtheoremnotestyle({#3})}}

\theoremstyle{lkx_definition}
\newtheorem{definition}[equation]{Definition}
\newcommand{\definitionautorefname}{Definition}
\crefformat{definition}{\normalfont{#2Definition~#1#3}}

\newtheorem*{convention*}{Convention}
\newtheorem*{definition*}{Definition}
\newtheorem*{theorem*}{Theorem}
\newtheorem*{remark*}{Remark}
\newtheorem*{proposition*}{Proposition}
\newtheorem*{claim*}{Claim}
\newtheorem*{lemma*}{Lemma}
\newtheorem*{note*}{Note}
\newtheorem*{corollary*}{Corollary}
\newtheorem*{conjecture*}{Conjecture}

\newtheoremstyle{lkx_remark}
{}{}{}{}{}{.}{ }
{{\bfseries\thmname{#1}\thmnumber{ #2}}\thmnote{ (#3\index{#3})}}

\theoremstyle{lkx_remark}
\newtheorem{remark}[equation]{Remark}
\newcommand{\remarkautorename}{Remark}
\crefformat{remark}{\normalfont{#2Remark~#1#3}}

\newtheorem*{example*}{Example}
\newtheorem{example}[equation]{Example}
\crefformat{example}{\normalfont{#2Example~#1#3}}

\crefname{equation}{}{}
\crefformat{equation}{\normalfont{#2(#1)#3}}

% Proofs
\newcounter{stackproof}
\AtBeginDocument{\setcounter{stackproof}{0}}

% Indent theorem environments inside of proofs
\newenvironment{subproof}{%
	\ifnumcomp{\value{stackproof}}{>}{0}{%
		\begin{list}{}{
				\setlength{\itemsep}{0em}
				\setlength{\topsep}{0em}
				\setlength{\leftmargin}{1em}
				\setlength{\rightmargin}{0em}
				\setlength{\listparindent}{\parindent}
				\setlength{\itemindent}{\parindent}
				\setlength{\parsep}{\parskip}
			}
			\item\leavevmode\vspace{-1.5em}}{}}{%
			      \ifnumcomp{\value{stackproof}}{>}{0}{%
		\end{list}%
	}{}}

\newcommand{\lkxregisteramsthm}[1]{%
	\BeforeBeginEnvironment{#1}{\begin{subproof}}
			\AfterEndEnvironment{#1}{\end{subproof}}}

\lkxregisteramsthm{lemma}
\lkxregisteramsthm{proposition}
\lkxregisteramsthm{theorem}

\BeforeBeginEnvironment{proof}{%
	\begin{subproof}%
		\defcounter{stackproof}{\value{stackproof} + 1}}
		\AfterEndEnvironment{proof}{%
		\defcounter{stackproof}{\value{stackproof} - 1}
	\end{subproof}}
\renewcommand{\qed}{\hfill$\blacksquare$}
