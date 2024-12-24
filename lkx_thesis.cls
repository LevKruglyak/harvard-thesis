\ProvidesClass{lkx_thesis}[Senior Thesis Class]
\LoadClass[11pt, letterpaper]{report}
\usepackage[utf8]{inputenc}
\RequirePackage{ifthen}

% TODO: configure in thesis.tex
\usepackage[portrait, margin=1in, includefoot]{geometry}

% -----------------------------------------------
%               Font
% -----------------------------------------------

\usepackage[T1]{fontenc}
\RequirePackage{mlmodern}
\usepackage{bold-extra}

\usepackage{setspace}
% \doublespace

% -----------------------------------------------
%               Configuration
% -----------------------------------------------

\def\@author{}
\def\@title{}
\def\@subtitle{}
\def\@university{}
\def\@location{}
\def\@department{}
\def\@date{}
\def\@degree{}
\def\@subject{}
\def\@titlegraphic{}

\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\titlegraphic}[1]{\def\@titlegraphic{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\location}[1]{\def\@location{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\subject}[1]{\def\@subject{#1}}

% -----------------------------------------------
%                   Collaborators
% -----------------------------------------------

\usepackage{etoolbox}

\newtoggle{firstadvisor}
\toggletrue{firstadvisor}
\newcommand\advisorlist{}

\newcommand\advisor[1]{%
	\iftoggle{firstadvisor}
	{%
		\def\advisorlist{#1}
		\togglefalse{firstadvisor}%
	}
	{%
		\gappto\advisorlist{,\\ #1}
	}
}

% -----------------------------------------------
%               For title page
% -----------------------------------------------
\usepackage{titling}
\renewcommand\maketitlehooka{\null\mbox{}\vfill}
\renewcommand\maketitlehookd{\vfill\null}

% -----------------------------------------------
%               Chapter
% -----------------------------------------------
\usepackage{moresize}
\makeatletter
\def\@makechapterhead#1{
  {\parindent \z@ \center \normalfont
		\bfseries 
    \ifnum \c@secnumdepth >\m@ne
      \HUGE --\!-- \thechapter \hskip 8\p@--\!--\ 
    \fi
    \interlinepenalty\@M
    \vskip 5\p@
    \huge #1\par\nobreak
    \vskip 40\p@
  }}
\makeatother

\makeatletter
\def\@makeschapterhead#1{%
  {\parindent \z@ \centering \normalfont
		\bfseries 
    \interlinepenalty\@M
    \vskip 5\p@
    \huge #1\par\nobreak
    \vskip 40\p@
  }}
\makeatother
