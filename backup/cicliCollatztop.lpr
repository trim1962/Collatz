program cicliCollatztop;

uses
 Sysutils, stampa, MioType;


var
  tfOut: TextFile;
  tfcsvOut: TextFile;
  tfcsvtopOut: TextFile;
   n: Qword;
   m: Qword;
   maxcontatore: Qword;

   contatore: Qword;
   numeri : mioarray;  // lunghezza ciclo   per il numer
   topciclo : mioarray;// valore massimo ciclo per il numero

   contatori : mioarray; // frequenza lunghezza ciclo
Begin
 AssignFile(tfOut, C_FNAME); // file out per il file tex
     rewrite(tfOut) ;
  AssignFile(tfcsvOut, CSVNUM_FNAME); // file cvs per contatori
   rewrite(tfcsvOut) ;
   AssignFile(tfcsvtopOut, CSVTOP_FNAME); // file cvs per topciclo
   rewrite(tfcsvtopOut) ;
for n:=1 to t do contatori[n]:=0;
for n:=1 to t do topciclo[n]:=0;

maxcontatore:=0;   // valore piu lungo del ciclo
for m:=1 to t do Begin    // ciclo calcolo Collatz
   n:=m;
   contatore:=0;
   Repeat
      If(n mod 2 = 0) Then
         n:=n Div 2
      Else
         n:=3*n+1;
      Writeln('m=',' ',m,' ', 'n=',n);
      contatore:=contatore + 1;
      if n > topciclo[m]then topciclo[m]:=n;  //valore più alto raggiunto
   Until(n = 1);
   if contatore > maxcontatore then maxcontatore:=contatore;     // valore piu lungo del ciclo
   Writeln;
   Writeln ('m= ',m,' ','contatore=  ', contatore);
   contatori[contatore]:= contatori[contatore]+1;
   numeri[m]:=contatore;
end;
  for n:=1 to maxcontatore do writeln(n,' ',contatori[n]);
  for n:=1 to t do  writeln(n,' ',topciclo[n]);
  for n:=1 to t do  writeln(n,' ',numeri[n]);
  m:=1;
   stampauno(tfOut);

while m<= t  do
    Begin
         stampalinea(tfOut,m,numeri);
          m:=m+6;
    End;
    chiusuralong(tfOut);
  stampadue(tfOut);
  m:=1;
while m<= maxcontatore  do
    Begin
       stampalinea(tfOut,m,contatori);
         m:=m+6;
    End;
chiusuralong(tfOut);
stampatre(tfOut);
m:=1;
 while m<= t  do
    Begin
         stampalinea(tfOut,m,topciclo);
          m:=m+6;
    End;
chiusuralong(tfOut);
CloseFile(tfOut);
n:=1;
while n<=maxcontatore do
begin
stampacsv(tfcsvOut,n,contatori);
n:=n+1;
end;
n:=1;
while n<=t do
begin
stampacsv(tfcsvOut,n,topciclo);
n:=n+1;
end;
CloseFile(tfcsvOut);
CloseFile(tfcsvtopOut);
Writeln('massimo ciclo', maxcontatore);
End.


