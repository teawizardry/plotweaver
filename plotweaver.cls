\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{plotweaver}[2026 LaTeX Plotweaver class]
\DeclareKeys[plotweaver]
{
    article.if = chararticletype,
    article.usage = load,
    standalone.if = charstandalonetype,
    standalone.usage = load,
    stormlight.if = charstormlightcs,
    stormlight.usage = general,
    mistborn.if = charmistborncs,
    mistborn.usage = general,
    ariandor.if = charariandorcs,
    ariandor.usage = general,
}
\ProcessKeyOptions
\ifcharstandalonetype
    \DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{standalone}}
    \LoadClass[tikz]{standalone}
\else
    \ifchararticletype
        \DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{article}}
        \LoadClass{article}
    \else
        \DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{article}}
        \LoadClass{article}
        \gdef\chararticletype{true}
    \fi
\fi

\ifchararticletype
\RequirePackage{geometry}
\geometry{
    paper=letterpaper,
    top=1in,
    bottom=1in,
    left=1in,
    right=1in,
    includeheadfoot
}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{8in}
\pagenumbering{arabic}
\else
\fi

\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

% Colors
\RequirePackage[x11names,table]{xcolor}
\definecolor{ink}{RGB}{34,26,74}
\definecolor{spruce}{RGB}{26,74,34}
\definecolor{crimson}{RGB}{165, 52, 29}
\definecolor{chestnut}{RGB}{74,34,26}
\definecolor{mustard}{RGB}{206,126,0}

\definecolor{plotweavergray}{RGB}{179,179,179}
\definecolor{opportunityblue}{RGB}{16,82,161}
\definecolor{complicationred}{RGB}{160,18,19}

\definecolor{stormingink}{RGB}{0,0,0}
\definecolor{stormingpaper}{RGB}{235,236,239}
\definecolor{stormingblue}{RGB}{30,60,96}
\definecolor{stormingbluedim}{RGB}{119,141,168}
\definecolor{storminggold}{RGB}{208,164,82}
\definecolor{stormingtblrowa}{RGB}{229,231,235}
\definecolor{stormingtblrowb}{RGB}{249,249,250}
\definecolor{stormingcalloutbg}{RGB}{227,231,235}

\definecolor{rustingink}{RGB}{0,0,0}
\definecolor{rustingpaper}{RGB}{247,245,245}
\definecolor{rustingred}{RGB}{82,48,43}
\definecolor{rustingreddim}{RGB}{95,83,83}
\definecolor{rustingsilver}{RGB}{122,121,121}
\definecolor{rustingtblrowa}{RGB}{229,231,235}
\definecolor{rustingtblrowb}{RGB}{249,249,250}
\definecolor{rustingcalloutbg}{RGB}{230,226,226}

\newcommand{\maincolor}{DodgerBlue4!85!black}

% stormlight colorscheme
\ifcharstormlightcs
    \colorlet{cspapercolor}{stormingpaper}
    \colorlet{cstextcolor}{stormingink}
    \colorlet{cscolor}{stormingblue}
    \colorlet{csaccent}{storminggold}
    \colorlet{csdim}{stormingbluedim}
    % table colors
    \colorlet{cstblheaderbg}{stormingblue}
    \colorlet{cstblheadertext}{white}
    \colorlet{cstblrowa}{stormingtblrowa}
    \colorlet{cstblrowb}{stormingtblrowb}
    % callout colors
    \colorlet{cscalloutheaderbg}{stormingblue}
    \colorlet{cscalloutheadertext}{white}
    \colorlet{cscalloutbg}{stormingcalloutbg}
\else
\fi

\ifcharmistborncs
    \colorlet{cspapercolor}{rustingpaper}
    \colorlet{cstextcolor}{rustingink}
    \colorlet{cscolor}{rustingred}
    \colorlet{csaccent}{rustingsilver}
    \colorlet{csdim}{rustingreddim}
    % table colors
    \colorlet{cstblheaderbg}{rustingreddim}
    \colorlet{cstblheadertext}{white}
    \colorlet{cstblrowa}{rustingtblrowa}
    \colorlet{cstblrowb}{rustingtblrowb}
    % callout colors
    \colorlet{cscalloutheaderbg}{rustingreddim}
    \colorlet{cscalloutheadertext}{white}
    \colorlet{cscalloutbg}{rustingcalloutbg}
\else
    \colorlet{cspapercolor}{stormingpaper}
    \colorlet{cstextcolor}{stormingink}
    \colorlet{cscolor}{stormingblue}
    \colorlet{csaccent}{storminggold}
    \colorlet{csdim}{stormingbluedim}
    % table colors
    \colorlet{cstblheaderbg}{stormingblue}
    \colorlet{cstblheadertext}{white}
    \colorlet{cstblrowa}{stormingtblrowa}
    \colorlet{cstblrowb}{stormingtblrowb}
    % callout colors
    \colorlet{cscalloutheaderbg}{stormingblue}
    \colorlet{cscalloutheadertext}{white}
    \colorlet{cscalloutbg}{stormingcalloutbg}
\fi

