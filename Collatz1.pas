Program Collatz1;
Var
   n: LongInt;
Begin
   ReadLn(n);
   Repeat
      If(n mod 2 = 0) Then
         n:=n Div 2
      Else
         n:=3*n+1;
      Write(n, ' ');
   Until(n = 1);
   ReadLn;
End.
