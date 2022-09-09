% This provides a custom class for assignments
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myassignment}

% Passes the options to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Set the page geometry
\RequirePackage[hmargin=20mm, vmargin=30mm]{geometry}

% Redefine the \maketitle command to produce a small title
\renewcommand{\maketitle}{%
\newpage
{\LARGE \@title} \hfill \begin{tabular}{@{}l}
    \hfill \@author \\ \hfill \@date
\end{tabular}
\bigskip
\@thanks
\setcounter{footnote}{0}%
}

% Make the file into PDF-A
\RequirePackage[a-1b, mathxmp]{pdfx}

\RequirePackage{myassignment}