%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% My article                               %
% Version 1.0 by Miguel Angel Piña Avelino %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de la clase para artículo con Código %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{latex/classes/myarticle}[2023/02/07 v1 myarticle class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
  \LoadClass[dvips,a4paper,11pt]{article}
\else
  \LoadClass[a4paper,11pt]{article}
\fi

%%%%%%%%%%%%%%%%%%%%%%%
% Paquetes utilizados %
%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{amsmath,amssymb,amsthm,geometry,hyperref,paralist,svg,thmtools,tikz,tikz-cd}
\usepackage{mathtools}
\usepackage[capitalise,noabbrev]{cleveref}
\usepackage{mdframed} \usepackage{svg}
\usepackage{environ} \NewEnviron{abmn}{\marginnote{\BODY}}
\usepackage{url}
\usepackage{color}
\usepackage{listings,chngcntr}% http://ctan.org/pkg/listings
\usepackage{multicol}
\usepackage{url}
\usepackage{tabularx}
\usepackage{xspace}
\usepackage{courier}
\definecolor{amber}{rgb}{1.0, 0.49, 0.0}
\definecolor{x11gray}{rgb}{0.75, 0.75, 0.75}
\lstset{ basicstyle=\footnotesize\mdseries\ttfamily, mathescape=true, frame=Trbl, numbers=left, keywordstyle=\color{blue}, showstringspaces=false, commentstyle=\color{x11gray}, stringstyle=\color{amber}, breaklines=true}
\renewcommand{\lstlistingname}{Code}
\setcounter{tocdepth}{1}
\newtheoremstyle{break}{\topsep}{\topsep}{\itshape}{}{\bfseries}{}{\newline}{}
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{affirmation}[theorem]{Affirmation}
\theoremstyle{definition}
\newtheorem{example}{Example}
\newtheorem{exmpl}{Example}
\newtheorem{exercise}{Exercise}
\theoremstyle{remark}
\newtheorem{note}{Note}
\newtheorem{remark}{Remark}
\usetikzlibrary{arrows,automata,positioning}
\NewEnviron{obs}{\begin{mdframed}\begin{remark} \BODY \end{remark}\end{mdframed}}
\NewEnviron{nota}{\begin{mdframed}\begin{note} \BODY \end{note}\end{mdframed}}
\renewcommand{\qedsymbol}{\textbf{\therefore}}
\NewEnviron{blk}{\begin{mdframed}\BODY\end{mdframed}}
\newcommand{\nimplies}{\;\not\nobreak\!\!\!\!\implies}
\AtBeginDocument{\renewcommand{\thelstlisting}{\thesection.\arabic{lstlisting}}}
\AtBeginDocument{\counterwithin{lstlisting}{section}}
\newcommand{\R}{{\sf \small Read}\xspace}
\newcommand{\W}{{\sf \small Write}\xspace}
\hyphenation{Reentrant-Read-Write-Lock Stamped-Lock}
