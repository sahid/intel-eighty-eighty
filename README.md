intel-eighty-eighty
===================

Implementation of the 8-bit microprocessor Intel 8080 in Ada
(In developpement, test purpose...)

How use it
----------

Define a pointer on Memory:
    Buffer : Memory_Access := new Memory(0 .. 16#2000#);

The package provides a Memory IO based on Sequential IO:
       Memory_IO.Open (File => Mem,
                       Mode => Memory_IO.In_File,
		       Name => "file.rom");
       Memory_IO.Read (File => Mem,
                       Item => Buffer.all);
       Memory_IO.Close (Mem);

       SetMemory(Buffer);

       Step;

       Free(Buffer);
