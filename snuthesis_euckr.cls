%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%
%% ko: �ѱ� ������ �ۼ��Ѵ�.
%%
%% indentfirst: indentfirst ��Ű���� ����Ѵ�.
%% noindentfirst: indentfirst ��Ű���� ������� �ʴ´�.
%% �̰��� �� section�� ù �ܶ����� �鿩���⸦ �� �� �� �� �����ϴ� �ɼ��̴�.
%% �ѱ� ���������� ����ϴ� ���� �⺻�̰�,
%% ���� ���������� ������� �ʴ� ���� �⺻�̴�.
%%
%% easy: ������ ������ ���� �ɼ��̴�.
%%
%% draft, final, leqno, fleqn, openright, openay,
%% openbib, oneside, twoside: report class�� �����Ѵ�.
%% �� �ɼǵ��� �ǹ̴� LaTeX �Թ����� �����Ǿ� �ִ�.
%%
%% nonfrench, finemath, strictcharcheck: kotex package�� �����Ѵ�.
%% �� �ɼǵ��� �ǹ̴� ko.TeX ��� �������� �����Ǿ� �ִ�.
%%
%% under: �л�
%% ms, master: ����
%% phd, doctor: �ڻ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������
%% �ݵ�� �ʿ��� Ŭ������ ��Ű������ ������ ����.
%%
%% * report class
%% ��� Ŭ�����̴�.
%% * kotex package
%% ���� ������ �ᵵ ���� ����� �־�� �ϹǷ� �� ��Ű���� �ʿ��ϴ�.
%%
%% �� �ܿ� �ɼǿ� ���� �ٸ� ��Ű���� �ʿ��� �� �ִ�.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��Ÿ
%% 
%% @snu@ko�� ���� @�� �ִ� ���� ���ɾ ���� ���ɾ�� ����ϴ� ���̴�.
%% �׸��� @snu�� ���� ���� �ٸ� ��Ű���� �浹�� ���ɼ��� �����ϱ� ���ؼ��̴�.
%%
%% ��Ű���� ������ ���� �ּ��� �о�� �����ϴ� ���� ����.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{snueethesis_euckr}

\newif\if@snu@under
\newif\if@snu@ms
\newif\if@snu@phd

\newif\if@snu@ko %% true�̸� ���� ����.
\@snu@kofalse %% �⺻���� ���� ����.

\newif\if@snu@indentfirst %% true�̸� section�� ù �ܶ��� �鿩����.
\@snu@indentfirstfalse
\newif\if@snu@indentoptionset
\@snu@indentoptionsetfalse

\newif\if@snu@easy %% easy �ɼ�. �̰����� ��� ����.
\@snu@easyfalse %% �⺻���� false.

\DeclareOption{under}{\@snu@undertrue \@snu@msfalse \@snu@phdfalse}
\DeclareOption{ms}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{master}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{phd}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}
\DeclareOption{doctor}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}

\DeclareOption{ko}{\@snu@kotrue}
\DeclareOption{indentfirst}{\@snu@indentfirsttrue \@snu@indentoptionsettrue}
\DeclareOption{noindentfirst}{\@snu@indentfirstfalse \@snu@indentoptionsettrue}
\DeclareOption{easy}{\@snu@easytrue}

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{final}{\PassOptionsToClass{final}{report}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{report}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}
%% report class�� ������ �ɼ��� �ǵ������� �������� ����.

\DeclareOption{nonfrench}{\PassOptionsToClass{nonfrench}{kotex}}
\DeclareOption{finemath}{\PassOptionsToClass{finemath}{kotex}}
\DeclareOption{strictcharcheck}{\PassOptionsToClass{strictcharcheck}{kotex}}
%% hangul, nojosa, hanja �ɼ��� �ǵ������� �������� ����.

\ExecuteOptions{phd}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% "\if@snu@under"�� �кθ� �ǹ���. 
%% "\if@snu@ko"�� �ѱ� ������ �ǹ���. 

