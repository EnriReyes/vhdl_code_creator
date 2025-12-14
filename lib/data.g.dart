// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $ComponentesTable extends Componentes
    with TableInfo<$ComponentesTable, Componente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
      'tipo', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _claseMeta = const VerificationMeta('clase');
  @override
  late final GeneratedColumn<String> clase = GeneratedColumn<String>(
      'clase', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [nombre, tipo, clase];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'componentes';
  @override
  VerificationContext validateIntegrity(Insertable<Componente> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
          _tipoMeta, tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta));
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('clase')) {
      context.handle(
          _claseMeta, clase.isAcceptableOrUnknown(data['clase']!, _claseMeta));
    } else if (isInserting) {
      context.missing(_claseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombre};
  @override
  Componente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Componente(
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      tipo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo'])!,
      clase: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clase'])!,
    );
  }

  @override
  $ComponentesTable createAlias(String alias) {
    return $ComponentesTable(attachedDatabase, alias);
  }
}

class Componente extends DataClass implements Insertable<Componente> {
  final String nombre;
  final String tipo;
  final String clase;
  const Componente(
      {required this.nombre, required this.tipo, required this.clase});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre'] = Variable<String>(nombre);
    map['tipo'] = Variable<String>(tipo);
    map['clase'] = Variable<String>(clase);
    return map;
  }

  ComponentesCompanion toCompanion(bool nullToAbsent) {
    return ComponentesCompanion(
      nombre: Value(nombre),
      tipo: Value(tipo),
      clase: Value(clase),
    );
  }

  factory Componente.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Componente(
      nombre: serializer.fromJson<String>(json['nombre']),
      tipo: serializer.fromJson<String>(json['tipo']),
      clase: serializer.fromJson<String>(json['clase']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombre': serializer.toJson<String>(nombre),
      'tipo': serializer.toJson<String>(tipo),
      'clase': serializer.toJson<String>(clase),
    };
  }

  Componente copyWith({String? nombre, String? tipo, String? clase}) =>
      Componente(
        nombre: nombre ?? this.nombre,
        tipo: tipo ?? this.tipo,
        clase: clase ?? this.clase,
      );
  Componente copyWithCompanion(ComponentesCompanion data) {
    return Componente(
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      clase: data.clase.present ? data.clase.value : this.clase,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Componente(')
          ..write('nombre: $nombre, ')
          ..write('tipo: $tipo, ')
          ..write('clase: $clase')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nombre, tipo, clase);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Componente &&
          other.nombre == this.nombre &&
          other.tipo == this.tipo &&
          other.clase == this.clase);
}

