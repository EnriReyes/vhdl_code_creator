// await _componentesDTO.insertarComponente(
//       "Sumador-Restador",
//       "Sumador-Restador",
//       "Bloques combinacionales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;

// entity sum_res is
//     generic(n:integer:=N_valor_parametrizable);
//     Port ( A : in  STD_LOGIC_VECTOR (n downto 0);
//            B : in  STD_LOGIC_VECTOR (n downto 0);
// 			  M : in STD_LOGIC;
//            SUMA : out  STD_LOGIC_VECTOR (n downto 0));
// end sum_res;

// architecture Behavioral of sum_res is

// begin

// process (A,B)
	
// variable i: integer;
// variable CI: std_logic_vector (n+1 downto 0);
		
// begin
		
// CI(0):= M; 
			
// for i in 0 to n loop
			
// SUMA(i)<= A(i)xor (M xor B(i)) xor CI(i);
// CI(i+1):= (A(i) and (M xor B(i)))or ((A(i) xor (M xor B(i))) and CI(i));
			
// end loop;
			

			
// end process;

// end Behavioral;''',
//"",
//     );

                    
        
//     await _componentesDTO.insertarValorParametrizable("N", "Número de bits de datos", 1);

//     await _componentesDTO.insertarComponenteValorParametrizable("Sumador-Restador", "N");

//     await _componentesDTO.insertarComponente(
//       "Biestable D asincrono",
//       "Biestable D",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;

// entity biestabled_asincrono is
//     Port ( D : in  STD_LOGIC;
//            clk : in  STD_LOGIC;
//            reset : in  STD_LOGIC;
// 	      Q : out  STD_LOGIC);
// end biestabled_asincrono;

// architecture Behavioral of biestabled_asincrono is

// begin

// process(clk,reset)

// begin

// 	if (reset='1')then
// 	Q<='0';
// 	elsif (rising_edge (clk)) then
// 	Q<=D;
// 	end if;
	
// end process;

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
 
 
// ENTITY biestabled_asincrono_tb IS
// END biestabled_asincrono_tb;
 
// ARCHITECTURE behavior OF biestabled_asincrono_tb IS 
 
    
//     COMPONENT biestabled_asincrono
//     PORT(
//          D : IN  std_logic;
//          clk : IN  std_logic;
//          reset : IN  std_logic;
//          Q : OUT  std_logic
//         );
//     END COMPONENT;
    

   
//    signal D : std_logic := '0';
//    signal clk : std_logic := '0';
//    signal reset : std_logic := '0';

 	
//    signal Q : std_logic;


//    constant clk_period : time := 10 ns;
 
// BEGIN
 
// 	   uut: biestabled_asincrono PORT MAP (
//           D => D,
//           clk => clk,
//           reset => reset,
//           Q => Q
//         );

//    clk_process :process
//    begin
// 		clk <= '0';
// 	wait for 50 ns;
// 	clk <= '1';
// 	wait for 50 ns;
// 	end process;

 


//    stim_proc: process
//    begin		
//       D<='1';reset<='1';
//       wait for 100 ns;	
// 		D<='1';reset<='0';
// 		wait for 100 ns;	
// 		D<='1';reset<='1';
// 		wait for 100 ns;
// 		D<='1';reset<='0';
//       wait;
//    end process;

// END;'''
// );

// await _componentesDTO.insertarComponente(
//       "Biestable D sincrono",
//       "Biestable D",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;


// entity biestabled_sincrono is
//     Port ( D : in  STD_LOGIC;
//            clk : in  STD_LOGIC;
//            reset : in  STD_LOGIC;
//            Q : out  STD_LOGIC);
// end biestabled_sincrono;

// architecture Behavioral of biestabled_sincrono is

// begin

// process(clk,reset)

// begin

// 	if (falling_edge(clk))then
// 		if (reset='0') then   
// 		Q<='0';
// 		else
// 		Q<=D;
// 		end if;
// 	end if;
	
// end process;

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
 
 
// ENTITY biestabled_sincrono_tb IS
// END biestabled_sincrono_tb;
 
// ARCHITECTURE behavior OF biestabled_sincrono_tb IS 
 
 
//     COMPONENT biestabled_sincrono
//     PORT(
//          D : IN  std_logic;
//          clk : IN  std_logic;
//          reset : IN  std_logic;
//          Q : OUT  std_logic
//         );
//     END COMPONENT;
    

//    signal D : std_logic := '0';
//    signal clk : std_logic := '0';
//    signal reset : std_logic := '0';

//    signal Q : std_logic;

//    constant clk_period : time := 10 ns;
 
// BEGIN
 
