\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{plotweaver}[2026 LaTeX Plotweaver class]
\DeclareKeys[plotweaver]
{
    article.if = @plotweaver@articletype,
    article.usage = load,
    standalone.if = @plotweaver@standalonetype,
    standalone.usage = load,
    stormlight.if = @plotweaver@stormlightcs,
    stormlight.usage = general,
    mistborn.if = @plotweaver@mistborncs,
    mistborn.usage = general,
    ariandor.if = @plotweaver@ariandorcs,
    ariandor.usage = general,
}
\ProcessKeyOptions
\if@plotweaver@standalonetype
    \DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{standalone}}
    \LoadClass[tikz]{standalone}
\else
    \if@plotweaver@articletype
        \DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{article}}
        \LoadClass{article}
    \else
        \DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{article}}
        \LoadClass{article}
        \gdef\@plotweaver@articletype{true}
    \fi
\fi

\if@plotweaver@articletype
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
\if@plotweaver@stormlightcs
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

\if@plotweaver@mistborncs
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

\AtBeginDocument{
  \pagecolor{cspapercolor}
}

\RequirePackage{amsmath}
\RequirePackage{bm}

\if@plotweaver@articletype
\RequirePackage{titlesec}
\else
\fi

\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins, raster}
\usetikzlibrary{calc, chains, backgrounds, positioning, arrows.meta,bending,shapes.geometric}
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
\if@plotweaver@articletype
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

\newtcolorbox{featureBox}[1]{
    enhanced,
    sharp corners,
    colback=white,
    colframe=black,
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
    colbacktitle=white,
    titlerule=-0.5pt,
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
    colbacktitle=white,
    titlerule=-0.5pt,
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

\NewDocumentCommand{\statBox}{mmmm}{
    \begin{tcbraster}[raster columns=2, raster equal height]
        \begin{leftBox}{#1}
            \begin{center}
                \huge#2
            \end{center}
        \end{leftBox}
        \begin{rightBox}{#3}
            \begin{center}
                \huge#4
            \end{center}
        \end{rightBox}
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
  \begin{keyTalentBox}{\key \textbf{#1}}
      #2
  \end{keyTalentBox}
}

% Normal Talent
\NewDocumentCommand{\talent}{mom}{
  {\color{cscolor}\bfseries\scshape\hspace{-0.6em} #1}\\
  \IfNoValueTF{#2}{}{{\color{plotweavergray}\footnotesize\itshape #2}\\}
  {\color{black}\small #3}
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

\if@plotweaver@standalonetype
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