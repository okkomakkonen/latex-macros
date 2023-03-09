% This provides a custom class for articles
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2023/03/09 MyArticle class]

% Define options
\newif\if@parindent
\newif\if@shorttitle

% We do not support the twocolumn mode or the titlepage mode
\DeclareOption{twocolumn}{\ClassError{myarticle}{twocolumn not allowed}{Do not use the twocolumn option}}
\DeclareOption{titlepage}{\ClassError{myarticle}{titlepage not allowed}{Do not use the titlepage option}}

% Use either skips or indents
\DeclareOption{parindent}{\@parindenttrue}
\DeclareOption{parskip}{\@parindentfalse}

% Use either the short or long title
\DeclareOption{shorttitle}{\@shorttitletrue}
\DeclareOption{longtitle}{\@shorttitlefalse}

% Passes the undeclared options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Default options
\ExecuteOptions{parindent,shorttitle}
\PassOptionsToClass{a4paper,12pt}{article}
\ProcessOptions\relax

% Loads the class article, which this class is based on
\LoadClass{article}

% Set the page geometry
\RequirePackage[hmargin=20mm, vmargin=30mm]{geometry}

% Use the \ifdefvoid command
\RequirePackage{etoolbox}

% Check if we have both author and date in the short title
\newif\if@authoranddate
\@authoranddatefalse

\newcommand{\@titlestyle}{}

% Redefine the look of the title
\if@shorttitle
\def\@maketitle{%
    \parskip 0ex
    \noindent{\@titlestyle\LARGE\@title}\hfill%
    \ifdefvoid{\@author}{\@date}{%
        \ifdefvoid{\@date}{\@author}{%
            \@authoranddatetrue
            \begin{tabular}{@{}r@{}}
                \@author \\ \@date
            \end{tabular}%
        }
    }%
    \par
    \smallskip
}
\else
\def\@maketitle{%
    \parskip 0ex
    \begin{center}
        {\@titlestyle\LARGE\@title\par}
        \bigskip
        \begin{tabular}{c}
            \@author \\ \@date
        \end{tabular}
    \end{center}
}
\fi

% Redefine abstract environment
\renewenvironment{abstract}{%
    \small
    \if@authoranddate\vspace{-\smallskipamount}\fi
    \begin{center}
        {\bfseries\abstractname\vspace{-.5em}}
    \end{center}
    \quotation
}{\endquotation}

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

% Uses skips or indents depending on the options
\if@parindent
\RequirePackage[indent=1em,skip=0ex]{parskip}
\else
\RequirePackage{parskip}
\fi

% Does not include double spaces after a period
\frenchspacing

% Load the packages and macros
\RequirePackage{mymacros}
