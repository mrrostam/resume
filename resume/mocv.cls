%%%%%%%%%%%%%%%%%
% This is mocv.cls written by
% Pouya Rostam (pooya.rostam@gmail.com)
%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%%
% Contributions:
%%%%%%%%%%%%%%%%

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mocv}[2020/01/08 Modified AltaCV, yet another alternative class for a resume/curriculum vitae.]


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\newif\if@raggedtwoe
\DeclareOption{ragged2e}{\@raggedtwoetrue}
\newif\if@compact
\DeclareOption{compact}{\@compacttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% pdf version
\RequirePackage[a-1b]{pdfx}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{fontawesome}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \ifluatex-\else-\fi statement
\RequirePackage{ifluatex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to find the last page number
\RequirePackage{lastpage}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to deal hyperlink
\RequirePackage{hyperref}
% Needed to use \fontsize{...}{...}\selectfont
\RequirePackage{anyfontsize}
% Fira fonts
%\RequirePackage[sfdefault,light]{FiraSans}
% 
\RequirePackage{scrlfile}
% 
\RequirePackage{xparse}
%
\RequirePackage{tikz}
%
\usetikzlibrary{arrows}
%
\RequirePackage[skins]{tcolorbox}
%
\RequirePackage[inline]{enumitem}

\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vspace{0.25\baselineskip}}

\setlist[itemize]{label=\itemmarker}
%
\RequirePackage{graphicx}
%
\RequirePackage{etoolbox}
%
\RequirePackage{dashrule}
%
\RequirePackage{multirow,tabularx}
%
\RequirePackage{changepage}
%
\RequirePackage{paracol}
%
% \RequirePackage{marginfix}
% Alias for if...
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

% Conditional
\ifxetexorluatex
  \RequirePackage{fontspec}
\else
  \RequirePackage{cmap}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfgentounicode=1
\fi

% Default font
\ifxetexorluatex
  % If using xelatex or lualatex:
  \setmainfont{Roboto Slab}
  \setsansfont{Lato}
  \renewcommand{\familydefault}{\sfdefault}
\else
  % If using pdflatex:
  \RequirePackage[rm]{roboto}
  \RequirePackage[defaultsans]{lato}
  % \usepackage{sourcesanspro}
  \renewcommand{\familydefault}{\sfdefault}
\fi

\if@raggedtwoe
  \RequirePackage[newcommands]{ragged2e}
\fi
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}
\hypersetup{
    colorlinks=true,
    urlcolor=links,
}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\if@compact
  \geometry{left=10mm,
            right=10mm,
            top=10mm,
            bottom=15mm,
            columnsep=7mm}
\else
\geometry{left=15mm,
          right=15mm,
          top=15mm,
          bottom=15mm,
          columnsep=10mm}
\fi

%% Header & Footer
% Set offset to each header and offset
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

\rfoot{Page \thepage~of \pageref{LastPage}}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newcommand{\namefont}{\fontsize{30}{40}\selectfont\bfseries}
\newcommand{\subtitlefont}{\small\itshape}
\newcommand{\personalinfofont}{\small}
\newcommand{\cvsectionfont}{\LARGE\bfseries}
\newcommand{\cvsubsectionfont}{\large\bfseries}

