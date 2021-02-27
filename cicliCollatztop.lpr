program cicliCollatztop;

uses
 Sysutils, stampa, MioType, vettori;


var
  tfOut: TextFile;
  tfcsvOut: TextFile;
  tfcsvtopOut: TextFile;
   n: Qword;
   m,im, i: Qword;
   maxcontatore: Qword;

   contatore: Qword;
   numeri : MioType_mioarray;  // lunghezza ciclo   per il numer
   topciclo,maxciclo : MioType_mioarray;// valore massimo ciclo per il numero

   contatori : MioType_mioarray; // frequenza lunghezza ciclo
   linea:string;
   lunglinea:integer;
   vett: MioType_mioarray;

Begin
 AssignFile(tfOut, MioType_C_FNAME); // file out per il file tex
     rewrite(tfOut) ;
  AssignFile(tfcsvOut, MioType_CSVNUM_FNAME); // file cvs per contatori
   rewrite(tfcsvOut) ;
   AssignFile(tfcsvtopOut, MioType_CSVTOP_FNAME); // file cvs per topciclo
   rewrite(tfcsvtopOut) ;
Vettori_azzera(contatori, MioType_t_max);
Vettori_azzera(topciclo, MioType_t_max);
maxcontatore:=0;   // valore piu lungo del ciclo
for m:=1 to MioType_t_max do Begin    // ciclo calcolo Collatz
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
  //for n:=1 to maxcontatore do writeln(n,' ',contatori[n]);
  //for n:=1 to MioType_t_max do  writeln(n,' ',topciclo[n]);
  //for n:=1 to MioType_t_max do  writeln(n,' ',numeri[n]);
  m:=1;
  Stampa_stampauno_Semplificata(tfOut);
while m<= MioType_t_max do
    Begin
          Stampa_stampalinea_Semplificata(tfOut,m,numeri);
          m:=m+12;
    End;
Stampa_chiusuralong(tfOut);
  Stampa_stampadue(tfOut);
  m:=1;
while m<= maxcontatore  do
    Begin
       Stampa_stampalinea(tfOut,m,contatori);
       m:=m+6;
    End;
Stampa_chiusuralong(tfOut);
Stampa_stampatre(tfOut);
m:=1;
 while m<= MioType_t_max  do
    Begin
         Stampa_stampalinea(tfOut,m,topciclo);
          m:=m+6;
    End;
 Stampa_chiusuralong(tfOut);
n:=1;
while n<=maxcontatore do
begin
Stampa_stampacsv(tfcsvOut,n,contatori);
n:=n+1;
end;
n:=1;
while n<=MioType_t_max do
begin
Stampa_stampacsv(tfcsvtopOut,n,topciclo);
n:=n+1;
end;
CloseFile(tfcsvOut);
CloseFile(tfcsvtopOut);
Writeln('massimo ciclo', maxcontatore);

for n:=1 to MioType_t_max do vett[n]:=topciclo[n];   //viene duplicato topciclo
Vettori_boubledec(vett);     // viene ordinato in senso decrescete vett
Vettori_azzeradoppivet(vett);  // vengono tolti da vett i valori duplicati
   Vettori_boublecre(vett);  //ordina vett in modo crescente
   im:=1;
   for i:=1 to  MioType_t_max do   //estrai da vett i valori diversi da zero
   begin
   if vett[i]<>0 then
       begin
            maxciclo[im]:=vett[i];
            im:=im+1;
       end;
   end;
   im:=im-1;// correzione indice
   //i:=1;
   //while i<=im do
   //begin
   //Writeln(Stampa_stampasenonzero(maxciclo[i]),'&',Stampa_stampasenonzero(maxciclo[i+1]),'&',Stampa_stampasenonzero(maxciclo[i+2]),'&',Stampa_stampasenonzero(maxciclo[i+3]),'&',Stampa_stampasenonzero(maxciclo[i+4]),'&',Stampa_stampasenonzero(maxciclo[i+5]),'\\');
   //i:=i+6;
   //end;
  // Vettori_stampavet(vett);
  Stampa_stampaquattro(tfOut);
  m:=1;
 while m<= im  do
    Begin
         Stampa_stampalinea_Semplificatanozero(tfOut,m,maxciclo);
          m:=m+12;
    End;
   Stampa_chiusuralong(tfOut);
CloseFile(tfOut);
i:=1;
n:=1;
linea:='';
for lunglinea:=1 to 11 do
AppendStr(linea,',&');
 AppendStr(linea,'\\');
while i <= im do
begin
writeln(maxciclo[i],linea);
     for m:=1 to  MioType_t_max do
     begin
          if topciclo[m]=maxciclo[i]
          then
              if n<= 12
                 then
                     begin
                          write('& ',m,' ');
                          n:=n+1
                     end
                 else
                     begin
                          n:=1;
                          writeln('\\');
                     end;
     end;
  writeln('n= ',n);
         n:=1;
         i:=i+1;
         writeln('\\');
end;
End.


