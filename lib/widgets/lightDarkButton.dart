import 'package:flutter/material.dart';
import 'package:vhdl_code_creator/navigationRail.dart';

class LightDarkButton extends StatelessWidget {
  const LightDarkButton({
    super.key,
    required this.widget,
    required this.onSelectIndex,
  });

  final NavigationRailApp widget;
  final ValueChanged<int> onSelectIndex;
  @override
  Widget build(BuildContext context) {
    return Align(
     alignment: Alignment.bottomCenter,
     child: Padding(
      padding: const EdgeInsets.all(29.0),
      child: Container(
              decoration: BoxDecoration(
                border: widget.isDarkMode 
                  ? Border.all(color: Colors.white, width: 0.6)
                  : Border.all(color: Colors.black, width: 0.6), // Borde negro de 2 píxeles
                borderRadius: BorderRadius.circular(22), // Esquinas redondeadas (opcional)
              ),
              child : IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: widget.isDarkMode
                ? const Icon(
                    Icons.dark_mode,
                    key: ValueKey('darkIcon'),
                    color: Colors.white, // Color de ícono en modo oscuro
                  )
                : const Icon(
                    Icons.light_mode,
                    key: ValueKey('lightIcon'),
                    color: Colors.black, // Color de ícono en modo claro

                  ),
          ),
          onPressed: (){
            onSelectIndex(0);
            widget.onSelectMode();
          },
        ),
      ),
     ),
    );
  }
} 