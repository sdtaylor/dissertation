%%
%% This is file `ufthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ufthesis.dtx  (with options: `class')
%%
%% Copyright Ron Smith 1998-2002
%% email ufthesis@ufthesis.com
%% URL: www.ufthesis.ece.ufl.edu
%%
%% This program may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%%
%%Modified February 9, 2007 to reflect Editorial Office format changes
%%Eliminated 2 in margin and page numbering shifts, implemented roman page numbering throughout the document
%%
%%Modified March 20, 2007 to reflect the copyright symbol and the change from major department to major in the abstract
%%
%%
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
%% This program consists of the files listed in manifest.txt
%%
\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{ufthesis}
   [2002/09/20 v2.0c UF Thesis Class (Ron Smith)]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Defining Class options and loading required   %
%%     packages                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
     [1996/08/02 v1.0m Standard LaTeX ifthen package (DPC)]
%% Declaring Options \& Initializing Flags
\newcommand{\RS@ptsize}{}
\newcounter{RS@ptcnt}
\DeclareOption{10pt}{\renewcommand{\RS@ptsize}{10pt}%
\setcounter{RS@ptcnt}{10}}%
\DeclareOption{11pt}{\renewcommand{\RS@ptsize}{11pt}%
\setcounter{RS@ptcnt}{11}}%
\DeclareOption{12pt}{\renewcommand{\RS@ptsize}{12pt}%
\setcounter{RS@ptcnt}{12}}%
\newboolean{RS@TOCHang}%
\setboolean{RS@TOCHang}{true}%
\DeclareOption{NoTocHang}{\setboolean{RS@TOCHang}{false}}
\newboolean{RS@BfSet}%
\setboolean{RS@BfSet}{false}%
\DeclareOption{Bold}{\setboolean{RS@BfSet}{true}}
\newboolean{RS@CPage}%
\setboolean{RS@CPage}{false}%
\DeclareOption{CPage}{\setboolean{RS@CPage}{true}}
\newboolean{RS@Draft}%
\setboolean{RS@Draft}{false}%
\DeclareOption{Draft}{\setboolean{RS@Draft}{true}}%
\newboolean{RS@Justify}%
\setboolean{RS@Justify}{false}%
\DeclareOption{Justify}{\setboolean{RS@Justify}{true}}%
\newboolean{RS@nopenalties}%
\setboolean{RS@nopenalties}{true}%
\DeclareOption{nopenalties}{\setboolean{RS@nopenalties}{false}}%
\DeclareOption*{\OptionNotUsed}
%% Executing Options \& Loading Required Packages
\ExecuteOptions{12pt}
\ProcessOptions\relax
\LoadClass[\RS@ptsize]{report}[2000/05/19 v1.4b Standard LaTeX document class]
\typeout{ }
\typeout{*****************************************}
\typeout{* Updating commands for Thesis Template *}
\typeout{*****************************************}
\RequirePackage[nodisplayskipstretch]{setspace}[2000/12/01 6.7 Contributed and Supported LaTeX2e package]%
%% Removing 3 minor commands left-over by the setspace 2000/12/01 6.7 package
\providecommand{\filename}{filenametext}%
\providecommand{\filedate}{filedatetext}%
\providecommand{\fileversion}{filevertext}%
\renewcommand{\filename}{}%
\renewcommand{\filedate}{}%
\renewcommand{\fileversion}{}%
\RequirePackage[normalem]{ulem}%
\RequirePackage{sectsty}[1999/04/12 v2.0.1 Commands to change all sectional heading styles]%
\ifthenelse{\boolean{RS@Justify}}{}{%
\RequirePackage{ragged2e}[1999/06/08 v1.02 Ragged2e Package (MS)]%
\setlength{\RaggedRightRightskip}{0pt plus 4em}%
\RaggedRight}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Font Specification                          %l
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\renewcommand{\sfdefault}{phv} %Defines Helvetica - uncomment these 2 lines to change to Helvetica
\renewcommand{\familydefault}{\sfdefault}
%\renewcommand{\sfdefault}{pag}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Page layout for UF Editorial Office           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\normalfont\small\normalsize% Make sure font size is set to normalsize
\newcounter{RS@TmpCnt}% Used to count the number of lines per page
\setcounter{RS@TmpCnt}{1}% and as a counter for handling TOC section spacing.
\newlength{\RS@TOChdent}% Used to define hanging indents.
\setlength{\RS@TOChdent}{1.0em}%
\newlength{\RS@MyHeader}% Used to set space between top of page and
\setlength{\RS@MyHeader}{0.45in}% page numbers
\newlength{\RS@NumPoints}%
\newlength{\RS@StartofHeader}%
\newlength{\RS@EndofFooter}%
\newlength{\RS@TempLength}%
%%    Setting the margin reference point
\setlength{\hoffset}{0pt}%
\setlength{\voffset}{0pt}%
%%    Setting the height of the text page
\setlength{\textheight}{\topskip}%
\addtolength{\textheight}{44\baselineskip}%
\ifthenelse{\value{RS@ptcnt}=11}{%
\addtolength{\textheight}{3\baselineskip}}{}%
\ifthenelse{\value{RS@ptcnt}=10}{%
\addtolength{\textheight}{9\baselineskip}}{}%
%%    Setting the width of the text page
\setlength{\oddsidemargin}{0in}%
\@settopoint{\oddsidemargin}%
\setlength{\evensidemargin}{\oddsidemargin}%
\setlength{\textwidth}{\paperwidth}%
\addtolength{\textwidth}{-2in}%
\addtolength{\textwidth}{-\oddsidemargin}%
\@settopoint{\textwidth}%
\setlength{\marginparpush}{8pt}%
\setlength{\marginparwidth}{\paperwidth}%
\addtolength{\marginparwidth}{-0in}%
\addtolength{\marginparwidth}{-\hoffset}%
\addtolength{\marginparwidth}{-\evensidemargin}%
\addtolength{\marginparwidth}{-\textwidth}%
\addtolength{\marginparwidth}{-2\marginparpush}%
\@settopoint{\marginparwidth}%
\settowidth{\parindent}{\ }%
\setlength{\parindent}{6\parindent}%
\ifthenelse{\boolean{RS@Justify}}{}{%
\setlength{\RaggedRightParindent}{\parindent}}%
%%    Positioning the Header
\ifthenelse{\value{RS@ptcnt} = 10}{\setlength{\headheight}{10.0pt}}{}%
\ifthenelse{\value{RS@ptcnt} = 11}{\setlength{\headheight}{11.0pt}}{}%
\ifthenelse{\value{RS@ptcnt} = 12}{\setlength{\headheight}{12.0pt}}{}%
\@settopoint{\RS@MyHeader}%
\setlength{\topmargin}{\RS@MyHeader}%
\addtolength{\topmargin}{-1.05in}%
\@settopoint{\topmargin}%
\setlength{\headsep}{-\topmargin}%
\addtolength{\headsep}{-\headheight}%
%%    Positioning the Footer
\setlength{\RS@StartofHeader}{\voffset}%
\addtolength{\RS@StartofHeader}{1.05in}%
\addtolength{\RS@StartofHeader}{\topmargin}%
\setlength{\footskip}{0pt}%
\setlength{\RS@EndofFooter}{100pt}%
\whiledo{\lengthtest{\RS@EndofFooter > \RS@StartofHeader}}%
    {\addtolength{\footskip}{0.5pt}%
    \setlength{\RS@EndofFooter}{-\voffset}%
    \addtolength{\RS@EndofFooter}{-1in}%
    \addtolength{\RS@EndofFooter}{-\topmargin}%
    \addtolength{\RS@EndofFooter}{-\headheight}%
    \addtolength{\RS@EndofFooter}{-\headsep}%
    \addtolength{\RS@EndofFooter}{-\textheight}%
    \addtolength{\RS@EndofFooter}{-\footskip}%
    \addtolength{\RS@EndofFooter}{\paperheight}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Page-breaking penalties and page number  %
%%          formatting commands                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\boolean{RS@nopenalties}}{%
\clubpenalty=10000    % Do not allow orphans
\@clubpenalty \clubpenalty
\widowpenalty=10000   % Do not allow widows
}{}%
\brokenpenalty=10000  % Do not allow hyphenation across
                      % page boundaries.

