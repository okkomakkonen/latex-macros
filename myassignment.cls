% This provides a custom class for assignments
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myassignment}[2023/03/06 MyAssignment class]

% Passes the undeclared options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{myarticle}}

% Default options
\ExecuteOptions{a4paper,12pt}
\ProcessOptions\relax

% Loads the class myarticle, which this class is based on
\LoadClass[parskip]{myarticle}

% Makes the section never produce a number, but still increments the counter
\RequirePackage{suffix}
\let\old@section\section
\renewcommand\section{\addtocounter{section}{1}\old@section*}
\WithSuffix\newcommand\section*{\section}

% Provide the \problem command
\newcommand{\problem}{\section*}