% Change the bullets for itemize and rating marker
% for \cvskill if you want to
\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{navy}{HTML}{000050}
\definecolor{bloody}{HTML}{500000}
% Basic colors
% \definecolor{green}{HTML}{C2E15F}
% \definecolor{orange}{HTML}{FDA333}
% \definecolor{purple}{HTML}{D3A4F9}
% \definecolor{red}{HTML}{FB4485}
% \definecolor{blue}{HTML}{6CE0F1}
\colorlet{red}{red!40!gray}
\colorlet{orange}{orange!40!gray}
\colorlet{yellow}{yellow!40!gray}
\colorlet{green}{green!40!gray}
\colorlet{cyan}{cyan!40!gray}
\colorlet{blue}{blue!40!gray}
\colorlet{purple}{purple!40!gray}
% Text colors
\definecolor{darktext}{HTML}{414141}
\definecolor{links}{HTML}{0D47A1} % light blue
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
\colorlet{heading}{navy}
\colorlet{firstname}{gray}
\colorlet{lastname}{black}
\colorlet{subtitle}{text}
\colorlet{accent}{blue!70!black}
\colorlet{headingrule}{black}
\colorlet{emphasis}{bloody}
\colorlet{subheading}{blue}
%\colorlet{body}{black!80!white}
\colorlet{body}{purple}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
\newcommand{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\linkedinlink}[1]{\def\@linkedinlink{#1}}
\newcommand{\linkedintext}[1]{\def\@linkedintext{#1}}
\newcommand{\phonetext}[1]{\def\@phonetext{#1}}
\newcommand{\emaillink}[1]{\def\@emaillink{#1}}
\newcommand{\emailtext}[1]{\def\@emailtext{#1}}
\newcommand{\semaillink}[1]{\def\@semaillink{#1}}
\newcommand{\semailtext}[1]{\def\@semailtext{#1}}
\newcommand{\githublink}[1]{\def\@githublink{#1}}
\newcommand{\githubtext}[1]{\def\@githubtext{#1}}
\newcommand{\websitelink}[1]{\def\@websitelink{#1}}
\newcommand{\websitetext}[1]{\def\@websitetext{#1}}

% icons
\def \linkedinicon {\faLinkedin}
\def \phoneicon {\faPhone}
\def \emailicon {\faEnvelope}
\def \semailicon {\faEnvelope}
\def \githubicon {\faGithub}
\def \websiteicon {\faGlobe}

% Defines to make listing easier
\def \linkedin {\linkedinicon \hspace{3pt}\href{\@linkedinlink}{\@linkedintext}}
\def \phone {\phoneicon \hspace{3pt}{ \@phonetext}}
\def \email {\emailicon \hspace{3pt}\href{\@emaillink}{\@emailtext}}
\def \semail {\emailicon \hspace{3pt}\href{\@semaillink}{\@semailtext}}
\def \github {\githubicon \hspace{3pt}\href{\@githublink}{\@githubtext}}
\def \website {\websiteicon \hspace{3pt}\href{\@websitelink}{\@websitetext}}

\newcommand{\makecvheader}{
    \begingroup
        \begin{tabularx}{\textwidth}{Xr}
            {
            \begin{tabular}[c]{l}
                {\namefont {\color{firstname}{{\textbf{\@firstname}}}~\color{lastname}{{\textbf{\@lastname}}}}} \\
                {\subtitlefont \color{subtitle}\@subtitle}
            \end{tabular}
            } & {
            \begin{tabular}[c]{l@{\hspace{1.5em}}l}
                {\personalinfofont \phone} & {\personalinfofont \linkedin} \\
                {\personalinfofont \email} & {\personalinfofont \github} \\
                {\personalinfofont \semail} & {\personalinfofont \website}
            \end{tabular}
            }
        \end{tabularx}
    \endgroup \medskip
}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------

\setlength{\parindent}{0pt}
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newenvironment{fullwidth}{%
  \begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
  {\end{adjustwidth}}

\newcommand{\cvsection}[2][]{%
    \bigskip%
    \ifstrequal{#1}{}{}{\marginpar{\vspace*{\dimexpr1pt-\baselineskip}\raggedright\input{#1}}}%
    {\color{heading}\cvsectionfont\MakeUppercase{#2}}\\[-1ex]%
    {\color{headingrule}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\cvsubsection}[1]{%
  \smallskip%
  {\color{subheading}\cvsubsectionfont{#1}\par}\medskip
}

\newcommand{\cvevent}[4]{%
  {\large\color{emphasis}#1\par}
  \smallskip\normalsize
  \ifstrequal{#2}{}{}{
  \textbf{\color{accent}#2}\par
  \smallskip}
  \ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\faCalendar~#3}}}%
  \ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\faMapMarker~#4}}}\par
  \medskip\normalsize
}

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

\newcommand{\cvachievement}[3]{%
  \begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
  \multirow{2}{*}{\Large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
  & #3
  \end{tabularx}%
  \smallskip
}

\newcommand{\cvskill}[2]{%
\textcolor{emphasis}{\textbf{#1}}\hfill
\foreach \x in {1,...,5}{%
  \space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
}

\newcommand{\cvref}[3]{%
  \smallskip
  \textcolor{emphasis}{\textbf{#1}}\par
  \begin{description}[font=\color{accent},style=multiline,leftmargin=1.35em,align=left]
    \item[\small\normalfont\faUniversity] #2
    \item[\small\normalfont\faEnvelope] #3
  \end{description}
%   \medskip
}