// 	   uut: biestabled_sincrono PORT MAP (
//           D => D,
//           clk => clk,
//           reset => reset,
//           Q => Q
//         );

//    clk_process :process
//    begin
// 		clk <= '0';
// 	wait for 50 ns;
// 	clk <= '1';
// 	wait for 50 ns;
// 	end process;

 

//    stim_proc: process
//    begin		
//       D<='1';reset<='1';
//       wait for 100 ns;	
// 		D<='1';reset<='0';
// 		wait for 100 ns;	
// 		D<='1';reset<='1';
// 		wait for 100 ns;
// 		D<='1';reset<='0';
//       wait;
//    end process;

// END;''',);

// await _componentesDTO.insertarComponente(
//       "Biestable JK sincrono",
//       "Biestable JK",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;


// entity biestablejk_sincrono is
//     Port ( J : in  STD_LOGIC;
// 			  K : in STD_LOGIC;
//            clk : in  STD_LOGIC;
//            reset : in  STD_LOGIC;
//            Q : out  STD_LOGIC);
// end biestablejk_sincrono;

// architecture Behavioral of biestablejk_sincrono is

// signal dato: std_logic;

// begin

// process(clk)

// begin

// 	if (falling_edge(clk))then
// 		if (reset='0') then  

// 		dato<='0';
// 		else
// 			if (J='0' and K='0') then
// 			dato<=dato;
// 			elsif (J='0' and K='1') then
// 			dato<='0';
// 			elsif (J='1' and K='0') then
// 			dato<='1';
// 			else
// 			dato<=not(dato);
// 			end if;
// 		end if;
// 	end if;
	
// end process;

// Q<=dato;

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
 
 
// ENTITY biestablejk_sincrono_tb IS
// END biestablejk_sincrono_tb;
 
// ARCHITECTURE behavior OF biestablejk_sincrono_tb IS 
 
 
//     COMPONENT biestablejk_sincrono
//     PORT(
//          J : IN  std_logic;
// 	    K : IN std_logic;
//          clk : IN  std_logic;
//          reset : IN  std_logic;
//          Q : OUT  std_logic
//         );
//     END COMPONENT;
    

   
//    signal J : std_logic := '0';
//    signal K : std_logic := '0';
//    signal clk : std_logic := '0';
//    signal reset : std_logic := '0';

 	
//    signal Q : std_logic;

    
// BEGIN
 
// 	uut: biestablejk_sincrono PORT MAP (
//           J => J,
// 	     K=> K,
//           clk => clk,
//           reset => reset,
//           Q => Q
//         );

//    clk_process :process
//    begin

// 	clk <= '0';
// 	wait for 50 ns;
// 	clk <= '1';
// 	wait for 50 ns;
// 	end process;

 

//    stim_proc: process
//    begin		
//       J<='0';K<='0';reset<='0';
//       wait for 150 ns;	
// 	 reset<='1';
// 	 wait for 100 ns;	
// 	 J<='0';K<='1';
// 	 wait for 100 ns;
// 	 J<='1';k<='0';
// 	 wait for 100 ns;
// 	 J<='1';K<='1';
// 	 wait for 100 ns;
//       wait;
//    end process;

// END;''',);

// await _componentesDTO.insertarComponente(
//       "Biestable JK asincrono",
//       "Biestable JK",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;


// entity biestablejk_asincrono is
//     Port ( J : in  STD_LOGIC;
// 		 K : in STD_LOGIC;
//            clk : in  STD_LOGIC;
//            reset : in  STD_LOGIC;
//            Q : out  STD_LOGIC);
// end biestablejk_asincrono;

// architecture Behavioral of biestablejk_asincrono is

// signal dato: std_logic;

// begin

// process(clk)

// begin

// 	if (reset='1') then  

// 	dato<='0';
// 	elsif (rising_edge(clk)) then
// 		if (J='0' and K='0') then
// 		dato<=dato;
// 		elsif (J='0' and K='1') then
// 		dato<='0';
// 		elsif (J='1' and K='0') then
// 		dato<='1';
// 		else
// 		dato<=not(dato);
// 		end if;
// 	end if;
	
	
// end process;
// Q<=dato;
// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
 
 
// ENTITY biestablejk_asincrono_tb IS
// END biestablejk_asincrono_tb;
 
// ARCHITECTURE behavior OF biestablejk_asincrono_tb IS 
  
//     COMPONENT biestablejk_asincrono
//     PORT(
//          J : IN  std_logic;
// 			K : IN std_logic;
//          clk : IN  std_logic;
//          reset : IN  std_logic;
//          Q : OUT  std_logic
//         );
//     END COMPONENT;
    