\pagestyle{plain}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Line-spacing commands                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{SetDSpace}%
\setboolean{SetDSpace}{true}%
\newcommand{\BaseDiff}{0}
\newcommand{\GoSingle}{\renewcommand{\baselinestretch}{1}%
\normalfont\tiny\normalsize}%
\ifthenelse{\value{RS@ptcnt} = 10}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.667}%
\renewcommand{\BaseDiff}{0.667}\normalfont\tiny\normalsize}}{}%
\ifthenelse{\value{RS@ptcnt} = 11}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.618}%
\renewcommand{\BaseDiff}{0.618}\normalfont\tiny\normalsize}}{}%
\ifthenelse{\value{RS@ptcnt} = 12}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.655}%
\renewcommand{\BaseDiff}{0.655}\normalfont\tiny\normalsize}}{}%
\GoDouble\GoSingle%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Formatting Chapter Headings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3}%
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\@chapapp}{\chaptername}
\let\@afterindentfalse\@afterindenttrue%
\@afterindenttrue%
\newenvironment{RS@Cent}{\centering}{\par}%
\renewcommand{\chapter}{%
    \clearpage%
    \thispagestyle{plain}%
    \GoSingle%
    \global\@topnum\z@%  Keep floats from top of page
    \@afterindentfalse%
    \secdef\@chapter\@schapter}%
