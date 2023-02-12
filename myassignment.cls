% This provides a custom class for assignments
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myassignment}[2023/02/11 MyAssignment class]

% We do not support the twocolumn mode
\DeclareOption{twocolumn}{\ClassError{myassignment}{twocolumn not allowed}{Do not use the twocolumn option}}

% We need to declare the default options and explicitly pass them to the article class
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}

% Passes the undeclared options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Default options
\ExecuteOptions{a4paper,12pt}
\ProcessOptions\relax

% Loads the class article, which this class is based on
\LoadClass{article}

% Set the page geometry
\RequirePackage[hmargin=20mm, vmargin=30mm]{geometry}

% Redefine the \maketitle command to produce a small title
\renewcommand\maketitle{%
    \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
        \hb@xt@1.8em{%
        \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    {\LARGE \@title} \hfill \begin{tabular}{@{}l}
        \hfill \@author \\ \hfill \@date
    \end{tabular}
    \par
    \bigskip
    \thispagestyle{plain}
    \@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}

% Makes the section never produce a number, but still increments the counter
\RequirePackage{suffix}
\let\old@section\section
\renewcommand\section{\addtocounter{section}{1}\old@section*}
\WithSuffix\newcommand\section*{\section}

% Make the file into PDF-A
\RequirePackage[a-1b, mathxmp]{pdfx}

% Encoding for fonts. Makes this support more fonts
\RequirePackage[T1]{fontenc}

% Language support
\RequirePackage{babel}

% Microtypography
\RequirePackage{microtype}

% Use the Latin Modern font
\RequirePackage{lmodern}

% Uses skips instead of indents for new paragraphs
\RequirePackage{parskip}
\parskip 1ex

% Does not include double spaces after a period
\frenchspacing

% Load the packages and macros
\RequirePackage{mymacros}

% Number equations within the section
\numberwithin{equation}{section}
\numberwithin{theorem}{section}