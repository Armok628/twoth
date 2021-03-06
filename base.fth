HERE
	6		C,
KEY	H		C,
KEY	E		C,
KEY	A		C,
KEY	D		C,
KEY	E		C,
KEY	R		C,
ALIGN HERE
	LATEST @	,
	6		,
	SWAP		,
LATEST !
	DOCOL		,
'	HERE		,
'	WORD		,
'	COUNT		,
'	TUCK		,

'	DUP		,
'	C,		,
'	DUP		,
'	0BRANCH		,
	10 CELL *	,
'	SWAP		,
'	DUP		,
'	C@		,
'	C,		,
'	1+		,
'	SWAP		,
'	1-		,
'	BRANCH		,
	-11 CELL *	,

'	DROP		,
'	DROP		,
'	ALIGN		,
'	HERE		,
'	LATEST		,
'	@		,
'	,		,
'	-ROT		,
'	,		,
'	,		,
'	LATEST		,
'	!		,
'	EXIT		,

HEADER IMMEDIATE
	DOCOL		,
'	LATEST		,
'	@		,
'	CELL		,
'	+		,
'	DUP		,
'	@		,
'	F_IMM		,
'	OR		,
'	SWAP		,
'	!		,
'	EXIT		,

HEADER STATE
	DOCOL		,
'	LIT		,
	HERE 2 CELL * +	,
'	EXIT		,
	0		,

HEADER [
	DOCOL		,
'	LIT		,
	0		,
'	STATE		,
'	!		,
'	EXIT		,
IMMEDIATE

HEADER ]
	DOCOL		,
'	LIT		,
	1		,
'	STATE		,
'	!		,
'	EXIT		,

HEADER TYPE
	DOCOL		,
'	DUP		,
'	0BRANCH		,
	10 CELL *	,
'	SWAP		,
'	DUP		,
'	C@		,
'	EMIT		,
'	1+		,
'	SWAP		,
'	1-		,
'	BRANCH		,
	-11 CELL *	,
'	DROP		,
'	DROP		,
'	EXIT		,

HEADER INTERPRET
	DOCOL		,

'	WORD		,
'	FIND		,
'	STATE		,
'	@		,
'	0BRANCH		,
	35 CELL *	,

'	DUP		,
'	0BRANCH		,
	10 CELL *	,

'	LIT		,
	-1		,
'	=		,
'	0BRANCH		,
	3 CELL *	,
'	,		,
'	EXIT		,

'	EXECUTE		,
'	EXIT		,

'	DROP		,
'	LIT		,
	0		,
'	SWAP		,
'	COUNT		,
'	>NUMBER		,
'	DUP		,
'	0BRANCH		,
	7 CELL *	,
'	TYPE		,
'	LIT		,
	KEY ?		,
'	EMIT		,
'	DROP		,
'	EXIT		,
'	DROP		,
'	DROP		,
'	LIT		,
	' LIT		,
'	,		,
'	,		,
'	EXIT		,

'	0BRANCH		,
	3 CELL *	,
'	EXECUTE		,
'	EXIT		,

'	LIT		,
	0		,
'	SWAP		,
'	COUNT		,
'	>NUMBER		,
'	DUP		,
'	0BRANCH		,
	7 CELL *	,
'	TYPE		,
'	LIT		,
	KEY ?		,
'	EMIT		,
'	DROP		,
'	EXIT		,
'	DROP		,
'	DROP		,
'	EXIT		,

HEADER QUIT
	DOCOL		,
'	R0		,
'	RP!		,
'	INTERPRET	,
'	BRANCH		,
	-2 CELL *	,

QUIT

