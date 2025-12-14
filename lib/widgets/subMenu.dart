import 'package:flutter/widgets.dart';
import 'package:vhdl_code_creator/widgets/menus/menu1.dart';
import 'package:vhdl_code_creator/model/GestorFicheros.dart';

class SubMenu extends StatefulWidget {
  const SubMenu({
    super.key,
    required this.selectedIndex,
    required this.controller,
    required this.onResExportarUpdated,
  });

  final TextEditingController controller;
  final int selectedIndex; // Cambiamos a int, porque generalmente se usa como un índice
  final Function(Map<String, dynamic>?) onResExportarUpdated;

  @override
  State<SubMenu> createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  final GestorFicheros fichero = GestorFicheros();
  Key _menuKey = UniqueKey();
  int? _previousIndex;

  @override
  Widget build(BuildContext context) {
    // Solo recargamos el menú si el índice ha cambiado
    if (_previousIndex != widget.selectedIndex) {
      _previousIndex = widget.selectedIndex;
      _menuKey = UniqueKey(); // Actualizamos la key solo cuando cambia el índice
    }

    if (widget.selectedIndex == 0) {
      return Menu1(
        key: _menuKey,
        submenu: widget,
        descripcion: widget.selectedIndex,
        onResExportarUpdated: widget.onResExportarUpdated
      );
    }
    
    if (widget.selectedIndex == 1) {
      return Menu1(
        key: _menuKey,
        submenu: widget,
        descripcion: widget.selectedIndex,
        onResExportarUpdated: widget.onResExportarUpdated
      );
    }
    
    if (widget.selectedIndex == 2) {
      fichero.saveTextFile(widget.controller.text);
    }
    
    return const Column();
  }
}