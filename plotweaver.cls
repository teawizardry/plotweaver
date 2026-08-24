%% plotweaver.cls
%% Copyright 2026 Hannah Kirkland
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Hannah Kirkland.
%
% This work consists of the files plotweaver.cls, plotweaver-boxes.sty,
% plotweaver-character-sheet.sty, plotweaver-colors.sty,
% plotweaver-icons.sty, plotweaver-timeline.sty, character-sheet.tex, 
% character-sheet.pdf, example.tex, example.pdf, plotweaver.tex,
% plotweaver.pdf, nomodan.png, and README.md.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{plotweaver}[2026 LaTeX Plotweaver class]

% Article or Standalone
\newif\ifchararticletype
\newif\ifcharstandalonetype
\chararticletypetrue

% Colorschemes
\newif\ifstormlight\stormlightfalse
\newif\ifmistborn\mistbornfalse
\newif\ifariandor\ariandorfalse
\newif\ifcsset\cssetfalse

% Character Sheet
\newif\ifcharsheet\charsheetfalse

% Timeline
\newif\ifchartimeline\chartimelinefalse

% Document type options
\DeclareOption{article}{%
    \chararticletypetrue
    \charstandalonetypefalse
}
\DeclareOption{standalone}{%
    \charstandalonetypetrue
    \chararticletypefalse
}

% Colorschemes
\DeclareOption{stormlight}{%
    \stormlighttrue
    \cssettrue
}
\DeclareOption{mistborn}{%
    \mistborntrue
    \cssettrue
}
\DeclareOption{ariandor}{%
    \ariandortrue
    \cssettrue
}

% Character Sheet
\DeclareOption{character-sheet}{%
    \charsheettrue
}

% Timeline
\DeclareOption{timeline}{%
    \chartimelinetrue
}

% Pass unknown options to base class
\DeclareOption*{%
    \ifcharstandalonetype
        \PassOptionsToClass{\CurrentOption}{standalone}%
    \else
        \PassOptionsToClass{\CurrentOption}{article}%
    \fi
}

\ProcessOptions\relax

% Load the appropriate class
\ifcharstandalonetype
    \LoadClass[tikz]{standalone}
\else
    \LoadClass{article}
\fi

% Load color package
\RequirePackage{plotweaver-colors}

% Apply colorscheme
\RequirePackage[x11names]{xcolor}
\ifstormlight
    \RequirePackage[stormlight]{plotweaver-icons}

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

\ifmistborn
    \RequirePackage[mistborn]{plotweaver-icons}

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
\fi

\ifariandor
    \RequirePackage[ariandor]{plotweaver-icons}

    \colorlet{cspapercolor}{ariandorpaper}
    \colorlet{cstextcolor}{ariandorink}
    \colorlet{cscolor}{ariandorgreen}
    \colorlet{csaccent}{ariandorcrimson}
    \colorlet{csdim}{ariandorgreendim}
    % table colors
    \colorlet{cstblheaderbg}{ariandorgreen}
    \colorlet{cstblheadertext}{white}
    \colorlet{cstblrowa}{ariandortblrowa}
    \colorlet{cstblrowb}{ariandortblrowb}
    % callout colors
    \colorlet{cscalloutheaderbg}{ariandorgreen}
    \colorlet{cscalloutheadertext}{white}
    \colorlet{cscalloutbg}{ariandorcalloutbg}
\fi

\ifcsset\else
    \RequirePackage[ariandor]{plotweaver-icons}

    \colorlet{cspapercolor}{ariandorpaper}
    \colorlet{cstextcolor}{ariandorink}
    \colorlet{cscolor}{ariandorgreen}
    \colorlet{csaccent}{ariandorcrimson}
    \colorlet{csdim}{ariandorgreendim}
    % table colors
    \colorlet{cstblheaderbg}{ariandorgreen}
    \colorlet{cstblheadertext}{white}
    \colorlet{cstblrowa}{ariandortblrowa}
    \colorlet{cstblrowb}{ariandortblrowb}
    % callout colors
    \colorlet{cscalloutheaderbg}{ariandorgreen}
    \colorlet{cscalloutheadertext}{white}
    \colorlet{cscalloutbg}{ariandorcalloutbg}
\fi

\ifcharsheet
    \RequirePackage{plotweaver-character-sheet}
\fi

\ifchartimeline
    \RequirePackage{plotweaver-timeline}
\fi

\RequirePackage[color=cscolor,accent-color=csaccent,callout-color=cscalloutbg,text-color=cstextcolor]{plotweaver-boxes}

\RequirePackage{fontspec}
\setmainfont{TeX Gyre Schola}
\setsansfont{Noto Sans}
\ifcsname scripty\endcsname\else
    \newfontface\scripty[Scale=1.5]{QT Handwriting}
\fi
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

\AtBeginDocument{
  \pagecolor{cspapercolor}
}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             TITLE & SECTIONS              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifchararticletype
    \RequirePackage{titlesec}
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
%%                  TABLES                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifchararticletype
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
\else
\fi