//    signal J : std_logic := '0';
// 	signal K : std_logic := '0';
//    signal clk : std_logic := '0';
//    signal reset : std_logic := '0';

//     signal Q : std_logic;

    
// BEGIN
 
// 	   uut: biestablejk_asincrono PORT MAP (
//           J => J,
// 	     K=> K,
//           clk => clk,
//           reset => reset,
//           Q => Q
//         );

//    clk_process :process
//    begin
// 	clk <= '0';
// 	wait for 50 ns;
// 	clk <= '1';
// 	wait for 50 ns;
// 	end process;

 

//    stim_proc: process
//    begin		
//      J<='0';K<='0';reset<='1';
//      wait for 150 ns;	
// 	reset<='0';
// 	wait for 100 ns;	
// 	J<='0';K<='1';
// 	wait for 100 ns;
// 	J<='1';k<='0';
// 	wait for 100 ns;
// 	J<='1';K<='1';
// 	wait for 100 ns;
//      wait;
//    end process;

// END;''',);

// await _componentesDTO.insertarComponente(
//       "Biestable T asincrono",
//       "Biestable T",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;

// entity biestablet_sincrono is
//     Port ( T : in  STD_LOGIC;
//            clk : in  STD_LOGIC;
//            reset : in  STD_LOGIC;
//            Q : out  STD_LOGIC);
// end biestablet_sincrono;

// architecture Behavioral of biestablet_sincrono is

// signal dato: std_logic;

// begin

// process(clk)

// begin

// 	if (falling_edge(clk))then
// 		if (reset='0') then  

// 		dato<='0';
// 		else
// 			if (T='0') then
// 			dato<=dato;
// 			else
// 			dato<=not(dato);
// 			end if;
// 		end if;
// 	end if;
	
// end process;
// Q<=dato;
// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
 
 
// ENTITY biestablet_asincrono_tb IS
// END biestablet_asincrono_tb;
 
// ARCHITECTURE behavior OF biestablet_asincrono_tb IS 
 
     
//     COMPONENT biestablet_asincrono
//     PORT(
//          T : IN  std_logic;
//          clk : IN  std_logic;
//          reset : IN  std_logic;
//          Q : OUT  std_logic
//         );
//     END COMPONENT;
    

//    signal T : std_logic := '0';
//    signal clk : std_logic := '0';
//    signal reset : std_logic := '0';

//    signal Q : std_logic;

 
// BEGIN
 
//    uut: biestablet_asincrono PORT MAP (
//           T => T,
//           clk => clk,
//           reset => reset,
//           Q => Q
//         );

//    clk_process :process
//    begin
// 		clk <= '0';
// 	wait for 50 ns;
// 	clk <= '1';
// 	wait for 50 ns;
// 	end process;

 

//    stim_proc: process
//    begin		
//       T<='0';reset<='1';
//       wait for 150 ns;	
// 	 reset<='0';
// 	 wait for 100 ns;	
// 	 T<='1';
// 	 wait for 100 ns;
//       wait;
//    end process;

// END;''');

// await _componentesDTO.insertarComponente(
//       "Biestable T sincrono",
//       "Biestable T",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;


// entity biestablet_asincrono is
//     Port ( T : in  STD_LOGIC;
//            clk : in  STD_LOGIC;
//            reset : in  STD_LOGIC;
//            Q : out  STD_LOGIC);
// end biestablet_asincrono;

// architecture Behavioral of biestablet_asincrono is

// begin

// process(clk,reset)

// begin
// 	if (reset='0') then  
// 		dato<='0';
// 	else
// 		if (falling_edge(clk))then
// 			if (T='0') then
// 			dato<=dato;
// 			else
// 			dato<=not(dato);
// 			end if;
// 		end if;
// 	end if;
	
// end process;
// Q<=dato;
// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
 
 
// ENTITY biestablet_sincrono_tb IS
// END biestablet_sincrono_tb;
 
// ARCHITECTURE behavior OF biestablet_sincrono_tb IS 
 
 
// COMPONENT biestablet_sincrono
//     PORT(
//          T : IN  std_logic;
//          clk : IN  std_logic;
//          reset : IN  std_logic;
//          Q : OUT  std_logic
//         );
// END COMPONENT;
    

   
//    signal T : std_logic := '0';
//    signal clk : std_logic := '0';
//    signal reset : std_logic := '0';

//    signal Q : std_logic;

  
// BEGIN
 
// 	   uut: biestablet_sincrono PORT MAP (
//           T => T,
//           clk => clk,
//           reset => reset,
//           Q => Q
//         );

// clk_process :process
//    begin
// 		clk <= '0';
// 	wait for 50 ns;
// 	clk <= '1';
// 	wait for 50 ns;
// end process;

 

