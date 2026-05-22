\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{plotweaver}[2026 LaTeX Plotweaver class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twocolumn,twoside]{article}
\RequirePackage{geometry}
\geometry{
    paper=letterpaper,
    top=1in,
    bottom=1in,
    left=1in,
    right=1in,
    includeheadfoot
}
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{8in}
\pagenumbering{arabic}

\RequirePackage{xparse}

\RequirePackage[x11names]{xcolor}
\newcommand{\maincolor}{DodgerBlue4!85!black}
\newcommand{\headlinecolor}{\color{\maincolor}}
\newcommand{\underlinecolor}{\color{Gold3}}

\RequirePackage{fontspec}
\setmainfont{TeX Gyre Schola}
\setsansfont{Noto Sans}

\AtBeginDocument{
  \pagecolor{DodgerBlue4!03!white}
}

\RequirePackage{amsmath}
\RequirePackage{bm}
\RequirePackage{bbding}
\let\orig@chooseSymbol\@chooseSymbol
\renewcommand{\@chooseSymbol}[1]{\raisebox{-0.5ex}[1.0ex][0pt]{\orig@chooseSymbol{#1}}}

\RequirePackage{titlesec}

\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins, raster}
\usetikzlibrary{calc, chains, backgrounds, positioning, arrows.meta,bending,shapes.geometric}
\pgfdeclarelayer{foreground}
\pgfdeclarelayer{lines}
\pgfsetlayers{background,lines,main,foreground}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             TITLE & SECTIONS              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \ifnum \col@number=\@ne
        \scshape\headlinecolor\@maketitle
      \else
        \twocolumn[\scshape\headlinecolor\@maketitle]%
      \fi
      \thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}

\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\huge \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}

\renewcommand{\section}{%
    \@startsection
    {section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\normalfont\LARGE\scshape\headlinecolor}%
}
\setcounter{secnumdepth}{0}

\titleformat{\subsection}
  {\normalfont\Large\scshape\headlinecolor}
  {\thesection}
  {1em}
  {}
  [{\underlinecolor\titlerule[1pt]}]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  BOXES                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtcolorbox{featureBox}[1]{
    enhanced,
    sharp corners,
    colback=white,
    colframe=white,
    colbacktitle=white,
    titlerule=-0.5pt,
    boxsep=1em,
    frame code={%
        \begin{pgfonlayer}{foreground}
            % outer box
            \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {xshift=1pt}, white}] ($(frame.north west) + (0pt, -0.925em)$) -- ($(frame.south west) + (0pt, 0.925em)$);
            \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {xshift=-1pt}, white}] ($(frame.north east) + (0pt, -0.925em)$) -- ($(frame.south east) + (0pt, 0.925em)$);
            \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=-1pt}, white}] ($(frame.north west) + (0.925em, 0pt)$) -- ($(frame.north east) + (-0.925em, 0pt)$);
            \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] ($(frame.south west) + (0.925em, 0pt)$) -- ($(frame.south east) + (-0.925em, 0pt)$);

            % round corners
            \begin{scope}
                \clip (frame.south west) rectangle (frame.north east);
                \draw[line width = 1.5pt, color = black] (frame.south west) circle (1em);
                \draw[line width = 1.5pt, color = black] (frame.north west) circle (1em);
                \draw[line width = 1.5pt, color = black] (frame.north east) circle (1em);
                \draw[line width = 1.5pt, color = black] (frame.south east) circle (1em);
            \end{scope}

            % inner box
            \draw[line width = 1pt, color=black] ($(frame.north west) + (1em, -0.3em)$) -- ($(frame.north west) + (0.3em, -0.3em)$) -- ($(frame.south west) + (0.3em, 0.3em)$) -- ($(frame.south east) + (-0.3em, 0.3em)$) -- ($(frame.north east) + (-0.3em, -0.3em)$) -- ($(frame.north east) + (-1em, -0.3em)$);
        \end{pgfonlayer}
    },
    title={#1},
    coltitle=black,
    fonttitle=\sffamily\scshape\large,
    halign title=flush center,
    bottomtitle = -1.5em,
    fontupper=\sffamily,
    segmentation code={
        \begin{pgfonlayer}{foreground}
            \draw[line width = 1.5pt, color = black] ($(segmentation.west) + (-0.2em, 0pt)$) -- ($(segmentation.east) + (0.2em, 0pt)$);
        \end{pgfonlayer}
    },
    subtitle style={
        boxrule=0pt,
        top=-1.5em,
        after skip=1.25\baselineskip,
        colframe=white,
        colback=white,
        coltext=black,
        fonttitle=\sffamily\scshape\large,
        halign=flush center
    },
    fontlower=\sffamily
}

