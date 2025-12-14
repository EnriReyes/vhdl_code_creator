import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vhdl_code_creator/model/GestorComponentes.dart';
import 'package:vhdl_code_creator/data.dart';
import 'package:vhdl_code_creator/widgets/subMenu.dart';

class Menu1 extends StatefulWidget {
  const Menu1({
    super.key,
    required this.submenu,
    required this.descripcion,
    required this.onResExportarUpdated,
    
  });

  final SubMenu submenu;
  final int descripcion;
  final Function(Map<String, dynamic>?) onResExportarUpdated;
  @override
  _Menu1State createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  final GestorComponentes gestorComponentes = GestorComponentes();
  List<String> opciones = [];

  Map<String, List<String>> subopcionesPorClase = {};

  @override
  void initState() {
    super.initState();
    cargarOpciones();
  }

  Future<void> cargarOpciones() async {
    final nombres = await gestorComponentes.obtenerClasesDeComponentes( widget.descripcion );
    setState(() {
      opciones = nombres;
    });
  }
   // Opcionalmente, también puedes implementar este método para detectar cambios de visibilidad

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      cargarOpciones();
    }
  }
  Future<void> cargarSubopciones(String clase) async {
    if (!subopcionesPorClase.containsKey(clase)) {
      final nombres = await gestorComponentes.obtenerTipoPorClase(clase, widget.descripcion);
      setState(() {
        subopcionesPorClase[clase] = nombres;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: ListView.builder(
        itemCount: opciones.length,
        itemBuilder: (context, index) {
          String currentItem = opciones[index];

          return ExpansionTile(
            title: Text(currentItem, style: TextStyle(fontSize: 14)),
            shape: RoundedRectangleBorder(
              side: BorderSide(color:  Theme.of(context).appBarTheme.backgroundColor ?? Color(0xfff2ecee)),
            ),
            trailing: Icon(Icons.arrow_drop_down, color: Colors.grey),
            onExpansionChanged: (bool expanded) {
              if (expanded) {
                cargarSubopciones(currentItem);
              }
            },
            children: (subopcionesPorClase[currentItem] ?? [])
                    .map((subItem) => ListTile(
                          contentPadding: EdgeInsets.only(left: 30.0), // Ajusta este valor para mover a la derecha
                          title: Text("$subItem", style: TextStyle(fontSize: 14)),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FormularioWidget(
                                  tipoComponente: subItem,
                                  controller: widget.submenu.controller,
                                  tipodescripcion : widget.descripcion,
                                  valorImportado: {},
                                  onResExportarUpdated: widget.onResExportarUpdated,
                                );
                              },
                            );
                          },
                        ))
                    .toList(),
          );
        },
      ),
    );
  }
}


class FormularioWidget extends StatefulWidget {
  final String tipoComponente;
  final TextEditingController controller;
  final int tipodescripcion;
  final Map<String, dynamic> valorImportado;
  final Function(Map<String, dynamic>?) onResExportarUpdated;

  FormularioWidget({
    Key? key,
    required this.tipoComponente,
    required this.controller,
    required this.tipodescripcion,
    required this.valorImportado,
    required this.onResExportarUpdated,
  }) : super(key: key);

  @override
  _FormularioWidgetState createState() => _FormularioWidgetState();
}

class _FormularioWidgetState extends State<FormularioWidget> {
  final GestorComponentes gestorComponentes = GestorComponentes();
  final _formKey = GlobalKey<FormState>(); // Clave para manejar el estado del formulario
  List<String> componentes = [];
  List<String> paquetes = [];
  List<ValorParametrizable> valores = [];
  String? _opcionSeleccionada;
  String? _paqueteSeleccionado;
  bool _mostrarErrores = false;
  


  @override
  void initState() {
    super.initState();
    obtenerEntradas();
    obtenerComponenetes();
    
    // Si hay un valor importado para "Componente", se selecciona automáticamente
    if (widget.valorImportado["Componente"] != null) {
      _opcionSeleccionada = widget.valorImportado["Componente"];
      obtenerPaquetes(_opcionSeleccionada!); // Obtener paquetes asociados al componente importado
    }

    // Si hay un valor importado para "Paquete", se selecciona automáticamente
    if (widget.valorImportado["Paquete"] != null) {
      _paqueteSeleccionado = widget.valorImportado["Paquete"];
    }
  }

  Future<void> obtenerEntradas() async {
    List<ValorParametrizable> entradas = await gestorComponentes.seleccionarValoresDeComponente(widget.tipoComponente);
    setState(() {
      valores = entradas;
    });
  }

  Future<void> obtenerComponenetes() async {
    List<String> entradas = await gestorComponentes.obtenerComponentesPorTipo(widget.tipoComponente);
    setState(() {
      componentes = entradas;
    });
  }

  Future<void> obtenerPaquetes(String opcion) async {
    final List<String> entradas = await gestorComponentes.listarPaquetesPorComponente(opcion);
    setState(() {
      paquetes = entradas;

      // Si el paquete importado sigue siendo válido, mantenerlo seleccionado
      if (_paqueteSeleccionado == null || !paquetes.contains(_paqueteSeleccionado)) {
        _paqueteSeleccionado = null; // Resetear si el paquete importado no está en la lista
      }
    });
  }

  Future<void> generarDescripcion(String? nombreComponente, String? nombrePaquete, String tipo_componente, final List<TextEditingController> nuevoTexto) async {
    widget.controller.text = await gestorComponentes.obtenerDescripcionActualizada(nombreComponente, nombrePaquete, tipo_componente, nuevoTexto, widget.tipodescripcion);
  }

