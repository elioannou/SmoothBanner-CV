%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Latex class for resume
%%
%% Author: Eleftherios Ioannou
%% Year: 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{smooth-banner-cv}[2018/11/05 Smooth Banner CV class]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{etoolbox}

%%---------- Class Options ----------
\DeclareOption{10.5pt}{\AtBeginDocument{%
 \fontsize{10.5}{12.6}\selectfont}}
\DeclareOption{11.5pt}{\AtBeginDocument{%
 \fontsize{11.5}{13.8}\selectfont}}
\newbool{darktheme}
\DeclareOption{dark}{\setbool{darktheme}{true}}
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
\RequirePackage{ragged2e}
\RequirePackage{parskip}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage[left=6.6cm,top=1.5cm,right=1.0cm,bottom=0.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\AtBeginDocument{%
  \hypersetup{%
    urlbordercolor=side,
    pdftitle={CV of \givensbname},
    pdfauthor= {\givensbname},
    pdfsubject= Smooth Banner CV,
  }
}
\RequirePackage{tabularx}

%%---------- Colours ----------

%% Define main colour of theme
\definecolor{themecolour}{HTML}{0E6086} %bismark

% Set colours according to theme
\colorlet{main}{white}
\colorlet{mainheader}{themecolour}
\colorlet{mainbody}{black!80}
\notbool{darktheme}{%
  \colorlet{side}{themecolour!10}
  \colorlet{sideemph}{themecolour}
  \colorlet{sidetext}{black!80}
  \colorlet{sideicon}{themecolour}
  \colorlet{activebar}{themecolour}
  \colorlet{inactivebar}{themecolour!70!black!30}
}{%
  \colorlet{side}{themecolour!90}
  \colorlet{sideemph}{white}
  \colorlet{sidetext}{themecolour!25}
  \colorlet{sideicon}{white}
  \colorlet{activebar}{themecolour!20}
  \colorlet{inactivebar}{themecolour!80}
}
        
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
        \draw[fill=side, color=side] (0.9,0) rectangle (6.4,\paperheight);
      \end{tikzpicture}
    };
  \end{tikzpicture}
  \hypersetup{%
    urlbordercolor=main
  }
  \renewcommand{\arraystretch}{1.5}
  \begin{textblock}{5}(1.3, 1)
    \begin{flushleft}
        \color{sidetext}
}{%
    \end{flushleft}
  \end{textblock}
  \color{mainbody}
  \hypersetup{%
    urlbordercolor=side
  }
}

% Sidebar text
\newcommand{\sidetext}[1]{\textcolor{sideemph}{#1}}
\newcommand{\sideemph}[1]{\textbf{\textcolor{sideemph}{#1}}}

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
\newcommand*\icon[1]{\large\textcolor{sideicon}{#1}}

%% Profile info environment
\newenvironment{profileinfo}
               {\tabularx{\textwidth}{c X}}
               {\endtabularx}
         
%% Sidebar section titles format
\newcommand*{\sidebarsection}[1]{{\bigskip\bigskip\noindent\textcolor{sidetext}{ \LARGE #1}}\par\medskip}

%% Bar skills format
\newcommand\barskills[1]{%
  \noindent
  \tikz{%
    \foreach [count=\i] \x/\y in {#1}
             {%
               \draw[fill=inactivebar,inactivebar] (0.1,-\i) rectangle (4.8,-\i+0.4);
               \draw[fill=main,activebar](0.1,-\i) rectangle (\y*0.4,-\i+0.4);
               \node [above right ] at (0.1,-\i+0.38) {\x};
             }
  }
}

%% Table skills format
\newcommand\tableskills[1]{% 
  \def\addtablerow##1/##2!{##1 &\hfill \sideemph{##2}\\}
  \renewcommand*\do[1]{\addtablerow##1!}
  \noindent
  \begin{tabularx}{\textwidth}{lX}
    \docsvlist{#1}
  \end{tabularx}
}

              
%% ---------- Make title -----------

\newcommand{\maketoptitle}{%
  \renewcommand{\arraystretch}{1.25}
  \begin{flushright}
    {\Huge\textcolor{mainheader}{\givensbname\hspace{6pt}}}\\
    \ifdef{\givensbjobtitle}{\Large\textcolor{mainbody}{\givensbjobtitle\hspace{6pt}}}{}
  \end{flushright}
  \hspace{-1.5cm} \textcolor{mainheader!90}{\rule{1.1\linewidth}{2pt}}
%  \vspace{-10pt}
}

%% ---------- Sections style -----------

\renewcommand{\section}[1]{%
  \bigbreak
  \textcolor{mainheader}{\LARGE #1}
  \par
}

\pagestyle{empty}

%% ---------- Regular text -----------

\newcommand{\regulartext}[1]{\textcolor{mainbody}{#1}}

%% ---------- Simple list environment -----------

\newenvironment{simplelist}
               {\tabularx{\textwidth}{lX}}
               {\endtabularx}

\newcommand{\simplelistitem}[2]{#1 & \textcolor{mainbody}{#2}\\}

%% ---------- Rich list environment -----------

\newenvironment{richlist}
               {\tabularx{\textwidth}{lX}}
               {\endtabularx}
               
\newcommand{\richlistitem}[4]{#1 & {\textcolor{mainbody}{\textbf{#2}}} \hfill {\textcolor{mainheader}{\emph{#3}}} \\
  & \textcolor{mainbody}{#4}\\ }

\newenvironment{richbullets}
               {\vspace{-4mm} \begin{itemize}[leftmargin=*]}
               {\end{itemize} \vspace{-4mm}}


\endinput
