
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:vhdl_code_creator/model/GestorComponentes.dart';
import 'package:vhdl_code_creator/model/GestorFicheros.dart';
import 'package:vhdl_code_creator/widgets/lightDarkButton.dart';
import 'package:vhdl_code_creator/widgets/menus/menu1.dart';
import 'package:vhdl_code_creator/widgets/subMenu.dart';
import 'package:highlight/languages/vhdl.dart';

class NavigationRailApp extends StatefulWidget {
  const NavigationRailApp({
   required this.onSelectMode,
   required this.isDarkMode,
   super.key
   });

  final VoidCallback onSelectMode;
  final bool isDarkMode;

  @override
  State<NavigationRailApp> createState() => _NavigationRailAppState();
}

class _NavigationRailAppState extends State<NavigationRailApp> {
  int selectedIndex = 0;
  int antSelectedIndex = 0;
  bool _isRailExpanded = false;
  bool _isSubMenuOpen = false;
  Map<String, dynamic>? resExportar = null;

  void onDestinationSelected (int index){
    setState((){
       antSelectedIndex = selectedIndex;
       selectedIndex = index;
      
      if ( selectedIndex != 2){

        _isSubMenuOpen = ! _isSubMenuOpen;

       if (antSelectedIndex != selectedIndex ) _isSubMenuOpen = true ;
      
      }
      else{
        _isSubMenuOpen = false;
      }
         
    });
  }
  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  
  void actualizarResExportar(Map<String, dynamic>? nuevoValor) {
    setState(() {
      resExportar = nuevoValor; 
    });
  }

  void expandRail(){
    setState(() {
      _isRailExpanded = ! _isRailExpanded;
    });
  }

    final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            HojaEscritura(controller: _controller),
            ImportButton(
            onPressed: () async {
              final GestorFicheros fichero = GestorFicheros();
              final GestorComponentes gestorComponentes = GestorComponentes();
              final resImportado = await fichero.leerDatosDesdeFichero();
              
              final tipoComponente = await gestorComponentes.verComponentePorNombre(resImportado?["Componente"]);
              if(tipoComponente != null) {
                showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FormularioWidget(
                                  tipoComponente: tipoComponente.tipo,
                                  controller: _controller,
                                  tipodescripcion : 0,
                                  valorImportado: resImportado ?? {},
                                  onResExportarUpdated: actualizarResExportar,
                                );
                              },
                            );
              }
              }),
              ExportButton(
                onPressed: () {
                  final GestorFicheros fichero = GestorFicheros();
                  fichero.storeDatatoFile(resExportar);
                },
                isEnabled: resExportar != null, // Si el mapa es null, isEnabled será false
              ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              left: _isSubMenuOpen ? 95 : -215.0,
              top: 0,
              bottom: 0,
              child: SizedBox(
                      width: 215,
                      child: Material(
                      elevation: 4,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0), // Radio de los bordes
                      side: BorderSide(
                        color: Theme.of(context).dividerColor.withOpacity(0.2), // Color del borde
                        width: 1.0, // Ancho del borde
                      ),
                  ),
                  child: SubMenu(selectedIndex: selectedIndex, controller: _controller, onResExportarUpdated: actualizarResExportar), // El submenú que se despliega
                )
              ),
            ),
              Row(
                  children: [
                  Stack(
                  children: [
                    NavigationRail(
                    backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Toma el color base del tema
                    labelType: NavigationRailLabelType.all,
                    unselectedLabelTextStyle: TextStyle(fontWeight: FontWeight.w400, 
                                                  color: Theme.of(context).colorScheme.onSurface, 
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13.0
                                                  ),
                    selectedLabelTextStyle:   TextStyle(fontWeight: FontWeight.w500, 
                                                  color: Theme.of(context).colorScheme.onSurface, 
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13.0
                                                  ),
                    indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
                    groupAlignment: -1.0,
                    selectedIndex: selectedIndex,
                    onDestinationSelected: onDestinationSelected,
                    destinations: [
                      NavigationRailDestination(
                        icon: const Icon(Icons.widgets_outlined),
                        selectedIcon: Icon(Icons.widgets_outlined, ),
                        label: const Text('Componentes',  ),
                      ),
                       NavigationRailDestination(
                        icon: const Icon(Icons.quiz_outlined),
                        selectedIcon: const Icon(Icons.quiz_outlined),
                        label: const Text('Testbench', ),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.file_download_outlined),
                        selectedIcon: Icon(Icons.file_download_outlined, ),
                        label: const Text('Descargar'),
                      ),
                    ],
                    
                  ),
                  LightDarkButton(widget: widget, onSelectIndex: setSelectedIndex),
                  ],
                ),
                  VerticalDivider(thickness: 1, width: 1, color:  Theme.of(context).dividerColor.withOpacity(0.2),),
                  


                
                ],
            ),
            
            ]
      ),
    );
  }
}



