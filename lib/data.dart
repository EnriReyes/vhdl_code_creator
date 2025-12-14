// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'dart:io';

// part 'data.g.dart';

// @DataClassName('Componente')
// class Componentes extends Table {
//   TextColumn get nombre => text().withLength(min: 1, max: 50)();
//   TextColumn get tipo => text().withLength(min: 1, max: 50)();
//   TextColumn get descripcion => text().withLength(min: 0, max: 1000)();

//   @override
//   Set<Column> get primaryKey => {nombre};
// }

// @DriftDatabase(tables: [Componentes])
// class ComponentesDTO extends _$ComponentesDTO {
// // Constructor privado para el patrón singleton
//   ComponentesDTO._internal() : super(NativeDatabase(File('componentes.sqlite')));

// // Instancia única de la base de datos
//   static final ComponentesDTO instance = ComponentesDTO._internal();

//   @override
//   int get schemaVersion => 1;

//   // Método para insertar un componente
//   Future<int> insertarComponente(String nombre, String tipo, String descripcion) {
//     return into(componentes).insert(ComponentesCompanion(
//       nombre: Value(nombre),
//       tipo: Value(tipo),
//       descripcion: Value(descripcion),
//     ));
//   }

//   // Método para ver un componente específico por su nombre
//   Future<Componente?> verComponentePorNombre(String nombre) {
//     return (select(componentes)..where((c) => c.nombre.equals(nombre))).getSingleOrNull();
//   }

//   // Método para ver todos los nombres de los componentes
//   Future<List<String>> verTodosLosNombresComponentes() async {
//     final query = selectOnly(componentes)..addColumns([componentes.nombre]);
//     final rows = await query.map((row) => row.read(componentes.nombre)!).get();
//     return rows;
//   }

//   // Método para eliminar un componente por su nombre
//   Future<int> eliminarComponentePorNombre(String nombre) {
//     return (delete(componentes)..where((c) => c.nombre.equals(nombre))).go();
//   }

//   // Método para obtener el número de componentes insertados
// Future<int> obtenerNumeroDeComponentes() {
//   return (select(componentes).get()).then((list) => list.length);
// }

// }




import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'data.g.dart';

@DataClassName('Componente')
class Componentes extends Table {
  TextColumn get nombre => text().withLength(min: 1, max: 50)();
  TextColumn get tipo => text().withLength(min: 1, max: 50)();
  TextColumn get clase => text().withLength(min: 1, max: 50)();
  @override
  Set<Column> get primaryKey => {nombre};
}

@DataClassName('ValorParametrizable')
class ValoresParametrizables extends Table {
  TextColumn get nombre => text().withLength(min: 1, max: 50)();
  TextColumn get descripcion => text().withLength(min: 0, max: 1000)();
  IntColumn get orden => integer()();
  @override
  Set<Column> get primaryKey => {nombre};
}