//  stim_proc: process
//    begin		
//       T<='0';reset<='0';
//       wait for 150 ns;	
// 	 D<='1';reset<='1';
// 	 wait for 100 ns;	
// 	 T<='1';
// 	 wait for 100 ns;
//       wait;
//    end process;

// END;''');

// await _componentesDTO.insertarComponente(
//       "Codificador",
//       "Codificador",
//       "Bloques combinacionales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;
// use ieee.numeric_std.all;


// entity codificador is
// generic (n: integer:=N_valor_parametrizable); 
//     Port ( entrada : in  STD_LOGIC_VECTOR ((2**n)-1 downto 0);
// 	      salida : out STD_LOGIC_VECTOR (n-1 downto 0));
// end codificador;

// architecture Behavioral of codificador is


// begin


// process (entrada)

// begin

// for i in 0 to (2**n)-1 loop

// 	if (entrada(i)='1') then
// 		salida<=std_logic_vector(to_unsigned(i,n)); 
// 	end if;

// end loop;

// end process;

// end Behavioral;''',
// '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;
// use ieee.numeric_std.all;
 
 
// ENTITY codificador_tb IS
// generic (n: integer:=N_valor_parametrizable); 
// END codificador_tb;
 
// ARCHITECTURE behavior OF codificador_tb IS 
 
//    COMPONENT codificador
//     generic (n: integer:=N_valor_parametrizable); 
//     Port ( entrada : in  STD_LOGIC_VECTOR ((2**n)-1 downto 0);
// 	      salida : out STD_LOGIC_VECTOR (n-1 downto 0));
// end component;


  
//    signal entrada : std_logic_vector((2**n)-1 downto 0) := (others => '0');

 	
//    signal salida : std_logic_vector(n-1 downto 0);
 
// BEGIN
 
// 	uut: codificador generic map(n=>N_valor_parametrizable)
// 		PORT MAP (
//           entrada => entrada,
//           salida => salida
//           );

 

//    stim_proc: process
//    begin		
//       entrada<=std_logic_vector(to_unsigned(8, 2**n));
//       wait for 100 ns;	
// 	 entrada<=std_logic_vector(to_unsigned(4, 2**n));
//       wait for 100 ns;	
//    	 entrada<=std_logic_vector(to_unsigned(2,2**n));
//       wait for 100 ns;
//    	 entrada<=std_logic_vector(to_unsigned(1, 2**n));
//       wait for 100 ns;	
//       wait;
//    end process;

// END;''',);

//     await _componentesDTO.insertarComponenteValorParametrizable("Codificador", "N");

// await _componentesDTO.insertarComponente(
//       "Decodificador",
//       "Decodificador",
//       "Bloques combinacionales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;

// entity deco is
// generic (n: integer:=N_valor_parametrizable); 
//     Port (entrada : in  STD_LOGIC_VECTOR ((n-1) downto 0);
// 	     salida : out STD_LOGIC_VECTOR ((2**n)-1 downto 0));
// end deco;

// architecture Behavioral of deco is

// signal input: integer:=0;

// begin

// input<=conv_integer (unsigned(entrada));

// process (input)

// begin

// for i in 0 to (2**n)-1 loop

// 	if (i=input) then
// 		salida(i)<='1'; 
// 	else
// 		salida(i)<='0';
// 	end if;

// end loop;

// end process;

// end Behavioral;''',
// '''library IEEE;
// USE ieee.std_logic_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;
// use ieee.numeric_std.all;

// entity deco_tb is
// 	generic (n: integer:=N_valor_parametrizable);
    
// end deco_tb;

// architecture Behavioral of deco_tb is

// COMPONENT deco
// generic (n: integer:=N_valor_parametrizable);
//     Port ( entrada : in  STD_LOGIC_VECTOR (n-1 downto 0);
//            salida : out  STD_LOGIC_VECTOR ((2**n)-1 downto 0));
// END COMPONENT;			  
			  
//    signal entrada : std_logic_vector(n-1 downto 0) := (others => '0');


//    signal salida : std_logic_vector((2**n)-1 downto 0);
	
// signal input: integer:=0;

// begin


// 	   uut: deco 
// 	generic map (n=>N_valor_parametrizable)
// 	PORT MAP (
//           entrada => entrada,
//           salida => salida
//         );

//       stim_proc: process
//    begin		
// 		entrada<=std_logic_vector(to_unsigned(1, n));
//       wait for 100 ns;	
// 	   entrada<=std_logic_vector(to_unsigned(0, n));
//       wait for 100 ns;	
//    	entrada<=std_logic_vector(to_unsigned(3, n));
//       wait for 100 ns;
//    	entrada<=std_logic_vector(to_unsigned(2, n));
//       wait for 100 ns;			
//       wait;
//    end process;