class ComponentesCompanion extends UpdateCompanion<Componente> {
  final Value<String> nombre;
  final Value<String> tipo;
  final Value<String> clase;
  final Value<int> rowid;
  const ComponentesCompanion({
    this.nombre = const Value.absent(),
    this.tipo = const Value.absent(),
    this.clase = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentesCompanion.insert({
    required String nombre,
    required String tipo,
    required String clase,
    this.rowid = const Value.absent(),
  })  : nombre = Value(nombre),
        tipo = Value(tipo),
        clase = Value(clase);
  static Insertable<Componente> custom({
    Expression<String>? nombre,
    Expression<String>? tipo,
    Expression<String>? clase,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nombre != null) 'nombre': nombre,
      if (tipo != null) 'tipo': tipo,
      if (clase != null) 'clase': clase,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentesCompanion copyWith(
      {Value<String>? nombre,
      Value<String>? tipo,
      Value<String>? clase,
      Value<int>? rowid}) {
    return ComponentesCompanion(
      nombre: nombre ?? this.nombre,
      tipo: tipo ?? this.tipo,
      clase: clase ?? this.clase,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (clase.present) {
      map['clase'] = Variable<String>(clase.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentesCompanion(')
          ..write('nombre: $nombre, ')
          ..write('tipo: $tipo, ')
          ..write('clase: $clase, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ValoresParametrizablesTable extends ValoresParametrizables
    with TableInfo<$ValoresParametrizablesTable, ValorParametrizable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ValoresParametrizablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ordenMeta = const VerificationMeta('orden');
  @override
  late final GeneratedColumn<int> orden = GeneratedColumn<int>(
      'orden', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [nombre, descripcion, orden];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'valores_parametrizables';
  @override
  VerificationContext validateIntegrity(
      Insertable<ValorParametrizable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('orden')) {
      context.handle(
          _ordenMeta, orden.isAcceptableOrUnknown(data['orden']!, _ordenMeta));
    } else if (isInserting) {
      context.missing(_ordenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nombre};
  @override
  ValorParametrizable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ValorParametrizable(
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      orden: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}orden'])!,
    );
  }

  @override
  $ValoresParametrizablesTable createAlias(String alias) {
    return $ValoresParametrizablesTable(attachedDatabase, alias);
  }
}

class ValorParametrizable extends DataClass
    implements Insertable<ValorParametrizable> {
  final String nombre;
  final String descripcion;
  final int orden;
  const ValorParametrizable(
      {required this.nombre, required this.descripcion, required this.orden});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nombre'] = Variable<String>(nombre);
    map['descripcion'] = Variable<String>(descripcion);
    map['orden'] = Variable<int>(orden);
    return map;
  }

  ValoresParametrizablesCompanion toCompanion(bool nullToAbsent) {
    return ValoresParametrizablesCompanion(
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      orden: Value(orden),
    );
  }

  factory ValorParametrizable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ValorParametrizable(
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      orden: serializer.fromJson<int>(json['orden']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'orden': serializer.toJson<int>(orden),
    };
  }

  ValorParametrizable copyWith(
          {String? nombre, String? descripcion, int? orden}) =>
      ValorParametrizable(
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        orden: orden ?? this.orden,
      );
  ValorParametrizable copyWithCompanion(ValoresParametrizablesCompanion data) {
    return ValorParametrizable(
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion:
          data.descripcion.present ? data.descripcion.value : this.descripcion,
      orden: data.orden.present ? data.orden.value : this.orden,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ValorParametrizable(')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('orden: $orden')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nombre, descripcion, orden);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValorParametrizable &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.orden == this.orden);
}

class ValoresParametrizablesCompanion
    extends UpdateCompanion<ValorParametrizable> {
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<int> orden;
  final Value<int> rowid;
  const ValoresParametrizablesCompanion({
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.orden = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ValoresParametrizablesCompanion.insert({
    required String nombre,
    required String descripcion,
    required int orden,
    this.rowid = const Value.absent(),
  })  : nombre = Value(nombre),
        descripcion = Value(descripcion),
        orden = Value(orden);
  static Insertable<ValorParametrizable> custom({
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<int>? orden,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (orden != null) 'orden': orden,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ValoresParametrizablesCompanion copyWith(
      {Value<String>? nombre,
      Value<String>? descripcion,
      Value<int>? orden,
      Value<int>? rowid}) {
    return ValoresParametrizablesCompanion(
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      orden: orden ?? this.orden,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (orden.present) {
      map['orden'] = Variable<int>(orden.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ValoresParametrizablesCompanion(')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('orden: $orden, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaquetesTable extends Paquetes with TableInfo<$PaquetesTable, Paquete> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaquetesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _componenteMeta =
      const VerificationMeta('componente');
  @override
  late final GeneratedColumn<String> componente = GeneratedColumn<String>(
      'componente', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES componentes (nombre)'));
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _testbenchMeta =
      const VerificationMeta('testbench');
  @override
  late final GeneratedColumn<String> testbench = GeneratedColumn<String>(
      'testbench', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [componente, nombre, descripcion, testbench];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'paquetes';
  @override
  VerificationContext validateIntegrity(Insertable<Paquete> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('componente')) {
      context.handle(
          _componenteMeta,
          componente.isAcceptableOrUnknown(
              data['componente']!, _componenteMeta));
    } else if (isInserting) {
      context.missing(_componenteMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('testbench')) {
      context.handle(_testbenchMeta,
          testbench.isAcceptableOrUnknown(data['testbench']!, _testbenchMeta));
    } else if (isInserting) {
      context.missing(_testbenchMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {componente, nombre};
  @override
  Paquete map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Paquete(
      componente: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}componente'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      testbench: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}testbench'])!,
    );
  }

  @override
  $PaquetesTable createAlias(String alias) {
    return $PaquetesTable(attachedDatabase, alias);
  }
}

class Paquete extends DataClass implements Insertable<Paquete> {
  final String componente;
  final String nombre;
  final String descripcion;
  final String testbench;
  const Paquete(
      {required this.componente,
      required this.nombre,
      required this.descripcion,
      required this.testbench});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['componente'] = Variable<String>(componente);
    map['nombre'] = Variable<String>(nombre);
    map['descripcion'] = Variable<String>(descripcion);
    map['testbench'] = Variable<String>(testbench);
    return map;
  }

  PaquetesCompanion toCompanion(bool nullToAbsent) {
    return PaquetesCompanion(
      componente: Value(componente),
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      testbench: Value(testbench),
    );
  }

  factory Paquete.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Paquete(
      componente: serializer.fromJson<String>(json['componente']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      testbench: serializer.fromJson<String>(json['testbench']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'componente': serializer.toJson<String>(componente),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'testbench': serializer.toJson<String>(testbench),
    };
  }

  Paquete copyWith(
          {String? componente,
          String? nombre,
          String? descripcion,
          String? testbench}) =>
      Paquete(
        componente: componente ?? this.componente,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        testbench: testbench ?? this.testbench,
      );
  Paquete copyWithCompanion(PaquetesCompanion data) {
    return Paquete(
      componente:
          data.componente.present ? data.componente.value : this.componente,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion:
          data.descripcion.present ? data.descripcion.value : this.descripcion,
      testbench: data.testbench.present ? data.testbench.value : this.testbench,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Paquete(')
          ..write('componente: $componente, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('testbench: $testbench')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(componente, nombre, descripcion, testbench);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Paquete &&
          other.componente == this.componente &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.testbench == this.testbench);
}

class PaquetesCompanion extends UpdateCompanion<Paquete> {
  final Value<String> componente;
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<String> testbench;
  final Value<int> rowid;
  const PaquetesCompanion({
    this.componente = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.testbench = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaquetesCompanion.insert({
    required String componente,
    required String nombre,
    required String descripcion,
    required String testbench,
    this.rowid = const Value.absent(),
  })  : componente = Value(componente),
        nombre = Value(nombre),
        descripcion = Value(descripcion),
        testbench = Value(testbench);
  static Insertable<Paquete> custom({
    Expression<String>? componente,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<String>? testbench,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (componente != null) 'componente': componente,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (testbench != null) 'testbench': testbench,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaquetesCompanion copyWith(
      {Value<String>? componente,
      Value<String>? nombre,
      Value<String>? descripcion,
      Value<String>? testbench,
      Value<int>? rowid}) {
    return PaquetesCompanion(
      componente: componente ?? this.componente,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      testbench: testbench ?? this.testbench,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (componente.present) {
      map['componente'] = Variable<String>(componente.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (testbench.present) {
      map['testbench'] = Variable<String>(testbench.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaquetesCompanion(')
          ..write('componente: $componente, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('testbench: $testbench, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComponentesValoresParametrizablesTable
    extends ComponentesValoresParametrizables
    with
        TableInfo<$ComponentesValoresParametrizablesTable,
            ComponenteValorParametrizable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComponentesValoresParametrizablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tipoComponenteMeta =
      const VerificationMeta('tipoComponente');
  @override
  late final GeneratedColumn<String> tipoComponente = GeneratedColumn<String>(
      'tipo_componente', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES componentes (tipo)'));
  static const VerificationMeta _idValorMeta =
      const VerificationMeta('idValor');
  @override
  late final GeneratedColumn<String> idValor = GeneratedColumn<String>(
      'id_valor', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES valores_parametrizables (nombre)'));
  @override
  List<GeneratedColumn> get $columns => [tipoComponente, idValor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'componentes_valores_parametrizables';
  @override
  VerificationContext validateIntegrity(
      Insertable<ComponenteValorParametrizable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tipo_componente')) {
      context.handle(
          _tipoComponenteMeta,
          tipoComponente.isAcceptableOrUnknown(
              data['tipo_componente']!, _tipoComponenteMeta));
    } else if (isInserting) {
      context.missing(_tipoComponenteMeta);
    }
    if (data.containsKey('id_valor')) {
      context.handle(_idValorMeta,
          idValor.isAcceptableOrUnknown(data['id_valor']!, _idValorMeta));
    } else if (isInserting) {
      context.missing(_idValorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tipoComponente, idValor};
  @override
  ComponenteValorParametrizable map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComponenteValorParametrizable(
      tipoComponente: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tipo_componente'])!,
      idValor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_valor'])!,
    );
  }

  @override
  $ComponentesValoresParametrizablesTable createAlias(String alias) {
    return $ComponentesValoresParametrizablesTable(attachedDatabase, alias);
  }
}

class ComponenteValorParametrizable extends DataClass
    implements Insertable<ComponenteValorParametrizable> {
  final String tipoComponente;
  final String idValor;
  const ComponenteValorParametrizable(
      {required this.tipoComponente, required this.idValor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tipo_componente'] = Variable<String>(tipoComponente);
    map['id_valor'] = Variable<String>(idValor);
    return map;
  }

  ComponentesValoresParametrizablesCompanion toCompanion(bool nullToAbsent) {
    return ComponentesValoresParametrizablesCompanion(
      tipoComponente: Value(tipoComponente),
      idValor: Value(idValor),
    );
  }

  factory ComponenteValorParametrizable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComponenteValorParametrizable(
      tipoComponente: serializer.fromJson<String>(json['tipoComponente']),
      idValor: serializer.fromJson<String>(json['idValor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tipoComponente': serializer.toJson<String>(tipoComponente),
      'idValor': serializer.toJson<String>(idValor),
    };
  }

  ComponenteValorParametrizable copyWith(
          {String? tipoComponente, String? idValor}) =>
      ComponenteValorParametrizable(
        tipoComponente: tipoComponente ?? this.tipoComponente,
        idValor: idValor ?? this.idValor,
      );
  ComponenteValorParametrizable copyWithCompanion(
      ComponentesValoresParametrizablesCompanion data) {
    return ComponenteValorParametrizable(
      tipoComponente: data.tipoComponente.present
          ? data.tipoComponente.value
          : this.tipoComponente,
      idValor: data.idValor.present ? data.idValor.value : this.idValor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComponenteValorParametrizable(')
          ..write('tipoComponente: $tipoComponente, ')
          ..write('idValor: $idValor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tipoComponente, idValor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComponenteValorParametrizable &&
          other.tipoComponente == this.tipoComponente &&
          other.idValor == this.idValor);
}

class ComponentesValoresParametrizablesCompanion
    extends UpdateCompanion<ComponenteValorParametrizable> {
  final Value<String> tipoComponente;
  final Value<String> idValor;
  final Value<int> rowid;
  const ComponentesValoresParametrizablesCompanion({
    this.tipoComponente = const Value.absent(),
    this.idValor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComponentesValoresParametrizablesCompanion.insert({
    required String tipoComponente,
    required String idValor,
    this.rowid = const Value.absent(),
  })  : tipoComponente = Value(tipoComponente),
        idValor = Value(idValor);
  static Insertable<ComponenteValorParametrizable> custom({
    Expression<String>? tipoComponente,
    Expression<String>? idValor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tipoComponente != null) 'tipo_componente': tipoComponente,
      if (idValor != null) 'id_valor': idValor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComponentesValoresParametrizablesCompanion copyWith(
      {Value<String>? tipoComponente,
      Value<String>? idValor,
      Value<int>? rowid}) {
    return ComponentesValoresParametrizablesCompanion(
      tipoComponente: tipoComponente ?? this.tipoComponente,
      idValor: idValor ?? this.idValor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tipoComponente.present) {
      map['tipo_componente'] = Variable<String>(tipoComponente.value);
    }
    if (idValor.present) {
      map['id_valor'] = Variable<String>(idValor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentesValoresParametrizablesCompanion(')
          ..write('tipoComponente: $tipoComponente, ')
          ..write('idValor: $idValor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ComponentesDTO extends GeneratedDatabase {
  _$ComponentesDTO(QueryExecutor e) : super(e);
  $ComponentesDTOManager get managers => $ComponentesDTOManager(this);
  late final $ComponentesTable componentes = $ComponentesTable(this);
  late final $ValoresParametrizablesTable valoresParametrizables =
      $ValoresParametrizablesTable(this);
  late final $PaquetesTable paquetes = $PaquetesTable(this);
  late final $ComponentesValoresParametrizablesTable
      componentesValoresParametrizables =
      $ComponentesValoresParametrizablesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        componentes,
        valoresParametrizables,
        paquetes,
        componentesValoresParametrizables
      ];
}

typedef $$ComponentesTableCreateCompanionBuilder = ComponentesCompanion
    Function({
  required String nombre,
  required String tipo,
  required String clase,
  Value<int> rowid,
});
typedef $$ComponentesTableUpdateCompanionBuilder = ComponentesCompanion
    Function({
  Value<String> nombre,
  Value<String> tipo,
  Value<String> clase,
  Value<int> rowid,
});

final class $$ComponentesTableReferences
    extends BaseReferences<_$ComponentesDTO, $ComponentesTable, Componente> {
  $$ComponentesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PaquetesTable, List<Paquete>> _paquetesRefsTable(
          _$ComponentesDTO db) =>
      MultiTypedResultKey.fromTable(db.paquetes,
          aliasName: $_aliasNameGenerator(
              db.componentes.nombre, db.paquetes.componente));

  $$PaquetesTableProcessedTableManager get paquetesRefs {
    final manager = $$PaquetesTableTableManager($_db, $_db.paquetes)
        .filter((f) => f.componente.nombre($_item.nombre));

    final cache = $_typedResult.readTableOrNull(_paquetesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ComponentesValoresParametrizablesTable,
          List<ComponenteValorParametrizable>>
      _componentesValoresParametrizablesRefsTable(_$ComponentesDTO db) =>
          MultiTypedResultKey.fromTable(db.componentesValoresParametrizables,
              aliasName: $_aliasNameGenerator(db.componentes.tipo,
                  db.componentesValoresParametrizables.tipoComponente));

  $$ComponentesValoresParametrizablesTableProcessedTableManager
      get componentesValoresParametrizablesRefs {
    final manager = $$ComponentesValoresParametrizablesTableTableManager(
            $_db, $_db.componentesValoresParametrizables)
        .filter((f) => f.tipoComponente.tipo($_item.tipo));

    final cache = $_typedResult
        .readTableOrNull(_componentesValoresParametrizablesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ComponentesTableFilterComposer
    extends Composer<_$ComponentesDTO, $ComponentesTable> {
  $$ComponentesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipo => $composableBuilder(
      column: $table.tipo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clase => $composableBuilder(
      column: $table.clase, builder: (column) => ColumnFilters(column));

  Expression<bool> paquetesRefs(
      Expression<bool> Function($$PaquetesTableFilterComposer f) f) {
    final $$PaquetesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nombre,
        referencedTable: $db.paquetes,
        getReferencedColumn: (t) => t.componente,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaquetesTableFilterComposer(
              $db: $db,
              $table: $db.paquetes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> componentesValoresParametrizablesRefs(
      Expression<bool> Function(
              $$ComponentesValoresParametrizablesTableFilterComposer f)
          f) {
    final $$ComponentesValoresParametrizablesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.tipo,
            referencedTable: $db.componentesValoresParametrizables,
            getReferencedColumn: (t) => t.tipoComponente,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ComponentesValoresParametrizablesTableFilterComposer(
                  $db: $db,
                  $table: $db.componentesValoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ComponentesTableOrderingComposer
    extends Composer<_$ComponentesDTO, $ComponentesTable> {
  $$ComponentesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipo => $composableBuilder(
      column: $table.tipo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clase => $composableBuilder(
      column: $table.clase, builder: (column) => ColumnOrderings(column));
}

class $$ComponentesTableAnnotationComposer
    extends Composer<_$ComponentesDTO, $ComponentesTable> {
  $$ComponentesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get clase =>
      $composableBuilder(column: $table.clase, builder: (column) => column);

  Expression<T> paquetesRefs<T extends Object>(
      Expression<T> Function($$PaquetesTableAnnotationComposer a) f) {
    final $$PaquetesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nombre,
        referencedTable: $db.paquetes,
        getReferencedColumn: (t) => t.componente,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaquetesTableAnnotationComposer(
              $db: $db,
              $table: $db.paquetes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> componentesValoresParametrizablesRefs<T extends Object>(
      Expression<T> Function(
              $$ComponentesValoresParametrizablesTableAnnotationComposer a)
          f) {
    final $$ComponentesValoresParametrizablesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.tipo,
            referencedTable: $db.componentesValoresParametrizables,
            getReferencedColumn: (t) => t.tipoComponente,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ComponentesValoresParametrizablesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.componentesValoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ComponentesTableTableManager extends RootTableManager<
    _$ComponentesDTO,
    $ComponentesTable,
    Componente,
    $$ComponentesTableFilterComposer,
    $$ComponentesTableOrderingComposer,
    $$ComponentesTableAnnotationComposer,
    $$ComponentesTableCreateCompanionBuilder,
    $$ComponentesTableUpdateCompanionBuilder,
    (Componente, $$ComponentesTableReferences),
    Componente,
    PrefetchHooks Function(
        {bool paquetesRefs, bool componentesValoresParametrizablesRefs})> {
  $$ComponentesTableTableManager(_$ComponentesDTO db, $ComponentesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> nombre = const Value.absent(),
            Value<String> tipo = const Value.absent(),
            Value<String> clase = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ComponentesCompanion(
            nombre: nombre,
            tipo: tipo,
            clase: clase,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String nombre,
            required String tipo,
            required String clase,
            Value<int> rowid = const Value.absent(),
          }) =>
              ComponentesCompanion.insert(
            nombre: nombre,
            tipo: tipo,
            clase: clase,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ComponentesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {paquetesRefs = false,
              componentesValoresParametrizablesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (paquetesRefs) db.paquetes,
                if (componentesValoresParametrizablesRefs)
                  db.componentesValoresParametrizables
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (paquetesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ComponentesTableReferences._paquetesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ComponentesTableReferences(db, table, p0)
                                .paquetesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.componente == item.nombre),
                        typedResults: items),
                  if (componentesValoresParametrizablesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ComponentesTableReferences
                            ._componentesValoresParametrizablesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ComponentesTableReferences(db, table, p0)
                                .componentesValoresParametrizablesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.tipoComponente == item.tipo),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ComponentesTableProcessedTableManager = ProcessedTableManager<
    _$ComponentesDTO,
    $ComponentesTable,
    Componente,
    $$ComponentesTableFilterComposer,
    $$ComponentesTableOrderingComposer,
    $$ComponentesTableAnnotationComposer,
    $$ComponentesTableCreateCompanionBuilder,
    $$ComponentesTableUpdateCompanionBuilder,
    (Componente, $$ComponentesTableReferences),
    Componente,
    PrefetchHooks Function(
        {bool paquetesRefs, bool componentesValoresParametrizablesRefs})>;
typedef $$ValoresParametrizablesTableCreateCompanionBuilder
    = ValoresParametrizablesCompanion Function({
  required String nombre,
  required String descripcion,
  required int orden,
  Value<int> rowid,
});
typedef $$ValoresParametrizablesTableUpdateCompanionBuilder
    = ValoresParametrizablesCompanion Function({
  Value<String> nombre,
  Value<String> descripcion,
  Value<int> orden,
  Value<int> rowid,
});

final class $$ValoresParametrizablesTableReferences extends BaseReferences<
    _$ComponentesDTO, $ValoresParametrizablesTable, ValorParametrizable> {
  $$ValoresParametrizablesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ComponentesValoresParametrizablesTable,
          List<ComponenteValorParametrizable>>
      _componentesValoresParametrizablesRefsTable(_$ComponentesDTO db) =>
          MultiTypedResultKey.fromTable(db.componentesValoresParametrizables,
              aliasName: $_aliasNameGenerator(db.valoresParametrizables.nombre,
                  db.componentesValoresParametrizables.idValor));

  $$ComponentesValoresParametrizablesTableProcessedTableManager
      get componentesValoresParametrizablesRefs {
    final manager = $$ComponentesValoresParametrizablesTableTableManager(
            $_db, $_db.componentesValoresParametrizables)
        .filter((f) => f.idValor.nombre($_item.nombre));

    final cache = $_typedResult
        .readTableOrNull(_componentesValoresParametrizablesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ValoresParametrizablesTableFilterComposer
    extends Composer<_$ComponentesDTO, $ValoresParametrizablesTable> {
  $$ValoresParametrizablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orden => $composableBuilder(
      column: $table.orden, builder: (column) => ColumnFilters(column));

  Expression<bool> componentesValoresParametrizablesRefs(
      Expression<bool> Function(
              $$ComponentesValoresParametrizablesTableFilterComposer f)
          f) {
    final $$ComponentesValoresParametrizablesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.nombre,
            referencedTable: $db.componentesValoresParametrizables,
            getReferencedColumn: (t) => t.idValor,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ComponentesValoresParametrizablesTableFilterComposer(
                  $db: $db,
                  $table: $db.componentesValoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ValoresParametrizablesTableOrderingComposer
    extends Composer<_$ComponentesDTO, $ValoresParametrizablesTable> {
  $$ValoresParametrizablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orden => $composableBuilder(
      column: $table.orden, builder: (column) => ColumnOrderings(column));
}

class $$ValoresParametrizablesTableAnnotationComposer
    extends Composer<_$ComponentesDTO, $ValoresParametrizablesTable> {
  $$ValoresParametrizablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => column);

  GeneratedColumn<int> get orden =>
      $composableBuilder(column: $table.orden, builder: (column) => column);

  Expression<T> componentesValoresParametrizablesRefs<T extends Object>(
      Expression<T> Function(
              $$ComponentesValoresParametrizablesTableAnnotationComposer a)
          f) {
    final $$ComponentesValoresParametrizablesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.nombre,
            referencedTable: $db.componentesValoresParametrizables,
            getReferencedColumn: (t) => t.idValor,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ComponentesValoresParametrizablesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.componentesValoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ValoresParametrizablesTableTableManager extends RootTableManager<
    _$ComponentesDTO,
    $ValoresParametrizablesTable,
    ValorParametrizable,
    $$ValoresParametrizablesTableFilterComposer,
    $$ValoresParametrizablesTableOrderingComposer,
    $$ValoresParametrizablesTableAnnotationComposer,
    $$ValoresParametrizablesTableCreateCompanionBuilder,
    $$ValoresParametrizablesTableUpdateCompanionBuilder,
    (ValorParametrizable, $$ValoresParametrizablesTableReferences),
    ValorParametrizable,
    PrefetchHooks Function({bool componentesValoresParametrizablesRefs})> {
  $$ValoresParametrizablesTableTableManager(
      _$ComponentesDTO db, $ValoresParametrizablesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ValoresParametrizablesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ValoresParametrizablesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ValoresParametrizablesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> nombre = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
            Value<int> orden = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ValoresParametrizablesCompanion(
            nombre: nombre,
            descripcion: descripcion,
            orden: orden,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String nombre,
            required String descripcion,
            required int orden,
            Value<int> rowid = const Value.absent(),
          }) =>
              ValoresParametrizablesCompanion.insert(
            nombre: nombre,
            descripcion: descripcion,
            orden: orden,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ValoresParametrizablesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {componentesValoresParametrizablesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (componentesValoresParametrizablesRefs)
                  db.componentesValoresParametrizables
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (componentesValoresParametrizablesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ValoresParametrizablesTableReferences
                            ._componentesValoresParametrizablesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ValoresParametrizablesTableReferences(
                                    db, table, p0)
                                .componentesValoresParametrizablesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idValor == item.nombre),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ValoresParametrizablesTableProcessedTableManager
    = ProcessedTableManager<
        _$ComponentesDTO,
        $ValoresParametrizablesTable,
        ValorParametrizable,
        $$ValoresParametrizablesTableFilterComposer,
        $$ValoresParametrizablesTableOrderingComposer,
        $$ValoresParametrizablesTableAnnotationComposer,
        $$ValoresParametrizablesTableCreateCompanionBuilder,
        $$ValoresParametrizablesTableUpdateCompanionBuilder,
        (ValorParametrizable, $$ValoresParametrizablesTableReferences),
        ValorParametrizable,
        PrefetchHooks Function({bool componentesValoresParametrizablesRefs})>;
typedef $$PaquetesTableCreateCompanionBuilder = PaquetesCompanion Function({
  required String componente,
  required String nombre,
  required String descripcion,
  required String testbench,
  Value<int> rowid,
});
typedef $$PaquetesTableUpdateCompanionBuilder = PaquetesCompanion Function({
  Value<String> componente,
  Value<String> nombre,
  Value<String> descripcion,
  Value<String> testbench,
  Value<int> rowid,
});

final class $$PaquetesTableReferences
    extends BaseReferences<_$ComponentesDTO, $PaquetesTable, Paquete> {
  $$PaquetesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ComponentesTable _componenteTable(_$ComponentesDTO db) =>
      db.componentes.createAlias(
          $_aliasNameGenerator(db.paquetes.componente, db.componentes.nombre));

  $$ComponentesTableProcessedTableManager? get componente {
    if ($_item.componente == null) return null;
    final manager = $$ComponentesTableTableManager($_db, $_db.componentes)
        .filter((f) => f.nombre($_item.componente!));
    final item = $_typedResult.readTableOrNull(_componenteTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PaquetesTableFilterComposer
    extends Composer<_$ComponentesDTO, $PaquetesTable> {
  $$PaquetesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get testbench => $composableBuilder(
      column: $table.testbench, builder: (column) => ColumnFilters(column));

  $$ComponentesTableFilterComposer get componente {
    final $$ComponentesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.componente,
        referencedTable: $db.componentes,
        getReferencedColumn: (t) => t.nombre,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ComponentesTableFilterComposer(
              $db: $db,
              $table: $db.componentes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaquetesTableOrderingComposer
    extends Composer<_$ComponentesDTO, $PaquetesTable> {
  $$PaquetesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get testbench => $composableBuilder(
      column: $table.testbench, builder: (column) => ColumnOrderings(column));

  $$ComponentesTableOrderingComposer get componente {
    final $$ComponentesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.componente,
        referencedTable: $db.componentes,
        getReferencedColumn: (t) => t.nombre,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ComponentesTableOrderingComposer(
              $db: $db,
              $table: $db.componentes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaquetesTableAnnotationComposer
    extends Composer<_$ComponentesDTO, $PaquetesTable> {
  $$PaquetesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
      column: $table.descripcion, builder: (column) => column);

  GeneratedColumn<String> get testbench =>
      $composableBuilder(column: $table.testbench, builder: (column) => column);

  $$ComponentesTableAnnotationComposer get componente {
    final $$ComponentesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.componente,
        referencedTable: $db.componentes,
        getReferencedColumn: (t) => t.nombre,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ComponentesTableAnnotationComposer(
              $db: $db,
              $table: $db.componentes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaquetesTableTableManager extends RootTableManager<
    _$ComponentesDTO,
    $PaquetesTable,
    Paquete,
    $$PaquetesTableFilterComposer,
    $$PaquetesTableOrderingComposer,
    $$PaquetesTableAnnotationComposer,
    $$PaquetesTableCreateCompanionBuilder,
    $$PaquetesTableUpdateCompanionBuilder,
    (Paquete, $$PaquetesTableReferences),
    Paquete,
    PrefetchHooks Function({bool componente})> {
  $$PaquetesTableTableManager(_$ComponentesDTO db, $PaquetesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaquetesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaquetesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaquetesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> componente = const Value.absent(),
            Value<String> nombre = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
            Value<String> testbench = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaquetesCompanion(
            componente: componente,
            nombre: nombre,
            descripcion: descripcion,
            testbench: testbench,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String componente,
            required String nombre,
            required String descripcion,
            required String testbench,
            Value<int> rowid = const Value.absent(),
          }) =>
              PaquetesCompanion.insert(
            componente: componente,
            nombre: nombre,
            descripcion: descripcion,
            testbench: testbench,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PaquetesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({componente = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (componente) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.componente,
                    referencedTable:
                        $$PaquetesTableReferences._componenteTable(db),
                    referencedColumn:
                        $$PaquetesTableReferences._componenteTable(db).nombre,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PaquetesTableProcessedTableManager = ProcessedTableManager<
    _$ComponentesDTO,
    $PaquetesTable,
    Paquete,
    $$PaquetesTableFilterComposer,
    $$PaquetesTableOrderingComposer,
    $$PaquetesTableAnnotationComposer,
    $$PaquetesTableCreateCompanionBuilder,
    $$PaquetesTableUpdateCompanionBuilder,
    (Paquete, $$PaquetesTableReferences),
    Paquete,
    PrefetchHooks Function({bool componente})>;
typedef $$ComponentesValoresParametrizablesTableCreateCompanionBuilder
    = ComponentesValoresParametrizablesCompanion Function({
  required String tipoComponente,
  required String idValor,
  Value<int> rowid,
});
typedef $$ComponentesValoresParametrizablesTableUpdateCompanionBuilder
    = ComponentesValoresParametrizablesCompanion Function({
  Value<String> tipoComponente,
  Value<String> idValor,
  Value<int> rowid,
});

final class $$ComponentesValoresParametrizablesTableReferences
    extends BaseReferences<
        _$ComponentesDTO,
        $ComponentesValoresParametrizablesTable,
        ComponenteValorParametrizable> {
  $$ComponentesValoresParametrizablesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ComponentesTable _tipoComponenteTable(_$ComponentesDTO db) =>
      db.componentes.createAlias($_aliasNameGenerator(
          db.componentesValoresParametrizables.tipoComponente,
          db.componentes.tipo));

  $$ComponentesTableProcessedTableManager? get tipoComponente {
    if ($_item.tipoComponente == null) return null;
    final manager = $$ComponentesTableTableManager($_db, $_db.componentes)
        .filter((f) => f.tipo($_item.tipoComponente!));
    final item = $_typedResult.readTableOrNull(_tipoComponenteTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ValoresParametrizablesTable _idValorTable(_$ComponentesDTO db) =>
      db.valoresParametrizables.createAlias($_aliasNameGenerator(
          db.componentesValoresParametrizables.idValor,
          db.valoresParametrizables.nombre));

  $$ValoresParametrizablesTableProcessedTableManager? get idValor {
    if ($_item.idValor == null) return null;
    final manager = $$ValoresParametrizablesTableTableManager(
            $_db, $_db.valoresParametrizables)
        .filter((f) => f.nombre($_item.idValor!));
    final item = $_typedResult.readTableOrNull(_idValorTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ComponentesValoresParametrizablesTableFilterComposer extends Composer<
    _$ComponentesDTO, $ComponentesValoresParametrizablesTable> {
  $$ComponentesValoresParametrizablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ComponentesTableFilterComposer get tipoComponente {
    final $$ComponentesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tipoComponente,
        referencedTable: $db.componentes,
        getReferencedColumn: (t) => t.tipo,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ComponentesTableFilterComposer(
              $db: $db,
              $table: $db.componentes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ValoresParametrizablesTableFilterComposer get idValor {
    final $$ValoresParametrizablesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.idValor,
            referencedTable: $db.valoresParametrizables,
            getReferencedColumn: (t) => t.nombre,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ValoresParametrizablesTableFilterComposer(
                  $db: $db,
                  $table: $db.valoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ComponentesValoresParametrizablesTableOrderingComposer extends Composer<
    _$ComponentesDTO, $ComponentesValoresParametrizablesTable> {
  $$ComponentesValoresParametrizablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ComponentesTableOrderingComposer get tipoComponente {
    final $$ComponentesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tipoComponente,
        referencedTable: $db.componentes,
        getReferencedColumn: (t) => t.tipo,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ComponentesTableOrderingComposer(
              $db: $db,
              $table: $db.componentes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ValoresParametrizablesTableOrderingComposer get idValor {
    final $$ValoresParametrizablesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.idValor,
            referencedTable: $db.valoresParametrizables,
            getReferencedColumn: (t) => t.nombre,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ValoresParametrizablesTableOrderingComposer(
                  $db: $db,
                  $table: $db.valoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ComponentesValoresParametrizablesTableAnnotationComposer
    extends Composer<_$ComponentesDTO,
        $ComponentesValoresParametrizablesTable> {
  $$ComponentesValoresParametrizablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ComponentesTableAnnotationComposer get tipoComponente {
    final $$ComponentesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tipoComponente,
        referencedTable: $db.componentes,
        getReferencedColumn: (t) => t.tipo,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ComponentesTableAnnotationComposer(
              $db: $db,
              $table: $db.componentes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ValoresParametrizablesTableAnnotationComposer get idValor {
    final $$ValoresParametrizablesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.idValor,
            referencedTable: $db.valoresParametrizables,
            getReferencedColumn: (t) => t.nombre,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ValoresParametrizablesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.valoresParametrizables,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ComponentesValoresParametrizablesTableTableManager
    extends RootTableManager<
        _$ComponentesDTO,
        $ComponentesValoresParametrizablesTable,
        ComponenteValorParametrizable,
        $$ComponentesValoresParametrizablesTableFilterComposer,
        $$ComponentesValoresParametrizablesTableOrderingComposer,
        $$ComponentesValoresParametrizablesTableAnnotationComposer,
        $$ComponentesValoresParametrizablesTableCreateCompanionBuilder,
        $$ComponentesValoresParametrizablesTableUpdateCompanionBuilder,
        (
          ComponenteValorParametrizable,
          $$ComponentesValoresParametrizablesTableReferences
        ),
        ComponenteValorParametrizable,
        PrefetchHooks Function({bool tipoComponente, bool idValor})> {
  $$ComponentesValoresParametrizablesTableTableManager(
      _$ComponentesDTO db, $ComponentesValoresParametrizablesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComponentesValoresParametrizablesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ComponentesValoresParametrizablesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComponentesValoresParametrizablesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> tipoComponente = const Value.absent(),
            Value<String> idValor = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ComponentesValoresParametrizablesCompanion(
            tipoComponente: tipoComponente,
            idValor: idValor,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String tipoComponente,
            required String idValor,
            Value<int> rowid = const Value.absent(),
          }) =>
              ComponentesValoresParametrizablesCompanion.insert(
            tipoComponente: tipoComponente,
            idValor: idValor,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ComponentesValoresParametrizablesTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tipoComponente = false, idValor = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tipoComponente) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tipoComponente,
                    referencedTable:
                        $$ComponentesValoresParametrizablesTableReferences
                            ._tipoComponenteTable(db),
                    referencedColumn:
                        $$ComponentesValoresParametrizablesTableReferences
                            ._tipoComponenteTable(db)
                            .tipo,
                  ) as T;
                }
                if (idValor) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idValor,
                    referencedTable:
                        $$ComponentesValoresParametrizablesTableReferences
                            ._idValorTable(db),
                    referencedColumn:
                        $$ComponentesValoresParametrizablesTableReferences
                            ._idValorTable(db)
                            .nombre,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ComponentesValoresParametrizablesTableProcessedTableManager
    = ProcessedTableManager<
        _$ComponentesDTO,
        $ComponentesValoresParametrizablesTable,
        ComponenteValorParametrizable,
        $$ComponentesValoresParametrizablesTableFilterComposer,
        $$ComponentesValoresParametrizablesTableOrderingComposer,
        $$ComponentesValoresParametrizablesTableAnnotationComposer,
        $$ComponentesValoresParametrizablesTableCreateCompanionBuilder,
        $$ComponentesValoresParametrizablesTableUpdateCompanionBuilder,
        (
          ComponenteValorParametrizable,
          $$ComponentesValoresParametrizablesTableReferences
        ),
        ComponenteValorParametrizable,
        PrefetchHooks Function({bool tipoComponente, bool idValor})>;

class $ComponentesDTOManager {
  final _$ComponentesDTO _db;
  $ComponentesDTOManager(this._db);
  $$ComponentesTableTableManager get componentes =>
      $$ComponentesTableTableManager(_db, _db.componentes);
  $$ValoresParametrizablesTableTableManager get valoresParametrizables =>
      $$ValoresParametrizablesTableTableManager(
          _db, _db.valoresParametrizables);
  $$PaquetesTableTableManager get paquetes =>
      $$PaquetesTableTableManager(_db, _db.paquetes);
  $$ComponentesValoresParametrizablesTableTableManager
      get componentesValoresParametrizables =>
          $$ComponentesValoresParametrizablesTableTableManager(
              _db, _db.componentesValoresParametrizables);
}
