unit matematica;

{$mode objfpc}{$H+}

interface

uses
   MioType;
function Matematica_Collatz(n:Qword):Qword;
implementation
function Matematica_Collatz(n:Qword):Qword;
begin
   If(n mod 2 = 0) Then
         Matematica_Collatz:=n Div 2
      Else
        Matematica_Collatz:=3*n+1;
end;

end.

