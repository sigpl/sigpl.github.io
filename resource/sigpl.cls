% sigpl.cls
% 프로그래밍언어논문지 작성을 위한 latex2e class
% 수정: 이광근, 표 이름후에 ``1mm''가 나타나는 것을 없앰. 9/20/2004
% 작성자 : 최웅식 (wschoi@ropas.kaist.ac.kr)
%   ( ACM TOPLAS 의 class 화일(acmtrans.cls)를 변경해서 만들었음. )
% 작성일자 : 2002년 10월 11일
%
%
% 이 class 화일을 사용하는 latex 문서의 예는 
% 아래 EXAMPLE.tex 이름으로 주석처리된 부분을 참고바랍니다.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sigpl} [2002/10/11 SIGPL class based on ACM Transactions class]
\RequirePackage{latexsym,hfont,graphicx}


\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \def\special@paper{210mm,297mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}%
    \def\special@paper{148mm,210mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}%
    \setlength\voffset     {-15mm}%
    \setlength\hoffset     {-20mm}%
    \def\special@paper{176mm,250mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}%
    \def\special@paper{8.5in,11in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}%
    \def\special@paper{8.5in,14in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}%
    \def\special@paper{7.25in,10.5in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi

\DeclareOption{checkMargin}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

\DeclareOption{10pt}{\def\@ptsize{0}} %needed for amssymbols.sty 
\DeclareOption{11pt}{\ClassError{acmtrans}{11pt style not supported}
            {ACM transactions doecuments can be set in 10pt only}}
\DeclareOption{12pt}{\ClassError{acmtrans}{11pt style not supported}
            {ACM transactions doecuments can be set in 10pt only}}

\DeclareOption{hyperref}{%
    \def\pages{\realpageref{@firstpg}--\realpageref{@lastpg}}%
    \def\mypage{\thepage}%
    \setlength{\bibitemindent}{-1em}
    \def\@getpagenum#1#2#3#4{#2}%
    \def\pdfinfo#1#2{\pdfmark{pdfmark=/DOCINFO,Title=#1,Author=#2}}
    }
\DeclareOption{nohyperref}{
        \def\pages{\pageref{@firstpg}--\pageref{@lastpg}}%
        \def\@getpagenum#1#2{#2}%
        \def\mypage{\thepage}%
        \def\pdfinfo#1#2{}%
        \def\href#1#2{#2}%
        \def\pdfbookmark#1#2{}%
        }
\DeclareOption{notfinal}{
        \def\pages{TBD}%
        \def\mypage{TBD}%
        \def\@getpagenum#1#2{#2}%
        \def\pdfinfo#1#2{}%
        \def\pdfbookmark#1#2{}%
        }
\DeclareOption{omitline}{\def\@abstractbottom{\relax}}
\DeclareOption{dontomitline}{\def\@abstractbottom{\hbox{\vrule height .2pt width 14cm}}}
\newlength{\bibitemindent}
\ExecuteOptions{twoside,final,10pt,dontomitline,nohyperref,letterpaper} % defaults



\ProcessOptions


 \widowpenalty=5000
 \clubpenalty=5000


\lineskip 1pt \normallineskip 1pt
\def\baselinestretch{1}

\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xpt\@xiipt
  \abovedisplayskip 6pt plus2pt minus1pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 6pt plus0pt minus 3pt
  \belowdisplayshortskip 6pt plus0pt minus3pt\let\@listi\@listI} 

\newcommand\small{%
  \@setfontsize\small\@ixpt{11pt}%
  \abovedisplayskip 5pt plus 2pt minus 1pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 5pt plus0pt minus2pt\belowdisplayshortskip 5pt plus0pt
      minus 2pt
  \def\@listi{\leftmargin\leftmargini \topsep 5pt plus 2pt minus 1pt\parsep 0pt
    plus .7pt 
  \itemsep 1.6pt plus .8pt}}
\newcommand\footnotesize{%
%   \@setfontsize\footnotesize\@viiipt{10pt}
 \@setsize\footnotesize{10pt}\viiipt\@viiipt
  \abovedisplayskip 4pt plus 1pt minus 0pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 4pt plus 0pt minus 1pt\belowdisplayshortskip 4pt plus
       0pt minus 1pt
  \def\@listi{\leftmargin\leftmargini \topsep 4pt plus 1pt minus
     0pt\parsep 0pt plus .5pt 
     \itemsep 1pt plus .7pt}}