\renewcommand{\@chapter}[2][?]{%
    \ifthenelse{\value{secnumdepth} > -1}{%
      \refstepcounter{chapter}%
      \typeout{***************************}%
      \typeout{\@chapapp\space\thechapter.}%
      \typeout{***************************}%
      \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}{#1}}%\uppercase
    }{%
      \addcontentsline{toc}{chapter}{\uppercase{#1} }}%
    \setcounter{footnote}{0}%
    \@makechapterhead{\uppercase{#2}}}%
\renewcommand{\@makechapterhead}[1]{%
    \begin{RS@Cent}%
    %\BigMargin%
    \ifthenelse{\value{secnumdepth} > -1}{%
      \@chapapp\space\thechapter\\}{}%
    #1%
    \end{RS@Cent}%
    \@afterheading%
    \ifthenelse{\boolean{SetDSpace}}{\GoDouble}{}%
    }%
\renewcommand{\@schapter}[2][?]{%
    \@makeschapterhead{#2}}%
\renewcommand{\@makeschapterhead}[1]{%
    \begin{RS@Cent}%
    %\BigMargin%
    #1\end{RS@Cent}%
    \@afterheading%
    \ifthenelse{\boolean{SetDSpace}}{\GoDouble}%
    {\addvspace{\BaseDiff\baselineskip}}%
    }%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Formattin Section Headings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\boolean{RS@BfSet}}%
{\sectionfont{\normalsize\normalfont\singlespace\centering\bfseries}%
 \subsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \subsubsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \paragraphfont{\normalsize\normalfont\bfseries}%
 \renewcommand{\paragraph}[1]{\@paragraph{#1.}}%
 \newcommand{\@paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0.1ex}%
    {-1.0em}%
    {\SS@parafont}}%
 \subparagraphfont{\normalsize\normalfont\bfseries}}%
{\sectionfont{\normalsize\normalfont\singlespace\centering\bf}%
 \subsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \subsubsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \paragraphfont{\normalsize\normalfont\bfseries}%
 \renewcommand{\paragraph}[1]{\@paragraph{#1}.}%
 \newcommand{\@paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0.1ex}%
    {0pt}%
    {\SS@parafont}}%
 \subparagraphfont{\normalsize\normalfont\bfseries}}%
\renewcommand{\section}{%
    \@startsection{section}{1}{\z@}%
    {-0\baselineskip}%
    {0.1ex}%
    {\SS@sectfont}}
\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{\z@}%
    {-0\baselineskip}%
    {0.1ex}%
    {\SS@subsectfont}}
\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}{3}{0em}%
    {-0\baselineskip}%
    {0.1ex}%
    {\SS@subsubsectfont}}
\renewcommand{\subparagraph}{%
    \@startsection{subparagraph}{5}{\z@}%
    {0.1ex}%
    {-1.0em}%
    {\SS@subparafont}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Formatting Generated Lists -- TOC, LOF and LOT %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@dotsep}{4.5}%
\renewcommand{\@pnumwidth}{1.55em}%
\ifthenelse{\boolean{RS@Justify}}{%
\renewcommand{\@tocrmarg}{2.55em}}{%
\renewcommand{\@tocrmarg}{2.55em plus 1.45em}}%
\renewcommand*{\l@chapter}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \@dottedtocline{0}{\UFdent}{\RS@chapnumwidth}{#1}{#2}%
  }{}}%
\newcommand*{\l@extrachapter}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \@dottedtocline{0}{0pt}{0pt}{#1}{#2}%
  }{}}%
\newcommand*{\l@extraentry}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \noindent #1\par%
  }{}}%
\renewcommand*{\l@section}{%
  \ifthenelse{\value{RS@TmpCnt} = 0}{%
     \setcounter{RS@TmpCnt}{1}%
     \vspace{\BaseDiff\baselineskip}}{}%
  \@dottedtocline{1}{\RS@secindent}{\RS@secnumwidth}}%
\renewcommand*{\l@subsection}{\@dottedtocline{2}{\RS@subsecindent}%
              {\RS@subsecnumwidth}}%
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{7.7em}{4.1em}}%
\renewcommand*{\l@paragraph}{\@dottedtocline{4}{10em}{5em}}%
\renewcommand*{\l@subparagraph}{\@dottedtocline{5}{12em}{6em}}%
\renewcommand*{\l@figure}{\vspace{\BaseDiff\baselineskip}%
              \@dottedtocline{-5}{0pt}{\RS@fignumwidth}}%
\renewcommand*{\l@table}{\vspace{\BaseDiff\baselineskip}%
              \@dottedtocline{-5}{0pt}{\RS@tabnumwidth}}%
\newcommand{\leaddots}{%
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill}%
\renewcommand{\@dottedtocline}[5]{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
%%   Handling those sections that are included in TOC, but have
%%   no section numbering. Also including hanging indent when the
%%   NoTocHang option was not used. Only the following 4 lines added.
     \ifthenelse{#1 > \value{secnumdepth}}{%
     \setlength{\@tempdima}{0pt}}{}%
    % \ifthenelse{#1 > \value{secnumdepth} \or \boolean{RS@TOCHang}}{%
    % \addtolength{\leftskip}{\RS@TOChdent}}{}%
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaddots
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Indenting Generated Lists -- TOC, LOF and LOT  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\UFdent}%
\setlength{\UFdent}{0pt}%
\newlength{\RS@chapnumwidth}%
\setlength{\RS@chapnumwidth}{2.3em}%
\newlength{\RS@secindent}%
\setlength{\RS@secindent}{0pt}%
\AtBeginDocument{%
\addtolength{\RS@secindent}{\UFdent}%
%% Verifying that the chapters are numbered.
\ifthenelse{\value{secnumdepth} > -1}{%
\addtolength{\RS@secindent}{\RS@chapnumwidth}}{}%
}
\newlength{\RS@secnumwidth}%
\setlength{\RS@secnumwidth}{2.3em}%
\newlength{\RS@subsecindent}%
\setlength{\RS@subsecindent}{0pt}%
\AtBeginDocument{%
\addtolength{\RS@subsecindent}{\RS@secindent}%
%% Verifying that the sections are numbered.
\ifthenelse{\value{secnumdepth} > 0}{%
\addtolength{\RS@subsecindent}{\RS@secnumwidth}}{}%
}
\newlength{\RS@subsecnumwidth}%
\setlength{\RS@subsecnumwidth}{3em}%
\newlength{\RS@figindent}%
\settowidth{\RS@figindent}{Fig}%
\newlength{\RS@fignumwidth}%
\setlength{\RS@fignumwidth}{2.3em}%
\newlength{\RS@tabindent}%
\settowidth{\RS@tabindent}{Ta}%
\newlength{\RS@tabnumwidth}%
\setlength{\RS@tabnumwidth}{2.3em}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Table of Contents                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{3}%
\renewcommand{\contentsname}{TABLE OF CONTENTS}%
\newenvironment{simpleenv}[4]{\clearpage}{\clearpage}%
\renewcommand{\tableofcontents}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\contentsname}%
      \vspace*{-5pt}%
      \noindent\phantom{Table}\hfill\uline{page}\par%
      \@starttoc{toc}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of Tables                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\listtablename}{LIST OF TABLES}%
