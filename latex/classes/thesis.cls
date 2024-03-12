%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tesis                                    %
% Version 1.1 by Miguel Angel Piña Avelino %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de la clase para la tesis %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{latex/classes/thesis}[2023/08/16 v2 thesis class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips,letterpaper,12pt]{book}
\else
   \LoadClass[letterpaper,12pt]{book}
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
\usepackage[final]{listings}
\usepackage{chngcntr}
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
\usepackage{soul}
\usetikzlibrary{matrix}
\usetikzlibrary{arrows,automata,positioning,matrix}
\usepackage{ifthen}
\usepackage{float}

\renewcommand{\qedsymbol}{$\blacksquare$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Draft, borrar cuando se entregue la versión final. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{ifdraft, blindtext}
\ifoptiondraft{%
    \usepackage{draftwatermark}
    \SetWatermarkText{\textsc{Draft}}
    \SetWatermarkScale{4}
    \SetWatermarkColor[gray]{0.95}
    \setkeys{Gin}{draft=false}
}{%
    % nothing to be done here
}

\usepackage[normalem]{ulem}
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
    hidelinks,
    final
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

\newtheoremstyle{ocrenumbox}% % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\sffamily}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\thmname{#1}\thmnumber{ #2}\thmnote{ \bfseries{(#3)}}\nobreakspace}% Theorem text
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

\theoremstyle{blacknumbox}
\newtheorem{exampleT}{Example}[chapter]
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
\newmdenv[skipabove=12pt,
          skipbelow=5pt,
          backgroundcolor=black!2.5,
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
\newmdenv[skipabove=14pt,
          skipbelow=14pt,
          rightline=false,
          leftline=true,
          topline=false,
          bottomline=false,
          linecolor=ocre,
          innerleftmargin=0.3cm,
          innerrightmargin=5pt,
          innertopmargin=6pt,
          leftmargin=0cm,
          rightmargin=0cm,
          linewidth=3pt,
          innerbottommargin=12pt]{dBox}

% Proof box
\newmdenv[skipabove=5pt,
          skipbelow=10pt, 
          rightline=false, 
          leftline=true, 
          topline=false, 
          bottomline=false, 
          linecolor=ocre, 
          innerleftmargin=0.3cm, 
          innerrightmargin=5pt,
          innertopmargin=6pt,
          leftmargin=0cm,
          linewidth=3pt,
          innerbottommargin=12pt]{dProof}

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
\newenvironment{proofT}[1][{\small\sffamily\bf\itshape Proof:}]{\begin{dProof}\begin{proof}[#1]$ $\newline}{\end{proof}\end{dProof}}
\newenvironment{exercise}{\begin{eBox}\begin{exerciseT}}{\hfill{\color{ocre}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}
\newenvironment{definition}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}
\newenvironment{desc}{\begin{dBox}\begin{descriptionT}}{\end{descriptionT}\end{dBox}}
\newenvironment{example}{\begin{dBox}\begin{exampleT}}{\end{exampleT}\end{dBox}}
\newenvironment{corollary}{\begin{cBox}\begin{corollaryT}}{\end{corollaryT}\end{cBox}}
\newenvironment{mydescription}[1]{\begin{dBox}\textbf{#1}}{\end{dBox}\smartsmallskip}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Correcta silabación de palabras %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hyphenation{E-the-reum e-the-reum}
\definecolor{mygray}{rgb}{191, 191, 191}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\definecolor{mypink}{RGB}{50, 50, 50}
\definecolor{myblue}{RGB}{120, 120, 120}
\definecolor{mypurple}{RGB}{170, 170, 170}
\definecolor{amber}{rgb}{1.0, 0.49, 0.0}
\definecolor{x11gray}{rgb}{0.75, 0.75, 0.75}
\definecolor{backcolour}{rgb}{0.97255, 0.96863, 0.96863}

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
  numbersep=5pt,
  numberstyle=\tiny\color{mygray},
  keywordstyle=\color{blue},
  showstringspaces=false,
  commentstyle=\color{x11gray},
  stringstyle=\color{amber},
  breaklines=true,
  backgroundcolor=\color{backcolour},
  keepspaces=true,  
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
% \renewcommand{\lstlistlistingname}{Índice de códigos}%\lstlistingname
% \setlist{itemsep=4pt,parsep=0pt}
\newcommand{\Put}{{\sf \small Put}\xspace}
\newcommand{\Take}{{\sf \small Take}\xspace}
\newcommand{\Puts}{{\sf \small Puts}\xspace}
\newcommand{\Takes}{{\sf \small Takes}\xspace}
\newcommand{\Steal} {{\sf \small Steal}\xspace}
\newcommand{\Steals} {{\sf \small Steals}\xspace}
\newcommand{\RAW}{{\sf \small Read-After-Write}\xspace}
\newcommand{\RMW}{{\sf \small Read-Modify-Write}\xspace}
\newcommand{\CAS}{{\sf \small Compare\&Swap}\xspace}
\newcommand{\TAS}{{\sf \small Test\&Set}\xspace}
\newcommand{\FAI}{{\sf \small Fetch\&Increment}\xspace}
\newcommand{\SWAP}{{\sf \small Swap}\xspace}
\newcommand{\LL}{{\sf \small LL}\xspace}
\newcommand{\IC}{{\sf \small IC}\xspace}
\newcommand{\SC}{{\sf \small SC}\xspace}
\newcommand{\R}{{\sf \small Read}\xspace}
\newcommand{\W}{{\sf \small Write}\xspace}
\newcommand{\ok}{{\sf \small OK}\xspace}
\newcommand{\closed}{{\sf \small CLOSED}\xspace}
\newcommand{\MaxReg}{{\sf \small MaxRegister}\xspace}
\newcommand{\RangeMaxReg}{{\sf \small RangeMaxRegister}\xspace}
\newcommand{\abort}{{\sf \small abort}\xspace}
\newcommand{\Enq}{{\sf \small Enqueue}\xspace}
\newcommand{\Push}{{\sf \small Push}\xspace}
\newcommand{\Pop}{{\sf \small Pop}\xspace}
\newcommand{\Deq}{{\sf \small Dequeue}\xspace}
\newcommand{\op}{{\sf \small op}\xspace}
\newcommand{\true}{{\sf \small true}\xspace}
\newcommand{\false}{{\sf \small false}\xspace}
\newcommand{\epty}{{\sf \small empty}\xspace}
\newcommand{\NBWSM}{{\sf \small NB-WS-MULT}\xspace}
\newcommand{\SetLin}{{\sf \small SetLin}\xspace}
\newcommand{\WFWSM}{{\sf \small WS-MULT}\xspace}
\newcommand{\MaxR}{{\sf \small MaxRead}\xspace}
\newcommand{\MaxW}{{\sf \small MaxWrite}\xspace}
\newcommand{\RMaxR}{{\sf \small RMaxRead}\xspace}
\newcommand{\RMaxW}{{\sf \small RMaxWrite}\xspace}
\newcommand{\NCWSM}{{\sf \small WS-WMULT}\xspace}
\newcommand{\Lin}{{\sf \small Lin}\xspace}
\newcommand{\ABWSM}{{\sf \small ABRT-WS-MULT}\xspace}
\newcommand{\BNBWSM}{{\sf \small B-WS-MULT}\xspace}
\newcommand{\BNCWSM}{{\sf \small B-WS-WMULT}\xspace}
\newcommand{\BWFWSM}{{\sf \small B-WS-MULT}\xspace}
\newcommand{\full}{{\sf \small FULL}\xspace}
\newcommand{\open}{{\sf \small OPEN}\xspace}
\newcommand{\compete}{{\sf \small compete}\xspace}

\newcounter{linecounter}
\newcommand{\linenumbering}{\ifthenelse{\value{linecounter}<10}{(0\arabic{linecounter})}{(\arabic{linecounter})}}
\renewcommand{\line}[1]{\refstepcounter{linecounter}\label{#1}\linenumbering}
\newcommand{\resetline}[1]{\setcounter{linecounter}{0}#1}

\newcommand{\AC}[1]{{\color{violet}#1}}
\newcommand{\ACC}[1]{{\color{red}#1}}
\definecolor{hanblue}{RGB}{68, 108, 207}
\newcommand{\MP}[1]{{\textcolor{hanblue}{#1}}}
\newcommand{\DISCUSS}[1]{{\textcolor{orange}{#1}}}
\hyphenation{li-nea-ri-za-bi-li-ty}
\hyphenation{li-nea-ri-za-ble}
\hyphenation{set-li-nea-ri-za-bi-li-ty}
\babelhyphenation[english]{li-nea-ri-za-bi-li-ty}
\babelhyphenation[english]{Thread-ri-pper}
\babelhyphenation[english]{non-con-cu-rrent}
\babelhyphenation[english]{con-cur-rent}

\newenvironment{thesisproof}[1][\proofname]{%
  \begin{proof}[#1]$ $\par\nobreak\ignorespaces
}{%
  \end{proof}
}



%%% Local Variables:
%%% mode: latex
%%% TeX-master: "../main"
%%% End:
