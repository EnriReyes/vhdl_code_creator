import 'dart:io';
import 'package:file_picker/file_picker.dart';

class GestorFicheros {

  GestorFicheros._privateConstructor(); // Constructor privado
  static final GestorFicheros _instance = GestorFicheros._privateConstructor();
  factory GestorFicheros() {
    return _instance;
  }

  bool isSavingFile = false; 

  Future<void> saveTextFile(String content, {String formato = "vhdl"}) async {
    if (isSavingFile) return;

    isSavingFile = true; // <<- Aquí inmediatamente

    try {
      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Seleccione la ubicación para guardar el archivo:',
        fileName: 'archivo_generado.${formato}',
      );

      if (outputFile != null) {
        File file = File(outputFile);
        await file.writeAsString(content);
      }
    } catch (e) {
      throw Exception('Error al guardar el archivo: $e');
    } finally {
      isSavingFile = false; 
    }
  }

  Future<String?> getPathFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        return result.files.single.path;
      }
    } catch (e) {
      throw Exception('Error al seleccionar el archivo: $e');
    }
    return null;
  }

  Future<Map<String, dynamic>?> leerDatosDesdeFichero() async {
    if (isSavingFile) return null;
    try {
      isSavingFile = true;
      String? path = await getPathFile();
      if (path == null) return null;

      File file = File(path);
      String contenido = await file.readAsString();

      // Expresión regular mejorada para capturar el nombre completo antes de la primera coma
      RegExp exp = RegExp(r'Componente:\s*([^,]+),\s*Paquete:\s*([^,]+),\s*(.*)');
      RegExpMatch? match = exp.firstMatch(contenido);

      if (match != null) {
        Map<String, dynamic> datos = {
          'Componente': match.group(1)?.trim(), // Captura el nombre hasta la primera coma
          'Paquete': match.group(2)?.trim(),    // Captura el nombre del paquete
        };

        // Extraer los valores clave-valor
        String valoresRestantes = match.group(3)?.trim() ?? "";
        Iterable<RegExpMatch> matches = RegExp(r'([\w_]+):(\d+)').allMatches(valoresRestantes);

        for (var m in matches) {
          datos[m.group(1)!] = int.parse(m.group(2)!); // Guarda clave y valor en el mapa
        }

        return datos;
      }
    } catch (e) {
      throw Exception('Error al leer el archivo: $e');
    }finally{
      isSavingFile = false;
    }
    return null;
  }

  void storeDatatoFile(Map<String, dynamic>? resExportar) async {
    if (resExportar == null || resExportar.isEmpty) {
      throw Exception('El mapa resExportar está vacío o es nulo.');
    }

    // Obtener el nombre del componente y removerlo del mapa temporalmente
    String nombreComponente = resExportar["Componente"] ?? "Desconocido";
    resExportar.remove("Componente");

    // Construir la cadena de texto con los valores
    String content = "Componente:$nombreComponente,";
    
    String nombrePaquete = resExportar["Paquete"] ?? "Desconocido";
    resExportar.remove("Paquete");

    content += " Paquete:$nombrePaquete,";

    resExportar.forEach((key, value) {
      content += " $key:$value,";
    });

    saveTextFile(content, formato:"txt");
  }
}