\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{20}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\normalsize 

 \oddsidemargin .40in \evensidemargin .40in \marginparwidth .5in 
 \marginparsep .125in 
 \topmargin .25in \headheight 12pt\headsep 16pt
  %% not in latex2e  \footheight 10pt
  \footskip 15pt 

\textheight 47pc \textwidth 14cm \columnsep 10pt \columnseprule 0pt 

\footnotesep 7pt
\skip\footins 15pt plus 4pt minus 3pt 
\floatsep 12pt plus 2pt minus 2pt 
\textfloatsep \floatsep 
\intextsep 1pc plus 1pc 
%%% not in 2e %% \@maxsep 1pc 
%%% not in 2e %% \@dblmaxsep 20pt 
\dblfloatsep 12pt plus 2pt minus 2pt 
\dbltextfloatsep 20pt plus 2pt minus 4pt 
\@fptop 0pt plus 1fil \@fpsep 1pc plus 2fil \@fpbot 0pt plus 1fil 
\@dblfptop 0pt plus 1fil \@dblfpsep 8pt plus 2fil \@dblfpbot 0pt plus 1fil
\marginparpush 6pt 

\parskip 0pt plus .1pt \parindent 10pt \partopsep 0pt 
\@lowpenalty 51 \@medpenalty 151 \@highpenalty 301 
\@beginparpenalty -\@lowpenalty \@endparpenalty -\@lowpenalty \@itempenalty
-\@lowpenalty 


%%%%%%%%%%
% WSCHOI %  

\def\@defpaperno{\Large\textsf{논$\cdot$문}}
\global\let\@etitle\@empty
\global\let\@paperno\@defpaperno

\def\etitle#1{\def\@etitle{#1}}
\def\paperno#1{\def\@paperno{#1}}
\def\authorsep{\vspace{1mm}}


