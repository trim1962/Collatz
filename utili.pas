unit utili;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;
   procedure creaout(var x:TextFile;t:string);
implementation
          procedure creaout(const t; var x:TextFile);
         begin
           if FileExists(t)then reset(x) else rewrite(x);
         end;
end.