@DataClassName('Paquete')
class Paquetes extends Table {
  TextColumn get componente => text().references(Componentes, #nombre)();
  TextColumn get nombre => text().withLength(min: 1, max: 50)();
  TextColumn get descripcion => text().withLength(min: 0, max: 1000)();
  TextColumn get testbench => text().withLength(min: 0, max: 2000)();

  @override
  Set<Column> get primaryKey => {componente, nombre};
}
@DataClassName('ComponenteValorParametrizable')
class ComponentesValoresParametrizables extends Table {
  TextColumn get tipoComponente => text().withLength(min: 1, max: 50).references(Componentes, #tipo)();
  TextColumn get idValor => text().withLength(min: 1, max: 50).references(ValoresParametrizables, #nombre)();

  @override
  Set<Column> get primaryKey => {tipoComponente, idValor};
}

@DriftDatabase(tables: [Componentes, ValoresParametrizables, Paquetes, ComponentesValoresParametrizables])
class ComponentesDTO extends _$ComponentesDTO {
  // Constructor privado para el patrón singleton
  ComponentesDTO._internal() : super(NativeDatabase(File('componentes.sqlite')));

  // Instancia única de la base de datos
  static final ComponentesDTO instance = ComponentesDTO._internal();

  @override
  int get schemaVersion => 2;

  // Métodos para insertar datos en las tablas
  Future<int> insertarComponente(String nombre, String tipo, String clase) {
    return into(componentes).insert(ComponentesCompanion(
      nombre: Value(nombre),
      tipo: Value(tipo),
      clase: Value(clase),
    ));
  }
  //Metodo para seleccionar un componente por nombre
  Future<Componente?> verComponentePorNombre(String nombre) {
    return (select(componentes)..where((c) => c.nombre.equals(nombre))).getSingleOrNull();
  }
  //Método para seleccionar todos los nombres de los componentes de la base de datos
  Future<List<String>> verTodosLosNombresComponentes() async {
    final query = selectOnly(componentes)..addColumns([componentes.nombre]);
    final rows = await query.map((row) => row.read(componentes.nombre)!).get();
    return rows;
  }
//Método para eliminar un componente en función de su nombre
  Future<int> eliminarComponentePorNombre(String nombre) {
    return (delete(componentes)..where((c) => c.nombre.equals(nombre))).go();
  }
//Método para obtener el numero de componentes que hay en la base de datos
  Future<int> obtenerNumeroDeComponentes() {
    return (select(componentes).get()).then((list) => list.length);
  }

  Future<List<String>> obtenerComponentesPorTipo(String tipo) async {
    final query = (select(componentes)..where((c) => c.tipo.equals(tipo)));
    final resultados = await query.map((componente) => componente.nombre).get();
    return resultados;
  }


  // Método para obtener los distintos tipos de componentes
  Future<List<String>> obtenerClasesUnicasDeComponentes() async {
    final query = selectOnly(componentes, distinct: true)..addColumns([componentes.clase]);

    final resultados = await query.map((row) => row.read(componentes.clase)!).get();
    return resultados;
  }

  // Método para obtener los tipos únicos en base a una clase específica
  Future<List<String>> obtenerTiposPorClase(String clase) async {
    final query = (selectOnly(componentes, distinct: true)
          ..addColumns([componentes.tipo])
          ..where(componentes.clase.equals(clase)));

    final resultados = await query.map((row) => row.read(componentes.tipo)!).get();

    return resultados;
  }

  // Inserta un nuevo valor parametrizable en la tabla `ValoresParametrizables`
  Future<int> insertarValorParametrizable(String nombre, String descripcion, int orden) {
    return into(valoresParametrizables).insert(
      ValoresParametrizablesCompanion(
        nombre: Value(nombre),
        descripcion: Value(descripcion),
        orden: Value(orden),
      ),
    );
  }

  // Borra un valor parametrizable de la tabla `ValoresParametrizables` basado en el nombre
  Future<int> borrarValorParametrizable(String nombre) {
    return (delete(valoresParametrizables)
          ..where((valor) => valor.nombre.equals(nombre)))
        .go();
  }

  // Obtiene un valor parametrizable específico de la tabla `ValoresParametrizables` según su nombre
  Future<ValorParametrizable?> verValorParametrizablePorNombre(String nombre) {
    return (select(valoresParametrizables)
          ..where((valor) => valor.nombre.equals(nombre)))
        .getSingleOrNull();
  }

  // Inserta una relación entre un componente y un valor parametrizable en la tabla `ComponentesValoresParametrizables`
  Future<int> insertarComponenteValorParametrizable(String tipoComponente, String idValor) {
    return into(componentesValoresParametrizables).insert(
      ComponentesValoresParametrizablesCompanion(
        tipoComponente: Value(tipoComponente),
        idValor: Value(idValor),
      ),
    );
  }

  // Borra una relación entre un componente y un valor parametrizable de la tabla `ComponentesValoresParametrizables`
  Future<int> borrarComponenteValorParametrizable(String tipoComponente, String idValor) {
    return (delete(componentesValoresParametrizables)
          ..where((entry) => entry.tipoComponente.equals(tipoComponente) & entry.idValor.equals(idValor)))
        .go();
  }

  // Selecciona todas los valores paramtrizables de un componenete
  Future<List<String>> seleccionarValoresDeComponente(String tipoComponente) async {
    final resultados = await (selectOnly(componentesValoresParametrizables)
          ..addColumns([componentesValoresParametrizables.idValor])
          ..where(componentesValoresParametrizables.tipoComponente.equals(tipoComponente)))
        .map((row) => row.read(componentesValoresParametrizables.idValor)!)
        .get();
    
    return resultados;
  }

  Future<int> insertarPaquete(String componente, String nombre, String descripcion, String testbench) {
    return into(paquetes).insert(PaquetesCompanion(
      componente: Value(componente),
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      testbench: Value(testbench),
    ));
  }

  Future<int> eliminarPaquete(String componente, String nombre) {
    return (delete(paquetes)
          ..where((p) => p.componente.equals(componente) & p.nombre.equals(nombre)))
        .go();
  }

  Future<List<String>> obtenerPaquetesPorComponente(String componente) async {
    final query = (select(paquetes)..where((c) => c.componente.equals(componente)));
    final resultados = await query.map((paquete) => paquete.nombre).get();
    return resultados;
  }

  Future<Paquete?> obtenerPaquetePorNombreYComponente(String componente, String nombre) {
    return (select(paquetes)
          ..where((p) => p.componente.equals(componente) & p.nombre.equals(nombre)))
        .getSingleOrNull();
  }
}
