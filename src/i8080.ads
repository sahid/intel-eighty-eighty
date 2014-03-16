--
--
--
--

with Ada.Sequential_IO;
with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

package I8080 is
   type Byte is range 0 .. 2 ** 8 - 1;
   type Word is range 0 .. 2 ** 16 - 1;
   
   type Memory_Addr is range 0 .. 16#1000# - 1;
   type Memory is array (Memory_Addr) of Byte;
   type Memory_Access is access Memory;
   
   procedure Free is
      new Ada.Unchecked_Deallocation (Object => Memory,
				      Name => Memory_Access);
   
   package Byte_IO is new Ada.Text_IO.Integer_IO (Byte);
   package Memory_IO is new Ada.Sequential_IO (Memory);
   
   Sp : Word;
   Pc : Word;
   
   F : Byte;
   A : Byte;
   
   B : Byte;
   C : Byte;
   
   D : Byte;
   E : Byte;
   
   H : Byte;
   L : Byte;
   
   Ram : Memory_Access;
   
   function BC return Word;
   function DE return Word;
   function HL return Word;
   
   procedure Step;
   procedure Reset;
   
   procedure SetRam (Mem : Memory_Access);
   
   procedure WriteByte (Addr : Word; Value : Byte);
   function ReadByte (Addr : Word) return Byte;
   
end I8080;