class HojaEscritura extends StatefulWidget {
  final TextEditingController controller;

  const HojaEscritura({Key? key, required this.controller}) : super(key: key);

  @override
  _HojaEscrituraState createState() => _HojaEscrituraState();
}

class _HojaEscrituraState extends State<HojaEscritura> {
  CodeController? _codeController;
  final GlobalKey _codeFieldKey = GlobalKey();
  @override
  void initState() {
    super.initState();

    // Asegurar que la inicialización ocurre después de que el widget está completamente montado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _codeController = CodeController(
            language: vhdl,
            text: widget.controller.text,
          );

          widget.controller.addListener(_syncTextControllers);
        });
      } 
    });
  }


  // Sincronizar cambios entre widget.controller y _codeController
  
 Future<void> _syncTextControllers() async {
  if (mounted && _codeController != null) {
    setState(() {
      _codeController!.text = "";  // Primero vacía el contenido
      
    });

    await Future.delayed(Duration(milliseconds: 50)); // Espera a que se refleje el cambio

    setState(() {
      final newText = widget.controller.text;
      _codeController!.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    });
  }
}


  @override
  void dispose() {
    // Remover el listener antes de destruir el widget
    widget.controller.removeListener(_syncTextControllers);
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final backgroundColor = Theme.of(context).cardColor;

    return Padding(
  // Esto añade espacio por encima del contenedor
  padding: const EdgeInsets.only(top: 10.0),
  child: Center(
    child: Container(
      width: 900,
      height: 1500,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.1),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: _codeController == null
          ? const Center(child: CircularProgressIndicator()) 
          : CodeTheme(
              data: CodeThemeData(styles: {
                "root": TextStyle(
                  backgroundColor: backgroundColor,
                  color: textColor,
                ),
                "keyword": const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                "literal": const TextStyle(color: Colors.orange),
                "string": const TextStyle(color: Colors.green),
                "built_in": const TextStyle(color: Colors.purple),
                "comment": TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
                "autocomplete": const TextStyle(color: Colors.red),
              }),
              child: CodeField(
                background: backgroundColor,
                key: _codeFieldKey,
                controller: _codeController!,
                expands: true,
                gutterStyle: GutterStyle.none,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Courier New',
                  height: 1.45,
                  letterSpacing: 0.4,
                  color: textColor,
                ),
                cursorColor: textColor,
                decoration: const BoxDecoration(),
              ),
            ),
    ),
  ),
);
  }
}





class ImportButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ImportButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(Icons.insert_drive_file),
        label: Text('Importar'),
      ),
    );
  }
}

class ExportButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled; // Nuevo parámetro para controlar si el botón está activo

  const ExportButton({Key? key, required this.onPressed, required this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 86,
      right: 16,
      child: FloatingActionButton.extended(
        onPressed: isEnabled ? onPressed : null, 
        icon: Icon(Icons.insert_drive_file, color: isEnabled ? null : Colors.grey), 
        label: Text(
          'Exportar',
          style: TextStyle(color: isEnabled ? null : Colors.grey), 
        ),
        backgroundColor: isEnabled ? null : Colors.grey[400], 
      ),
    );
  }
}
