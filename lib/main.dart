import 'package:flutter/material.dart';
import 'package:vhdl_code_creator/model/GestorComponentes.dart';
import 'navigationRail.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  final GestorComponentes gestorComponentes = GestorComponentes();

  @override
  void initState() {
    super.initState();
    _inicializarBaseDeDatos();
  }

  // Método para inicializar la base de datos con componentes de ejemplo
  Future<void> _inicializarBaseDeDatos() async {
    await gestorComponentes.inicializarComponentes();
  }

  void _selectMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  final _darkMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.dark(
      surface: Color(0xff262624),
      primary: Color(0xff1e7bc4),
      onPrimary: Colors.white70,       // Color de texto sobre el primario
      onSurface: Colors.white70,       // Color de texto sobre el surface  
      secondaryContainer: Color(0xffdcdaf5),
    ),
    cardColor: Color(0xff141413), 
    dividerColor: Color(0xFF424242),
    shadowColor: Colors.white10,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff1f1e1d),  // Aquí defines el color del AppBar
    ),
  );

  final _lightMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      surface: Color(0xFFE2E7E8),    // Gris claro para el surface
      primary: Color(0xFF6442d6),    // Morado estándar como color primario
      onPrimary: Colors.white,       // Color de texto sobre el primario
      onSurface: Colors.black,       // Color de texto sobre el surface  
      secondaryContainer: Color(0xffdcdaf5)
    ),
    cardColor: Color(0xffffffff),
    dividerColor: Colors.grey,
    shadowColor: Colors.black26,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xfff2ecee),  // Aquí defines el color del AppBar
  ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? _darkMode : _lightMode,
      home: NavigationRailApp(onSelectMode: _selectMode, isDarkMode: isDarkMode),
    );
  }

  @override
  void dispose() {
    gestorComponentes.cerrar(); // Liberar los recursos de la base de datos
    super.dispose();
  }
}