// end Behavioral;''',);

//     await _componentesDTO.insertarComponenteValorParametrizable("Decodificador", "N");


// await _componentesDTO.insertarComponente(
//       "Demultiplexor",
//       "Demultiplexor",
//       "Bloques combinacionales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;
// use ieee.numeric_std.all;

// entity demux is
// generic (c: integer:=C_valor_parametrizable; 
// 	    n: integer:=N_valor_parametrizable); 
// Port (entrada : in  STD_LOGIC_VECTOR(n-1 downto 0);
//       control : in  STD_LOGIC_VECTOR (c-1 downto 0);
//       salida : out  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0));
// end demux;

// architecture Behavioral of demux is

// signal sel: integer:=0;

// begin

// sel<=conv_integer (control);

// process (sel,entrada)

// begin

// for i in 0 to (2**c)-1 loop

// 	if (sel=i) then
// 		salida(n*(i+1)-1 downto n*i)<=entrada; 
// 	else
// 		salida(n*(i+1)-1 downto n*i)<=std_logic_vector(to_unsigned(0,n));

// 	end if;

// end loop;

// end process;

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
// use ieee.numeric_std.all;
 
// ENTITY demux_tb IS
// generic (C: integer:=C_valor_parametrizable;
// 	    n: integer:=N_valor_parametrizable);
// END demux_tb;
 
// ARCHITECTURE behavior OF demux_tb IS 
 
    
//     COMPONENT demux
// 	 generic (C: integer:=C_valor_parametrizable;
// 		     n: integer:=N_valor_parametrizable);
//     Port ( entrada : in  STD_LOGIC_VECTOR (n-1 downto 0);
//            control : in  STD_LOGIC_VECTOR (c-1 downto 0);
//            salida : out  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0));
//     END COMPONENT;
    

// signal entrada : std_logic_vector (n-1 downto 0);
// signal control : std_logic_vector(c-1 downto 0) := (others => '0');

//  signal salida : std_logic_vector(((2**c)*n)-1 downto 0);
  
// BEGIN
 
//    uut: demux 
// 	    generic map (C=>C_valor_parametrizable,n=>N_valor_parametrizable)
// 	    PORT MAP (
//           entrada => entrada,
//           control => control,
//           salida => salida
// 			 );

//    stim_proc: process
//    begin		
    
//    	entrada<=std_logic_vector(to_unsigned(3,n));
// 		control<=std_logic_vector(to_unsigned(3,c));
//       wait for 100 ns;	
// 	   control<=std_logic_vector(to_unsigned(2,c));
//       wait for 100 ns;	
//    	control<=std_logic_vector(to_unsigned(1,c));
//       wait for 100 ns;
//    	control<=std_logic_vector(to_unsigned(0,c));
//       wait for 100 ns;			
//       wait;
		
//    end process;

// END;''',);
// await _componentesDTO.insertarValorParametrizable("C", "Número de entradas de control", 2);
// await _componentesDTO.insertarComponenteValorParametrizable("Demultiplexor", "N");
// await _componentesDTO.insertarComponenteValorParametrizable("Demultiplexor", "C");

// await _componentesDTO.insertarComponente(
//       "Multiplexor",
//       "Multiplexor",
//       "Bloques combinacionales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;

// entity mux_n is
// generic (n: integer:=N_valor_parametrizable; 
//          c: integer:=C_valor_parametrizable);
//     Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
//            control : in  STD_LOGIC_VECTOR (c-1 downto 0);
//            salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
// end mux_n;

// architecture Behavioral of mux_n is

// signal sel: integer:=0;

// begin

// sel<=conv_integer (unsigned(Control));

// Salida<=Datos(n*(sel+1)-1 downto n*sel);

// end Behavioral;''',
// '''
// USE ieee.std_logic_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;
// use ieee.numeric_std.all;
 

 
// ENTITY mux_tb IS
// generic (C: integer:=C_valor_parametrizable);
// END mux_tb;
 
// ARCHITECTURE behavior OF mux_tb IS 
 
    
//     COMPONENT multiplexor
// 	 generic (C: integer:=C_valor_parametrizable);
// 	     PORT(
//          Datos : IN  std_logic_vector(2**C-1 downto 0);
//          Control : IN  std_logic_vector(C-1 downto 0);
//          Salida : OUT  std_logic
//         );
//     END COMPONENT;
    

//    signal Datos : std_logic_vector(2**C-1 downto 0) := (others => '0');
//    signal Control : std_logic_vector(C-1 downto 0) := (others => '0');
//    signal Salida : std_logic;
 
