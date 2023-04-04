%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tesis                                    %
% Version 1.1 by Miguel Angel Piña Avelino %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de la clase para la tesis %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{latex/classes/thesis}[2018/11/30 v1 thesis class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips,letterpaper,11pt]{book}
\else
   \LoadClass[letterpaper,11pt]{book}
\fi

%%%%%%%%%%%%%%%%%%%%%%%
% Paquetes utilizados %
%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc} % El tipo de codificación para la fuente
\usepackage[english]{babel} % Soporte multilenguaje
% y locales.
\usepackage{graphicx}
\usepackage{color}
\usepackage{xcolor}
% \usepackage{setspace}
\usepackage[hmarginratio=3:2]{geometry}
\usepackage{mathtools}
\usepackage{amsmath,amsfonts,amssymb,amsthm,thmtools}
\usepackage{svg}
\usepackage{paralist}
\usepackage{lipsum}
\usepackage{fancyhdr}
\usepackage{titlesec}
\usepackage{quotchap}
\usepackage{hyperref}
\usepackage{listings,chngcntr}
\usepackage{booktabs}
\usepackage{hyphenat}
\usepackage{subcaption}
\usepackage{courier}
\usepackage{enumitem}
\usepackage{tikz}
\usepackage{tikz-cd}
\usepackage[capitalise,noabbrev]{cleveref}
\usepackage{environ}
\usepackage{url}
\usepackage{multicol}
\usepackage{tabularx}
\usepackage{xspace}
\usepackage{courier}
\usetikzlibrary{matrix}
\usetikzlibrary{arrows,automata,positioning,matrix}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Draft, borrar cuando se entregue la versión final. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \usepackage{draftwatermark}
% \SetWatermarkText{\textsc{Borrador}}
% \SetWatermarkScale{4}
% \SetWatermarkColor[gray]{0.95}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuraciones de paquetes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% qalvg
\newcommand{\nfont}[2]{\textcolor{#1}{\fontfamily{lmss}\selectfont{#2}}}

\pagestyle{fancy} % Estilo de la página
\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\thechapter.\ #1}{}} % Ajuste de la fuente mostrada en el header
                         % asociada al capítulo.
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection\hspace{5pt}#1}{}}
% Fuente mostrada en el header asociada a la sección.
\fancyhf{} \fancyhead[LE,RO]{\sffamily\normalsize\thepage} % Numeración de la página.
\fancyhead[LO]{\rightmark}
\fancyhead[RE]{\leftmark}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{\fancyhead{}\renewcommand{\headrulewidth}{0pt}}
\setlength{\headheight}{52pt}%
\raggedbottom
%\flushbottom
\NewEnviron{abmn}{\marginnote{\BODY}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuración de hyperref %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{
    colorlinks = false,
    hidelinks
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Actualiza los margenes de la izquierda y la derecha. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{changemargin}[2]{%
  \begin{list}{}{%
      \setlength{\topsep}{0pt}%
      \setlength{\leftmargin}{#1}%
      \setlength{\rightmargin}{#2}%
      \setlength{\listparindent}{\parindent}%
      \setlength{\itemindent}{\parindent}%
      \setlength{\parsep}{\parskip}%
    }%
  \item[]}
  {\end{list}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entornos para el prefacio del libro %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{alwayssingle}{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \else\newpage\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

\newenvironment{prefacio} {
  \begin{alwayssingle} \pagestyle{empty}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Prefacio}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
    {\end{quote}\end{alwayssingle}}

\newenvironment{resumen} {
  \begin{alwayssingle} \pagestyle{empty}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Resumen}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{agradecimientos} {
  \pagestyle{empty}
  \begin{alwayssingle}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Agradecimientos}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
{\end{quote}\end{alwayssingle}}

% \renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[display]
{\bfseries\Large}
{\filleft\MakeUppercase{\chaptertitlename} \Huge\thechapter}
{4ex}
{\titlerule
\vspace{2ex}%
\filleft}
[\vspace{2ex}%
\titlerule]

\titleformat{\section}[frame]
{\normalfont}
{\filright
\footnotesize
\enspace ~ \thesection\enspace}
{8pt}
{\Large\bfseries\filcenter}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ajustes de matemáticas %
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtheoremstyle{ocrenumbox}% % titulo do teorema
{0pt}% Space above
{0pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\sffamily\color{ocre}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\color{ocre}\thmname{#1}\nobreakspace}% Theorem text
% (e.g. Theorem 2.1)

\newtheoremstyle{blacknumex}% Theorem style name
{5pt}% Space above
{5pt}% Space below
{\normalfont}% Body font
{} % Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily{\tiny\ensuremath{\blacksquare}}\nobreakspace}% Theorem text (e.g. Theorem 2.1)


\newtheoremstyle{blacknumbox} % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% Body font
{}% Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{\newline}% Space after theorem head
{\small\sffamily\thmname{#1}\thmnumber{ #2}\thmnote{ \bfseries{(#3)}}\nobreakspace}% Theorem text (e.g. Theorem 2.1)

% Non-boxed/non-framed environments
\newtheoremstyle{ocrenum}% % Theorem style name
{5pt}% Space above
{5pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\sffamily\color{ocre}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\color{ocre}\thmname{#1}\thmnumber{ #2}\thmnote{ \bfseries{(#3)}}\nobreakspace}% Theorem text
% (e.g. Theorem 2.1)

\newtheoremstyle{break}{\topsep}{\topsep}{\itshape}{}{\bfseries}{}{newline}{}
\newtheoremstyle{notes}{\topsep}{\topsep}{\itshape}{}{\bfseries}{}{newline}{}

\definecolor{ocre}{RGB}{191,191,191}
\newcounter{dummy}
\numberwithin{dummy}{section}
\theoremstyle{ocrenumbox}
\newtheorem{theoremeT}[dummy]{Theorem}
\newtheorem{problem}{Problem}[chapter]
\newtheorem{exerciseT}{Exercise}[chapter]
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Example}[chapter]
\theoremstyle{blacknumbox}
\newtheorem{definitionT}{Definition}[chapter]
\newtheorem{descriptionT}{Description}[chapter]
\newtheorem{vocabulary}{Vocabulary}[chapter]
\newtheorem{corollaryT}[dummy]{Corollary}
\newtheorem{remark}[dummy]{Remark}
\newtheorem{note}[dummy]{Note}
\newtheorem{noteT}{Note}
\theoremstyle{ocrenum}
\newtheorem{proposition}[dummy]{Proposition}

\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

% Theorem box
\newmdenv[skipabove=7pt,
          skipbelow=7pt,
          backgroundcolor=black!5,
          linecolor=ocre,
          innerleftmargin=5pt,
          innerrightmargin=5pt,
          innertopmargin=5pt,
          leftmargin=0cm,
          rightmargin=0cm,
          innerbottommargin=5pt]{tBox}

% Exercise box
\newmdenv[skipabove=7pt,
          skipbelow=7pt,
          rightline=false,
          leftline=true,
          topline=false,
          bottomline=false,
          backgroundcolor=ocre!10,
          linecolor=ocre,
          innerleftmargin=5pt,
          innerrightmargin=5pt,
          innertopmargin=5pt,
          innerbottommargin=5pt,
          leftmargin=0cm,
          rightmargin=0cm,
          linewidth=4pt]{eBox}

% Definition box
\newmdenv[skipabove=5pt,
          skipbelow=5pt,
          rightline=false,
          leftline=true,
          topline=false,
          bottomline=false,
          linecolor=ocre,
          innerleftmargin=0.5cm,
          innerrightmargin=5pt,
          innertopmargin=0pt,
          leftmargin=0cm,
          rightmargin=0cm,
          linewidth=4pt,
          innerbottommargin=0pt]{dBox}

% Corollary box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=gray,
backgroundcolor=black!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=5pt]{cBox}

\def\smartsmallskip{\par
  \ifdim\lastskip>0pt \else \smallskip\fi
}

% Creates an environment for each type of theorem and assigns it a theorem text style from the "Theorem Styles" section above and a colored box from above
\newenvironment{theorem}{\begin{tBox}\begin{theoremeT}}{\end{theoremeT}\end{tBox}}
\newenvironment{exercise}{\begin{eBox}\begin{exerciseT}}{\hfill{\color{ocre}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}
\newenvironment{definition}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}
\newenvironment{desc}{\begin{dBox}\begin{descriptionT}}{\end{descriptionT}\end{dBox}}
\newenvironment{example}{\begin{exampleT}}{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}
\newenvironment{corollary}{\begin{cBox}\begin{corollaryT}}{\end{corollaryT}\end{cBox}}
\newenvironment{mydescription}[1]{\begin{dBox}\textbf{#1}}{\end{dBox}\smartsmallskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Correcta silabación de palabras %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hyphenation{E-the-reum e-the-reum}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\definecolor{mypink}{RGB}{50, 50, 50}
\definecolor{myblue}{RGB}{120, 120, 120}
\definecolor{mypurple}{RGB}{170, 170, 170}
\definecolor{amber}{rgb}{1.0, 0.49, 0.0}
\definecolor{x11gray}{rgb}{0.75, 0.75, 0.75}
\lstdefinestyle{Solidity}{
  frame=single,language=Java,morekeywords={pragma,
    solidity,struct,contract,uint,bool,address,bytes32,mapping,
    function,constructor,push,require,returns,view,storage,msg.sender,
    var},
  numbers=left,
  numbersep=5pt,
  numberstyle=\tiny\color{mygray},
  stringstyle=\color{mymauve},
  keywordstyle=\color{blue},,
  commentstyle=\color{mygray},
  basicstyle=\footnotesize\ttfamily,
  backgroundcolor=\color{white},
  showstringspaces=false,
  breaklines=true,
  captionpos=b
}

\lstset{
  basicstyle=\footnotesize\mdseries\ttfamily,
  mathescape=true,
  frame=Trbl,
  numbers=left,
  numberstyle=\tiny\color{mygray},
  keywordstyle=\color{blue},
  showstringspaces=false,
  commentstyle=\color{x11gray},
  stringstyle=\color{amber},
  breaklines=true
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ajusta el nombre del índice de códigos mostrados en la tesis %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\lstlistingname}{Code}
\setcounter{tocdepth}{1}
\newcommand{\nimplies}{\;\not\nobreak\!\!\!\!\implies}
\AtBeginDocument{\counterwithin{lstlisting}{section}}
\AtBeginDocument{\renewcommand{\thelstlisting}{\thesection.\arabic{lstlisting}}}

%%%%%%%%%%%%%%%%%%%
% Custom commands %
%%%%%%%%%%%%%%%%%%%

\hyphenation{Reentrant-Read-Write-Lock Stamped-Lock}
\newcommand{\R}{{\sf \small Read}\xspace}
\newcommand{\W}{{\sf \small Write}\xspace}

% \renewcommand{\lstlistlistingname}{Índice de códigos}%\lstlistingname

% \setlist{itemsep=4pt,parsep=0pt}
