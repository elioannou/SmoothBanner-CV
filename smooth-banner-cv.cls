%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Latex class for resume
%%
%% Author: Eleftherios Ioannou
%% Year: 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{smooth-banner-cv}[2018/11/05 Smooth Banner CV class]
\NeedsTeXFormat{LaTeX2e}

%%---------- Class Options ----------
\DeclareOption{10.5pt}{\AtBeginDocument{%
 \fontsize{10.5}{12.6}\selectfont}}
\DeclareOption{11.5pt}{\AtBeginDocument{%
 \fontsize{11.5}{13.8}\selectfont}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax

%%---------- Packages ----------
\LoadClass{article}
\RequirePackage[sups]{XCharter}
\RequirePackage[T1]{fontenc}
\RequirePackage{anyfontsize}
%\RequirePackage[english]{babel}
\RequirePackage{fontawesome}
\RequirePackage{tikz}
\usetikzlibrary{patterns}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{parskip}
\RequirePackage{etoolbox}
\RequirePackage[left=6.6cm,top=2cm,right=1.0cm,bottom=0.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\AtBeginDocument{%
  \hypersetup{%
    urlbordercolor=gray,
    pdftitle={CV of \givensbname},
    pdfauthor= {\givensbname},
    pdfsubject= Smooth Banner CV,
  }
}
\RequirePackage{tabularx}
\renewcommand{\arraystretch}{1.5}

%%---------- Colours ----------

\definecolor{lightgray}{HTML}{E7E7E7}
\definecolor{lightbeige}{HTML}{EAE8E3}
\definecolor{bargray}{HTML}{B9B9B9}
\definecolor{mainblue}{HTML}{0E5484}

\colorlet{sidecolour}{lightgray}
\colorlet{headercolour}{mainblue}
\colorlet{textcolour}{black}

%%--------- Definition of class commands ----------

\newcommand{\sbname}[1]{\newcommand{\givensbname}{#1}}
\newcommand{\sbjobtitle}[1]{\newcommand{\givensbjobtitle}{#1}}

%% Checks whether basic info has been provided
\AtBeginDocument{%
  \ifundef{\givensbname}{%
    \PackageError{smoothbannercv}{No name has been provided}
                 {Specify a name by setting \sbname{name}}
}}

%% ---------- Sidebar commands -----------

%% textblock units
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

%% Sidebar environement
\newenvironment{sidebar}{%
  %% Background colour
  \begin{tikzpicture}[remember picture,overlay]
    \node  at (current page.south west) {%
      \begin{tikzpicture}[remember picture,overlay]
        \draw[fill=sidecolour,color=sidecolour] (0.9,0) rectangle (6.4,\paperheight);
      \end{tikzpicture}
    };
  \end{tikzpicture}
  \color{black!80}
  \hypersetup{%
    urlbordercolor=white
  }
  \begin{textblock}{5}(1.3, 1.5)
    \begin{flushleft}
}{%
    \end{flushleft}
  \end{textblock}
  \color{black}
  \hypersetup{%
    urlbordercolor=gray
  }
}

%% Profile picture dimensions
\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%

%% Make profile picture
\newcommand{\makeprofilepic}[1]{%
  \begin{center}
    \begin{tikzpicture}[x=\imagescale,y=-\imagescale]
      \clip (600/2, 567/2) circle (567/2);
      \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{#1}};
    \end{tikzpicture}
    \medskip
  \end{center}
}

%% Icons format
\newcommand*\icon[1]{\large\textcolor{mainblue}{#1}}

%% Profile info environment
\newenvironment{profileinfo}
               {\tabularx{\textwidth}{c X}}
               {\endtabularx}
         
%% Sidebar section titles format
\newcommand*{\sidebarsection}[1]{{\medskip\noindent\textcolor{black}{ \LARGE #1}}\par}

%% Skills format
\newcommand\barskills[1]{%
  \noindent
  \tikz{%
    \foreach [count=\i] \x/\y in {#1}
             {%
               \draw[fill=bargray,bargray] (0.1,-\i) rectangle (4.6,-\i+0.4);
               \draw[fill=white,mainblue](0.1,-\i) rectangle (\y*0.3,-\i+0.4);
               \node [above right ] at (0.1,-\i+0.38) {\x};
             }
  }
  \bigskip
}

%% Languages format
\newcommand\tableskills[1]{% 
  \def\addtablerow##1/##2!{##1 &\hfill \textcolor{mainblue}{##2}\\}
  \renewcommand*\do[1]{\addtablerow##1!}
  \noindent
  \begin{tabularx}{\textwidth}{lX}
    \docsvlist{#1}
  \end{tabularx}
}

              
%% ---------- Make title -----------

\newcommand{\maketoptitle}{%
  \begin{flushright}
    {\Huge\textcolor{mainblue}{\givensbname\hspace{6pt}}}\\
    \ifdef{\givensbjobtitle}{\Large\textcolor{black!80}{\givensbjobtitle\hspace{6pt}}}{}
  \end{flushright}
  \hspace{-1.5cm} \textcolor{sidecolour}{\rule{1.1\linewidth}{20pt}}
}

%% ---------- Sections style -----------

\renewcommand{\section}[1]{%
  \bigskip
  \textcolor{headercolour}{\LARGE #1}
  \par
  \vspace{-4pt}
}

\pagestyle{empty}

%% ---------- Simple list environment -----------

\newenvironment{simplelist}
               {\tabularx{\textwidth}{lX}}
               {\endtabularx}

\newcommand{\simplelistitem}[2]{#1 & #2\\}

%% ---------- Rich list environment -----------

\newenvironment{richlist}
               {\tabularx{\textwidth}{lX}}
               {\endtabularx}
               
\newcommand{\richlistitem}[4]{#1 & {\textcolor{black}{\textbf{#2}}} \hfill \emph{#3} \\
  & \textcolor{black!80}{#4}\\ }

\endinput