// BEGIN
 
//    uut: multiplexor 
// 	generic map (C=>C_valor_parametrizable)
// 	PORT MAP (
//           Datos => Datos,
//           Control => Control,
//           Salida => Salida
//         );

//    stim_proc: process
//    begin		
// 		datos<=std_logic_vector(to_unsigned(6, 2**C));
// 		control<=std_logic_vector(to_unsigned(1, C));
//       wait for 100 ns;	
// 	   control<=std_logic_vector(to_unsigned(3, C));
//       wait for 100 ns;	
//    	control<=std_logic_vector(to_unsigned(2, C));
//       wait for 100 ns;
//    	control<=std_logic_vector(to_unsigned(0, C));
//       wait for 100 ns;			
//       wait;
//    end process;

// END;''');
// await _componentesDTO.insertarComponenteValorParametrizable("Multiplexor", "N");
// await _componentesDTO.insertarComponenteValorParametrizable("Multiplexor", "C");

// await _componentesDTO.insertarComponente(
//       "Comparador",
//       "Comparador",
//       "Bloques combinacionales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;

// entity comparador is
// 	 generic (n: integer:=N_valor_parametrizable); 
//       Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
//              B : in  STD_LOGIC_VECTOR (n-1 downto 0);
//              AmayorB : out  STD_LOGIC;
//              AigualB : out  STD_LOGIC;
//              AmenorB : out  STD_LOGIC);
// end comparador;

// architecture Behavioral of comparador is

// begin

// AmayorB<='1' when A>B else '0'; 
// AigualB<='1' when A=B else '0'; 
// AmenorB<='1' when A<B else '0'; 

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;
// use ieee.numeric_std.all;
  
// ENTITY comparador_tb IS
// generic(n: INTEGER:=N_valor_parametrizable);
// END comparador_tb;
 
// ARCHITECTURE behavior OF comparador_tb IS 
 
    
//     COMPONENT comparador
// 	 generic(n: INTEGER:=N_valor_parametrizable);
//       PORT(
//            A : IN  std_logic_vector(n-1 downto 0);
//            B : IN  std_logic_vector(n-1 downto 0);
//            AmayorB : OUT  std_logic;
//            AigualB : OUT  std_logic;
//            AmenorB : OUT  std_logic
//            );
//     END COMPONENT;
    

//    signal A : std_logic_vector(n-1 downto 0) := (others => '0');
//    signal B : std_logic_vector(n-1 downto 0) := (others => '0');

//    signal AmayorB : std_logic;
//    signal AigualB : std_logic;
//    signal AmenorB : std_logic;

    
// BEGIN
 
//    uut: comparador generic map(n=>N_valor_parametrizable)
// 		PORT MAP (
//            A => A,
//            B => B,
//            AmayorB => AmayorB,
//            AigualB => AigualB,
//            AmenorB => AmenorB
//            );

 
//    stim_proc: process
//    begin		
//       A<=std_logic_vector(to_unsigned(3,n));
//       B<=std_logic_vector(to_unsigned(2,n));
//       wait for 100 ns;	
// 	 B<=std_logic_vector(to_unsigned(3,n));
// 	 wait for 100 ns;
// 	 A<=std_logic_vector(to_unsigned(2,n));

//       wait;
//    end process;

// END;''');
// await _componentesDTO.insertarComponenteValorParametrizable("Comparador", "N");

// await _componentesDTO.insertarComponente(
//       "Contador con direccion cuenta",
//       "Contador con direccion cuenta",
//       "Bloques secuenciales",
//       '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use ieee.numeric_std.all;
// use ieee.std_logic_arith.all;
// use ieee.std_logic_unsigned.all;



// entity contador is
// 	generic (n: integer:=N_valor_parametrizable); 
//     Port ( en : in  STD_LOGIC;
// 		        direccion: in std_logic; 
//            reset : in  STD_LOGIC;
//            clk : in  STD_LOGIC;
//            cuenta : out  STD_LOGIC_VECTOR (n-1 downto 0));
// end contador;

// architecture Behavioral of contador is

// signal cont:std_logic_vector(n-1 downto 0);

// begin

// process(clk,reset)

// begin
// 	if (reset='1') then
// 	cont<=std_logic_vector(to_unsigned(0,n));
// 	elsif (rising_edge(clk)) then
// 		if (en='1') then
// 			if (direccion='0') then
// 			cont<=cont + '1';
// 			else cont<=cont-'1';
// 			end if;
// 		else
// 		cont<=cont;
// 		end if;
// 	end if;

// end process;

// cuenta<=cont;

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
  
