unit utli;

{$mode objfpc}{$H+}

interface
     procedure creaout(t:TextFile);
uses
  Classes, SysUtils;

implementation
         procedure creaout(t:TextFile);
         begin
           if FileExists(t)then reset(t) else rewrite(t);
         end;
end.