\renewcommand{\listoftables}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\listtablename}%
      \vspace*{-5pt}%
      \addcontentsline{toc}{extrachapter}{\listtablename}%
      \noindent\uline{Table}\hfill\uline{page}\par%
      \@starttoc{lot}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of Figures                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\listfigurename}{LIST OF FIGURES}%
\renewcommand{\listoffigures}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\listfigurename}%
      \vspace*{-5pt}%
      \addcontentsline{toc}{extrachapter}{\listfigurename}%
      \noindent\uline{Figure}\hfill\uline{page}\par%
      \@starttoc{lof}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
\renewcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
 %\renewcommand{\thechapter}{\c@chapter}}% Add this line for one appendix
  \renewcommand{\thechapter}{\@Alph\c@chapter}}% Add this line for multiple appendices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of References                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{REFERENCES}%
\renewenvironment{thebibliography}[1]%
     {\clearpage\pagestyle{plain}%
      \markboth{}{}%
      \setboolean{SetDSpace}{false}%
      \chapter*{\bibname}%
      \addcontentsline{toc}{extrachapter}{\bibname}%
      \setboolean{SetDSpace}{true}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \setlength{\parsep}{\BaseDiff\baselineskip}%
            \setlength{\itemsep}{0ex}%
            \setlength{\leftmargin}{\labelwidth}%
            \addtolength{\leftmargin}{\labelsep}%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty10000
      \@clubpenalty \clubpenalty
      \widowpenalty10000%
      \sfcode`\.=1000\relax}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\clearpage}
%% Special Pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Title Page                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \begin{RS@Cent}%
    %\BigMargin%
    \Title%
    \vfill%
    By \\*[\BaseDiff\baselineskip]%
    \MakeUppercase{\FullName}%
    \vfill%
    A \MakeUppercase{\ThesisType} PRESENTED TO THE GRADUATE SCHOOL \\%
    OF THE UNIVERSITY OF FLORIDA IN PARTIAL FULFILLMENT \\%
    OF THE REQUIREMENTS FOR THE DEGREE OF \\%
    \MakeUppercase{\DegreeType} \\*[\BaseDiff\baselineskip]%
    UNIVERSITY OF FLORIDA \\*[\BaseDiff\baselineskip]%
    \GradYear%
    \end{RS@Cent}%
    \vspace*{0in}
    \setboolean{SetDSpace}{true}%
    \clearpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Copyright Page                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makecopyright}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \vspace*{\fill}%
    \begin{RS@Cent}%
    \copyright\ \GradYear \ \FullName%
    \end{RS@Cent}%
    \vfill%
    \setboolean{SetDSpace}{true}%
    \clearpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Dedication                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\dedication}[1]{%
    \begin{simpleenv}{#1}{}{}{}%
      \pagestyle{empty}%
      \GoSingle%
      \vspace*{\fill}%
      \vspace{-12 cm}%%Adjust this length depending upon the length of your dedication
      %\BigMargin\par%
      \GoDouble%
      #1%
    \vfill%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Acknowledgments                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acknowledgname}{ACKNOWLEDGMENTS}%
\newcommand{\acknowledge}[1]{%
    \setboolean{SetDSpace}{true}%
    \begin{simpleenv}{#1}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\acknowledgname}%
      \addcontentsline{toc}{extrachapter}{\acknowledgname}%
      #1%
    \end{simpleenv}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Abstract                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\abstractname}{ABSTRACT}%
\renewenvironment{abstract}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \ifthenelse{\boolean{RS@Draft}}{\pagestyle{plain}}{\pagestyle{plain}}%
    \GoSingle%
    \addcontentsline{toc}{extrachapter}{\abstractname}%
    \begin{RS@Cent}%
    %\BigMargin%
    Abstract of \ThesisType\ Presented to the Graduate School \\%
    of the University of Florida in Partial Fulfillment of the \\%
    Requirements for the Degree of \DegreeType \\*[\BaseDiff\baselineskip]%
    \Title \\*[\BaseDiff\baselineskip]%
    By \\*[\BaseDiff\baselineskip]%
    \FullName \\*[\BaseDiff\baselineskip]%
    \GradMonth\ \GradYear \\*[\BaseDiff\baselineskip]%
    \end{RS@Cent}%
    {\raggedright Chair: \Chair \\%
    %\raggedright Cochair: \Cochair \\%uncomment this line if you have a cochair
    Major: \Department} %
    \setboolean{SetDSpace}{true}%
    \par%
    \GoDouble}%
    {\clearpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Biographical Sketch                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\biographyname}{BIOGRAPHICAL SKETCH}%
\newcommand{\biography}[1]{%
    \setboolean{SetDSpace}{true}%
    \begin{simpleenv}{#1}{}{}{}%
      \ifthenelse{\boolean{RS@Draft}}{\pagestyle{plain}%
        \let\ps@plain\ps@empty}{\pagestyle{plain}}%
      \markboth{}{}%
      \chapter*{\biographyname}%
      \addcontentsline{toc}{extrachapter}{\biographyname}%
      #1%
    \end{simpleenv}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Signature Page Stuff                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\CertPar}[2][0.25in]{\par%
    {\setlength{\parskip}{#1}I certify that I have read this study and that %
    in my opinion it conforms to acceptable standards of scholarly %
    presentation and is fully adequate, in scope and quality, as a %
    \MakeLowercase{\ThesisType} for the degree of %
    {\DegreeType}.\par%
    {\setlength{\leftskip}{3in}%
     \setlength{\parindent}{0pt}%
     \setlength{\hangindent}{1em}%
     \hangafter=3%
    \hrulefill \newline%
    #2\par}\vspace{-\parskip}}%
   \par\vspace{\parskip}
}
\newcommand{\SubmitPar}[3][0.25in]{\par%
    {\setlength{\parskip}{#1} This \MakeLowercase{\ThesisType} was %
    submitted to the Graduate Faculty of the College of Engineering %
    and to the Graduate School and was accepted as partial fulfillment %
    of the requirements for the degree of {\DegreeType}.\par%
    {\setlength{\leftskip}{3in}%
     \setlength{\parindent}{0pt}%
     \setlength{\hangindent}{1em}%
     \hangafter=3%
    \hspace*{-\leftskip}\makebox[3in][l]{\GradMonth\ \GradYear}%
    \hrulefill \newline%
    #2\par\hrulefill \newline #3\par}\vspace{-\parskip}}%
   \par\vspace{\parskip}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Getting personal information and         %
%%          defining other miscellaneous commands  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\SetTitle}[1]{\renewcommand*{\Title}{\uppercase{#1}}}%
\newcommand*{\Title}{No Title Given}%
\@onlypreamble{\SetTitle}%
\newcommand*{\SetFullName}[1]{\renewcommand*{\FullName}{#1}}%
\newcommand*{\FullName}{Please Define Your Name}%
\@onlypreamble{\SetFullName}%
\newcommand*{\SetThesisType}[1]{\renewcommand*{\ThesisType}{#1}}%
\newcommand*{\ThesisType}{THESIS OR DISSERTATION}%
\@onlypreamble{\SetThesisType}%
\newcommand*{\SetDegreeType}[1]{\renewcommand*{\DegreeType}{#1}}%
\newcommand*{\DegreeType}{UNDEFINED DEGREE}%
\@onlypreamble{\SetDegreeType}%
\newcommand*{\SetGradMonth}[1]{\renewcommand*{\GradMonth}{#1}}%
\newcommand*{\GradMonth}{UNDEFINED MONTH}%
\@onlypreamble{\SetGradMonth}%
\newcommand*{\SetGradYear}[1]{\renewcommand*{\GradYear}{#1}}%
\newcommand*{\GradYear}{UNDEFINED YEAR}%
\@onlypreamble{\SetGradYear}%
\newcommand*{\SetDepartment}[1]{\renewcommand*{\Department}{#1}}%
\newcommand*{\Department}{UNDEFINED DEPARTMENT}%
\@onlypreamble{\SetDepartment}%
\newcommand*{\SetChair}[1]{\renewcommand*{\Chair}{#1}}%
\newcommand*{\Chair}{UNDEFINED Chair}%
\@onlypreamble{\SetChair}%
%\newcommand*{\SetCochair}[1]{\renewcommand*{\Cochair}{#1}}%uncomment these three lines if you have a Cochair
%\newcommand*{\Cochair}{UNDEFINED Cochair}%Line 2
%\@onlypreamble{\SetCochair}%Line 3
%%    Adding personal notes to your text
\newboolean{ShowNotes}% Used to display private notes.
\setboolean{ShowNotes}{false}%
\newcommand{\NOTE}[1]{%
    \ifthenelse{\boolean{ShowNotes}}{%
    \begin{spacing}{1}%
    \par\noindent\marginpar{NOTE}%
    \parbox[t]{\textwidth}{\hrulefill\\%
    #1\\*[-0.5\baselineskip]%
    \hspace*{0.1in}\hspace{-0.1in}\hrulefill\\}%
    \vspace{0.25in}\end{spacing}}{}%
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Footnotes                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\footnotesep}{0.7\baselineskip}%
\addtolength{\footnotesep}{\BaseDiff\baselineskip}%
\setlength{\skip\footins}{2.5\baselineskip}%
\renewcommand{\footnoterule}{%
   \kern -3\p@
   \kern +8pt
   \hrule \@width 2in
   \kern -8pt
   \kern +2.6\p@}
\renewcommand{\@makefnmark}{%
  \hbox{\@textsuperscript{\normalfont\@thefnmark}}~}%
\renewcommand\@makefntext[1]{%
    \normalsize%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Figures and Tables and Equations               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\theequation}{%
  {\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@equation}}%
\renewcommand{\thefigure}{%
  {\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@figure}}%
\renewcommand{\thetable}{%
  {\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@table}}%
\newlength{\abovefigcaptskip}%
\newlength{\belowfigcaptskip}%
\newlength{\abovetabcaptskip}%
\newlength{\belowtabcaptskip}%
\setlength{\abovefigcaptskip}{\abovecaptionskip}%
\setlength{\belowfigcaptskip}{.5\belowcaptionskip}%
\setlength{\abovetabcaptskip}{\belowcaptionskip}%
\setlength{\belowtabcaptskip}{\abovecaptionskip}%
\renewenvironment{table}
     {\setlength{\abovecaptionskip}{\abovetabcaptskip}%
      \addtolength{\belowtabcaptskip}{-.9\belowtabcaptskip}
      \setlength{\belowcaptionskip}{\belowtabcaptskip}%
      \@float{table}}
     {\end@float}
\renewenvironment{figure}
     {\setlength{\abovecaptionskip}{\abovefigcaptskip}%
      \addtolength{\belowfigcaptskip}{-.9\belowfigcaptskip}
      \setlength{\belowcaptionskip}{\belowfigcaptskip}%
      \@float{figure}}
     {\end@float}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UF Thesis Multiple Index Generation            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printindex}[4][\jobname]{%
    \IfFileExists{#1.ind}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{#1}{#2}{#3}{#4}%
      \pagestyle{plain} %
      \addcontentsline{toc}{extrachapter}{#2}%
      \chapter*{#3}{\GoDouble{#4}\par\GoSingle}%
      \input{#1.ind}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}
    {\typeout{No file #1.ind found.}}}%
\newcommand{\see}[2]{\emph{see} #1}%
\renewcommand{\makeindex}[1][\jobname]{\begingroup
  \makeatletter
  \if@filesw \expandafter\newwrite\csname #1@idxfile\endcsname
  \expandafter\immediate\openout \csname #1@idxfile\endcsname #1.idx\relax
  \typeout{Writing index file #1.idx }\fi \endgroup}
\@onlypreamble{\makeindex}%
\renewcommand{\index}[2][\jobname]{\@bsphack\begingroup
               \def\protect##1{\string##1\space}\@sanitize
               \@wrindex{#1}{#2}}
\renewcommand{\@wrindex}[2]{\let\thepage\relax
   \xdef\@gtempa{\@ifundefined{#1@idxfile}{}{\expandafter
      \write\csname #1@idxfile\endcsname{\string
      \indexentry{#2|RSpset}{\thepage}}}}\endgroup\@gtempa
   \if@nobreak \ifvmode\nobreak\fi\fi\@esphack}
\newcommand{\indxspace}{\par\vspace{\BaseDiff\baselineskip}}
\newcommand{\IndexSet}{%
\renewcommand{\@idxitem}{\par\setlength{\leftskip}{0pt}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\subitem}{\par\setlength{\leftskip}{0.25in}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\subsubitem}{\par\setlength{\leftskip}{0.5in}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\indexspace}{}
\renewcommand{\indxspace}{\par\vspace{\BaseDiff\baselineskip}}
\renewenvironment{theindex}{%
                \setlength{\parindent}{\z@}%
                \parskip\z@ \@plus .3\p@\relax
                \setlength{\rightskip}{\@tocrmarg}%
                \setlength{\parfillskip}{-\rightskip}%
                \let\item\@idxitem}
} %% End of the IndexSet definition
\newcommand{\RSpnum}[1]{\makebox[\@pnumwidth][r]{#1}}
\newcommand{\RSnopnum}[1]{\makebox[\@pnumwidth][r]{}}
\newcommand{\RSpset}[1]{\RSpnum{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Fixing the enumerate and itemize environments  %
%%  by updating the general list parameters.       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\@listi}{\leftmargin\leftmargini
      \setlength{\topsep}{0in}%
      \setlength{\partopsep}{0pt}%
      \setlength{\parsep}{0pt}%
      \setlength{\itemsep}{0pt}}
\let\@listI\@listi
\@listi
\renewcommand*{\@listii}{\leftmargin\leftmarginii
      \labelwidth\leftmarginii
      \advance\labelwidth-\labelsep
      \setlength{\topsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\itemsep}{\parsep}}
\renewcommand*{\@listiii}{\leftmargin\leftmarginiii
      \labelwidth\leftmarginiii
      \advance\labelwidth-\labelsep
      \setlength{\topsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\partopsep}{0in}%
      \setlength{\itemsep}{\parsep}}
\ifthenelse{\boolean{RS@CPage}}{%
  \renewcommand{\ps@myheadings}{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\hfil\thepage\hfil}%
      \def\@oddhead{\hfil\thepage\hfil}%
      \let\@mkboth\@gobbletwo
      \let\chaptermark\@gobble
      \let\sectionmark\@gobble
      }
  }{}
%% Disabling some unused commands
\renewcommand{\author}{}
\renewcommand{\date}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UF Thesis Local Configuration                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\InputIfFileExists{ufthesis.cfg}{%
\typeout{***************************************}
\typeout{* Local config file ufthesis.cfg used *}
\typeout{***************************************}}{}
\typeout{ }
\typeout{*****************************************}
\typeout{*\space \space Finished with Thesis Template}
\typeout{*****************************************}
\typeout{ }
\AtBeginDocument{%
\typeout{**************************************}
\typeout{* Executing Begin Document Statement *}
\typeout{**************************************}
}
\endinput
%%
%% End of file `ufthesis.cls'.
