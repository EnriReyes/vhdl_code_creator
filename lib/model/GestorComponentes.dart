import 'package:flutter/material.dart';
import 'package:vhdl_code_creator/data.dart';

class GestorComponentes {
  final ComponentesDTO _componentesDTO;

  GestorComponentes() : _componentesDTO = ComponentesDTO.instance;

  // Método para insertar un componente
  Future<int> insertarComponente(String nombre, String tipo, String clase) {
    return _componentesDTO.insertarComponente(nombre, tipo, clase);
  }

  // Método para obtener un componente específico por su nombre
  Future<Componente?>? verComponentePorNombre(String? nombre) {
  return nombre != null 
    ? _componentesDTO.verComponentePorNombre(nombre) 
    : Future.value(null);
  }

  // Método para obtener todos los nombres de los componentes
  Future<List<String>> verTodosLosNombresComponentes() {
    return _componentesDTO.verTodosLosNombresComponentes();
  }

  Future<List<String>> obtenerClasesDeComponentes(int descripcion) {
    return _componentesDTO.obtenerClasesUnicasDeComponentes();
  }
  Future<List<String>> obtenerComponentesPorTipo(String tipo){
    return _componentesDTO.obtenerComponentesPorTipo(tipo);
  }
  // Método para eliminar un componente por su nombre
  Future<int> eliminarComponentePorNombre(String nombre) {
    return _componentesDTO.eliminarComponentePorNombre(nombre);
  }