// ENTITY contador_tb IS
// generic (n: integer:=N_valor_parametrizable);
// END contador_tb;
 
// ARCHITECTURE behavior OF contador_tb IS 
 
     
//     COMPONENT contador
// 	 generic (n: integer:=N_valor_parametrizable);
//     PORT(
//          en : IN  std_logic;
// 	    direccion: IN std_logic;
//          reset : IN  std_logic;
//          clk : IN  std_logic;
//          cuenta : OUT  std_logic_vector(n-1 downto 0)
//         );
//     END COMPONENT;
    

//    signal en : std_logic := '0';
//    signal direccion: std_logic := '0';
//    signal reset : std_logic := '0';
//    signal clk : std_logic := '0';

//    signal cuenta : std_logic_vector(n-1 downto 0);

 
// BEGIN
 
// 	uut: contador 
// 	generic map(n=>N_valor_parametrizable)
// 	PORT MAP (
//           en => en,
// 	     direccion => direccion,
//           reset => reset,
//           clk => clk,
//           cuenta => cuenta
//         );

//    clk_process :process
//    begin
// 		clk <= '0';
// 		wait for 50 ns;
// 		clk <= '1';
// 		wait for 50 ns;
//    end process;
 

   
//    stim_proc: process
//    begin		
//       reset<='1';en<='0';direccion<='0';
//       wait for 100 ns;	
// 	 reset<='0';
//       wait for 100 ns;
// 	 en<='1';
//       wait for 400 ns; 
// 	 direccion<='1';
// 	 wait for 400 ns;

//       wait;
//    end process;

// END;''');
// await _componentesDTO.insertarComponenteValorParametrizable("Contador con direccion cuenta", "N");

// await _componentesDTO.insertarComponente(
//       "Multiplexor",
//       "Multiplexor",
//       "Bloques combinacionales");

// await _componentesDTO.insertarComponenteValorParametrizable("Multiplexor", "N");
// await _componentesDTO.insertarComponenteValorParametrizable("Multiplexor", "C");

// await.componentesDTO.agregarPaquete("Multiplexor", "Aritmético", '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;

// entity mux_n is
// generic (n: integer:=N_valor_parametrizable; 
//          c: integer:=C_valor_parametrizable);
//     Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
//            control : in  STD_LOGIC_VECTOR (c-1 downto 0);
//            salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
// end mux_n;

// architecture Behavioral of mux_n is

// signal sel: integer:=0;

// begin

// sel<=conv_integer (unsigned(Control));

// Salida<=Datos(n*(sel+1)-1 downto n*sel);

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
// use IEEE.STD_LOGIC_ARITH.ALL;
 
// ENTITY muxn_tb IS
// generic (C: integer:=3;
// 			n: integer:=2);
// END muxn_tb;
 
// ARCHITECTURE behavior OF muxn_tb IS 
 
//     COMPONENT mux_n
// 	 generic (C: integer:=2;
// 			    n: integer:=2);
//     PORT(
//          datos : IN  std_logic_vector(((2**c)*n)-1 downto 0);
//          control : IN  std_logic_vector(c-1 downto 0);
//          salida : OUT  std_logic_vector(n-1 downto 0));
//     END COMPONENT;
    

   
//    signal datos : std_logic_vector(((2**c)*n)-1 downto 0) := (others => '0');
//    signal control : std_logic_vector(c-1 downto 0) := (others => '0');

 	
//    signal salida : std_logic_vector(n-1 downto 0);
  
// BEGIN
 
	
//    uut: mux_n 
// 	    generic map (C=>C_valor_parametrizable, n=>N_valor_parametrizable)
// 	    PORT MAP (
//           datos => datos,
//           control => control,
//           salida => salida
//         );


   
//    stim_proc: process
//    begin		
    
//    	datos<=conv_std_logic_vector(10, (2**c)*n);
// 		control<=conv_std_logic_vector(3, C);
//       wait for 100 ns;	
// 	   control<=conv_std_logic_vector (2, C);
//       wait for 100 ns;	
//    	control<=conv_std_logic_vector(1, C);
//       wait for 100 ns;
//    	control<=conv_std_logic_vector(0, C);
//       wait for 100 ns;			
//       wait;
		
//    end process;

// END;''');
// await.componentesDTO.agregarPaquete("Multiplexor", "Numérico", '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.NUMERIC_STD.ALL;

// entity mux_n_numeric is
// generic (n: integer:=N_valor_parametrizable; 
//          c: integer:=C_valor_parametrizable);
//     Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
//            control : in  STD_LOGIC_VECTOR (c-1 downto 0);
//            salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
// end mux_n_numeric;

