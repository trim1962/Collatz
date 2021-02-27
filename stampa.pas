unit stampa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,MioType;
  procedure Stampa_stampauno(var t:textfile);
  procedure Stampa_stampauno_Semplificata(var t:textfile);
  procedure Stampa_stampadue(var t:textfile);
  procedure Stampa_stampatre(var t:textfile);
  procedure Stampa_stampaquattro(var t:textfile);
  procedure Stampa_chiusuralong(var t:textfile);
  procedure Stampa_stampalinea(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
  procedure Stampa_stampalinea_Semplificata(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
  procedure Stampa_stampalinea_Semplificatanozero(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
  procedure Stampa_stampacsv(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
  function  Stampa_stampasenonzero(t:Qword):string;
implementation
procedure Stampa_stampauno(var t:textfile);
begin
Writeln(t,'\chapter{Congettura di Collatz}');
Writeln(t,'\citaoeis{A006577}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t , '\caption{Lunghezza ciclo}\\');
 Writeln(t , '\midrule');
 Writeln(t , '\textbf{n} & \textbf{l} & \textbf{n} & \textbf{l}& \textbf{n} & \textbf{l} & \textbf{n} & \textbf{l}& \textbf{n} & \textbf{l} & \textbf{n} & \textbf{l}\\');
 Writeln(t ,'\midrule');
 Writeln(t ,'\endfirsthead' );
  Writeln(t ,'\multicolumn{12}{c} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(t , '\textbf{n} & \textbf{l} & \textbf{n} & \textbf{l}& \textbf{n} & \textbf{l} & \textbf{n} & \textbf{l}& \textbf{n} & \textbf{l} & \textbf{n} & \textbf{l}\\');
  Writeln(t , '\toprule');
  Writeln(t ,'\endhead');
  Writeln(t ,'\bottomrule');
  Writeln(t ,'\multicolumn{12}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(t ,'\endfoot' );
  Writeln(t ,'\endlastfoot');
end;
procedure Stampa_stampauno_Semplificata(var t:textfile);
begin
Writeln(t,'\chapter{Congettura di Collatz}');
Writeln(t,'\citaoeis{A006577}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t , '\caption{Lunghezza ciclo}\\');
 Writeln(t ,'\midrule');
 Writeln(t ,'\endfirsthead' );
  Writeln(t ,'\multicolumn{12}{c} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(t , '\toprule');
  Writeln(t ,'\endhead');
  Writeln(t ,'\bottomrule');
  Writeln(t ,'\multicolumn{12}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(t ,'\endfoot' );
  Writeln(t ,'\endlastfoot');
end;
procedure Stampa_stampalinea(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
begin
   Writeln(t,m,' & ',numeri[m],'&',m+1,' &',numeri[m+1],'&',m+2,'& ',numeri[m+2],'&',m+3,' &',numeri[m+3],'&',m+4,' &',numeri[m+4],'&',m+5,'& ',numeri[m+5],'\\');
end;
procedure Stampa_stampalinea_Semplificata(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
begin
   Writeln(t,numeri[m],' &',numeri[m+1],'& ',numeri[m+2],' &',numeri[m+3],' &',numeri[m+4],'& ',numeri[m+5],'&',numeri[m+6],' &',numeri[m+7],'& ',numeri[m+8],' &',numeri[m+9],' &',numeri[m+10],'& ',numeri[m+11],'\\');
end;
procedure Stampa_stampalinea_Semplificatanozero(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
begin
  Writeln(t,Stampa_stampasenonzero(numeri[m]),' &',Stampa_stampasenonzero(numeri[m+1]),'& ',Stampa_stampasenonzero(numeri[m+2]),' &',Stampa_stampasenonzero(numeri[m+3]),' &',Stampa_stampasenonzero(numeri[m+4]),'& ',Stampa_stampasenonzero(numeri[m+5]),'&',Stampa_stampasenonzero(numeri[m+6]),' &',Stampa_stampasenonzero(numeri[m+7]),'& ',Stampa_stampasenonzero(numeri[m+8]),' &',Stampa_stampasenonzero(numeri[m+9]),' &',Stampa_stampasenonzero(numeri[m+10]),'& ',Stampa_stampasenonzero(numeri[m+11]),'\\');
end;
procedure Stampa_chiusuralong(var t:textfile);
begin
  Writeln(t,'\bottomrule','\end{longtable}');
end;
procedure Stampa_stampadue(var t:textfile);
 begin
Writeln(t,'\section{Frequenza cicli}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t ,   '\caption{Frequenza cicli}\\');
 Writeln(t , '\midrule');
 Writeln(t , '\textbf{c} & \textbf{f} & \textbf{c} & \textbf{f}& \textbf{c} & \textbf{f} & \textbf{c} & \textbf{f}& \textbf{c} & \textbf{f} & \textbf{c} & \textbf{f}\\');
 Writeln(t ,'\midrule');
 Writeln(t ,'\endfirsthead' );
  Writeln(t ,'\multicolumn{12}{c} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(t , '\textbf{c} & \textbf{f} & \textbf{c} & \textbf{f}& \textbf{c} & \textbf{f} & \textbf{c} & \textbf{f}& \textbf{c} & \textbf{f} & \textbf{c} & \textbf{f}\\');
  Writeln(t , '\toprule');
  Writeln(t ,'\endhead');
  Writeln(t ,'\bottomrule');
  Writeln(t ,'\multicolumn{12}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(t ,'\endfoot' );

  Writeln(t ,'\endlastfoot');
end;
procedure Stampa_stampatre(var t:textfile);
 begin
Writeln(t,'\section{Valori massini}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t ,   '\caption{Valori massimi}\\');
 Writeln(t , '\midrule');
 Writeln(t , '\textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}\\');
 Writeln(t ,'\midrule');
 Writeln(t ,'\endfirsthead' );
  Writeln(t ,'\multicolumn{12}{c} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(t , '\textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}\\');
  Writeln(t , '\toprule');
  Writeln(t ,'\endhead');
  Writeln(t ,'\bottomrule');
  Writeln(t ,'\multicolumn{12}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(t ,'\endfoot' );

  Writeln(t ,'\endlastfoot');
end;
procedure Stampa_stampaquattro(var t:textfile);
 begin
Writeln(t,'\section{Cicli massini}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t ,   '\caption{Cicli massimi}\\');
 Writeln(t , '\midrule');
// Writeln(t ,'\midrule');
 Writeln(t ,'\endfirsthead' );
  Writeln(t ,'\multicolumn{12}{c} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(t , '\toprule');
  Writeln(t ,'\endhead');
  Writeln(t ,'\bottomrule');
  Writeln(t ,'\multicolumn{12}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(t ,'\endfoot' );
  Writeln(t ,'\endlastfoot');
end;
procedure Stampa_stampacsv(var t:textfile;var m:Qword;var numeri:MioType_mioarray);
begin
 writeln(t,m,';',numeri[m]);
end;

function  Stampa_stampasenonzero(t:Qword):string;
begin
 if t <>0 then Stampa_stampasenonzero:=IntToStr(t)else Stampa_stampasenonzero:='';
end;

end.

