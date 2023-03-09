% This provides a custom class for assignments
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myassignment}[2023/03/09 MyAssignment class]

% Passes the undeclared options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{myarticle}}

% Default options
\ProcessOptions\relax

% Loads the class myarticle, which this class is based on
\LoadClass[parskip]{myarticle}

% Provide the \problem command, set the problemname with \problemname
\newcommand{\problemname}[1]{\def\@problemname{#1}}
\newcommand{\problem}[1]{\setcounter{section}{#1}\section*{\@problemname~#1}}
\problemname{Problem}

% Number equations and theorems within the section
\numberwithin{equation}{section}
\numberwithin{theorem}{section}