  // Método para inicializar la base de datos con componentes de ejemplo
  Future<void> inicializarComponentes() async {
  // Obtener el número de componentes en la base de datos
  int numeroDeComponentes = await _componentesDTO.obtenerNumeroDeComponentes();
  print(numeroDeComponentes);
  // Insertar el componente si el número de componentes es distinto de 0
  if (numeroDeComponentes == 0) {
    print("Hola");
    await _componentesDTO.insertarComponente(
      "Multiplexor",
      "Multiplexor",
      "Bloques combinacionales");


await _componentesDTO.insertarValorParametrizable("N", "Número de bits de datos", 1);
await _componentesDTO.insertarValorParametrizable("C", "Número de entradas de control", 2);

await _componentesDTO.insertarComponenteValorParametrizable("Multiplexor", "N");
await _componentesDTO.insertarComponenteValorParametrizable("Multiplexor", "C");

await agregarPaquete("Multiplexor", "Aritmético", '''library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity mux_n is
generic (n: integer:=N_valor_parametrizable; 
         c: integer:=C_valor_parametrizable);
    Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux_n;

architecture Behavioral of mux_n is

signal sel: integer:=0;

begin

sel<=conv_integer (unsigned(Control));

Salida<=Datos(n*(sel+1)-1 downto n*sel);

end Behavioral;''',
'''LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
ENTITY muxn_tb IS
generic (C: integer:=3;
			n: integer:=2);
END muxn_tb;
 
ARCHITECTURE behavior OF muxn_tb IS 
 
    COMPONENT mux_n
	 generic (C: integer:=2;
			    n: integer:=2);
    PORT(
         datos : IN  std_logic_vector(((2**c)*n)-1 downto 0);
         control : IN  std_logic_vector(c-1 downto 0);
         salida : OUT  std_logic_vector(n-1 downto 0));
    END COMPONENT;
    

   
   signal datos : std_logic_vector(((2**c)*n)-1 downto 0) := (others => '0');
   signal control : std_logic_vector(c-1 downto 0) := (others => '0');

 	
   signal salida : std_logic_vector(n-1 downto 0);
  
BEGIN
 
	
   uut: mux_n 
	    generic map (C=>C_valor_parametrizable, n=>N_valor_parametrizable)
	    PORT MAP (
          datos => datos,
          control => control,
          salida => salida
        );


   
   stim_proc: process
   begin		
    
   	datos<=conv_std_logic_vector(10, (2**c)*n);
		control<=conv_std_logic_vector(3, C);
      wait for 100 ns;	
	   control<=conv_std_logic_vector (2, C);
      wait for 100 ns;	
   	control<=conv_std_logic_vector(1, C);
      wait for 100 ns;
   	control<=conv_std_logic_vector(0, C);
      wait for 100 ns;			
      wait;
		
   end process;

END;''');
await agregarPaquete("Multiplexor", "Numérico", '''library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_n_numeric is
generic (n: integer:=N_valor_parametrizable; 
         c: integer:=C_valor_parametrizable);
    Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux_n_numeric;

architecture Behavioral of mux_n_numeric is

signal sel: integer:=0;

begin

sel<=to_integer(unsigned(Control));

Salida<=Datos(n*(sel+1)-1 downto n*sel);

end Behavioral;''',
'''LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY muxn_numeric_tb IS
generic (C: integer:=3;
			n: integer:=2);
END muxn_numeric_tb;
 
ARCHITECTURE behavior OF muxn_numeric_tb IS 
 
 
    COMPONENT mux_n_numeric
	 generic (C: integer:=2;
			    n: integer:=2);
    PORT(
         datos : IN  std_logic_vector(((2**c)*n)-1 downto 0);
         control : IN  std_logic_vector(c-1 downto 0);
         salida : OUT  std_logic_vector(n-1 downto 0));
    END COMPONENT;
    

   signal datos : std_logic_vector(((2**c)*n)-1 downto 0) := (others => '0');
   signal control : std_logic_vector(c-1 downto 0) := (others => '0');


   signal salida : std_logic_vector(n-1 downto 0);
  
BEGIN
 
   uut: mux_n_numeric 
	    generic map (C=>C_valor_parametrizable, n=>N_valor_parametrizable)
	    PORT MAP (
          datos => datos,
          control => control,
          salida => salida
        );


   stim_proc: process
   begin		
    
   	datos<=std_logic_vector(to_unsigned(10, (2**c)*n));
		control<=std_logic_vector(to_unsigned(3, C));
      wait for 100 ns;	
	   control<=std_logic_vector(to_unsigned(2, C));
      wait for 100 ns;	
   	control<=std_logic_vector(to_unsigned(1, C));
      wait for 100 ns;
   	control<=std_logic_vector(to_unsigned(0, C));
      wait for 100 ns;			
      wait;
		
   end process;

END;''');
await agregarPaquete("Multiplexor", "Sin signo", '''library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity muxn_unsigned is
generic (n: integer:=N_valor_parametrizable; 
         c: integer:=C_valor_parametrizable);
    Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
end muxn_unsigned;

architecture Behavioral of muxn_unsigned is

signal sel: integer:=0;

begin

sel<=conv_integer(Control);

Salida<=Datos(n*(sel+1)-1 downto n*sel);

end Behavioral;''',
'''LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
 
ENTITY muxn_unsigned_tb IS
generic (C: integer:=3;
			n: integer:=2);
END muxn_unsigned_tb;
 
ARCHITECTURE behavior OF muxn_unsigned_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxn_unsigned
	 generic (C: integer:=2;
			    n: integer:=2);
    PORT(
         datos : IN  std_logic_vector(((2**c)*n)-1 downto 0);
         control : IN  std_logic_vector(c-1 downto 0);
         salida : OUT  std_logic_vector(n-1 downto 0));
    END COMPONENT;
    

   --Inputs
   signal datos : std_logic_vector(((2**c)*n)-1 downto 0) := (others => '0');
   signal control : std_logic_vector(c-1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(n-1 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxn_unsigned 
	    generic map (C=>C_valor_parametrizable, n=>N_valor_parametrizable)
	    PORT MAP (
          datos => datos,
          control => control,
          salida => salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
    
   	datos<=std_logic_vector(to_unsigned(10, (2**c)*n));
		control<=std_logic_vector(to_unsigned(3, C));
      wait for 100 ns;	
	   control<=std_logic_vector(to_unsigned(2, C));
      wait for 100 ns;	
   	control<=std_logic_vector(to_unsigned(1, C));
      wait for 100 ns;
   	control<=std_logic_vector(to_unsigned(0, C));
      wait for 100 ns;			
      wait;
		
   end process;

END;''');
      
   
  }
}
// Método para actualizar la descripción de un componente reemplazando los '@' por un espacio en blanco
Future<String> obtenerDescripcionActualizada(String? nombreComponente, String? nombrePaquete, String tipoComponenete, final List<TextEditingController> nuevoTexto, int tipoDescripcion) async {
  // Primero obtenemos el componente específico por su nombre
  int iterador = 0;
  final paquete = await obtenerDetallePaquete(nombreComponente, nombrePaquete);
  final parametros = await seleccionarValoresDeComponente(tipoComponenete);
  // Si el componente existe, procedemos a actualizar la descripción
  if (paquete != null) {

    String descripcionActualizada = tipoDescripcion == 0 ? paquete.descripcion : paquete.testbench;
    for( ValorParametrizable aux in parametros){
        descripcionActualizada = descripcionActualizada.replaceAll('${aux.nombre}_valor_parametrizable', nuevoTexto[iterador].text);
        ++ iterador;
    }
    
    return descripcionActualizada;
  } 
  else {
      return "";
  }
}

Future<Map<String, dynamic>?> obtenerConfiguracionActual( String? nombreComponente, String? nombrePaquete, final List<TextEditingController> nuevoTexto) async {
  int iterador = 0;
  Map<String, dynamic>? res = {};
  res["Componente"] = nombreComponente;
  res["Paquete"] = nombrePaquete;
  final componente = await verComponentePorNombre(nombreComponente);
  final parametros = await seleccionarValoresDeComponente(componente?.tipo);
  // Si el componente existe, procedemos a actualizar la descripción
  if (componente != null) {

    for( ValorParametrizable aux in parametros){
        res[aux.nombre] = nuevoTexto[iterador].text;
        ++ iterador;
    }
    return res;
  } 
  else {
      return null;
  }
}

Future<List<String>> obtenerTipoPorClase (String clase, int descripcion){
    Future<List<String>> list = _componentesDTO.obtenerTiposPorClase(clase);
    
    return list.then((componentesList) {
      if (descripcion == 1) {
        // Filter out the object with a specific name
        componentesList.removeWhere((componente) => componente == "FSM");
        print(componentesList.toString());
      }
      return componentesList;
    });
}

// Inserta un nuevo valor parametrizable
  Future<int> insertarValorParametrizable(String nombre, String descripcion, int orden) {
    return _componentesDTO.insertarValorParametrizable(nombre, descripcion, orden);
  }

