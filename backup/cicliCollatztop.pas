//28/02/2021 16:34:24
program cicliCollatztop;

uses
 Sysutils, vettori, stampa, Mytype, MyMath, MyUtility;


var
  tfOut: TextFile;
  tfcsvOut: TextFile;
  tfcsvtopOut: TextFile;
   n,nc: Qword;
   m,im, i: Qword;
   maxcontatore: Qword;

   contatore: Qword;
   numeri : MyType_arrayQword;  // lunghezza ciclo   per il numer
   topciclo,maxciclo : MyType_arrayQword;// valore massimo ciclo per il numero

   contatori : MyType_arrayQword; // frequenza lunghezza ciclo
   linea:string;
   vett: MyType_arrayQword;

{$R *.res}

Begin
 AssignFile(tfOut, MioType_C_FNAME); // file out per il file tex
     rewrite(tfOut) ;
  AssignFile(tfcsvOut, MioType_CSVNUM_FNAME); // file cvs per contatori
   rewrite(tfcsvOut) ;
   AssignFile(tfcsvtopOut, MioType_CSVTOP_FNAME); // file cvs per topciclo
   rewrite(tfcsvtopOut) ;
Vettori_azzera(contatori, MyType_Max_Numero);
Vettori_azzera(topciclo, MyType_Max_Numero);
linea:=MyUtility_lineatabella(MyType_Max_Rigamezza-1);


Stampa_stampatitolocapitolo(tfOut,'Congettura di Collatz','A006577');
maxcontatore:=0;   // valore piu lungo del ciclo
Stampa_stampauno_Semplificata(tfOut,'Cicli',MyType_Max_Rigamezza);
for m:=1 to MyType_Max_Numero do
Begin    // ciclo calcolo Collatz
   n:=m;
   contatore:=0;
   writeln(tfOut);
  // writeln(tfOut,'\midrule');
   writeln(tfOut,m,linea);
   nc:=1;
   Repeat
      n:=Matematica_Collatz(n);
                         if nc<MyType_Max_Rigamezza then
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

  Stampa_stampatitolosezione(tfOut,'Lunghezza ciclo');
  Stampa_stampauno_Semplificata(tfOut,'Lunghezza ciclo',MyType_Max_Rigamezza+6);
    m:=1;
    nc:=1;
while m<= MyType_Max_Numero do
    Begin
       if nc<MyType_Max_Rigamezza+6 then
                             begin
                             write(tfOut,numeri[m],'& ');
                             nc:=nc+1;
                             end
                             else
                             begin
                             write(tfOut,numeri[m],'\\');
                              writeln(tfOut);
                             nc:=1;
                             end;
          //Stampa_stampalinea_Semplificata(tfOut,m,numeri);
          //m:=m+MyType_Max_Riga;
          m:=m+1;
    End;
    if nc<>1 then writeln(tfOut,'\\');
Stampa_chiusuralong(tfOut);
Stampa_stampatitolosezione(tfOut,'Frequenza cicli');
  Stampa_stampadue(tfOut);
  m:=1;
while m<= maxcontatore  do
    Begin
       Stampa_stampalinea(tfOut,m,contatori);
       m:=m+6;
    End;
Stampa_chiusuralong(tfOut);
Stampa_stampatitolosezione(tfOut,'Valori massini');
Stampa_stampatre(tfOut);
m:=1;
 while m<= MyType_Max_Numero  do
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
while n<=MyType_Max_Numero do
begin
Stampa_stampacsv(tfcsvtopOut,n,topciclo);
n:=n+1;
end;

Writeln('massimo ciclo', maxcontatore);

for n:=1 to MyType_Max_Numero do vett[n]:=topciclo[n];   //viene duplicato topciclo
Vettori_boubledec(vett);     // viene ordinato in senso decrescete vett
Vettori_azzeradoppivet(vett);  // vengono tolti da vett i valori duplicati
   Vettori_boublecre(vett);  //ordina vett in modo crescente
   im:=1;
   for i:=1 to  MyType_Max_Numero do   //estrai da vett i valori diversi da zero
   begin
   if vett[i]<>0 then
       begin
            maxciclo[im]:=vett[i];
            im:=im+1;
       end;
   end;
   im:=im-1;// correzione indice
    Stampa_stampatitolosezione(tfOut,'Cicli massini');
   //Stampa_stampaquattro(tfOut);
   Stampa_stampauno_Semplificata(tfOut,'Cicli massini',MyType_Max_Rigamezza+6);
  m:=1;
  nc:=1;
 while m<= im  do
  begin
  if nc<MyType_Max_Rigamezza+6 then
                             begin
                             write(tfOut,maxciclo[m],'& ');
                             nc:=nc+1;
                             end
                             else
                             begin
                             write(tfOut,maxciclo[m],'\\');
                              writeln(tfOut);
                             nc:=1;
                             end;

   m:=m+1;
  end;
   if nc<>1 then writeln(tfOut,'\\');



    //Begin
    //     Stampa_stampalinea_Semplificatanozero(tfOut,m,maxciclo);
    //      m:=m+12;
    //End;
   Stampa_chiusuralong(tfOut);
   Stampa_stampatitolosezione(tfOut,'Cicli massimi comuni');
 Stampa_stampauno_Semplificata(tfOut,'Cicli massimi comuni',MyType_Max_Riga);
i:=1;
nc:=1;
linea:=MyUtility_lineatabella(MyType_Max_Riga-1);
while i <= im do
begin
writeln(tfOut,maxciclo[i],linea);
     for m:=1 to  MyType_Max_Numero do
     begin
          if topciclo[m]=maxciclo[i]
          then

                     begin
                         if nc<MyType_Max_Riga then
                                    begin
                                    write(tfOut,m,'& ');
                                    nc:=nc+1;
                                    end
                         else
                         begin
                           write(tfOut,m,'\\');
                            writeln(tfOut);
                          nc:=1;
                         end;
                     end;

     end;
         i:=i+1;
    if nc<>1 then writeln(tfOut,'\\');

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


