HERE
	6	C,
KEY	H	C,
KEY	E	C,
KEY	A	C,
KEY	D	C,
KEY	E	C,
KEY	R	C,
ALIGN HERE SWAP
LATEST @ ,
DUP C@ , ,
LATEST !
' HERE		COMPILE,
' WORD		COMPILE,
' DUP		COMPILE,
' C@		COMPILE,
' 1+		COMPILE,
HERE
' DUP		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' 1-		COMPILE,
' SWAP		COMPILE,
' DUP		COMPILE,
' C@		COMPILE,
' C,		COMPILE,
' 1+		COMPILE,
' SWAP		COMPILE,
' BRANCH COMPILE, SWAP HERE - , HERE OVER - SWAP !
' DROP		COMPILE,
' DROP		COMPILE,
' ALIGN		COMPILE,
' HERE		COMPILE,
' SWAP		COMPILE,
' LATEST	COMPILE,
' @		COMPILE,
' ,		COMPILE,
' DUP		COMPILE,
' C@		COMPILE,
' ,		COMPILE,
' ,		COMPILE,
' LATEST	COMPILE,
' !		COMPILE,
' EXIT		COMPILE,

HEADER IMMEDIATE
' LATEST	COMPILE,
' @		COMPILE,
' CELL		COMPILE,
' +		COMPILE,
' DUP		COMPILE,
' @		COMPILE,
' F_IMM		COMPILE,
' OR		COMPILE,
' SWAP		COMPILE,
' !		COMPILE,
' EXIT		COMPILE,

HEADER STATE
' DOLIT		COMPILE,
HERE 2 CELL * + ,
' EXIT		COMPILE,
0 ,

HEADER ]
' DOLIT		COMPILE,
  -1		,
' STATE		COMPILE,
' !		COMPILE,
' EXIT		COMPILE,

HEADER [
' DOLIT		COMPILE,
  0		,
' STATE		COMPILE,
' !		COMPILE,
' EXIT		COMPILE,
IMMEDIATE

HEADER TYPE
HERE
' DUP		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' 1-		COMPILE,
' SWAP		COMPILE,
' DUP		COMPILE,
' C@		COMPILE,
' EMIT		COMPILE,
' 1+		COMPILE,
' SWAP		COMPILE,
' BRANCH COMPILE, SWAP HERE - , HERE OVER - SWAP !
' DROP		COMPILE,
' DROP		COMPILE,
' EXIT		COMPILE,

HEADER INTERPRET
' FIND		COMPILE,
' DUP		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' STATE		COMPILE,
' @		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' DOLIT		COMPILE,
  1		,
' =		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' EXECUTE	COMPILE,
' BRANCH COMPILE, HERE 0 , SWAP HERE OVER - SWAP !
' COMPILE,	COMPILE,
HERE OVER - SWAP !
' EXIT		COMPILE,
' BRANCH COMPILE, HERE 0 , SWAP HERE OVER - SWAP !
' DROP		COMPILE,
' EXECUTE	COMPILE,
' EXIT		COMPILE,
HERE OVER - SWAP !
' BRANCH COMPILE, HERE 0 , SWAP HERE OVER - SWAP !
' SWAP		COMPILE,
' COUNT		COMPILE,
' >NUMBER	COMPILE,
' DUP		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' TYPE		COMPILE,
' DROP		COMPILE,
' DOLIT		COMPILE,
  KEY ?		,
' EMIT		COMPILE,
' EXIT		COMPILE,
' BRANCH COMPILE, HERE 0 , SWAP HERE OVER - SWAP !
' DROP		COMPILE,
' DROP		COMPILE,
' STATE		COMPILE,
' @		COMPILE,
' 0BRANCH COMPILE, HERE 0 ,
' DOLIT		COMPILE,
' DOLIT		COMPILE,
' ,		COMPILE,
' ,		COMPILE,
HERE OVER - SWAP !
' EXIT		COMPILE,
HERE OVER - SWAP !
' EXIT		COMPILE,

HEADER QUIT
HERE
' WORD COMPILE,
' INTERPRET COMPILE,
' BRANCH COMPILE, HERE - ,
' EXIT		COMPILE,

QUIT

HEADER : ] HEADER ] EXIT [
: ; DOLIT EXIT , [ ' [ COMPILE, ] EXIT [ IMMEDIATE