  // Borra un valor parametrizable por su nombre
  Future<int> borrarValorParametrizable(String nombre) {
    return _componentesDTO.borrarValorParametrizable(nombre);
  }

  // Obtiene un valor parametrizable por su nombre
  Future<ValorParametrizable?> verValorParametrizablePorNombre(String nombre) {
    return _componentesDTO.verValorParametrizablePorNombre(nombre);
  }

  // Inserta una relación entre componente y valor parametrizable
  Future<int> insertarComponenteValorParametrizable(String idComponente, String idValor) {
    return _componentesDTO.insertarComponenteValorParametrizable(idComponente, idValor);
  }

  // Borra una relación entre componente y valor parametrizable
  Future<int> borrarComponenteValorParametrizable(String idComponente, String idValor) {
    return _componentesDTO.borrarComponenteValorParametrizable(idComponente, idValor);
  }

  // Selecciona todos los valores parametrizables de un componente
  Future<List<ValorParametrizable>> seleccionarValoresDeComponente(String? idComponente) async {
  List<ValorParametrizable> listaParametros = [];

  // Obtener los valores de idValor asociados al idComponente
  List<String> aux = idComponente != null 
                    ? await _componentesDTO.seleccionarValoresDeComponente(idComponente) 
                    : [];
  
  // Rellenar la lista de parámetros
  for (String nombre in aux) {
    ValorParametrizable? parametro = await verValorParametrizablePorNombre(nombre);
    if (parametro != null) {
      listaParametros.add(parametro);
    }
  }
  return listaParametros;   
  }

  Future<int> agregarPaquete(String componente, String nombre, String descripcion, String testbench) {
    return _componentesDTO.insertarPaquete(componente, nombre, descripcion, testbench);
  }

  Future<int> eliminarPaquete(String componente, String nombre) {
    return _componentesDTO.eliminarPaquete(componente, nombre);
  }

  Future<List<String>> listarPaquetesPorComponente(String componente) {
    return _componentesDTO.obtenerPaquetesPorComponente(componente);
  }

  Future<Paquete?> obtenerDetallePaquete(String? componente, String? nombre) {
    return nombre == null || componente == null
    ? Future.value(null)
    :_componentesDTO.obtenerPaquetePorNombreYComponente(componente, nombre);
  }

  // Método de cierre para liberar los recursos de la base de datos
  Future<void> cerrar() async {
    await _componentesDTO.close();
  }


}