  Future<void> guardarConfiguracion(String? nombreComponente, String? nombrePaquete, List<TextEditingController> nuevoTexto) async {
    
    final nuevaConfig = await gestorComponentes.obtenerConfiguracionActual(nombreComponente, nombrePaquete, nuevoTexto);
    widget.onResExportarUpdated(nuevaConfig);
  }

  String rutaImagen() {
    String aux = widget.tipoComponente.replaceAll(" ", "_");
    return 'images/$aux.png';
  }

  String? validator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> formControllers = List.generate(
      valores.length,
      (index) {
        final controller = TextEditingController();
        controller.text = widget.valorImportado[valores[index].nombre]?.toString() ?? "";
        return controller;
      },
    );

    /// Antes de construir el Dropdown, agregas esto:
    if (componentes.length == 1 && _opcionSeleccionada == null) {
      setState(() {
        _opcionSeleccionada = componentes.first;
        _paqueteSeleccionado = null; // Resetear paquete al cambiar componente
        paquetes = []; // Limpiar paquetes temporalmente
      });

      obtenerPaquetes(componentes.first);
    }

    return AlertDialog(
      title: Text(widget.tipoComponente),
      content: Form(
        key: _formKey, // Asignar la clave del formulario
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              rutaImagen(),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),

            /// **Dropdown del Componente**
            DropdownButtonFormField<String>(
              isDense: true,
              decoration: InputDecoration(
                labelText: 'Tipo del componente',
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                errorStyle: TextStyle(color: Colors.red), // Estilo para el mensaje de error
              ),
              items: componentes.map((String componente) {
                return DropdownMenuItem<String>(
                  value: componente,
                  child: Text(componente),
                );
              }).toList(),
              value: _opcionSeleccionada ?? widget.valorImportado["Componente"],
              validator: (value) => validator(value, 'Por favor seleccione un componenete'),
              autovalidateMode: _mostrarErrores 
                ? AutovalidateMode.always 
                : AutovalidateMode.disabled,
              onChanged: (componentes.length == 1)
              ? null // Si hay solo una opción, desactivar el cambio
              : (String? newValue) async {
                  if (newValue == null) return;

                  setState(() {
                    _opcionSeleccionada = newValue;
                    _paqueteSeleccionado = null; // Resetear paquete al cambiar componente
                    paquetes = []; // Limpiar paquetes temporalmente
                  });

                  await obtenerPaquetes(newValue);
                },
            ),

            SizedBox(height: 16),

            /// **Dropdown del Paquete (Deshabilitado si no se ha seleccionado un componente)**
            paquetes.length > 1
              ? DropdownButtonFormField<String>(
                  isDense: true,
                  decoration: InputDecoration(
                    labelText: 'Tipo implmentación',
                    border: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    errorStyle: TextStyle(color: Colors.red), // Estilo para el mensaje de error
                  ),
                  items: paquetes.map((String paquete) {
                    return DropdownMenuItem<String>(
                      value: paquete,
                      child: Text(paquete),
                    );
                  }).toList(),
                  value: _opcionSeleccionada != null
                      ? (_paqueteSeleccionado ?? widget.valorImportado["Paquete"])
                      : null, // Si no hay opción seleccionada, se mantiene vacío
                 validator: (value) => validator(value, 'Por favor seleccione un tipo de implementación'),
                  autovalidateMode: _mostrarErrores 
                    ? AutovalidateMode.always 
                    : AutovalidateMode.disabled,
                  onChanged: _opcionSeleccionada != null
                      ? (String? newValue) {
                          setState(() {
                            _paqueteSeleccionado = newValue;
                          });
                        }
                      : null, // Deshabilitado si no hay selección en el primer dropdown
                  disabledHint: Text("Selecciona un componente primero"),
                )
              : SizedBox.shrink(),
            SizedBox(height: 16),

            /// **Campos numéricos generados dinámicamente con validación**
            ...List.generate(valores.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0), // Espaciado entre los campos
                child: TextFormField(
                  controller: formControllers[index],
                  decoration: InputDecoration(
                    labelText: valores[index].nombre,
                    labelStyle: _mostrarErrores && (formControllers[index].text.isEmpty)
                                ? TextStyle(color: Colors.red)
                                : TextStyle(color: Theme.of(context).colorScheme.onSurface),
                    hintText: valores[index].descripcion,
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                    errorStyle: TextStyle(color: Colors.red), // Estilo para el mensaje de error
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) => validator(value, 'Este campo es obligatorio'),
                  autovalidateMode: _mostrarErrores 
                    ? AutovalidateMode.always 
                    : AutovalidateMode.disabled,
                ),
              );
            }),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Generar'),
          onPressed: () {
            // Activar la validación
            setState(() {
              _mostrarErrores = true;
            });
            
            // Verificar si el formulario es válido
            if (_formKey.currentState!.validate()) {
              generarDescripcion(
                _opcionSeleccionada ?? widget.valorImportado["Componente"],
                _paqueteSeleccionado ?? widget.valorImportado["Paquete"] ?? (paquetes.isNotEmpty ? paquetes.first : null),
                widget.tipoComponente,
                formControllers,
              );
              guardarConfiguracion(_opcionSeleccionada, _paqueteSeleccionado ?? paquetes.first, formControllers);
              Navigator.of(context).pop();
            }
            // Si no es válido, se mostrarán los mensajes de error
          },
        ),
      ],
    );
  }
}
