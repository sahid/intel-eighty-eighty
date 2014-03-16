--
--
--
--

with Ada.Text_IO;
with Interfaces;

use Interfaces;

package body I8080 is
   function BC return Word is
   begin
      return Word (Shift_Left (Unsigned_64 (B), 8) or Unsigned_64 (C));
   end;
   
   function DE return Word is
   begin
      return Word (Shift_Left (Unsigned_64 (D), 8) or Unsigned_64 (E));
   end;
   
   function HL return Word is
   begin
      return Word (Shift_Left (Unsigned_64 (H), 8) or Unsigned_64 (L));
   end;
   
   procedure Reset is
   begin
      Pc := 0;
      Sp := 16#F000#;
      
      B := 0;
      C := 0;
      D := 0;
      E := 0;
      H := 0;
      L := 0;
      A := 0;
      F := 0;
   end;
      
   procedure SetRam (Mem : Memory_Access) is
   begin
      Ram := Mem;
   end;
   
   procedure WriteByte (Addr : Word; Value : Byte) is
   begin
      Ram (Memory_Addr (Addr)) := Value;
   end;
   
   function ReadByte (Addr : Word) return Byte is
   begin
      return Ram (Memory_Addr (Addr));
   end;
   
   procedure Step is
      Opcode : Byte := ReadByte (Pc);
   begin
      case Opcode is
	 when 16#00# =>
	    --  NOP
	    null;
	 when 16#01# =>
	    --  LXI B, D16
	    B := ReadByte (Pc + 2);
	    C := ReadByte (Pc + 1);
	    Pc := Pc + 2;
	 when 16#02# =>
	    --  STAX B
	    --  B := A and 16#FF00#;
	    --  C := A and 16#00FF#;
	    null;
	 when others =>
	    null;
      end case;
      
      Pc := Pc + 1;
   end;
end I8080;
