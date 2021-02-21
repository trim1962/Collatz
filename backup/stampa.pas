unit stampa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,MioType;
  procedure stampauno(var t:textfile);
  procedure stampadue(var t:textfile);
  procedure stampatre(var t:textfile);
  procedure chiusuralong(var t:textfile);
  procedure stampalinea(var t:textfile;var m:Qword;var numeri:mioarray);
  procedure stampacsv(var t:textfile;var m:Qword;var numeri:mioarray);
implementation
procedure stampauno(var t:textfile);
begin
Writeln(t,'\chapter{Congettura di Collatz}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t ,   '\caption{Numero e lunghezza ciclo}\\');
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
procedure stampalinea(var t:textfile;var m:Qword;var numeri:mioarray);
begin
   Writeln(t,m,' & ',numeri[m],'&',m+1,' &',numeri[m+1],'&',m+2,'& ',numeri[m+2],'&',m+3,' &',numeri[m+3],'&',m+4,' &',numeri[m+4],'&',m+5,'& ',numeri[m+5],'\\');
end;
procedure chiusuralong(var t:textfile);
begin
  Writeln(t,'\bottomrule','\end{longtable}');
end;
procedure stampadue(var t:textfile);
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
procedure stampatre(var t:textfile);
 begin
Writeln(t,'\section{Valori massini}');
Writeln(t ,'\begin{longtable}{llllllllllll}\toprule');
 Writeln(t ,   '\caption{Valori massimi}\\');
 Writeln(t , '\midrule');
 Writeln(t , '\textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}\\');
 Writeln(t ,'\midrule');
 Writeln(t ,'\endfirsthead' );
  Writeln(t ,'\multicolumn{12}{N} {\tablename\ \thetable\ -- \textit{Continua dalla pagina precedente}} \\');
  Writeln(t , '\textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}& \textbf{N} & \textbf{R} & \textbf{N} & \textbf{R}\\');
  Writeln(t , '\toprule');
  Writeln(t ,'\endhead');
  Writeln(t ,'\bottomrule');
  Writeln(t ,'\multicolumn{12}{r} {\textit{Continua nella pagina successiva}} \\');
  Writeln(t ,'\endfoot' );

  Writeln(t ,'\endlastfoot');
end;
procedure stampacsv(var t:textfile;var m:Qword;var numeri:mioarray);
begin
 writeln(t,m,';',numeri[m]);
end;


end.

