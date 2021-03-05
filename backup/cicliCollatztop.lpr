//28/02/2021 16:34:24
program cicliCollatztop;

uses
 Sysutils, stampa, MioType, vettori, matematica;


var
  tfOut: TextFile;
  tfcsvOut: TextFile;
  tfcsvtopOut: TextFile;
   n,nc: Qword;
   m,im, i: Qword;
   maxcontatore: Qword;

   contatore: Qword;
   numeri : MioType_mioarray;  // lunghezza ciclo   per il numer
   topciclo,maxciclo : MioType_mioarray;// valore massimo ciclo per il numero

   contatori : MioType_mioarray; // frequenza lunghezza ciclo
   linea:string;
   lunglinea:integer;
   vett: MioType_mioarray;

{$R *.res}

Begin
 AssignFile(tfOut, MioType_C_FNAME); // file out per il file tex
     rewrite(tfOut) ;
  AssignFile(tfcsvOut, MioType_CSVNUM_FNAME); // file cvs per contatori
   rewrite(tfcsvOut) ;
   AssignFile(tfcsvtopOut, MioType_CSVTOP_FNAME); // file cvs per topciclo
   rewrite(tfcsvtopOut) ;
Vettori_azzera(contatori, MioType_t_max);
Vettori_azzera(topciclo, MioType_t_max);
linea:='\midrule';
for lunglinea:=1 to 11 do
AppendStr(linea,'&');
 AppendStr(linea,'\\');
Stampa_stampatitolo(tfOut);
maxcontatore:=0;   // valore piu lungo del ciclo
 Stampa_stampacinque(tfOut,'Cicli');
for m:=1 to MioType_t_max do
Begin    // ciclo calcolo Collatz
   n:=m;
   contatore:=0;
   writeln(tfOut);
  // writeln(tfOut,'\midrule');
   writeln(tfOut,m,linea);
   nc:=1;
   Repeat
      n:=Matematica_Collatz(n);
                         if nc<MioType_LungLineamax then
                             begin
                             write(tfOut,n,'& ');
                             nc:=nc+1;
                             end
                             else
                             begin
                             write(tfOut,n,'\\');
                              writeln(tfOut);
                             nc:=1;
                             end;
      contatore:=contatore + 1;
      if n > topciclo[m]then topciclo[m]:=n;  //valore più alto raggiunto
   Until(n = 1);
   // writeln(nc);
if nc<>1 then writeln(tfOut,'\\');
   if contatore > maxcontatore then maxcontatore:=contatore;     // valore piu lungo del ciclo
   contatori[contatore]:= contatori[contatore]+1;
   numeri[m]:=contatore;
end;
Stampa_chiusuralong(tfOut);
  m:=1;
  Stampa_stampauno_Semplificata(tfOut,'Lunghezza ciclo');
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
   Stampa_stampaquattro(tfOut);
  m:=1;
 while m<= im  do
    Begin
         Stampa_stampalinea_Semplificatanozero(tfOut,m,maxciclo);
          m:=m+12;
    End;
   Stampa_chiusuralong(tfOut);
 Stampa_stampacinque(tfOut,'Cicli massimi comuni');
i:=1;
n:=1;


while i <= im do
begin
writeln(tfOut,maxciclo[i],linea);
     for m:=1 to  MioType_t_max do
     begin
          if topciclo[m]=maxciclo[i]
          then
           //   if n<= MioType_LungLineamax
             //    then
                     begin
                         if n<MioType_LungLineamax then
                                    begin
                                    write(tfOut,m,'& ');
                                    n:=n+1;
                                    end
                         else
                         begin
                           write(tfOut,m,'\\');
                            writeln(tfOut);
                          n:=1;
                         end;
                     end
                 //else
                    // begin
                         // n:=1;
                         // writeln(tfOut,'\\');
                    // end;
     end;
  //writeln('n= ',n);
         i:=i+1;
    if n<>1 then writeln(tfOut,'\\');

end;
Stampa_chiusuralong(tfOut);
CloseFile(tfcsvOut);
CloseFile(tfcsvtopOut);
CloseFile(tfOut);
for m:=1 to im do
Begin    // ciclo calcolo Collatz
   n:=maxciclo[m];
   contatore:=0;
   Repeat
      n:=Matematica_Collatz(n);
      Writeln('m=',' ',m,' ', 'n=',n);
      contatore:=contatore + 1;
   Until(n = 1);
   Writeln;
   Writeln ('m= ',maxciclo[m] ,' ','contatore=  ', contatore);
end;
End.


