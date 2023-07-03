\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myposter}

% "article" as the base class
\LoadClass{article}
\pagestyle{empty}

% REQUIRED PACKAGES
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{tikz}
\usetikzlibrary{shapes,arrows,positioning}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{graphicx}

%% AMS packages (optional for math and equations)
% \RequirePackage{amsmath}
% \RequirePackage{amsfonts}
% \RequirePackage{amssymb}

%%%% Page setup

%% Remove default margins
\geometry{margin=0in}

%% Small separation on enumerate and itemize
\setlist{nolistsep}
\setenumerate{noitemsep}
\setitemize{noitemsep}
\setlength{\parindent}{0pt}

% Colours
\definecolor{wasppink}{RGB}{203,166,169}
\definecolor{waspgrey}{RGB}{88,89,91}
\definecolor{waspblue}{RGB}{26,141,173}
\definecolor{darkgreen}{rgb}{0,0.6,0}
\definecolor{wasp_text}{RGB}{66,80,82}
\colorlet{wasp_banner_light}{waspblue}
\colorlet{wasp_banner_dark}{waspgrey}


\newcommand{\columnbackgroundcolor}{white}
\newcommand{\columnfontcolor}{black}

\newcommand{\maincolumnbackgroundcolor}{wasp_banner_light}
\newcommand{\maincolumnfontcolor}{white}

\newcommand{\titlebackgroundcolor}{white}
\newcommand{\titlefontcolor}{waspgrey}

\newcommand{\institutefontcolor}{waspgrey}
\newcommand{\authorfontcolor}{waspgrey}

%%%% SIZE COMMANDS

%% Poster lengths
\newlength{\mainfindingheight}
\setlength{\mainfindingheight}{0.3\paperheight}

\newlength{\marginvertical}
\setlength{\marginvertical}{0.07\paperheight}

\newlength{\bottomboxheight}
\setlength{\bottomboxheight}{0.1\paperheight}

\setlength{\columnsep}{0.02\textwidth}

%%%% SIZING OPTIONS

\newcommand{\fontsizestandard}{\fontsize{32.00}{50.50} \selectfont}
\newcommand{\fontsizestandardcode}{\ttfamily\fontsize{32.00}{40.0} \selectfont}
\newcommand{\fontsizemain}{\fontsize{116.00}{220.00} \selectfont}
\newcommand{\fontsizetitle}{\fontsize{80.00}{120.00} \selectfont}
\newcommand{\fontsizeauthor}{\fontsize{48.00}{68.00} \selectfont}
\newcommand{\fontsizeinstitution}{\fontsize{48.00}{68.00} \selectfont}
\newcommand{\fontsizesection}{\fontsize{48.00}{68.00} \selectfont}

\DeclareOption{a2paper}{
\geometry{a2paper}
\renewcommand{\fontsizestandard}{\fontsize{16.00}{25.00} \selectfont}
\renewcommand{\fontsizemain}{\fontsize{58.00}{110.00} \selectfont}
\renewcommand{\fontsizetitle}{\fontsize{40.00}{50.00} \selectfont}
\renewcommand{\fontsizeauthor}{\fontsize{24.00}{34.00} \selectfont}
\renewcommand{\fontsizeinstitution}{\fontsize{24.00}{34.00} \selectfont}
\renewcommand{\fontsizesection}{\fontsize{24.00}{34.00} \selectfont}
}

\DeclareOption{a1paper}{
\geometry{a1paper}
\renewcommand{\fontsizestandard}{\fontsize{22.63}{35.36} \selectfont}
\renewcommand{\fontsizemain}{\fontsize{82.02}{155.56} \selectfont}
\renewcommand{\fontsizetitle}{\fontsize{56.57}{70.71} \selectfont}
\renewcommand{\fontsizeauthor}{\fontsize{33.94}{48.08} \selectfont}
\renewcommand{\fontsizeinstitution}{\fontsize{33.94}{48.08} \selectfont}
\renewcommand{\fontsizesection}{\fontsize{33.94}{48.08} \selectfont}
}

\DeclareOption{a0paper}{
\geometry{a0paper}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% TEMPLATE COMMANDS


% makes main column
\newcommand{\makemain}[1]{
    \noindent
    \parbox[t][0.55\paperheight][t]{0.65\linewidth}{%

        {\let\newpage\relax\maketitle}
        #1
    }
}

% makes additional figures column
\newcommand{\makeextracolumn}[1]{
    \hfill\begin{tikzpicture}[overlay]
    \draw[\postertype, very thick] (0,0.01\paperheight) -- (0,-0.56\paperheight);
    \end{tikzpicture}
    \hfill
    \parbox[t][0.55\paperheight][t]{0.3\linewidth}{
        \section*{Extra figures}

        {\scriptsize
        #1
        }
    }
}

% Begin \mainfinding command
\newcommand{\mainfinding}[1]{
    \noindent\colorbox{\maincolumnbackgroundcolor}{
        \begin{minipage}[c][\mainfindingheight][c]{\textwidth}
            \centering
            \fontsizemain\color{\maincolumnfontcolor}
            \begin{tabular}{p{0.9\textwidth}}
                #1 \\
            \end{tabular}
        \end{minipage}
    }
}
% End \mainfinding command

% Begin \titlebox command
\newcommand{\titlebox}[1]{
    \centering
    \begin{minipage}{0.9\textwidth}
        \vspace{1em}
            #1
    \end{minipage}
}
% End \titlebox command



% Begin \centerbox command
\newcommand{\centerbox}[1]{
    \fontsizestandard\noindent\colorbox{\columnbackgroundcolor}{
        \noindent\hrulefill\par
        \noindent\makebox[\textwidth][c]{%
            \begin{minipage}{0.9\textwidth}
                \vspace{2em}
                \vfill{

                    \fontsizestandard\color{\columnfontcolor}
                    #1

                }
                \vspace{2em}

            \end{minipage}
        }
    }
}
% End \centerbox command



% Begin \bottombox command
\newcommand{\bottombox}[1]{
  \vfill
  \noindent
  \colorbox{\maincolumnbackgroundcolor}{
    \begin{minipage}[c][\bottomboxheight][c]{\textwidth}
      \centering
      \begin{minipage}{0.9\textwidth}

        \vfill
            {
              \fontsizesection\color{\maincolumnfontcolor}
              #1
            }

      \end{minipage}
    \end{minipage}
  }
}
% End \bottombox command


%% Bottom box logo
\newcommand{\bottomboxlogo}[2][width=\textwidth]{
    \begin{minipage}[c][\bottomboxheight][c]{0.3\textwidth}
        \includegraphics[#1]{#2}
    \end{minipage}
}

%% Section command
\renewcommand{\section}[1]{
    \vspace{2em}{\fontsizesection\selectfont
    \textbf{\leavevmode
    #1
    }}\\[0.5em]
}
% End \section command

%% Title command
\renewcommand{\title}[1]{
\setstretch{0.75}
\fontsizetitle
\vspace{0.25em}
\textbf{#1}

}

%% Author command
\renewcommand{\author}[1]{
    \vspace{0.25em}
    \fontsizeauthor
    \color{\authorfontcolor}
    #1
}


%% Institution command
\newcommand{\institution}[1]{
    \vspace{0.15em}
    \fontsizeinstitution
    \color{\institutefontcolor}
    #1
}
