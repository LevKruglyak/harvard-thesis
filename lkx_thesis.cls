\ProvidesClass{lkx_thesis}[Senior Thesis Class]
\LoadClass[11pt, letterpaper]{article}
\usepackage[utf8]{inputenc}
\RequirePackage{ifthen}


% -----------------------------------------------
%               Font
% -----------------------------------------------

\usepackage[T1]{fontenc}
\usepackage[finnish]{babel}

% -----------------------------------------------
%               Configuration
% -----------------------------------------------

\def\@author{}
\def\@title{}
\def\@subtitle{}

\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}

% -----------------------------------------------
%               For title page
% -----------------------------------------------
\usepackage{titling}
\renewcommand\maketitlehooka{\null\mbox{}\vfill}
\renewcommand\maketitlehookd{\vfill\null}