\newcommand{\@snu@koen}{%
	\if@snu@ko \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@koen{�ѱ�}{English}

\newcommand{\@snu@msphd}{%
	\if@snu@ms \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@msphd{M.S.}{Ph.D.}

%% ProcessOptions �ڿ� ���;� ���������� �����Ѵ�.
\if@snu@under % �к�
	\if@snu@ko
		\PassOptionsToClass{a4paper,10pt}{report}
	\else
		\PassOptionsToClass{a4paper,11pt}{report}
	\fi
\else % ���п�
	%% ���� ���� �ɼ�. b5paper -> B5, a4paper -> A4 
	\PassOptionsToClass{b5paper,11pt}{report}
\fi
\LoadClass[onecolumn]{report}

\if@snu@ko
	\RequirePackage[euc]{kotex}
	\renewcommand{\abstractname}{���} %
	\renewcommand{\appendixname}{�η�} %
	\renewcommand{\bibname}{��������} % (report,book)
	\renewcommand{\contentsname}{����} %
	\renewcommand{\figurename}{�׸�} % (for captions)
	\renewcommand{\indexname}{����} %
	\renewcommand{\listfigurename}{�׸� ����} %
	\renewcommand{\listtablename}{ǥ ����} %
	\renewcommand{\tablename}{ǥ} % (for caption)
	\newcommand{\keywordname}{�ֿ��}
	\newcommand{\keywordnamealt}{Keywords}
	\newcommand{\studentnumbername}{�й�}
	\newcommand{\studentnumbernamealt}{Student Number}
	\newcommand{\abstractnamealt}{Abstract}
	\newcommand{\acknowledgementname}{������ ��}
	%% ��������
	%% kotex�� [hangul] �ɼ��� �ָ�
	%% ���⼭ ������ ������ ���������.
	%% babel ��Ű���� ����� ������ �� �� �ִ�.
\else
	\RequirePackage[euc]{kotex} %% ���� ��� ������ �ʿ��ϴ�.
	\newcommand{\keywordname}{Keywords}
	\newcommand{\keywordnamealt}{�ֿ��}
	\newcommand{\studentnumbername}{Student Number}
	\newcommand{\studentnumbernamealt}{�й�}
	\newcommand{\abstractnamealt}{���}
	\newcommand{\acknowledgementname}{Acknowledgements}
\fi

\if@snu@indentoptionset
    \if@snu@indentfirst
	\RequirePackage{indentfirst}
    \fi
\else
    \if@snu@ko
	\RequirePackage{indentfirst}
    \fi
\fi

\RequirePackage{ifpdf}

%% maketitle ���� ����.
\let\oldmaketitle=\maketitle
\renewcommand\maketitle{}

%% ���� ����.
%% a4paper : 210 mm X 297 mm
%% B5 (ISO) : 176 mm X 250 mm
%% B5 (JIS) : 182 mm X 257 mm
%% 4X6���� : 188 mm X 258 mm
%% �к� ��Ŀ����� A4�� ����Ѵ�.
%% ���п��� doc ����� B5 (JIS)�� ���� �ִ�.
%% LaTeX�� b5paper�� ISO �԰����� �ణ �����Ƿ�,
%% ���� �����ش�.

\if@snu@under
	\setlength{\paperwidth}{210mm}
	\setlength{\paperheight}{297mm}
	\setlength{\textwidth}{160mm} %% 210 mm - (2.5 cm)*2
	\setlength{\textheight}{232mm} %% 297 mm - 3 cm - 3.5 cm
	% �¿� ���� 2.5 cm
	% ��� ���� 3 cm, �ϴ� ���� 3.5 cm
\else
	\setlength{\paperwidth}{182mm}
	\setlength{\paperheight}{257mm}
	\setlength{\textwidth}{132mm} %% 182 mm - (2.5 cm)*2
	\setlength{\textheight}{207mm} %% 257 mm - 2.5 cm - 2.5 cm
	% �¿� ���� 2.5 cm
	% ��� ���� 2.5 cm, �ϴ� ���� 2.5 cm
\fi
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{25mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\addtolength{\marginparwidth}{-1.2cm} %% �� �߿���.
%\setlength{\marginparsep}{3mm} %% ��� ����.
\setlength{\oddsidemargin}{25mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\footskip}{10mm} % �Ʒ� page number ��ġ
\ifpdf
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
\fi

%% �ٰ���
\if@snu@under
	%% ���ణ ������ ���� ��ٷӴ�.
	%% ������ 1.6���� �ϰ�, �ѱ��� 1.75�� 2.0���� �ؾ� �Ѵٴ� ���嵵 �ִ�.
	\linespread{1.75} % Doblespacing
\else
	\if@snu@ko
	\linespread{1.6} % 170% (?)
	\else
	\linespread{1.5} % 170% (?)
	\fi
\fi
\let\@snu@oldfootnote=\footnote
\renewcommand{\footnote}[1]{\linespread{1.0}\@snu@oldfootnote{#1}}

%% \@onlypreamble ���� ����.
%% \@onlypreamble�� �����ϴ� ���� ���� �ʴ�.
%% ǥ������ ���� ������ �ְ�
%% ���������� �ѱ� ������ �ְ� ���� ����� ���� ���̰�,
%% ���� ��ο� �ѱ� ������ ����ϰ� ���� ����� ���� ���̴�.
%% \makefrontcover�� \makeapproval ���̿��� \author \author*�� ����Ͽ� �ѱ�/���� ���ϴ� ���·� ����� �� �ִ�.
%% \author�� \author*�� ���̴� ���� �����̸� *�� ���� ������ �̸� ���̿� ������ ����.


%% ����
\let\@oldtitle=\title
\def\title{\@ifstar\@snu@title\@oldtitle}
\def\@snu@title#1{\gdef\@titlealt{#1}}
\def\@titlealt{\@latex@error{No \noexpand\title* given}\@ehc}
%\@onlypreamble{\title}

%% �̸�
\let\@oldauthor=\author
\def\author{\@ifstar\@snu@authoralt\@oldauthor}
\def\@snu@authoralt#1{\gdef\@authoralt{#1}}
\def\@authoralt{\@latex@error{No \noexpand\author* given}\@ehc}
%\@onlypreamble{\author}

%% �й�
\def\studentnumber#1{\gdef\@snu@studentnumber{#1}}
\def\@snu@studentnumber{\@latex@error{No \noexpand\studentnumber given}\@ehc}
%\@onlypreamble{\studentnumber}

%% ��������
\def\advisor{\@ifstar\@snu@advisoralt\@snu@advisor}
\def\@snu@advisoralt#1{\gdef\@advisoralt{#1}}
\def\@snu@advisor#1{\gdef\@advisor{#1}}
\def\@advisoralt{\@latex@error{No \noexpand\advisor* given}\@ehc}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}
%\@onlypreamble{\advisor}

%% ���� ������ - ǥ�ڿ� ��
\def\graddate#1{\gdef\@snu@graddate{#1}}
\def\@snu@graddate{\@latex@error{No \noexpand\graddate given}\@ehc}
%\@onlypreamble{\graddate}

%% ���� ������ - �������� �� (�л� ����)
\def\submissiondate#1{\gdef\@snu@submissiondate{#1}}
\def\@snu@submissiondate{\@latex@error{No \noexpand\submissiondate given}\@ehc}
%\@onlypreamble{\submissiondate}

%% ���� ������ - �������� ��
\def\approvaldate#1{\gdef\@snu@approvaldate{#1}}
\def\@snu@approvaldate{\@latex@error{No \noexpand\approvaldate given}\@ehc}
%\@onlypreamble{\approvaldate}

%% ������, ��������, ����
\def\committeemembers#1#2#3#4#5{%
	\gdef\@snu@committeememberA{#1}
	\gdef\@snu@committeememberB{#2}
	\gdef\@snu@committeememberC{#3}
	\gdef\@snu@committeememberD{#4}
	\gdef\@snu@committeememberE{#5}
}
\def\@snu@committeememberA{}
\def\@snu@committeememberB{}
\def\@snu@committeememberC{}
\def\@snu@committeememberD{}
\def\@snu@committeememberE{}

%% Copied def. of \cleardoublepage from memoir.cls
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  %\hbox{}\thispagestyle{cleared}%
  \hbox{}\thispagestyle{empty}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% ǥ��
%% ǥ�� �ϴ� ������ 3 cm (5 mm ����)
%% ǥ�� �¿� ������ 2 cm (5 mm ����)
%% ������ linespread 1.3
\newlength{\@snu@covertextheight}
\setlength{\@snu@covertextheight}{\textheight}
\addtolength{\@snu@covertextheight}{5mm}
\newcommand{\makefrontcover}{%
	%% ���� ������
	\cleardoublepage
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{5mm}
	\thispagestyle{empty}
	\noindent
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\if@snu@under % �к�
			\fontsize{16pt}{16pt}\selectfont
			�����л���������\\
			\vspace{2cm}\nointerlineskip
			\fontsize{21pt}{21pt}\selectfont
			\@title\\
			\vfill
			\fontsize{16pt}{16pt}\selectfont
			\@snu@graddate\\
			\vspace{4cm}\nointerlineskip
			������б�~��������\\
			\vspace{1cm}\nointerlineskip
			��ǻ�Ͱ��к�\\
			\vspace{1cm}\nointerlineskip
			\@authoralt
		\else % ���п�
			\fontsize{14pt}{14pt}\selectfont
			\if@snu@ms
				\@snu@koen{���м�����������}%
				{M.S. THESIS}\\
			\else
				\@snu@koen{���йڻ���������}%
				{Ph.D. DISSERTATION}\\
			\fi
			\vspace{2cm}\nointerlineskip
			\fontsize{22pt}{22pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@titlealt\\
			\vspace{5cm}
			\fontsize{14pt}{14pt}\selectfont
			\@snu@graddate\\
			\vspace{4cm}\nointerlineskip
			\if@snu@ko
				\fontsize{16pt}{16pt}\selectfont
				������б� ���п�\\
				\vspace{5mm}\nointerlineskip
				\fontsize{14pt}{16pt}\selectfont
				��ǻ�� ���к�\\
				\vspace{5mm}\nointerlineskip
				\fontsize{16pt}{16pt}\selectfont
				\@authoralt
			\else
				\fontsize{14pt}{14pt}\selectfont
				DEPARTMENT OF COMPUTER SCIENCE ENGINEERING\\
				COLLEGE OF ENGINEERING\\
				SEOUL NATIONAL UNIVERSITY\\
			\fi
			\fontsize{14pt}{14pt}\selectfont
			\vspace{1cm}
			\if@snu@ko\else
				\@author
			\fi
			\vfill
			\vspace{2cm}
		\fi
	}
	%% ���� �������
	\newpage
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
%% ��������
%% center enviornment�� ����ϸ� �ϴ� ������ �� ����.
%% ���� ������ ���ݸ� ��߳��� �������� �μ���� ����.
}

%% ������
%% ������ �ϴ� ���� 2 cm (15 mm ����)
\newlength{\@snu@approvaltextheight}
\setlength{\@snu@approvaltextheight}{\textheight}
\addtolength{\@snu@approvaltextheight}{15mm}
%% underline length
\newlength{\committeenameunderlinelength}
\setlength{\committeenameunderlinelength}{7cm}
\newlength{\@snu@underlinetmp}
\newlength{\@snu@underlinetmpb}
\newcommand{\committeestyle}[1]{%
	\setlength{\@snu@underlinetmp}{\committeenameunderlinelength}%
	\settowidth{\@snu@underlinetmpb}{#1}%
	\addtolength{\@snu@underlinetmp}{-\@snu@underlinetmpb}%
	\divide \@snu@underlinetmp by 2 %
	\underline{\hspace{\@snu@underlinetmp}#1\hspace{\@snu@underlinetmp}}%
}
\newcommand{\makeapproval}{
	\cleardoublepage
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{15mm}
	\thispagestyle{empty}
	\noindent
	\parbox[][\@snu@approvaltextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\if@snu@under % �к�
			\vspace{5cm}
			\fontsize{21pt}{21pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			��������~\@advisoralt\\
			\vspace{1cm}\nointerlineskip
			��~������~�����л�����~��������~������\\
			%\@snu@submissiondate\\
			\vspace{5cm}\nointerlineskip
			������б�~��������\\
			\vspace{1cm}\nointerlineskip
			���к�\\
			\vspace{0.5cm}\nointerlineskip
			\@authoralt\\
			\vfill
			\@author~��~�л�����~������~������\\
			\vspace{1cm}\nointerlineskip
			\@snu@approvaldate\\
			\vspace{1cm}\nointerlineskip
			��~��~��~��~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(��)
		\else % ���п�
			\vspace{1cm}
			\fontsize{\if@snu@ko 22pt \else 16pt \fi}%
			{22pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@titlealt\\
			\vspace{1cm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			�������� \@advisoralt\\
			\vspace{5mm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			�� ������ %
			����\@snu@msphd{����}{�ڻ�}%
			������������ ������\\
			\vspace{5mm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			\@snu@submissiondate\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			������б� ���п�\\
			\vspace{5mm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			��ǻ�� ���к�\\
			\vspace{5mm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@authoralt\\
			\vspace{1cm}\nointerlineskip
			\@author�� %
			\@snu@msphd{����}{�ڻ�}%
			���������� ������\\
			\vspace{5mm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			\@snu@approvaldate\\
			\vfill
			\begin{tabular}[b]{cc}
			�� \hfill �� \hfill �� & \committeestyle{\@snu@committeememberA} (��)\\
			��������               & \committeestyle{\@snu@committeememberB} (��)\\
			�� \hfill ��           & \committeestyle{\@snu@committeememberC} (��)\\
			\if@snu@ms\else
			�� \hfill ��           & \committeestyle{\@snu@committeememberD} (��)\\
			�� \hfill ��           & \committeestyle{\@snu@committeememberE} (��)\\
			\fi
			\end{tabular}
			\@snu@msphd{\vspace{2cm}}{\vspace{1cm}}
		\fi
	}
	\newpage
	\if@restonecol \twocolumn \fi
%% ��������
%% center enviornment�� ����ϸ� �ϴ� ������ �� ����.
%% ���� ������ ���ݸ� ��߳��� �������� �μ���� ����.
}



%% keyword
\newcommand{\@snu@keyword}{}
\newcommand{\keyword}[1]{\renewcommand{\@snu@keyword}{#1}}
\newcommand{\abstracttitle}[1]{
	{
		\centering
		\ \\ \ \\ \fontsize{22pt}{22pt}\selectfont #1 \\
	}
} 
\newcommand{\abstractauthor}[1]{
	\begin{flushright}
		\fontsize{14pt}{14pt}\selectfont #1\\ 
		School of Computer Science Engineering\\ Collage of Engineering\\ The Graduate School\\ Seoul National University\\ \ \\ 
		\fontsize{11pt}{11pt}\selectfont
	\end{flushright}
}


\def\phantomsection{}


%% abstract
\renewenvironment{abstract}{%
	\if@snu@ko
		\chapter*{\abstractname}
		\@mkboth{\MakeUppercase\abstractname}%
			{\MakeUppercase\abstractname}%
		\addcontentsline{toc}{chapter}{\abstractname}%
	\else
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\abstractname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{22pt}{22pt}\selectfont
			\textbf{\abstractname}\par\nobreak
		}
		\@afterheading
	\fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordname}:~\@snu@keyword
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbername}:~\@snu@studentnumber
	\fi
	\newpage
}

%% keywordalt
\newcommand{\@snu@keywordalt}{}
\newcommand{\keywordalt}[1]{\renewcommand{\@snu@keywordalt}{#1}}

%% abstractalt
\newenvironment{abstractalt}%
{%
	\if@snu@ko
    \chapter*{\abstractnamealt}
    \@mkboth{\MakeUppercase\abstractnamealt}%
      {\MakeUppercase\abstractnamealt}%
    \addcontentsline{toc}{chapter}{\abstractnamealt}%
    \vspace{-2.5cm}
  \else
    \if@openright \cleardoublepage
    \else \clearpage \fi
    \@afterindentfalse
    \phantomsection
    \addcontentsline{toc}{chapter}{\abstractnamealt}
    {%
      \centering
      \normalfont
      \linespread{1.0}
      \fontsize{16pt}{16pt}\selectfont
      \textbf{\abstractnamealt}\par\nobreak
    }
    \vspace{2cm}
    \@afterheading
  \fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordnamealt}:~\@snu@keywordalt
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbernamealt}:~\@snu@studentnumber
	\fi
  	\newpage
}

%% ������ ��
\newcommand{\acknowledgement}{%
	\if@snu@ko
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\acknowledgementname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\acknowledgementname}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\else
		\chapter*{\acknowledgementname}
		\@mkboth{\MakeUppercase\acknowledgementname}%
			{\MakeUppercase\acknowledgementname}%
		\addcontentsline{toc}{chapter}{\acknowledgementname}%
	\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ĸ�� ��Ÿ��
%% - ĸ�ǿ��� colon(:)�� �����ؾ� �Ѵ�.
%% - report Ŭ�������� ������ :�� ����.
%% - ������ �˾Ƽ� ��.
%% TODO
%% - caption�� �������� ��ħǥ�� �ִ��� üũ
%% - ǥ�� ĸ�ǿ��� ��ħǥ�� ����� �ϰ�
%% - �׸��� ĸ�ǿ��� �־�� ��.

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% �ѱ� ������ ���� ������ ������ �ٸ���.
% ���� ������ �Ѵ�.
\if@snu@ko
    %% report Ŭ�������� �ణ ��ħ
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      {%
	\centering
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% report Ŭ�������� �ణ ��ħ
    %% chapter style
    \def\@makechapterhead#1{%
      {%
	\centering
	\normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{16pt}{16pt}\selectfont
	    \bfseries ��\space\thechapter\space��\space
	\fi
	\interlinepenalty\@M
	\fontsize{16pt}{16pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\else
    %% report Ŭ�������� �ణ ��ħ
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      \vspace*{3cm}% é�� ���� ���� ����
      \vspace{-\f@baselineskip} % ��Ȯ�� ������ ���� �ʿ�
      {%
	\parindent \z@ \raggedright
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% report Ŭ�������� �ణ ��ħ
    %% chapter style
    \def\@makechapterhead#1{%
      \vspace*{3cm}% é�� ���� ���� ����
      \vspace{-\f@baselineskip} % ��Ȯ�� ������ ���� �ʿ�
      {%
	\parindent \z@ \raggedright \normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{20pt}{20pt}\selectfont
	    \bfseries \@chapapp\space \thechapter
	    \par\nobreak
	    \vspace{2cm}
	\fi
	\interlinepenalty\@M
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\fi

% section style
\renewcommand\section{%
	\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\fontsize{14pt}{14pt}\selectfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\fontsize{12pt}{12pt}\selectfont\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% template�� �������� ������ ���� �������� �̰����� ��� ���ش�.

\if@snu@easy
	% �̰��� KLDP���� �����Դ�.
	% http://faq.ktug.or.kr/faq/pdflatex%B0%FAlatex%B5%BF%BD%C3%BB%E7%BF%EB
	\ifpdf
		% \input glyphtounicode.tex\pdfgentounicode=1 %type 1 font����
		\usepackage{dhucs-cmap} % true type �۲� ����
		\pdfmapfile{+unttf-pdftex-dhucs.map} % truetype�۲û���
		\usepackage[pdftex,unicode]{hyperref}
		\usepackage[pdftex]{graphicx}
		\usepackage[pdftex,svgnames]{xcolor}
	\else
		\usepackage[dvipdfmx,unicode]{hyperref}
		\usepackage[dvipdfmx]{graphicx}
		\usepackage[dvipdfmx,svgnames]{xcolor}
	\fi
	%KC2008�� ���Ŀ����� first.tex�� ko.TEX v0.1.0 ��� ������ ����
	%hangul-ucs 4.0 ���� ���������� dhucs-ucshyper��� �ΰ� ��Ű���� �����Ǿ�����, 
	%hyperref�� ��� ��� ���� ���ʿ��������Ƿ� 
	%ko.TEX������ �̸� �������� �ʴ´�.
\fi