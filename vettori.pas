unit Vettori;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,MioType;
   procedure Vettori_boubledec(var vet:MioType_mioarray);
   procedure Vettori_boublecre(var vet:MioType_mioarray);
   procedure Vettori_stampavet(var vet:MioType_mioarray);
   procedure Vettori_azzeradoppivet(var vet:MioType_mioarray);
   procedure Vettori_azzera(var vet:MioType_mioarray; max:Qword);
implementation
procedure Vettori_boubledec(var vet:MioType_mioarray);
var
  scambio : boolean;
  i,temp:Qword;
begin
  repeat
scambio:=false;
for i:=1 to MioType_t_max-1 do
begin
   if vet[i] < vet[i+1] then
      begin
        temp := vet[i];
        vet[i] := vet[i+1];
         vet[i+1] := temp;
         scambio := true;
      end;
end;

until (scambio = false);
end;
 procedure Vettori_boublecre(var vet:MioType_mioarray);
var
  scambio : boolean;
  i,temp:Qword;
begin
  repeat
scambio:=false;
for i:=1 to MioType_t_max-1 do
begin
   if vet[i] > vet[i+1] then
      begin
        temp := vet[i];
        vet[i] := vet[i+1];
         vet[i+1] := temp;
         scambio := true;
      end;
end;

until (scambio = false);
end;
procedure Vettori_stampavet(var vet:MioType_mioarray);
var
  n:Qword;
  begin
    for n:=1 to MioType_t_max do writeln(vet[n]);
  end;
   procedure Vettori_azzeradoppivet(var vet:MioType_mioarray);
   var
     i,j:Qword;
     begin
   i:=2;
j:=1;
repeat
if vet[i]=vet[j] then vet[i]:=0 else j:=i;
i:=i+1;
until i>MioType_t_max;
     end;
  procedure Vettori_azzera(var vet:MioType_mioarray; max:Qword);
  var
    i:Qword;
    begin
    for i:=1 to max do vet[i]:=0;
    end;

end.

