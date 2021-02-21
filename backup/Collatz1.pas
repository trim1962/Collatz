Program Collatz1;
uses
 Sysutils;

const
  C_FNAME = 'Collatz1.tex';
  t =2400;
var
  tfOut: TextFile;
   n: LongInt;
   m: LongInt;

   contatore: LongInt;
   numeri : array[1..t] of LongInt;
Begin
AssignFile(tfOut, C_FNAME);
    rewrite(tfOut);
for m:=1 to t do Begin
   n:=m;
   contatore:=0;
   Repeat
      If(n mod 2 = 0) Then
         n:=n Div 2
      Else
         n:=3*n+1;
      Writeln('n=',n, ' ');
      contatore:=contatore + 1;
   Until(n = 1);
   Writeln;
   Writeln (contatore);
   numeri[m]:=contatore;
end;
m:=1;
Writeln(tfOut,'\chapter{Congettura di Collatz}');
   Writeln(tfOut,'\begin{longtable}{llllll}','\toprule');
 Writeln(tfOut,   '\caption{Numero e lunghezza ciclo}\\');
 Writeln(tfOut, '\toprule');
 Writeln(tfOut, '\textbf{n l} & \textbf{n l} & \textbf{n l} & \textbf{n l}& \textbf{n l} & \textbf{n l}\\');
 Writeln(tfOut,'\midrule');
 Writeln(tfOut,'\endfirsthead' );
  Writeln(tfOut,'\multicolumn{6}{c} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(tfOut, '\textbf{n l} & \textbf{n l} & \textbf{n l} & \textbf{n l}& \textbf{n l} & \textbf{n l}\\');
  Writeln(tfOut,'\midrule');
  Writeln(tfOut,'\endhead');
  Writeln(tfOut,'\midrule');
  Writeln(tfOut,'\multicolumn{6}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(tfOut,'\endfoot' );
  Writeln(tfOut,'\bottomrule');
  Writeln(tfOut,'\endlastfoot');

while m<= t  do
    Begin
         Writeln(numeri[m]);
         Writeln(tfOut,m,'  ',numeri[m],'&',m+1,' ',numeri[m+1],'&',m+2,' ',numeri[m+2],'&',m+3,' ',numeri[m+3],'&',m+4,' ',numeri[m+4],'&',m+5,' ',numeri[m+5],'\\');
    m:=m+6;
    End;
  Writeln(tfOut,'\bottomrule','\end{longtable}');
CloseFile(tfOut);
End.