HEADER : DOCOL , ] HEADER DOCOL , ] EXIT [

: ; LIT EXIT , [ ' [ , ] EXIT [ IMMEDIATE

: / /MOD SWAP DROP ;
: MOD /MOD DROP ;

: 0< 0 < ;
: 0> 0 > ;
: 0<= 0 <= ;
: 0>= 0 >= ;
: 0= 0 = ;
: 0<> ; IMMEDIATE

: TRUE -1 ;
: FALSE 0 ;
: NOT 0= ;

: CELL+ CELL + ;
: CELLS CELL * ;
: CHAR+ 1 + ;
: CHARS ;

: +! TUCK @ + SWAP ! ;

: 2* 1 LSHIFT ;
: 2/ 1 RSHIFT ;
: 2@ DUP @ SWAP CELL+ @ ;
: 2! TUCK ! CELL+ ! ;
: 2DROP DROP DROP ;
: 2DUP OVER OVER ;
: 2SWAP >R -ROT R> -ROT ;
: 2OVER >R >R OVER OVER R> R> 2SWAP ;
: 2>R R> -ROT SWAP >R >R >R ;
: 2R> R> R> R> ROT >R SWAP ;
: 2R@ 2R> 2DUP 2>R ;

: POSTPONE ' , ; IMMEDIATE
: COMPILE, , ; IMMEDIATE
: LITERAL LIT LIT , , ; IMMEDIATE
: ['] ' POSTPONE LITERAL ; IMMEDIATE
: CHAR WORD CHAR+ C@ ;
: [CHAR] CHAR POSTPONE LITERAL ; IMMEDIATE

: CREATE HEADER
	DOCOL ,
	HERE 4 CELLS + POSTPONE LITERAL
	['] EXIT ,
	CELL ALLOT
;
: LENMASK [ F_IMM F_HID OR INVERT ] LITERAL ;
: >XT 3 CELLS + ;
: DOES> LATEST @ >XT 3 CELLS +
	['] BRANCH OVER ! CELL+
	R> OVER - SWAP !
;
: >BODY 5 CELLS + ;
: CONSTANT CREATE , DOES> @ ;
: VARIABLE CREATE 0 , ;

: >LINK 3 CELLS - ;
: HIDE ' >LINK CELL+ DUP C@ F_HID OR SWAP ! ;
: FORGET ' >LINK DUP @ SWAP HERE - ALLOT LATEST ! ;

: CLEAR S0 SP! ;
: DEPTH S0 SP@ - CELL / 1- ;
: ABORT REFILL CLEAR QUIT ;

: IF ['] 0BRANCH , HERE 0 , ; IMMEDIATE
: THEN HERE OVER - SWAP ! ; IMMEDIATE
: ELSE ['] BRANCH , HERE 0 , SWAP POSTPONE THEN ; IMMEDIATE

: ?DUP DUP IF DUP THEN ;
: ABS DUP 0< IF NEGATE THEN ;
: MAX 2DUP < IF SWAP THEN DROP ;
: MIN 2DUP > IF SWAP THEN DROP ;

: BEGIN HERE ; IMMEDIATE
: AGAIN ['] BRANCH , HERE - , ; IMMEDIATE
: UNTIL ['] 0BRANCH , HERE - , ; IMMEDIATE
: WHILE POSTPONE IF ; IMMEDIATE
: REPEAT ['] BRANCH , SWAP HERE - , POSTPONE THEN ; IMMEDIATE

: \ BEGIN KEY 10 = UNTIL ; IMMEDIATE
: ( BEGIN KEY [CHAR] ) = UNTIL ; IMMEDIATE
: ) ; IMMEDIATE

: DECIMAL 10 BASE ! ;
: HEX 16 BASE ! ;
: BINARY 2 BASE ! ;

: U.
	-1 SWAP
	BEGIN
		BASE @ /MOD
	DUP 0= UNTIL
	DROP
	BEGIN
		DUP 10 < IF
			[CHAR] 0 +
		ELSE
			[ KEY A 10 - ] LITERAL +
		THEN
		EMIT
	DUP -1 = UNTIL
	DROP
;
: . DUP 0< IF NEGATE [CHAR] - EMIT THEN U. ;

\ 10 0 DO ... LOOP -> 10 0 SWAP >R >R BEGIN ... R> 1+ R@ OVER >R >= UNTIL R> R> DROP DROP ;

: DO
	['] SWAP ,
	['] >R DUP , ,
	0
	POSTPONE BEGIN
; IMMEDIATE
: ?DO
	['] OVER DUP , ,
	['] <> ,
	POSTPONE IF
	POSTPONE DO
	SWAP DROP
; IMMEDIATE
: UNLOOP
	['] R> DUP , ,
	['] DROP DUP , ,
; IMMEDIATE
: +LOOP
	['] DUP ,
	['] R> ,
	['] + ,
	['] R@ ,
	['] OVER ,
	['] >R ,
	['] ROT ,
	0 POSTPONE LITERAL
	['] < ,
	POSTPONE IF
		['] < ,
	POSTPONE ELSE
		['] > ,
	POSTPONE THEN
	POSTPONE UNTIL
	POSTPONE UNLOOP
	DUP IF
		POSTPONE ELSE
		['] DROP DUP , ,
		POSTPONE THEN
	ELSE
		DROP
	THEN
; IMMEDIATE
: LOOP
	['] R> ,
	['] 1+ ,
	['] R@ ,
	['] OVER ,
	['] >R ,
	['] >= ,
	POSTPONE UNTIL
	POSTPONE UNLOOP
	DUP IF
		POSTPONE ELSE
		['] DROP DUP , ,
		POSTPONE THEN
	ELSE
		DROP
	THEN
; IMMEDIATE

: I RP@ CELL+ @ ;
: I' RP@ 2 CELLS + @ ;
: J RP@ 3 CELLS + @ ;
: J' RP@ 4 CELLS + @ ;

32 CONSTANT BL
: SPACE 32 EMIT ;
: SPACES 0 MAX 0 ?DO SPACE LOOP ;
: CR 10 EMIT ;

: S"
	STATE @ IF
		['] LIT ,
		HERE 5 CELLS + ,
		['] LIT ,
		HERE 0 ,	( save address of literal )
		['] BRANCH ,
		HERE 0 ,	( save address of branch offset )
	THEN
	HERE
	BEGIN
		KEY
	DUP [CHAR] " <> WHILE
		C,
	REPEAT
	DROP
	STATE @ IF
		HERE - NEGATE
		SWAP
		ALIGN
		POSTPONE THEN
		SWAP !
	ELSE
		DUP HERE - NEGATE
	THEN
; IMMEDIATE
: ."
	STATE @ IF
		POSTPONE S"
		['] TYPE ,
	ELSE
		BEGIN
			KEY
		DUP [CHAR] " <> WHILE
			EMIT
		REPEAT
		DROP
	THEN
; IMMEDIATE
: ABORT"
	POSTPONE ."
	['] ABORT ,
; IMMEDIATE