// architecture Behavioral of mux_n_numeric is

// signal sel: integer:=0;

// begin

// sel<=to_integer(unsigned(Control));

// Salida<=Datos(n*(sel+1)-1 downto n*sel);

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
// use IEEE.NUMERIC_STD.ALL;
 
// ENTITY muxn_numeric_tb IS
// generic (C: integer:=3;
// 			n: integer:=2);
// END muxn_numeric_tb;
 
// ARCHITECTURE behavior OF muxn_numeric_tb IS 
 
 
//     COMPONENT mux_n_numeric
// 	 generic (C: integer:=2;
// 			    n: integer:=2);
//     PORT(
//          datos : IN  std_logic_vector(((2**c)*n)-1 downto 0);
//          control : IN  std_logic_vector(c-1 downto 0);
//          salida : OUT  std_logic_vector(n-1 downto 0));
//     END COMPONENT;
    

//    signal datos : std_logic_vector(((2**c)*n)-1 downto 0) := (others => '0');
//    signal control : std_logic_vector(c-1 downto 0) := (others => '0');


//    signal salida : std_logic_vector(n-1 downto 0);
  
// BEGIN
 
//    uut: mux_n_numeric 
// 	    generic map (C=>C_valor_parametrizable, n=>N_valor_parametrizable)
// 	    PORT MAP (
//           datos => datos,
//           control => control,
//           salida => salida
//         );


//    stim_proc: process
//    begin		
    
//    	datos<=std_logic_vector(to_unsigned(10, (2**c)*n));
// 		control<=std_logic_vector(to_unsigned(3, C));
//       wait for 100 ns;	
// 	   control<=std_logic_vector(to_unsigned(2, C));
//       wait for 100 ns;	
//    	control<=std_logic_vector(to_unsigned(1, C));
//       wait for 100 ns;
//    	control<=std_logic_vector(to_unsigned(0, C));
//       wait for 100 ns;			
//       wait;
		
//    end process;

// END;''');
// await.componentesDTO.agregarPaquete("Multiplexor", "Sin signo", '''library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// use IEEE.STD_LOGIC_UNSIGNED.ALL;

// entity muxn_unsigned is
// generic (n: integer:=N_valor_parametrizable; 
//          c: integer:=C_valor_parametrizable);
//     Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
//            control : in  STD_LOGIC_VECTOR (c-1 downto 0);
//            salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
// end muxn_unsigned;

// architecture Behavioral of muxn_unsigned is

// signal sel: integer:=0;

// begin

// sel<=conv_integer(Control);

// Salida<=Datos(n*(sel+1)-1 downto n*sel);

// end Behavioral;''',
// '''LIBRARY ieee;
// USE ieee.std_logic_1164.ALL;
// use IEEE.numeric_std.ALL;
 
// ENTITY muxn_unsigned_tb IS
// generic (C: integer:=3;
// 			n: integer:=2);
// END muxn_unsigned_tb;
 
// ARCHITECTURE behavior OF muxn_unsigned_tb IS 
 
//     -- Component Declaration for the Unit Under Test (UUT)
 
//     COMPONENT muxn_unsigned
// 	 generic (C: integer:=2;
// 			    n: integer:=2);
//     PORT(
//          datos : IN  std_logic_vector(((2**c)*n)-1 downto 0);
//          control : IN  std_logic_vector(c-1 downto 0);
//          salida : OUT  std_logic_vector(n-1 downto 0));
//     END COMPONENT;
    

//    --Inputs
//    signal datos : std_logic_vector(((2**c)*n)-1 downto 0) := (others => '0');
//    signal control : std_logic_vector(c-1 downto 0) := (others => '0');

//  	--Outputs
//    signal salida : std_logic_vector(n-1 downto 0);
  
// BEGIN
 
// 	-- Instantiate the Unit Under Test (UUT)
//    uut: muxn_unsigned 
// 	    generic map (C=>C_valor_parametrizable, n=>N_valor_parametrizable)
// 	    PORT MAP (
//           datos => datos,
//           control => control,
//           salida => salida
//         );


//    -- Stimulus process
//    stim_proc: process
//    begin		
    
//    	datos<=std_logic_vector(to_unsigned(10, (2**c)*n));
// 		control<=std_logic_vector(to_unsigned(3, C));
//       wait for 100 ns;	
// 	   control<=std_logic_vector(to_unsigned(2, C));
//       wait for 100 ns;	
//    	control<=std_logic_vector(to_unsigned(1, C));
//       wait for 100 ns;
//    	control<=std_logic_vector(to_unsigned(0, C));
//       wait for 100 ns;			
//       wait;
		
//    end process;

// END;''');