\newcommand{\vitae}[4]{
\vspace{7mm}
\hspace{-1cm}
\begin{tabular}[t]{ll}
&\hspace{-5mm} {\large #1}\vspace{1.5mm} \\
\begin{minipage}[t]{3cm}
\includegraphics[height=3cm]{#2}
\end{minipage}
&
\hspace{-1cm}
\begin{tabular}[t]{l}
\vspace{-3cm}\\
\begin{tabular}[t]{@{\textbf{--} }p{11.3cm}}
#3
\end{tabular}
\vspace{2mm}\\
\begin{minipage}[t]{11.6cm}
$<$관심분야$>$ #4
\end{minipage}
\end{tabular}
\end{tabular}
}
%%%%%%%%%%


\def\part{\@ucheadfalse
 \@startsection{part}{9}{\z@}{-10pt plus -4pt minus 
 -2pt}{4pt}{\reset@font\Large\sffamily}}
\def\section{\@ucheadfalse
 \@startsection{section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}
{2.3ex \@plus.2ex}{\reset@font\Large\sffamily}}
\def\subsection{\@ucheadfalse
 \@startsection{subsection}{2}{\z@}{-8pt plus -2pt minus 
 -1pt}{2.3ex \@plus.2ex}{\reset@font\large\sffamily}}
\def\subsubsection{\@ucheadfalse
 \@startsection{subsubsection}{3}{\parindent}{6pt plus 
1pt}{-5pt}{\reset@font\normalsize\itshape}}
\def\paragraph{\@ucheadfalse
 \@startsection{paragraph}{3}{\parindent}{6pt plus 
1pt}{-5pt}{\reset@font\normalsize\itshape}}

\renewcommand{\@seccntformat}[1]{\textup{\csname the#1\endcsname}}

\gdef\@period{.}
\def\@trivlist{\@topsepadd\topsep
\if@noskipsec \gdef\@period{}\leavevmode\gdef\@period{.}\fi
 \ifvmode \advance\@topsepadd\partopsep \else \unskip\par\fi
 \if@inlabel \@noparitemtrue \@noparlisttrue 
 \else \@noparlistfalse \@topsep\@topsepadd \fi
 \advance\@topsep \parskip
 \leftskip\z@\rightskip\@rightskip \parfillskip\@flushglue
 \@setpar{\if@newlist\else{\@@par}\fi} \global\@newlisttrue
\@outerparskip\parskip}


\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
      \if@uchead%
        \protected@edef\@svsec{\@seccntformat{#1}.\quad\relax}%
    \else%
        \protected@edef\@svsec{\@seccntformat{#1}\quad\relax}%
    \fi%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M \if@uchead\MakeUppercase{#8}\else#8\fi \@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec \if@uchead\Makeuppercase{#8}\else#8\fi}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\def\@xsect#1{\@tempskipa #1\relax
 \ifdim \@tempskipa>\z@
 \par \nobreak
 \vskip \@tempskipa
 \@afterheading
 \else \global\@nobreakfalse \global\@noskipsectrue
 \everypar{\if@noskipsec \global\@noskipsecfalse
 \clubpenalty\@M \hskip -\parindent
 \begingroup \@svsechd\@period \endgroup \unskip
 \hskip -#1
 \else \clubpenalty \@clubpenalty
 \everypar{}\fi}\fi\ignorespaces}
\newif\if@uchead\@ucheadfalse


\setcounter{secnumdepth}{3}
\newcounter{secnumbookdepth}
\setcounter{secnumbookdepth}{3}

% for appendix
\newfont{\apbf}{cmbx9}
\def\@appsec{}

\def\appendix{\par
 \setcounter{section}{0}
 \setcounter{subsection}{0}
 \def\@appsec{부록 } 
    \def\thesection{\Alph{section}}
    \def\theHsection{\Alph{section}}}


\labelsep 5pt
\settowidth{\leftmargini}{(9)} \addtolength\leftmargini\labelsep
\settowidth{\leftmarginii}{(b)} \addtolength\leftmarginii\labelsep
\leftmarginiii \leftmarginii
\leftmarginiv \leftmarginii 
\leftmarginv \leftmarginii 
\leftmarginvi \leftmarginii 
\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep
\def\@listI{\leftmargin\leftmargini \parsep 0pt plus 1pt\topsep 6pt plus 2pt
minus 2pt\itemsep 2pt plus 1pt minus .5pt}
\let\@listi\@listI
\@listi 
\def\@listii{\leftmargin\leftmarginii
 \labelwidth\leftmarginii\advance\labelwidth-\labelsep
 \topsep 0pt plus 1pt 
 \parsep 0pt plus .5pt 
 \itemsep \parsep}
\def\@listiii{\leftmargin\leftmarginiii
 \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
 \topsep 0pt plus 1pt 
 \parsep 0pt plus .5pt 
 \itemsep \parsep}
\def\@listiv{\leftmargin\leftmarginiv
 \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
 \labelwidth\leftmarginv\advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
 \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}




\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
 \advance\@enumdepth \@ne 
 \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
 {\csname label\@enumctr\endcsname}{\usecounter
 {\@enumctr}\def\makelabel##1{##1\hss}}\fi}
\def\longenum{\ifnum \@enumdepth >3 \@toodeep\else
 \advance\@enumdepth \@ne 
 \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
 {\csname label\@enumctr\endcsname}{\usecounter
 {\@enumctr}\labelwidth\z@}\fi}
%\leftmargin\z@ \itemindent\parindent}\fi} - this indents each item in enumerate
\let\endlongenum\endlist
%%--------------------CHANGED: always roman parentheses. dave ---------------%%
\def\labelenumi{{\rm (}\arabic{enumi}\/{\rm )}} 
\def\theenumi{\arabic{enumi}} 
\def\labelenumii{{\rm (}\alph{enumii}\rm{)}}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}
\def\labelenumiii{\roman{enumiii}.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi{\rm (}\theenumii{\rm )}}
\def\labelenumiv{\Alph{enumiv}.}
\def\theenumiv{\Alph{enumiv}} 
\def\p@enumiv{\p@enumiii\theenumiii}

\def\p@enumiv{\p@enumiii\theenumiii}

\def\itemize{\list{\normalfont\bf --\ \hskip -\labelsep}{\settowidth
 {\leftmargin}{---}\labelwidth\leftmargin
 \addtolength{\labelwidth}{-\labelsep}}}
\let\enditemize\endlist
\def\longitem{\list{---}{\labelwidth\z@
 \leftmargin\z@ \itemindent\parindent \advance\itemindent\labelsep}}
\let\endlongitem\endlist

\def\verse{\let\\=\@centercr 
 \list{}{\leftmargin 2pc 
 \itemindent -1.5em\listparindent \itemindent 
 \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist
\def\quotation{\list{}{\leftmargin 2pc \listparindent .5em
 \itemindent\listparindent
 \rightmargin\leftmargin \parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist
\def\quote{\list{}{\leftmargin 2pc \rightmargin\leftmargin}\item[]}
\let\endquote=\endlist


\def\description{\list{}{\labelwidth\z@
 \leftmargin\z@ \advance\itemindent\labelsep
 \def\makelabel##1{\bf ##1.}}}
\let\enddescription\endlist

\def\theequation{\arabic{equation}}

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

\arraycolsep 2.5pt \tabcolsep 6pt \arrayrulewidth .4pt \doublerulesep 2pt 
\tabbingsep \labelsep 

\skip\@mpfootins = \skip\footins
\fboxsep = 3pt \fboxrule = .4pt 

\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]

\def\thepart{\Roman{part}} 
\def\thesection {\arabic{section}}
\def\thesubsection {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\def\theparagraph {\thesubsubsection.\arabic{paragraph}}

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{참고문헌
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

\newif\if@restonecol
\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35pt\twocolumn[\section*{Index}]
 \@mkboth{INDEX}{INDEX}\thispagestyle{plain}\parindent\z@
 \parskip\z@ plus .3pt\relax\let\item\@idxitem}
\def\@idxitem{\par\hangindent 40pt}
\def\subitem{\par\hangindent 40pt \hspace*{20pt}}
\def\subsubitem{\par\hangindent 40pt \hspace*{30pt}}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}

\def\footnoterule{\kern-3\p@
 \hrule \@height 0.2\p@ \@width 47\p@ 
  \kern 2.6\p@
} 

\long\def\@makefntext#1{\parindent 1em\noindent 
 $^{\@thefnmark}$#1}


\setcounter{topnumber}{3}
\def\topfraction{.99}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.5}
\setcounter{totalnumber}{3}
\def\textfraction{.01}
\def\floatpagefraction{.85}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}


\long\def\@makecaption#1#2{\vskip 1pc \setbox\@tempboxa\hbox{#1 \relax #2}
 \ifdim \wd\@tempboxa >\hsize #1 #2\par \else \hbox
to\hsize{\hfil\box\@tempboxa\hfil} 
 \fi}

\def\nocaption{\refstepcounter\@captype \par
 \vskip 1pc \hbox to\hsize{\hfil \footnotesize \sf[그림] \thefigure
 \hfil}}

\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\bf\sf[그림~\thefigure]}
\def\figure{\let\normalsize\footnotesize \normalsize \@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}
\newcounter{table}
\def\thetable{\@Roman\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\newcommand{\fnum@table}[1]{\sf[표~\thetable]}
\def\table{\let\normalsize\footnotesize \normalsize\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}
\def\acmtable#1{\@narrowfig #1\relax
 \let\caption\@atcap \let\nocaption\@atnocap
 \def\@tmpnf{}\@ifnextchar[{\@xntab}{\@ntab}}
\def\endacmtable{\hbox to \textwidth{\hfil
\vbox{\hsize \@narrowfig
\box\@nfcapbox
{\baselineskip 4pt \hbox{\vrule height .4pt width \hsize}}
\vskip -1pt
\box\@nfigbox\vskip -1pt
{\baselineskip 4pt \hbox{\vrule height .4pt width \hsize}}}\hfil}
\end@float}
\def\@xntab[#1]{\def\@tmpnf{[#1]}\@ntab}
\def\@ntab{\expandafter\table\@tmpnf
 \setbox\@nfigbox\vbox\bgroup
 \hsize \@narrowfig \@parboxrestore}
\def\@atmakecap #1#2{\setbox\@tempboxa\hbox{#1.\hskip 1em\relax #2}
 \ifdim \wd\@tempboxa >\hsize \sloppy #1.\hskip 1em\relax #2 \par \else \hbox
to\hsize{\hfil\box\@tempboxa\hfil}
 \fi}
\def\@atcap{\par\egroup\refstepcounter\@captype 
 \@dblarg{\@atcapx\@captype}}
\long\def\@atcapx#1[#2]#3{\setbox\@nfcapbox\vbox {\hsize \wd\@nfigbox
 \@parboxrestore
 \@atmakecap{\csname fnum@#1\endcsname}{\ignorespaces #3}\par}}
\def\@atnocap{\egroup \refstepcounter\@captype 
 \setbox\@nfcapbox\vbox {\hsize \wd\@nfigbox
 \hbox to\hsize{\hfil \footnotesize [표] \thetable\hfil}}}

\def\maketitle{\newpage \thispagestyle{titlepage}\par
 \begingroup \lineskip = \z@\null \vskip -15pt\relax
 \parindent\z@ \LARGE {\raggedright \hyphenpenalty\@M
   \vskip 10pt
   \begin{center}
     {\rm \@title}\vspace{2mm}\\
     {\it \Large \@etitle}
   \end{center}
 \par}


\label{@firstpg}
{\vskip 3mm
\begin{center}
 \@author
 \end{center}
}
\vskip 5mm
\@beginparpenalty\@lowpenalty
\begin{center}{\sf \large요\hspace{3mm}약}
\@endparpenalty\@M
\end{center}\vskip -2mm
\hspace{0.5cm}\box\@abstract
\vskip 5mm
 \endgroup
\let\maketitle\relax
\@thanks}



\newbox\@abstract
\def\abstract{\global\setbox\@abstract=\vbox\bgroup \everypar{}
\hsize 13cm \parindent 12pt \noindent 
 \rule{0pt}{12pt}\ignorespaces}
\def\endabstract{\egroup}



\newenvironment{ackslike}[1]
  {\par \footnotesize 
   \@ucheadfalse
   \@startsection{section}{1}{\z@}{-10pt plus -4pt minus -2pt}{4pt}
      {\reset@font\normalsize\sffamily}*{#1}\par\normalsize
   \pdfbookmark{Acknowledgments}{Ack}
    }
  {\par}
\newenvironment{acks}{\begin{ackslike}{\large감사의 글}}{\end{ackslike}}

\def\received{\par\footnotesize\addvspace{18pt plus 0pt minus
4pt}\parindent\z@}
\def\endreceived{\label{@lastpg}\hskip-2pt\par}

\mark{{}{}} 

\def\ps@myheadings{\let\@mkboth\@gobbletwo
\def\@oddhead{\hbox{}\hfill \small\sf \rightmark\hskip
19pt{\Large$\cdot$}\hskip 17pt\mypage}
\def\@oddfoot{\hbox{}\hfill\tiny\@runningfoot}
\def\@evenhead{\small\sf\mypage \hskip 17pt{\Large$\cdot$}\hskip 19pt\leftmark\hfill \hbox{}}
\def\@evenfoot{\tiny\@runningfoot\hfill\hbox{}}
\def\sectionmark##1{}\def\subsectionmark##1{}}
\def\@runningfoot{}
\def\runningfoot#1{\def\@runningfoot{#1}}
\def\@firstfoot{}
\def\firstfoot#1{\def\@firstfoot{#1}}
\def\ps@titlepage{\let\@mkboth\@gobbletwo
\def\@oddhead{}\def\@oddfoot{\hbox{}\hfill
\tiny\@firstfoot}\def\@evenhead{}\def\@evenfoot{\tiny\@firstfoot\hfill\hbox{}}}

\def\today{\ifcase\month\or
 January\or February\or March\or April\or May\or June\or
 July\or August\or September\or October\or November\or December\fi
 \space\number\day, \number\year}
\def\@marrayclassiv{\@addtopreamble{$\displaystyle \@nextchar$}}
\def\@marrayclassz{\ifcase \@lastchclass \@acolampacol \or \@ampacol \or
 \or \or \@addamp \or
 \@acolampacol \or \@firstampfalse \@acol \fi
\edef\@preamble{\@preamble
 \ifcase \@chnum 
 \hfil$\relax\displaystyle\@sharp$\hfil \or $\relax\displaystyle\@sharp$\hfil 
 \or \hfil$\relax\displaystyle\@sharp$\fi}}
\def\marray{\arraycolsep 2.5pt\let\@acol\@arrayacol \let\@classz\@marrayclassz
 \let\@classiv\@marrayclassiv \let\\\@arraycr\def\@halignto{}\@tabarray}
\def\endmarray{\crcr\egroup\egroup}


\ps@myheadings \pagenumbering{arabic} \onecolumn 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fixes to acm trans macro package
% 31-JAN-1996
% John Tang Boyland

% footers produced too small (vpt), when ACM typsets them at 7.5pt (!).
% A better compromise is viipt.
\def\@oddfoot{\hbox{}\hfill\scriptsize\@runningfoot}
\def\@evenfoot{\scriptsize\@runningfoot\hfill\hbox{}}

% first footer was set to (vpt), when ACM typesets them at 6.5pt (!).
% A better compromise is vipt.
\def\firstfootsize{\@setsize\firstfootsize{7pt}\vipt\@vipt}
\def\ps@titlepage{\let\@mkboth\@gobbletwo
\def\@oddhead{\@sigplhead}\def\@oddfoot{\hbox{}\hfill\firstfootsize\@firstfoot}%
\def\@evenhead{\@sigplhead}\def\@evenfoot{\firstfootsize\@firstfoot\hfill\hbox{}}}



\def\@sigplhead{\Large\sf\@paperno
\hfill
$\begin{array}[t]{r}%
   \vspace{-7.5mm}\\
   \vrule height 2mm depth 0pt width 10.5cm%
   \vspace{-5.3mm}
\\ \vrule height 0.1mm depth 0pt width 10.5cm%
\end{array}
$
}


% enumerations and longenums are wrong
% 1. the second line in a paragraph of an enumerations in theorems
%  (or other trivlists) doesn't line up under the first
% 1. the second line of a longenum doesn't properly wrap around
%  back to the left margin.

% the original definition of \@listI doesn't set labelwidth
\def\@listI{\leftmargin\leftmargini
 \labelwidth\leftmargini\advance\labelwidth-\labelsep
 \parsep 0pt plus 1pt
 \topsep 6pt plus 2pt minus 2pt
 \itemsep 2pt plus 1pt minus .5pt}
\let\@listi\@listI
\@listi 

% add set of \labelwidth and \itemindent
\def\longenum{\ifnum \@enumdepth >3 \@toodeep\else
 \advance\@enumdepth \@ne 
 \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
 {\csname label\@enumctr\endcsname}{\usecounter
 {\@enumctr}\labelwidth\z@\leftmargin\z@
 \itemindent\parindent \advance\itemindent\labelsep}\fi}


% provide both spellings of Acknowledgment(s)
\let\acknowledgments\acks
\let\endacknowledgments\endacks

\newcommand{\longpage}{\enlargethispage{\baselineskip}}
\newcommand{\shortpage}{\enlargethispage{-\baselineskip}}




\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


\AtBeginDocument{
   \begin{sloppy}
   \begin{flushbottom}

}

\AtEndDocument{
   \end{flushbottom}
   \end{sloppy}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EXAMPLE.tex
%% sigpl.cls를 사용해서 다음과 같이 논문을 작성후 latex을 돌리면 됩니다.
%% 첫번째 열의 ``%''를 지운 상태가 EXAMPLE.tex 소스가 되겠습니다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % sigpl.cls 를 사용해서 프로그래밍언어논문지의 논문을 작성하는 방법
% %   작성자   : 최웅식 (wschoi@ropas.kaist.ac.kr)
% %   작성일자 : 2002년 10월 11일
% 
% 
% % sigpl.cls의 사용을 선언한다
% %   sigpl.cls를 사용하려면 한글 폰트가 깔려 있어야 하고
% %   hfont.sty가 있어야 함.
% 
% \documentclass{sigpl}
% \usepackage{amsmath}
% \usepackage{amssymb}
% \usepackage{latexsym}
% 
% 
% % title 페이지의 왼쪽 상단에 들어갈 논문 종류및 번호를 선언한다.
% \paperno{논$\cdot$문 18-1-?}
% 
% 
% % 왼쪽 페이지와 오른쪽 페이지에 들어갈 heading을 선언한다.
% %   형식은 왼쪽 페이지는 '프로그래밍언어논문지 제 - 권 - 호 (년도. 월)' 이고
% %   오른쪽은 '한글제목 -- 저자' 이다.
% %   저자가 여러명인 경우 '저자1 $\cdot$ 저자2 ...' 으로 나타낸다.
% \markboth
%    {프로그래밍언어논문지 제 18 권 1 호(2004. 2)}
%    {양상 논리의 이해 -- 신승철}
% 
% 
% % 제목을 선언한다.
% %   지원기관등을 제목에 footnote로 달고 싶은 경우 \thanks{}를 사용한다.
% \title{양상 논리의 이해
% %\thanks{이 연구는 ... 의 지원을 받았음을 밝힙니다.}
% } \etitle{A Tutorial Introduction to Modal Logics}
% 
% % 저자를 선언한다.
% %   형식은 '\Large 저자 \\ \large 소속기관 \\ email' 로 한다.
% %   저자가 여러명인 경우 같은 기관에 속한 저자들은
% %   '저자1 $\cdot$ 저자2 \\ 소속기관 \\ \{id1; id2\}@domain} 로 한다.
% %   다른 기관에 속한 저자들은 다음과 같이 \authorsep 로 구분을 한다.
% %   '\Large 저자1 \\ \large 소속기관1 \\ email1 \\
% %    \authorsep
% %    \Large 저자2 \\ \large 소속기관2 \\ email2'
% \author{
%    \Large 홍길동\\
%    \large 좋은대학교 컴퓨터학부 \\
%           hgd@foo.ac.kr \\
% %   \authorsep
% %   \Large 저자3 \\
% %   \large 소속기관3 \\
% %          email
% }
% 
% 
% % 요약문을 작성한다.
% \begin{abstract}
% \end{abstract}
% 
% \begin{document}
% % 제목 저자 등을 출력한다.
% \maketitle
% 
% % 내용의 구분은 \section 부터 사용을 한다.
% \section{서 론}
% 
% % 그림은 다음과 같이 넣는다
% \begin{figure}[h]
%    \centering \includegraphics[width=8cm, height=5.5cm]{modalcube}
%    \caption{modal cube}
% \end{figure}
% \section{결론}
% 
% % 다음과 같이 필요할 경우 본 문의 끝에 감사의 글을 작성할 수 있다.
% \begin{acks}
% 논리학 공부에 대한 관심과 토론을 통해 격려해 주신 LiComR group의 경북대 정주희교수님과 경성대 변석우 교수님께 감사를 드립니다.
% \end{acks}
% 
% %감사의 글 이후에 다음과 같이 bibliography를 작성한다.
% \bibliographystyle{plain}
% \begin{thebibliography}{7}
% \bibitem{bib1} Blackburn, P., M. de Rijke, and Y.Venema, Modal
% logic, Cambridge University Press, 2001 
% \bibitem{bib2} Chellas, B., Modal Logic: An Introduction, Cambridge
% University Press, 1980 
% \bibitem{bib3} Davis, M., Universal computer: the road from Frege to
% G$\ddot{o}$del, Norton, 2000 
% \bibitem{bib4} van Dalen, D., Logic and Structure, Springer, third
% edition, 1994 
% \bibitem{bib5} Garson, J., "Modal Logic", The Stanford Encyclopedia
% of Philosophy, Edward N. Zalta (ed.), URL =
% http://plato.stanford.edu/archives/win2003/entries/logic-modal/ 
% \bibitem{bib6} Ryan, M. and M. Sadler, "Valuation systems and
% consequence relations", Handbook of logic in computer science,
% S. Abramsky, D.M. Gabbay, and T.S.E. Maibaum (ed.), Oxford
% University Press, 1992 
% \bibitem{bib7} Sahlqvist, H., "Completeness and Correspondence in
% First and Second Order Semantics for Modal Logic," in Kanger,
% S. (ed.) Proceedings of the Third Scandanavian Logic Symposium,
% Amsterdam: North Holland. 110-143, 1975 
% 
% \end{thebibliography}
% 
% 
% %필요할 경우 다음과 같이 부록을 작성할 수 있다.
% %\appendix
% %\section{부록1}
% %부록1 내용
% %
% %\section{부록2}
% %부록2 내용
% 
% %마지막으로 각각의 저자의 사진 및 vitae를 다음과 같이 작성한다.
% %  사진은 가로:세로가 2.5:3인 (세로가 3cm로 scale되서 표시됨) eps화일 형식이다.
% %  형식은
% %    \vitae{이 름}      % 각자를 뛰어씀
% %          {picture}  % 확장자는 쓰지않음
% %          {양력}      % 각각을 \\ 로 구분함
% %          {관심분야}  % 각각을 , 로 구분함
% \vitae{홍길동}
%       {photo}
%       {1983-1987 좋은대 학사\\
%        1987-1993 좋은대 박사
%        }
%       {프로그래밍 언어, 프로그램 분석 및 검증, 소프트웨어 보안, 수리 논리}
% 
% %\vitae{저 자 2}
% %      {sample}
% %      {19xx-19xx 약력1\\
% %       19xx-19xx 약력2}
% %      {관심분야1, 관심분야2}
% 
% \end{document}
% 