% Table definitions
\RequirePackage{caption}
\captionsetup{
    format = hang,
    justification = raggedright,
    singlelinecheck=off,
    font = {Large,sf,sc,bf},
    skip = 0.25em,
    position = above,
}
\NewDocumentCommand{\lowercaption}{m}{
    \par\vspace{0.5em}
    % \leftskip 1pt
    \textcolor{csdim}{\uppercase{\small\bfseries\sffamily #1}}
}
\RequirePackage{nicematrix}
\NewDocumentEnvironment{plotable}{m o}{%
    \sffamily
    \begin{NiceTabular}{#1}[#2]
        \CodeBefore
            \rowcolor{cscolor}{1}
            \rowcolors{2}{cstblrowa}{cstblrowb}
        \Body
        \RowStyle[nb-rows=1,color=white]{\bfseries}
}{%
    \end{NiceTabular}
}
\renewcommand{\arraystretch}{1.5}

\RequirePackage{fontspec}
\setmainfont{TeX Gyre Schola}
\setsansfont{Noto Sans}
\newfontface\scripty[Scale=1.5]{QT Handwriting}

\AtBeginDocument{
  \pagecolor{cspapercolor}
}

\RequirePackage{amsmath}
\RequirePackage{bm}

\ifchararticletype
\RequirePackage{titlesec}
\else
\fi

\RequirePackage{tikz}
\RequirePackage[poster]{tcolorbox}
\tcbuselibrary{skins, raster}
\usetikzlibrary{calc, chains, backgrounds, positioning, arrows.meta, bending, shapes.geometric, shadings}
\pgfdeclarelayer{foreground}
\pgfdeclarelayer{lines}
\pgfsetlayers{background,lines,main,foreground}
\RequirePackage{varwidth}
\tikzset{
    max width/.style={
        % Wraps the node content in a varwidth environment dynamically
        execute at begin node={\begin{varwidth}{#1}},
        execute at end node={\end{varwidth}}
    },
    invclip/.style={
        clip,
        insert path={(-1em,-1em) rectangle (1em,1em)}
    }
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             TITLE & SECTIONS              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifchararticletype
    \renewcommand{\maketitle}{\par
        \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
        \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
        \long\def\@makefntext##1{\parindent 1em\noindent
                \hb@xt@1.8em{%
                    \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
        \ifnum \col@number=\@ne
            \scshape\color{cscolor}\@maketitle
        \else
            \twocolumn[\scshape\color{cscolor}\@maketitle]%
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
        {1ex plus .2ex}{\normalfont\LARGE\scshape\color{cscolor}}%
    }
    \setcounter{secnumdepth}{0}

    \titleformat{\subsection}
    {\normalfont\Large\scshape\color{cscolor}}
    {\thesection}
    {1em}
    {}
    [{\color{csaccent}\titlerule[1pt]}]

        \setcounter{secnumdepth}{0}

        \titleformat{\subsubsection}
        {\normalfont\large\scshape\color{cscolor}}
        {\thesection}
        {}
        {}

        \titlespacing*{\subsubsection}
        {0pt}
        {1em} 
        {0.5em}  
\else
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  BOXES                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tcbset{
    featureBox/.style={
        enhanced,
        sharp corners,
        colback=white,
        colframe=black,
        colbacktitle=white,
        titlerule=-0.5pt,
        toptitle=-0.25em,
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
                \draw[line width = 1.3pt, color = black] ($(segmentation.west) + (-0.2em, 0pt)$) -- ($(segmentation.east) + (0.2em, 0pt)$);
            \end{pgfonlayer}
        },
        middle = 0em,
        subtitle style={
            boxrule=0pt,
            top=-1.5em,
            before={\vspace*{-0.25em}},
            after skip=1.25\baselineskip,
            colframe=white,
            colback=white,
            coltext=black,
            fonttitle=\sffamily\scshape\large,
            halign=flush center
        },
        fontlower=\sffamily
    },
    %
    sideBox/.style={
        enhanced,
        sidebyside,
        sharp corners,
        colback=white,
        colframe=black,
        colbacktitle=white,
        titlerule=-0.5pt,
        toptitle=-0.5em,
        boxsep=0.5em,
        lefttitle=0em,
        righttitle=0em,
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
        title={\small#1},
        coltitle=black,
        fonttitle=\sffamily\scshape\small,
        halign title=flush center,
        halign = flush center,
        valign = center,
        bottomtitle = -1em,
        fontupper=\sffamily,
        segmentation code={
            \begin{pgfonlayer}{foreground}
                \draw[line width = 1.3pt, color = black] ($(segmentation.north) + (0em, 12pt)$) -- ($(segmentation.south) + (0em, -2pt)$);
            \end{pgfonlayer}
        },
        middle = -1em,
        fontlower=\sffamily
    },
    % 
    leftBox/.style={
        enhanced,
        nobeforeafter,
        colback=white,
        colbacktitle=white,
        titlerule=-0.5pt,
        toptitle=-0.5em,
        left=0em,
        right=0em,
        boxsep=1em,
        frame code={%
            \begin{pgfonlayer}{foreground}
                % outer box
                \begin{scope}
                    \clip (frame.south west) rectangle (frame.north east);
                    \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] (frame.south west) circle (1em);
                    \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] (frame.north west) circle (1em);
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
        halign=flush center,
        bottomtitle = -1.5em,
        fontupper=\sffamily,
    },
    % 
    rightBox/.style={
        enhanced,
        nobeforeafter,
        colback=white,
        colbacktitle=white,
        titlerule=-0.5pt,
        toptitle=-0.5em,
        left=0em,
        right=0em,
        boxsep=1em,
        frame code={%
            \begin{pgfonlayer}{foreground}
                % outer box
                \begin{scope}
                    \clip (frame.south west) rectangle (frame.north east);
                    \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] (frame.north east) circle (1em);
                    \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] (frame.south east) circle (1em);
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
        halign=flush center,
        bottomtitle = -1.5em,
        fontupper=\sffamily,
    },
    % 
    statBoxLeft/.style={
        enhanced,
        sharp corners,
        colback=white,
        colframe=black,
        colbacktitle=white,
        titlerule=-0.5pt,
        toptitle=-0.5em,
        boxsep=0.9em,
        left=0em,
        right=0em,
        frame code={%
            \begin{pgfonlayer}{foreground}
                % outer box
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {xshift=1pt}, white}] ($(frame.north west) + (0pt, -0.925em)$) -- ($(frame.south west) + (0pt, 0.925em)$);
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=-1pt}, white}] ($(frame.north west) + (0.925em, 0pt)$) -- (frame.north east);
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] ($(frame.south west) + (0.925em, 0pt)$) -- (frame.south east);
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, shorten <= 2pt, transform canvas = {xshift=-1pt}, white}] ($(frame.north east) + (0pt, 0.7pt)$) -- ($(frame.north east) + (0pt, -0.3cm) + (0pt, -0.7pt)$);
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, shorten <= 2pt, transform canvas = {xshift=-1pt}, white}] ($(frame.south east) + (0pt, -0.7pt)$) -- ($(frame.south east) + (0pt, 0.3cm) + (0pt, 0.7pt)$);

                % round corners
                \begin{scope}
                    \clip (frame.south west) rectangle (frame.north east);
                    \draw[line width = 1.5pt, color = black] (frame.south west) circle (1em);
                    \draw[line width = 1.5pt, color = black] (frame.north west) circle (1em);
                    \draw[line width = 1.5pt, color = black] (frame.east) circle (0.7cm);
                \end{scope}

                % inner box
                \draw[line width = 1pt, color=black] ($(frame.north west) + (1em, -0.3em)$) -- ($(frame.north west) + (0.3em, -0.3em)$) -- ($(frame.south west) + (0.3em, 0.3em)$) -- ($(frame.south east) + (0pt, 0.3em)$);
            \end{pgfonlayer}
        },
        title={#1},
        coltitle=black,
        fonttitle=\sffamily\scshape,
        halign title=flush center,
        halign=flush center,
        valign=center,
        bottomtitle = -1.5em,
        fontupper=\sffamily,
        height=2cm,
    },
    % 
    statBoxRight/.style={
        enhanced,
        sharp corners,
        colback=white,
        colframe=black,
        colbacktitle=white,
        titlerule=-0.5pt,
        toptitle=-0.5em,
        boxsep=0.9em,
        left=0em,
        right=0em,
        frame code={%
            \begin{pgfonlayer}{foreground}
                % outer box
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=-1pt}, white}] (frame.north west) -- ($(frame.north east) + (-0.925em, 0pt)$);
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] (frame.south west) -- ($(frame.south east) + (-0.925em, 0pt)$);
                \draw[line width = 1.5pt, color = black, preaction = {draw, line width=1pt, transform canvas = {xshift=-1pt}, white}] ($(frame.north east) + (0pt, -0.925em)$) -- ($(frame.south east) + (0pt, 0.925em)$);
                \draw[line width = 1.5pt, color = black, preaction = {draw, shorten <= 2pt, line width=1pt, transform canvas = {xshift=1pt}, white}] ($(frame.south west) + (0pt, -0.7pt)$) -- ($(frame.south west) + (0pt, 0.3cm) + (0pt, 0.7pt)$);
                \draw[line width = 1.5pt, color = black, preaction = {draw, shorten <= 2pt, line width=1pt, transform canvas = {xshift=1pt}, white}] ($(frame.north west) + (0pt, 0.7pt)$) -- ($(frame.north west) + (0pt, -0.3cm) + (0pt, -0.7pt)$);

                % round corners
                \begin{scope}
                    \clip (frame.south west) rectangle (frame.north east);
                    \draw[line width = 1.5pt, color = black] (frame.south east) circle (1em);
                    \draw[line width = 1.5pt, color = black] (frame.north east) circle (1em);
                    \draw[line width = 1.5pt, color = black] (frame.west) circle (0.7cm);
                \end{scope}

                % inner box
                \draw[line width = 1pt, color=black] ($(frame.south west) + (0pt, 0.3em)$) -- ($(frame.south east) + (-0.3em, 0.3em)$) -- ($(frame.north east) + (-0.3em, -0.3em)$) -- ($(frame.north east) + (-1em, -0.3em)$);
            \end{pgfonlayer}
        },
        title={#1},
        coltitle=black,
        fonttitle=\sffamily\scshape,
        halign title=flush center,
        halign=flush center,
        valign=center,
        bottomtitle = -1.5em,
        fontupper=\sffamily,
        height=2cm,
    },
    %
    keyTalentBox/.style={
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
                \draw[line width = 1.5pt, color = csaccent, preaction = {draw, line width=1pt, transform canvas = {xshift=1pt}, white}] ($(frame.north west) + (0pt, -0.925em)$) -- ($(frame.south west) + (0pt, 0.925em)$);
                \draw[line width = 1.5pt, color = csaccent, preaction = {draw, line width=1pt, transform canvas = {xshift=-1pt}, white}] ($(frame.north east) + (0pt, -0.925em)$) -- ($(frame.south east) + (0pt, 0.925em)$);
                \draw[line width = 1.5pt, color = csaccent, preaction = {draw, line width=1pt, transform canvas = {yshift=-1pt}, white}] ($(frame.north west) + (0.925em, 0pt)$) -- ($(frame.north east) + (-0.925em, 0pt)$);
                \draw[line width = 1.5pt, color = csaccent, preaction = {draw, line width=1pt, transform canvas = {yshift=1pt}, white}] ($(frame.south west) + (0.925em, 0pt)$) -- ($(frame.south east) + (-0.925em, 0pt)$);

                % round corners
                \begin{scope}
                    \clip (frame.south west) rectangle (frame.north east);
                    \draw[line width = 1.5pt, color = csaccent] (frame.south west) circle (1em);
                    \draw[line width = 1.5pt, color = csaccent] (frame.north west) circle (1em);
                    \draw[line width = 1.5pt, color = csaccent] (frame.north east) circle (1em);
                    \draw[line width = 1.5pt, color = csaccent] (frame.south east) circle (1em);
                \end{scope}

                % inner box
                \draw[line width = 1pt, color=csaccent] ($(frame.north west) + (1em, -0.3em)$) -- ($(frame.north west) + (0.3em, -0.3em)$) -- ($(frame.south west) + (0.3em, 0.3em)$) -- ($(frame.south east) + (-0.3em, 0.3em)$) -- ($(frame.north east) + (-0.3em, -0.3em)$) -- ($(frame.north east) + (-1em, -0.3em)$);
            \end{pgfonlayer}
        },
        title={#1},
        coltitle=cscolor,
        fonttitle=\sffamily\scshape\large,
        halign title=flush left,
        bottomtitle = -1.5em,
        fontupper=\sffamily,
        segmentation code={
            \begin{pgfonlayer}{foreground}
                \draw[line width = 1.5pt, color = csaccent] ($(segmentation.west) + (-0.2em, 0pt)$) -- ($(segmentation.east) + (0.2em, 0pt)$);
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
}

\NewDocumentCommand{\statBox}{mmmm}{
    \begin{tcbraster}[raster columns=2, raster equal height]
        \begin{tcolorbox}[leftBox,title={#1}]
            \huge#2
        \end{tcolorbox}
        \begin{tcolorbox}[rightBox,title={#3}]
            \huge#4
        \end{tcolorbox}
    \end{tcbraster}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%               ACTIVATIONS                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Action
\NewDocumentCommand{\action}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.75ex]{%
        \node[fill=textcolor, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (0,0) {};
    }
}

% Double Action
\NewDocumentCommand{\doubleAction}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.75ex]{%
        \node[fill=textcolor, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (0,0) {};
        \node[fill=textcolor, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (4pt,0) {};
    }
}

% Triple Action
\NewDocumentCommand{\tripleAction}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.75ex]{%
        \node[fill=textcolor, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (0,0) {};
        \node[fill=textcolor, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (4pt,0) {};
        \node[fill=textcolor, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (8pt,0) {};
    }
}

% Free Action
\NewDocumentCommand{\freeAction}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.75ex]{%
        \node[draw=textcolor, very thick, shape=isosceles triangle, isosceles triangle apex angle=60, minimum height=0.75em, inner sep=0pt, anchor=base] at (0,0) {};
    }
}

% Reaction
\NewDocumentCommand{\reaction}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.2ex]{%
        \draw[color=textcolor,{Triangle[length=0.5em, width=0.5em]}-,line width=0.125em] 
            (0,0.15) -- (0.3,0.15) 
            arc (90:-90:0.075cm) 
            -- (0.1,0);
  }
}

% Forever
\NewDocumentCommand{\forever}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.6ex]{%
        \draw[color=textcolor, domain=0:359, smooth, samples=100, line width=0.125em] 
            plot ({0.2*cos(\x)/(1+sin(\x)^2)}, {0.2*sin(\x)*cos(\x)/(1+sin(\x)^2)}) -- cycle;
    }
}

