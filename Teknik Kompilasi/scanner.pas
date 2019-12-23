unit Scanner;
interface
uses CRT;
const
ALNG            = 30;
eof             = #26;
tab             = #009;
LineFeed        = #010;
space           = #032;
car_return      = #013;

type
Alfa = string[ALNG];

tokens = (
t_int, t_add, t_sub, t_mul, t_rdiv, t_double_mul,
t_assign { ':=' },
t_lbrack { '[' }, t_rbrack { ']' },
t_lparent { '(' }, t_rparent { ')' },
t_id, t_else, t_if, t_then
);
const
num_reserved_word = 3;

KeyStr : array [1..num_reserved_word] of Alfa = (
'else', 'if', 'then'
);

KeySym : array [1..num_reserved_word] of tokens = (
t_else, t_if, t_then
);

var
FIn         : string[12];
FInput      : text;

LookAhead   : boolean;
Enum        : boolean;
Ch          : char;
token       : tokens;
Id          : Alfa;
Inum        : longint;
LineNumber  : integer;

procedure initialize;
procedure scan;
procedure terminate;

implementation

procedure Initialize;
begin
if (ParamCount < 1)
then repeat
Write(' File Sumber (.pas) ');
Readln(FIn);
until (Length(FIn) <> 0 )
else FIn := ParamStr(1);
if (Pos('.', FIn) = 0 )
then FIn := FIn + '.pas';
{$I-}
Assign(FInput, FIn);
Reset(FInput);
{$I+}
if (IOResult <> 0 )
then begin
Writeln('Tidak bisa mengkases File : "', FIn, "'');
Halt;
end;
FIn ;= Copy(FIn, 1, Pos('.',FIn) -1 ) + '.out';
LookAhead       := FALSE;
Enum            := FALSE;
Ch              := ' ';
Line Number     := 1;
end;
procedure Terminate;
begin
close(FInput);
end;
procedure GetCh;
begin
read(FInput, Ch);
end;
procedure error_report(id: byte);
begin
case id of
1 : writeln(' Error -> unknown character "', Ch, ''' Line : ', LineNumber);
2 : writeln(' Error -> comment not limited Line', LineNumber);
end;
end;
procedure Scan;
var
Idx : integer;
e   : integer;
begin
if (not LookAhead)
then GetCh;
LookAhead := FALSE;
repeat
case Ch of
tab, LineFeed, space : GetCh;
car_return :
begin
GetCh;
inc (LineNumber);
end;
eof :
Exit;
'A'..'Z','a'..'z' :
begin
Id := '';
repeat
Id := Id + Ch;
GetCh;
until (not (Ch in['0'..'9', 'A'..'Z', 'a'..'z']));
LookAhead := TRUE;
Idx := 0;
repeat
Idx := Idx + 1;
until ((Idx = num_reserved_word) or (Id = KeyStr[Idx]));
if (Id = KeyStr[Idx])
then token := KeySym[Idx]
else token := t_id;
Exit;
end;
'0'..'9' :
begin
Inum := 0;
token := t_int;
repeat
Inum := Inum * 10 + (ord(Ch) - ord('0'));
until (not (Ch in['0'..'9']));
LookAhead := TRUE;
Exit;
end;
'+' :
begin
token := t_add;
exit;
end;
'-' :
begin
token := t_sub;
exit;
end;
'*' :
begin
getch;
if(ch = '*')
then token := t_double_mul
else begin
token := t_mul;
lookahead := true;
end;
exit;
'/' :
begin
token := t_rdiv;
exit;
end;
')' :
begin
token := t_rparent;
exit;
end;
'[' :
begin
token := t_lbrack;
exit;
end;
']' :
begin
token := t_rbrack;
exit;
end;
':' :
begin
GetCh;
if ( Ch = '=')
then begin
token
:=t_assign;
end
else begin
Writeln('Error -> Unknown character'':'' line : ', LineNumber);
lookahead := true;
end;
exit;
end;
'(' :
begin
GetCh;
if(Ch <> '*')
then begin
token := t_lparent;
LookAhead :=TRUE;
Exit;
end
else begin
GetCh;
if (Ch = eof)
then begin
error_report(2);
Exit;
end;
repeat
while (Ch <> '*')
do begin
GetCh;
if (Ch = eof) then
begin
error_report(2);
exit;
end;
end;
Getch;
if(Ch = eof)
then begin
error_report(2);
exit;
end;
until(Ch = ')');
GetCh;
end;
end;
else
begin
error_report(1);
GetCh;
end;
end;
until FALSE;
end
end.
