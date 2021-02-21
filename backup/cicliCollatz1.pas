Program cicliCollatz1;
uses
 Sysutils;

const
  C_FNAME = 'Collatz2.tex';
  CVS_FNAME = 'Collatz2.csv';
  t =6000;
var
  tfOut: TextFile;
  tfcsvOut: TextFile;
   n: Qword;
   m: Qword;
   maxcontatore: Qword;

   contatore: Qword;
   numeri : array[1..t] of Qword;
   contatori : array[1..t] of Qword;
Begin
 AssignFile(tfOut, C_FNAME);
     rewrite(tfOut) ;
  AssignFile(tfcsvOut, CVS_FNAME);
   rewrite(tfcsvOut) ;
for n:=1 to t do contatori[n]:=0;

maxcontatore:=0;
for m:=1 to t do Begin
   n:=m;
   contatore:=0;
   Repeat
      If(n mod 2 = 0) Then
         n:=n Div 2
      Else
         n:=3*n+1;
      Writeln('m=',' ',m,' ', 'n=',n);
      contatore:=contatore + 1;
   Until(n = 1);
   if contatore > maxcontatore then maxcontatore:=contatore;
   Writeln;
   Writeln ('m= ',m,' ','contatore=  ', contatore);
   contatori[contatore]:= contatori[contatore]+1;
   numeri[m]:=contatore;
end;
  for n:=1 to maxcontatore do writeln(n,' ',contatori[n]);

  Writeln(tfOut,'\section{Frequenza cicli}');
     Writeln(tfOut,'\begin{longtable}{llllll}','\toprule');
   Writeln(tfOut,   '\caption{Frequenza cicli}\\');
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

  m:=1;
while m<= maxcontatore  do
    Begin
         Writeln(tfOut,m,'  ',contatori[m],'&',m+1,' ',contatori[m+1],'&',m+2,' ',contatori[m+2],'&',m+3,' ',contatori[m+3],'&',m+4,' ',contatori[m+4],'&',m+5,' ',contatori[m+5],'\\');
         m:=m+6;
    End;
 Writeln(tfOut,'\bottomrule','\end{longtable}');
CloseFile(tfOut);
for n:=1 to maxcontatore do
writeln(tfcsvOut,n,';',contatori[n]);
CloseFile(tfcsvOut);
Writeln('massimo ciclo', maxcontatore);
End.