% Complication
\NewDocumentCommand{\complication}{o}{%
    \tikz[baseline=-0.65ex]{%
        \begin{scope}
            \begin{pgfinterruptboundingbox}
            \path[clip, invclip] (67.5:0.4em) -- (202.5:0.4em) -- (337.5:0.4em) -- (112.5:0.4em) -- (247.5:0.4em) -- (382.5:0.4em) -- (157.5:0.4em) -- (292.5:0.4em) -- (67.5:0.4em) -- cycle;
            \path[invclip] (0,0) circle (0.22em);
            \end{pgfinterruptboundingbox}
            
            \fill[complicationred] (45:0.5em) -- (180:0.5em) -- (315:0.5em) -- (90:0.5em) -- (225:0.5em) -- (360:0.5em) -- (135:0.5em) -- (270:0.5em) -- (45:0.5em) -- cycle;
        \end{scope}
    }%
    \IfNoValueTF{#1}{}{\,{\color{complicationred}#1}}
}

% Complication Dice
\NewDocumentCommand{\complicationDice}{o}{%
    \tikz[baseline=-0.65ex]{%
        \begin{scope}
            \begin{pgfinterruptboundingbox}
            \path[clip, invclip] (67.5:0.5em) -- (202.5:0.5em) -- (337.5:0.5em) -- (112.5:0.5em) -- (247.5:0.5em) -- (382.5:0.5em) -- (157.5:0.5em) -- (292.5:0.5em) -- (67.5:0.5em) -- cycle;
            \path[invclip] (0,0) circle (0.27em);
            \end{pgfinterruptboundingbox}
            
            \fill[complicationred] (45:0.6em) -- (180:0.6em) -- (315:0.6em) -- (90:0.6em) -- (225:0.6em) -- (360:0.6em) -- (135:0.6em) -- (270:0.6em) -- (45:0.6em) -- cycle;
        \end{scope}
        \node[inner sep=0pt, outer sep=0pt, anchor=center, text=complicationred] at (0,0) {\IfNoValueTF{#1}{}{\sffamily\tiny #1}};
    }
}

% Opportunity
\NewDocumentCommand{\opportunity}{}{%
  \tikz[baseline=-0.65ex]{%
    \draw[color=opportunityblue, line width=0.075em, sharp corners, anchor=center] 
        (0:0.15) .. controls (22.5:0.025) and (67.5:0.025) .. (90:0.15)
        .. controls (112.5:0.025) and (157.5:0.025) .. (180:0.15)
        .. controls (202.5:0.025) and (247.5:0.025) .. (270:0.15)
        .. controls (292.5:0.025) and (337.5:0.025) .. cycle;
    \begin{scope}
        \draw[color=opportunityblue, line width=0.075em, anchor=center] (0,0) circle (0.3em);
    \end{scope}
  }
}

% Key Talent Star
\NewDocumentCommand{\key}{}{%
    \colorlet{textcolor}{.}%
    \tikz[baseline=-0.6ex]{%
        \node[fill, color=textcolor, shape=star, star points=5, star point height=0.3em, minimum height=1em, inner sep=0pt, outer sep=0pt, anchor=center] at (0,0) {};
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%               TALENT TREE                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Talent TikZ Style
\tikzstyle{talent} = [rectangle, fill=white, text width=10em, sharp corners, minimum height=3em, draw=white, node font=\sffamily\normalsize, inner sep=0.5em]

% Connector TikZ Style
\tikzstyle{connector} = [color=white, sharp corners, line width = 3pt]

% Key Talent
\NewDocumentCommand{\keyTalent}{mm}{
  \begin{tcolorbox}[keyTalentBox]
    \key \textbf{#1}
    #2
  \end{tcolorbox}
}

% Normal Talent
\NewDocumentCommand{\talent}{mom}{
  {\color{cscolor}\bfseries\scshape\hspace{-0.6em} #1}\\
  \IfNoValueTF{#2}{}{{\color{plotweavergray}\footnotesize\itshape #2}\\}
  {\color{black}\small #3}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%               CHARACTER SHEET             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% table styling
\NewDocumentEnvironment{CharTable}{m m}{%
    \centering
    \setlength{\tabcolsep}{0.5em}
    \begin{NiceTabularX}{#1}{#2}
        \CodeBefore
            \rowcolor{plotweavergray!85!black}{1}
            \rowcolors{2}{plotweavergray!50}{white}
        \Body
        \RowStyle[nb-rows=1,color=white]{\bfseries}
}{%
    \end{NiceTabularX}
}

% keys
\DeclareKeys[charsheet]{
    name    .store = \charName,
    ancestry    .store = \charAncestry,
    level   .store = \charLevel,
    paths   .store = \charPaths,
    maxHealth   .store = \charMaxHealth,
    maxEssence  .store = \charMaxEssence,
    recoveryDie     .store = \charRecoveryDie,
    liftingCapacity     .store = \charLiftingCapacity,
    movement    .store = \charMovement,
    sensesRange     .store = \charSensesRange,
    strength    .store = \charStrength,
    speed   .store = \charSpeed,
    intellect   .store = \charIntellect,
    willpower   .store = \charWillpower,
    awareness   .store = \charAwareness,
    presence    .store = \charPresence,
    phyDefenseBonus     .store = \charPhyDefenseBonus,
    cogDefenseBonus     .store = \charCogDefenseBonus,
    spiDefenseBonus     .store = \charSpiDefenseBonus,
    agility     .store = \charAgility,
    athletics   .store = \charAthletics,
    heavyweaponry   .store = \charHeavyweaponry,
    lightweaponry   .store = \charLightweaponry,
    stealth     .store = \charStealth,
    finesse     .store = \charFinesse,
    crafting    .store = \charCrafting,
    deduction   .store = \charDeduction,
    discipline  .store = \charDiscipline,
    intimidation    .store = \charIntimidation,
    knowledge   .store = \charKnowledge,
    medicine    .store = \charMedicine,
    deception   .store = \charDeception,
    insight     .store = \charInsight,
    leadership  .store = \charLeadership,
    perception  .store = \charPerception,
    persuasion  .store = \charPersuasion,
    survival    .store = \charSurvival, 
    phyStatName     .store = \charPhyStatName,
    phyStatRanks    .store = \charPhyStatRanks,
    phyStatRanks    .initial:n = 0,
    phyStatBase     .store = \charPhyStatBase,
    phyStatBase     .initial:n = 0,
    cogStatName     .store = \charCogStatName,
    cogStatRanks    .store = \charCogStatRanks,
    cogStatRanks    .initial:n = 0,
    cogStatBase     .store = \charCogStatBase,
    cogStatBase     .initial:n = 0,
    spiStatName     .store = \charSpiStatName,
    spiStatRanks    .store = \charSpiStatRanks,
    spiStatRanks    .initial:n = 0,
    spiStatBase     .store = \charSpiStatBase,
    spiStatBase     .initial:n = 0,
    image   .store = \charImage,
    hideBlanks.if = charHideBlanks,
    stormlight.if = charStormlight,
    mistborn.if = charMistborn,
    handwritten.if = charHandwritten,
    expertises .store = \charExpertises,
    firstTalents .store = \charfirstTalents,
    secondTalents .store = \charSecondTalents,
    thirdTalents  .store = \charThirdTalents,
    weapons .store = \charWeapons,
    armor   .store = \charArmor,
    goals   .store = \charGoals,
    conditions .store = \charConditions,
    inventory .store = \charInventory,
    currency .store = \charCurrency,
    description .store = \charDescription,
    backstory .store = \charBackstory,
    connections .store = \charConnections,
    rewards .store = \charRewards,
    purpose .store = \charPurpose,
    obstacle .store = \charObstacle,
    notes .store = \charNotes,
}

% #1 - stat name, #2 - stat ranks, #3 - stat base
\NewDocumentCommand{\StatRow}{o O{0} O{0}}{%
    \tikz[baseline=-0.5ex]{%
        \node[rounded corners=0.25em, rectangle, draw, line width=1pt, minimum width=2.5em, minimum height=2.25em]{\IfNoValueF{#1}{\large\charFont \number\numexpr#2+#3\relax}};
    }
    & 
    \IfNoValueTF{#1}{\underline{\hspace{7em}} (\underline{\hspace{2em}})}{#1} &
    \tikz[baseline=-0.5ex]{%
        \foreach \x in {0,1,2,3,4}{
            \ifnum\x<\numexpr#2\relax
                \node[circle, draw, line width=1pt, minimum size=0.75em, inner sep=0pt, fill=black] at (\x*1em,0) {};
            \else
                \node[circle, draw, line width=1pt, minimum size=0.75em, inner sep=0pt, fill=white] at (\x*1em,0) {};
            \fi
        }
    }
}

% #1 - goal name, #2 - goal ranks
\NewDocumentCommand{\GoalRow}{o O{0}}{%
    \IfNoValueTF{#1}{\rule{11.25em}{1pt}}{\large#1} &
    \tikz[baseline=-0.9em]{%
        \foreach \x in {0,1,2}{
            \ifnum\x<\numexpr#2\relax
                \node[circle, draw, line width=1pt, minimum size=0.75em, inner sep=0pt, fill=black] at (\x*1em,0) {};
            \else
                \node[circle, draw, line width=1pt, minimum size=0.75em, inner sep=0pt, fill=white] at (\x*1em,0) {};
            \fi
        }
    }
}

% #1 - keys, #2 - expertises, #3 - talents, #4 - weapons, #5 - armor
\NewDocumentCommand{\MakeCharacterSheet}{m}{%
    \SetKeys[charsheet]{#1}

    \ifcharHandwritten
        \def\charFont{\scripty}
    \else
        \def\charFont{\sffamily}
    \fi

    \ifcharStormlight
        \charMistbornfalse
        \def\finesseName{Thievery}
        \def\essenceName{Investiture}
        \def\currencyName{Marks}
    \else
        \ifcharMistborn
            \def\finesseName{Thievery}
            \def\essenceName{Investiture}
            \def\currencyName{Boxings}
        \else
            \def\finesseName{Finesse}
            \def\essenceName{Essence}
            \def\currencyName{Currency}
        \fi
    \fi

    \begin{tcbposter}[
        coverage = {spread},
        poster = {columns=6,rows=6,spacing=1em},
    ]
        % top part
        \posterbox[enhanced,sharp corners,frame empty,borderline={2.5pt}{4pt}{white},interior style={top color=white,middle color=plotweavergray,bottom color=plotweavergray},boxsep=0pt,
        underlay first={%
        \shade[
            draw=none,
            top color=white,
            middle color=plotweavergray,
            bottom color=plotweavergray,
        ] ([xshift=-5pt, yshift=5pt]frame.north west) 
            rectangle ([xshift=5pt, yshift=-5pt]frame.south east);
        }]{name=C,column=1,span=7,below=top,rowspan=2.24,xshift=-1cm}{}

        \posterbox[featureBox={\normalsize Character Name},split=0.9,valign=center,bottom=0pt]{name=character,column=1,span=2,below=top,rowspan=1}{
            \centering\huge\charFont 
            \charName
            % {Damien
            % \\[-0.5em]
            % Simmyns}
            \tcblower
            \tcbsubtitle[after skip=1em]{\small Ancestry}
            \centering\large\charFont
            \charAncestry
        }
        
        \posterbox[rightBox={\small Level},valign=center]{name=level,column*=6,span=1.022,below=top,rowspan=0.5}{\centering\Huge\charFont \charLevel}

        \posterbox[leftBox={\small Paths},valign=center,bottom=0pt]{name=paths,column=3,span=3.022,below=top,rowspan=0.5}{

            \centering\Large\charFont 
            \charPaths
        }
            
        \posterbox[leftBox={\small Lifting Capacity}]{name=capacity,column=3,span=1.022,below=paths,rowspan=0.5}{\centering\Large\charFont \charLiftingCapacity}
        \posterbox[rightBox={\small Movement}]{name=movement,column*=4,span=1.022,below=paths,rowspan=0.5}{\centering\Large\charFont \charMovement}
        
        \posterbox[leftBox={\small Recovery Die}]{name=recovery,column=5,span=1.022,below=paths,rowspan=0.5}{\centering\Large\charFont \charRecoveryDie}
        \posterbox[rightBox={\small Senses Range}]{name=senses,column*=6,span=1.022,below=level,rowspan=0.5}{\centering\Large\charFont \charSensesRange}
        % \posterbox[featureBox={},boxsep=0.5em]{name=senses,column*=6,below=top,span=2, rowspan=1}{
        %     \small\centering
        %     \setlength{\tabcolsep}{0pt}
        %     \begin{NiceTabularX}{\linewidth}{X|X}
        %         Movement & Recovery Die \\
        %         \charMovement & \charRecoveryDie \\
        %         \hline
        %         Lifting Capacity & Senses Range \\
        %         \charLiftingCapacity & \charSensesRange
        %     \end{NiceTabularX}
        % }

        % stats
        \posterbox[featureBox={Physical},frame empty,opacityback=0,opacitybacktitle=0]{name=physical,column=1,span=2,below=character,rowspan=1.1,yshift=0.2cm}{}
        \posterbox[statBoxRight={Speed}]{name=speed,column*=2,span=1,below=character,yshift=-0.6cm,xshift=-3pt}{
            \Huge \charSpeed
        }
        \posterbox[statBoxLeft={Strength}]{name=strength,column=1,span=1,below=character,yshift=-0.6cm,xshift=3pt}{
            \Huge \charStrength
        }
        \posterbox[halign=center,valign=center,square,circular arc,colback=white,colframe=black,width=1.4cm,boxsep=0pt,left=0pt,right=0pt]{name=phyDefense,below=character,column=1,yshift=-0.895cm,xshift=2.65cm}{
            \sffamily\LARGE \the\numexpr10+\charStrength+\charSpeed+\charPhyDefenseBonus\relax
        }
        \posterbox[adjusted title={Health}, fonttitle=\sffamily\scshape\large, halign title=flush center, frame empty, opacityback=0, coltitle=black, boxsep=0pt]{name=healthtitle,column=1,below=strength,span=2,rowspan=0.14,yshift=2mm}{}
        \posterbox[sideBox={\setlength{\tabcolsep}{0pt}\begin{NiceTabularX}{\linewidth}{*2{>{\centering}X}}Maximum & Current\end{NiceTabularX}},height=1.5cm]{name=health,column=1,below=healthtitle,span=1.5,xshift=0.04166666667\textwidth}{
            \centering\huge\charFont \charMaxHealth
            \tcblower
        }

        
        \posterbox[featureBox={Cognitive},frame empty,opacityback=0,opacitybacktitle=0]{name=cognitive,column=3,span=2,below=character,rowspan=1,yshift=0.2cm}{}
        \posterbox[statBoxRight={Intellect}]{name=intellect,column*=4,span=1,below=character,yshift=-0.6cm,xshift=-3pt}{
            \Huge \charIntellect
        }
        \posterbox[statBoxLeft={Willpower}]{name=willpower,column=3,span=1,below=character,yshift=-0.6cm,xshift=3pt}{
            \Huge \charWillpower
        }
        \posterbox[halign=center,valign=center,square,circular arc,colback=white,colframe=black,width=1.4cm,boxsep=0pt,left=0pt,right=0pt]{name=cogDefense,below=character,column=3,yshift=-0.895cm,xshift=2.65cm}{
            \sffamily\LARGE \the\numexpr10+\charIntellect+\charWillpower+\charCogDefenseBonus\relax
        }
        \posterbox[adjusted title={Focus}, fonttitle=\sffamily\scshape\large, halign title=flush center, frame empty, opacityback=0, coltitle=black, boxsep=0pt]{name=focustitle,column=3,below=strength,span=2,rowspan=0.14,yshift=2mm}{}
        \posterbox[sideBox={\setlength{\tabcolsep}{0pt}\begin{NiceTabularX}{\linewidth}{*2{>{\centering}X}}Maximum & Current\end{NiceTabularX}},height=1.5cm]{name=focus,column=3,below=focustitle,span=1.5,xshift=0.04166666667\textwidth}{
            \centering\huge\charFont \the\numexpr2+\charWillpower\relax
            \tcblower
        }

        \posterbox[featureBox={Spiritual},frame empty,opacityback=0,opacitybacktitle=0]{name=spiritual,column=5,span=2,below=character,rowspan=1,yshift=0.2cm}{}
        \posterbox[statBoxRight={Awareness}]{name=awareness,column*=6,span=1,below=character,yshift=-0.6cm,xshift=-3pt}{
            \Huge \charAwareness
        }
        \posterbox[statBoxLeft={Presence}]{name=presence,column=5,span=1,below=character,yshift=-0.6cm,xshift=3pt}{
            \Huge \charPresence
        }
        \posterbox[halign=center,valign=center,square,circular arc,colback=white,colframe=black,width=1.4cm,boxsep=0pt,left=0pt,right=0pt]{name=spiDefense,below=character,column=5,yshift=-0.895cm,xshift=2.65cm}{
            \sffamily\LARGE \the\numexpr10+\charAwareness+\charPresence+\charSpiDefenseBonus\relax
        }
        \posterbox[adjusted title={\essenceName}, fonttitle=\sffamily\scshape\large, halign title=flush center, frame empty, opacityback=0, coltitle=black, boxsep=0pt]{name=essencetitle,column=5,below=strength,span=2,rowspan=0.14,yshift=2mm}{}
        \posterbox[sideBox={\setlength{\tabcolsep}{0pt}\begin{NiceTabularX}{\linewidth}{*2{>{\centering}X}}Maximum & Current\end{NiceTabularX}},height=1.5cm]{name=essence,column=5,below=healthtitle,span=1.5,xshift=0.04166666667\textwidth}{
            \centering\huge\charFont \charMaxEssence
            \tcblower
        }

        % skills
        \posterbox[fontupper=\sffamily\scshape,frame empty,boxsep=0pt,left=0pt,right=0pt,top=0.25em,bottom=0.25em,colback=white]{name=phyStats,column=1,span=2,below=health,rowspan=\ifcharHideBlanks 1.47 \else 1.67 \fi}{
            \setlength{\tabcolsep}{0pt}
            \begin{NiceTabularX}{\textwidth}[cell-space-limits=3pt]{c@{\hspace{0.25em}}X@{\hspace{0.25em}}r}
                \StatRow[Agility (spd)][\charAgility][\charSpeed] \\
                \StatRow[Athletics (str)][\charAthletics][\charStrength] \\
                \StatRow[Heavy Weaponry (str)][\charHeavyweaponry][\charStrength] \\
                \StatRow[Light Weaponry (spd)][\charLightweaponry][\charSpeed] \\
                \StatRow[Stealth (spd)][\charStealth][\charSpeed] \\
                \StatRow[\finesseName~(spd)][\charFinesse][\charSpeed] \\
                \ifcharHideBlanks
                \else
                    \ifx\charPhyStatName\@empty
                        \StatRow \\
                    \else
                        \StatRow[\charPhyStatName][\charPhyStatRanks][\charPhyStatBase] \\
                    \fi
                \fi
            \end{NiceTabularX}
        }
        \posterbox[fontupper=\sffamily\scshape,frame empty,boxsep=0pt,left=0pt,right=0pt,top=0.25em,bottom=0.25em,colback=white]{name=cogStats,column=3,span=2,below=focus,rowspan=\ifcharHideBlanks 1.47 \else 1.67 \fi}{
            \setlength{\tabcolsep}{0pt}
            \begin{NiceTabularX}{\textwidth}[cell-space-limits=3pt]{c@{\hspace{0.25em}}X@{\hspace{0.25em}}r}
                \StatRow[Crafting (int)][\charCrafting][\charIntellect] \\
                \StatRow[Deduction (int)][\charDeduction][\charIntellect] \\
                \StatRow[Discipline (wil)][\charDiscipline][\charWillpower] \\
                \StatRow[Intimidation (wil)][\charIntimidation][\charWillpower] \\
                \StatRow[Knowledge (int)][\charKnowledge][\charIntellect] \\
                \StatRow[Medicine (int)][\charMedicine][\charIntellect] \\
                \ifcharHideBlanks
                \else
                    \ifx\charCogStatName\@empty
                        \StatRow \\
                    \else
                        \StatRow[\charCogStatName][\charCogStatRanks][\charCogStatBase] \\
                    \fi
                \fi
            \end{NiceTabularX}
        }
        \posterbox[fontupper=\sffamily\scshape,frame empty,boxsep=0pt,left=0pt,right=0pt,top=0.25em,bottom=0.25em,colback=white]{name=spiStats,column=5,span=2,below=essence,rowspan=\ifcharHideBlanks 1.47 \else 1.67 \fi}{
            \setlength{\tabcolsep}{0pt}
            \begin{NiceTabularX}{\textwidth}[cell-space-limits=3pt]{c@{\hspace{0.25em}}X@{\hspace{0.25em}}r}
                \StatRow[Deception (pre)][\charDeception][\charPresence] \\
                \StatRow[Insight (awa)][\charInsight][\charAwareness] \\
                \StatRow[Leadership (pre)][\charLeadership][\charPresence] \\
                \StatRow[Perception (awa)][\charPerception][\charAwareness] \\
                \StatRow[Persuasion (pre)][\charPersuasion][\charPresence] \\
                \StatRow[Survival (awa)][\charSurvival][\charAwareness] \\
                \ifcharHideBlanks
                \else
                    \ifx\charSpiStatName\@empty
                        \StatRow \\
                    \else
                        \StatRow[\charSpiStatName][\charSpiStatRanks][\charSpiStatBase] \\
                    \fi
                \fi
            \end{NiceTabularX}
        }

        % bottom part
        \posterbox[featureBox={\small Weapons}]{name=weapons,column*=6,span=4,below=cogStats}{
            \charWeapons
            \tcblower
            \tcbsubtitle{\small Armor}
            \vspace{-0.5em}
            \charArmor
        }

        \posterbox[featureBox={\small Talents}]{name=talents,column*=6,span=4,between=weapons and bottom}{
                \charFont\large
                \charfirstTalents
        }

        \posterbox[featureBox={\small Basic Actions},boxsep=0.25em,top=1.5em,toptitle=0.25em]{name=basic,column=1,span=2,above=bottom,rowspan=1.3}{
            \centering
            \setlength{\tabcolsep}{0pt}
            \begin{NiceTabularX}{\textwidth}{c@{\hspace{0.5em}}X}[cell-space-limits=0pt]
                \reaction & Aid\textsuperscript{\ast}, Avoid Danger, Dodge\textsuperscript{\ast}, Reactive Strike\textsuperscript{\ast} \\
                \freeAction & Banter, Drop \\
                \action & Brace, Disengage, Gain Advantage, Interact, Move, Ready\textsuperscript{\dagger}, Strike, Use a Skill \\
                \doubleAction & Grapple, Recover, Shove \\[0.25em]
            \end{NiceTabularX}
            {\small
                \ast~\textit{costs 1 focus} 
                
                \dagger~\textit{not including action cost}
            }
        }
        \posterbox[featureBox={\small Expertises}]{name=expertises,column=1,span=2,between=phyStats and basic}{
            \charFont\large \charExpertises
        }

    \end{tcbposter}

    \begin{tcbposter}[
        coverage = {spread},
        poster = {columns=6,rows=6,spacing=1em},
        ]
        \posterbox[featureBox={\normalsize Character Name},valign=center,bottom=0pt]{name=character,column=1,span=2,below=top,rowspan=0.5}{
            \centering\LARGE\charFont 
            \charName
            % {Damien
            % \\[-0.5em]
            % Simmyns}
        }
        \posterbox[rightBox={\small Level},valign=center]{name=level,column*=6,span=1.022,below=top,rowspan=0.5}{\centering\Huge\charFont \charLevel}

        \posterbox[leftBox={\small Paths},valign=center,bottom=0pt]{name=paths,column=3,span=3.022,below=top,rowspan=0.5}{
            \centering\Large\charFont 
            \charPaths
        }

        \posterbox[featureBox={Talents}]{name=talents,column=1,span=3.5,below=character,rowspan=5.5}{
            \Large\charFont
            \charSecondTalents
        }

        \posterbox[featureBox={Conditions \& Injuries}]{name=conditions,column*=6,span=2.5,below=level,rowspan=1.3}{
            \Large\charFont\centering
            \charConditions
        }

        \posterbox[featureBox={Conditions}]{name=conditions,column*=6,span=2.5,below=conditions,rowspan=4.2}{
            \textbf{Afflicted\textsuperscript{\ast}:} Take some amount of damage at the end of your turn.

            \textbf{Determined:} When you fail a test, add an \opportunity to the result.

            \textbf{Diminished\textsuperscript{\dagger}:} The effected attribute is temporarily reduced by some amount.

            \textbf{Disoriented:} You can't use \reaction, your senses are obscured, and you have disadvantage on Perception tests.

            \textbf{Enhanced\textsuperscript{\dagger}:} The effected attribute is temporarily increased by some amount.

            \textbf{Exhausted\textsuperscript{\dagger}:} Apply the specified penalty to skill tests. Reduce the penalty by 1 after a long rest.

            \textbf{Focused:} Focus costs are reduced by 1.

            \textbf{Immobilized:} Your movement rate becomes 0, and you can't move or be moved.

            \textbf{Prone:} You are Slowed, and melee attacks against you gain advantage. Brace can be used without cover. Standing up costs 5 movement.

            \textbf{Restrained:} Your movement rate becomes 0, and you have disadvantage on all tests other than to escape.

            \textbf{Severed:} You cannot recover the specified resource.

            \textbf{Slowed:} Remaining movement rate is halved.

            \textbf{Stunned:} You cannot use or regain \reaction and lose 2 \action per turn.

            \textbf{Surprised:} You cannot use or regain \reaction, you cannot take fast turns, and lose 1 \action per turn.

            \textbf{Unconscious:} You always take slow turns, but cannot do anything on your turn. You can regain consciousness as \freeAction at the end of your turn and gain 1 Health or when healed with at least 1 Health.

            {\small
                \ast : This condition can be combined with other conditions.
                
                \dagger : This condition can be applied multiple times.
            }
        }
    \end{tcbposter}


    \begin{tcbposter}[
        coverage = {spread},
        poster = {columns=6,rows=6,spacing=1em},
        ]
        \posterbox[featureBox={\normalsize Character Name},valign=center,bottom=0pt]{name=character,column=1,span=2,below=top,rowspan=0.5}{
            \centering\LARGE\charFont 
            \charName
            % {Damien
            % \\[-0.5em]
            % Simmyns}
        }
        \posterbox[rightBox={\small Level},valign=center]{name=level,column*=6,span=1.022,below=top,rowspan=0.5}{\centering\Huge\charFont \charLevel}

        \posterbox[leftBox={\small Paths},valign=center,bottom=0pt]{name=paths,column=3,span=3.022,below=top,rowspan=0.5}{
            \centering\Large\charFont 
            \charPaths
        }

        \posterbox[featureBox={Inventory},split=0.9]{name=inventory,column*=6,span=2.5,below=paths,rowspan=4.2}{
            \Large\charFont
            \charInventory
            \tcblower
            \tcbsubtitle[bottomtitle=1em]{\currencyName}
            \Large\charFont\centering
            \charCurrency
        }

        \posterbox[featureBox={Opportunities}]{name=opportunities,column*=6,span=2.5,between=inventory and bottom}{

        \textbf{Aid an Ally.} An ally of your choice gains advantage on thier next test.

        \textbf{Collect Yourself.} You recover 1 focus.

        \textbf{Critically Hit.} You change a hit into a critical hit.

        \textbf{Influence the Narrative.} Your actions result in a positive narrative effect of your choice.

        \textbf{Trigger Special Ability.} Some talents provide additional ways to spend an \opportunity.
        }

        \posterbox[featureBox={Talents}]{name=notes,column=1,span=3.5,below=character,rowspan=5.5}{
            \Large\charFont
            \charThirdTalents
        }
    \end{tcbposter}

    \begin{tcbposter}[
        coverage = {spread},
        poster = {columns=6,rows=6,spacing=1em},
        ]
        \posterbox[featureBox={\normalsize Character Name},valign=center,bottom=0pt]{name=character,column=1,span=2,below=top,rowspan=0.5}{
            \centering\LARGE\charFont 
            \charName
            % {Damien
            % \\[-0.5em]
            % Simmyns}
        }
        \posterbox[rightBox={\small Level},valign=center]{name=level,column*=6,span=1.022,below=top,rowspan=0.5}{\centering\Huge\charFont \charLevel}

        \posterbox[leftBox={\small Paths},valign=center,bottom=0pt]{name=paths,column=3,span=3.022,below=top,rowspan=0.5}{
            \centering\Large\charFont 
            \charPaths
        }

        \posterbox[featureBox={Purpose},split=0.5]{name=purpose,column*=6,span=2,below=paths,rowspan=2.5}{
            \large\charFont
            \charPurpose
            \tcblower
            \tcbsubtitle{Obstacle}
            \large\charFont
            \charObstacle
        }

        \posterbox[featureBox={Goals},left=0.3em,right=0.25em,valign=center]{name=goals,column*=6,span=2,between=purpose and bottom}{
            \charGoals
        }

        \posterbox[featureBox={Appearance},square]{name=appearance,column=1,span=2,below=character}{
            \IfValueT{\charImage}{
                \includegraphics[width=\linewidth]{\charImage}
            }
        }
        \posterbox[featureBox={Description},split=0.5]{name=description,column=1,span=2,between=appearance and bottom}{
            \large\charFont
            \charDescription
            \tcblower
            \tcbsubtitle{Backstory}
            \large\charFont
            \charBackstory
        }

        \posterbox[featureBox={Connections},split=0.5]{name=connections,column=3,span=2,below=paths,rowspan=2.5}{
            \large\charFont
            \charConnections
            \tcblower
            \tcbsubtitle{Rewards}
            \large\charFont
            \charRewards
        }
        \posterbox[featureBox={Notes}]{name=notes,column=3,span=2,between=connections and bottom}{
            \large\charFont
            \charNotes
        }

    \end{tcbposter}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                TIMELINE                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% makes a new timeline base
\DeclareKeys[erakeys] {
    start  .store = \startyearkey,
    end  .store = \endyearkey,
    prefix  .store = \timelineprefix,
    prefix  .initial:n = {},
    major color  .store = \timelinecolor,
    major color  .initial:n = {spruce!85!black},
    minor color  .store = \minortimelinecolor,
    minor color  .initial:n = {spruce!90!white},
}

\NewDocumentCommand{\era}{m}{
    \SetKeys[erakeys]{#1}
    \pgfmathsetmacro{\startyear}{\startyearkey}
    \pgfmathsetmacro{\endyear}{\endyearkey}
    \pgfmathtruncatemacro{\numnodes}{abs(\endyear - \startyear)}
    \pgfmathsetmacro{\direction}{sign(\endyear - \startyear)}
    
    % Calculate scaled positions
    \pgfmathsetmacro{\scaledstart}{\timelineend * \timescale}
    \pgfmathsetmacro{\scaledend}{\scaledstart - \numnodes * \timescale}

    % Draw nodes
    \foreach \i in {0,...,\numnodes} {
        \pgfmathtruncatemacro{\major}{mod(\i,\tickpattern)}
        \pgfmathsetmacro{\currentyear}{\startyear + \i*\direction}
        \pgfmathsetmacro{\ypos}{\scaledstart - \i*\timescale}
        \ifnum\major=0
            \node[draw, line width=1pt, color=\timelinecolor, minimum width=1.5em, minimum height=0pt, inner ysep=0pt, inner xsep=2pt] at (0,\ypos) {};
            \node[left, color=\timelinecolor] at (-0.25,\ypos) {\timelineprefix\space\pgfmathprintnumber[assume math mode=true, precision=0]{\currentyear}};
        \else
            \node[draw, line width=0.5pt, color=\minortimelinecolor, minimum width=1em, minimum height=0pt, inner ysep=0pt, inner xsep=2pt] at (0,\ypos) {};
        \fi
    }

    % Draw vertical line with gap
    \pgfmathtruncatemacro{\gapcheck}{abs(sign(\timelineend))}
    \ifnum\gapcheck=1
        \node[draw, very thick, color=\timelinecolor, minimum width=1.5em, minimum height=0pt, inner ysep=0pt, inner xsep=2pt] at (0,\scaledstart) {};
    \fi
    \draw[thick, color=\timelinecolor] (0,\scaledstart) -- (0,\scaledend);
    
    % Update endpoint for chaining (unscaled)
    \pgfmathsetmacro{\newtimelineend}{\timelineend - \numnodes - 1}
    \global\edef\timelineend{\newtimelineend}
    
    % Update start year for events
    \pgfmathsetmacro{\newerastart}{\endyear + \direction}
    \global\edef\erastart{\newerastart}
}

% event command
\DeclareKeys[eventkeys] {
    year  .store = \eventyear,
    prefix  .store = \eventprefix,
    prefix  .initial:n = {},
    dot color  .store = \eventdotcolor,
    dot color  .initial:n = {chestnut},
    line color  .store = \eventlinecolor,
    line color  .initial:n = {chestnut!70!white},
    year color  .store = \eventyearcolor,
    year color  .initial:n = {chestnut},
    prefix color  .store = \eventprefixcolor,
    prefix color  .initial:n = {crimson},
}

\NewDocumentCommand{\reseteventkeys}{}{
    \SetKeys[eventkeys]{
        year = 0,
        prefix = {},
        dot color = chestnut,
        line color = chestnut!70!white,
        year color = chestnut,
        prefix color = crimson
    }
}

\ifcharstandalonetype
  \gdef\timelinewidth{15cm}
\else
  \gdef\timelinewidth{0.8\textwidth}
\fi

\NewDocumentCommand{\event}{m m O{}}{
    \reseteventkeys
    \SetKeys[eventkeys]{#1}
    \pgfmathsetmacro{\ypos}{(\timelineend + \erastart - \eventyear) * \timescale}

    \node[fill, circle, inner sep=1.5pt, color=\eventdotcolor] (year-marker) at (0,\ypos) {};
    \def\tempa{}%
    \ifx\eventprefix\tempa
        \node[right, max width=\timelinewidth, below={#3} of event-\number\numexpr\value{eventcounter}-1\relax.south west, anchor=north west] (event-\number\value{eventcounter}) {\leavevmode{\color{\eventyearcolor}\textbf{\pgfmathprintnumber[assume math mode=true, precision=0]{\eventyear}~--- }}#2};
    \else
        \node[right, max width=\timelinewidth, below={#3} of event-\number\numexpr\value{eventcounter}-1\relax.south west, anchor=north west] (event-\number\value{eventcounter}) {\leavevmode{\color{\eventprefixcolor}\textbf{\pgfmathprintnumber[assume math mode=true, precision=0]{\eventyear}~--- \eventprefix}}#2};
    \fi
    \draw[thin, color=\eventlinecolor, shorten <=-0.2pt] (year-marker) -- ($(event-\number\value{eventcounter}.north west) - (0, 0.75em)$);
    \stepcounter{eventcounter}
}

% timeline environment
\DeclareKeys[timelinekeys] {
  scale  .store = \timescale,
  scale  .initial:n = 0.1,
  major tick pattern  .store = \majortickpattern,
  major tick pattern  .initial:n = 1,
  event xshift  .store = \eventxshift,
  event xshift  .initial:n = 3cm,
}

\NewDocumentEnvironment{timeline}{o}{
    \SetKeys[timelinekeys]{#1}
    % Initialize timeline start and end position
    \gdef\timelineend{0}
    \gdef\erastart{0}
    % Initialize first event node position
    \ifcsname c@eventcounter\endcsname
    \else
        \newcounter{eventcounter}
    \fi
    \setcounter{eventcounter}{0}
    % Tick pattern
    \gdef\tickpattern{\majortickpattern}
    \begin{tikzpicture}
        \node[xshift=\eventxshift] (event-\the\value{eventcounter}) at (0,0) {};
        \stepcounter{eventcounter}
}{
    \end{tikzpicture}
}