\newtcolorbox{leftBox}[1]{
    enhanced,
    nobeforeafter,
    colback=white,
    boxsep=1em,
    frame code={%
        \begin{pgfonlayer}{foreground}
            % outer box
            \begin{scope}
                \clip (frame.south west) rectangle (frame.north east);
                \draw[line width = 1.5pt, color = black] (frame.south west) circle (1em);
                \draw[line width = 1.5pt, color = black] (frame.north west) circle (1em);
            \end{scope}
            \draw[line width = 1.5pt, color = black] ($(frame.north west) + (0pt, -0.925em)$) -- ($(frame.south west) + (0pt, 0.925em)$);
            \draw[line width = 1.5pt, color = black] ($(frame.north east) + (0pt, 0.075em)$) -- ($(frame.south east) + (0pt, -0.075em)$);
            \draw[line width = 1.5pt, color = black] ($(frame.north west) + (0.925em, 0pt)$) -- (frame.north east);
            \draw[line width = 1.5pt, color = black] ($(frame.south west) + (0.925em, 0pt)$) -- (frame.south east);

            % inner box
            \draw[line width = 1pt, color=black] ($(frame.north west) + (1em, -0.3em)$) -- ($(frame.north west) + (0.3em, -0.3em)$) -- ($(frame.south west) + (0.3em, 0.3em)$) -- ($(frame.south east) + (-0.3em, 0.3em)$) -- ($(frame.north east) + (-0.3em, 0em)$);
        \end{pgfonlayer}
    },
    title={#1},
    coltitle=black,
    fonttitle=\sffamily\scshape\large,
    halign title=flush center,
    bottomtitle = -1.5em,
    fontupper=\sffamily,
    segmentation code={
        \draw[line width = 1.5pt, color = black] ($(segmentation.west) + (-0.2em, 0pt)$) -- ($(segmentation.east) + (0.2em, 0pt)$);
    },
    subtitle style={
        boxrule=0pt,
        top=-1.5em,
        after skip=1.25\baselineskip,
        colframe=white,
        colback=white,
        coltext=black,
        fonttitle=\sffamily\scshape\large,
        halign=flush center
    },
    fontlower=\sffamily
}

\newtcolorbox{rightBox}[1]{
    enhanced,
    nobeforeafter,
    colback=white,
    boxsep=1em,
    frame code={%
        \begin{pgfonlayer}{foreground}
            % outer box
            \begin{scope}
                \clip (frame.south west) rectangle (frame.north east);
                \draw[line width = 1.5pt, color = black] (frame.north east) circle (1em);
                \draw[line width = 1.5pt, color = black] (frame.south east) circle (1em);
            \end{scope}
            \draw[line width = 1.5pt, color = black] ($(frame.north west) + (0pt, 0.075em)$) -- ($(frame.south west) + (0pt, -0.075em)$);
            \draw[line width = 1.5pt, color = black] ($(frame.north east) + (0pt, -0.925em)$) -- ($(frame.south east) + (0pt, 0.925em)$);
            \draw[line width = 1.5pt, color = black] (frame.north west) -- ($(frame.north east) + (-0.925em, 0pt)$);
            \draw[line width = 1.5pt, color = black] (frame.south west) -- ($(frame.south east) + (-0.925em, 0pt)$);

            % inner box
            \draw[line width = 1pt, color=black]  ($(frame.north west) + (0.3em, 0em)$) -- ($(frame.south west) + (0.3em, 0.3em)$) -- ($(frame.south east) + (-0.3em, 0.3em)$) -- ($(frame.north east) + (-0.3em, -0.3em)$) -- ($(frame.north east) + (-1em, -0.3em)$);
        \end{pgfonlayer}
    },
    title={#1},
    coltitle=black,
    fonttitle=\sffamily\scshape\large,
    halign title=flush center,
    bottomtitle = -1.5em,
    fontupper=\sffamily,
    segmentation code={
        \draw[line width = 1.5pt, color = black] ($(segmentation.west) + (-0.2em, 0pt)$) -- ($(segmentation.east) + (0.2em, 0pt)$);
    },
    subtitle style={
        boxrule=0pt,
        top=-1.5em,
        after skip=1.25\baselineskip,
        colframe=white,
        colback=white,
        coltext=black,
        fonttitle=\sffamily\scshape\large,
        halign=flush center
    },
    fontlower=\sffamily
}

\newtcolorbox{keyTalentBox}[1]{
    enhanced,
    remember as=kt,
    nobeforeafter,
    width=15em,
    sharp corners,
    colback=white,
    colframe=white,
    colbacktitle=white,
    titlerule=-0.5pt,
    boxsep=1em,
    frame code={%
        \begin{pgfonlayer}{foreground}
            % outer box
            \draw[line width = 1.5pt, color = Gold3, preaction = {draw, line width=1pt, transform canvas = {xshift=1pt}, white}] ($(frame.north west) + (0pt, -0.925em)$) -- ($(frame.south west) + (0pt, 0.925em)$);
            \draw[line width = 1.5pt, color = Gold3, preaction = {draw, line width=1pt, transform canvas = {xshift=-1pt}, white}] ($(frame.north east) + (0pt, -0.925em)$) -- ($(frame.south east) + (0pt, 0.925em)$);
            \draw[line width = 1.5pt, color = Gold3, preaction = {draw, line width=1pt, transform canvas = {yshift=-1pt}, white}] ($(frame.north west) + (0.925em, 0pt)$) -- ($(frame.north east) + (-0.925em, 0pt)$);
            \draw[line width = 1.5pt, color = Gold3, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] ($(frame.south west) + (0.925em, 0pt)$) -- ($(frame.south east) + (-0.925em, 0pt)$);

            % round corners
            \begin{scope}
                \clip (frame.south west) rectangle (frame.north east);
                \draw[line width = 1.5pt, color = Gold3] (frame.south west) circle (1em);
                \draw[line width = 1.5pt, color = Gold3] (frame.north west) circle (1em);
                \draw[line width = 1.5pt, color = Gold3] (frame.north east) circle (1em);
                \draw[line width = 1.5pt, color = Gold3] (frame.south east) circle (1em);
            \end{scope}

            % inner box
            \draw[line width = 1pt, color=Gold3] ($(frame.north west) + (1em, -0.3em)$) -- ($(frame.north west) + (0.3em, -0.3em)$) -- ($(frame.south west) + (0.3em, 0.3em)$) -- ($(frame.south east) + (-0.3em, 0.3em)$) -- ($(frame.north east) + (-0.3em, -0.3em)$) -- ($(frame.north east) + (-1em, -0.3em)$);
        \end{pgfonlayer}
    },
    title={#1},
    coltitle=\maincolor,
    fonttitle=\sffamily\scshape\large,
    halign title=flush left,
    bottomtitle = -1.5em,
    fontupper=\sffamily,
    segmentation code={
        \begin{pgfonlayer}{foreground}
            \draw[line width = 1.5pt, color = Gold3] ($(segmentation.west) + (-0.2em, 0pt)$) -- ($(segmentation.east) + (0.2em, 0pt)$);
        \end{pgfonlayer}
    },
    subtitle style={
        boxrule=0pt,
        top=-1.5em,
        after skip=1.25\baselineskip,
        colframe=white,
        colback=white,
        coltext=\maincolor,
        fonttitle=\sffamily\scshape\large,
        halign=flush center
    },
    fontlower=\sffamily
}

\NewDocumentCommand{\statBox}{mmmm}{
    \begin{tcbraster}[raster columns=2, raster equal height]
        \begin{leftBox}{#1}
            #2
        \end{leftBox}
        \begin{rightBox}{#3}
            #4
        \end{rightBox}
    \end{tcbraster}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%               ACTIVATIONS                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Action
\NewDocumentCommand{\action}{}{\text{\hspace{0.1em}\raisebox{0.45ex}{\rotatebox[origin=c]{90}{\normalfont\tiny\TriangleDown}} }}

% Double Action
\NewDocumentCommand{\doubleAction}{}{\ooalign{\action\hspace{-0.35em}\action}}

% Triple Action
\NewDocumentCommand{\tripleAction}{}{\ooalign{\action\hspace{-0.35em}\action\hspace{-0.35em}\action}}

% Free Action
\NewDocumentCommand{\freeAction}{}{\raisebox{1pt}{\(\bm{\triangleright}\)} }

% Reaction
\NewDocumentCommand{\reaction}{}{%
  \tikz[baseline=-0.2ex]{
      \draw[{Triangle[length=0.5em, width=0.5em]}-,line width=0.125em] 
            (0,0.15) -- (0.3,0.15) 
            arc (90:-90:0.075cm) 
            -- (0.1,0);
  }~%
}

% Forever
\NewDocumentCommand{\forever}{}{%
  \tikz[baseline=-0.6ex]{
    \draw[domain=0:359, smooth, samples=100, line width=0.125em] 
        plot ({0.2*cos(\x)/(1+sin(\x)^2)}, {0.2*sin(\x)*cos(\x)/(1+sin(\x)^2)}) -- cycle;
  }~%
}

% Complication
\NewDocumentCommand{\complication}{o}{
  \hspace{-0.15em}%
  \tikz[baseline=-0.65ex]{
    \node[fill=Firebrick2, shape=star, star points=9, star point height=0.25em, star point ratio=2, minimum size=1.1em, inner sep=0pt, anchor=center, rotate=20] at (0,0) {};
    \node[fill=white, shape=star, star points=9, star point height=0.25em, star point ratio=2, minimum size=0.9em, inner sep=0pt, anchor=center] at (0,0) {};
  }%
  \IfNoValueTF{#1}{}{\,{\color{Firebrick2}#1}}
}

% Complication Dice
\NewDocumentCommand{\complicationDice}{o}{
  \hspace{-0.15em}%
  \tikz[baseline=-0.65ex]{
    \node[fill=Firebrick2, shape=star, star points=9, star point height=0.25em, star point ratio=2, minimum size=1.4em, inner sep=0pt, anchor=center, rotate=20] at (0,0) {};
    \node[fill=white, shape=star, star points=9, star point height=0.25em, star point ratio=2, minimum size=1.1em, inner sep=0pt, anchor=center] at (0,0) {\IfNoValueTF{#1}{}{\color{Firebrick2}\tiny #1}};
  }~%
}

% Opportunity
\NewDocumentCommand{\opportunity}{}{
  \hspace{-0.5em}%
  \tikz[baseline=-0.65ex]{
    \draw[color=\maincolor, line width=0.075em, sharp corners, anchor=center] 
        (0:0.15) .. controls (22.5:0.025) and (67.5:0.025) .. (90:0.15)
        .. controls (112.5:0.025) and (157.5:0.025) .. (180:0.15)
        .. controls (202.5:0.025) and (247.5:0.025) .. (270:0.15)
        .. controls (292.5:0.025) and (337.5:0.025) .. cycle;
    \draw[color=\maincolor, line width=0.075em, anchor=center] (0,0) circle (0.3em);
  }~%
}

% Key Talent Star
\newcommand{\key}{\raisebox{0.075em}{\normalfont\FiveStar~}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%               TALENT TREE                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Talent TikZ Style
\tikzstyle{talent} = [rectangle, fill=white, text width=10em, sharp corners, minimum height=3em, draw=white, node font=\sffamily\normalsize, inner sep=0.5em]

% Connector TikZ Style
\tikzstyle{connector} = [color=white, sharp corners, line width = 3pt]

% Key Talent
\NewDocumentCommand{\keyTalent}{mm}{
  \begin{keyTalentBox}{\key \textbf{#1}}
      #2
  \end{keyTalentBox}
}

% Normal Talent
\NewDocumentCommand{\talent}{mom}{
  {\color{\maincolor}\bfseries\scshape\hspace{-0.6em} #1}\\
  \IfNoValueTF{#2}{}{{\color{black!50}\footnotesize\itshape #2}\\}
  {\color{black}\small #3}
}