with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Float_Text_IO;	use Ada.Float_Text_IO;

procedure Bernoulli_Numbers is
   N : constant Integer := 33; -- From 0 to 33
   type Float_Array is array (0 .. N) of Long_Float; -- Long Float for a better precision
   B : Float_Array;
   function Binomial(N, K : Integer) return Long_Float is
      Result : Long_Float := 1.0;
   begin
      if K > N or else K < 0 then
         return 0.0;
      end if;
      for I in 1 .. K loop
         Result := Result * Long_Float(N - I + 1) / Long_Float(I);
      end loop;
      return Result;
   end Binomial;
 
begin
   B(0) := 1.0;
   for M in 1 .. N loop
      B(M) := 0.0;
      for K in 0 .. M - 1 loop
         B(M) := B(M) - Binomial(M + 1, K) * B(K);
      end loop;
      B(M) := B(M) / Long_Float(M + 1);
   end loop;

   Put_Line("Bernoulli Numbers from B0 to B" & Integer'Image(N));
   for I in 0 .. N loop
      Put("B");
      Put(Integer'Image(I));
      Put(" = ");
      Put(B(I), Fore => 1, Aft => 10, Exp => 0);
      New_Line;
   end loop;

end Bernoulli_Numbers;
