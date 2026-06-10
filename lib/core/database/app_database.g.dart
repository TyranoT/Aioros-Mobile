// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EstabelecimentosTable extends Estabelecimentos
    with TableInfo<$EstabelecimentosTable, Estabelecimento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EstabelecimentosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responsavelMeta = const VerificationMeta(
    'responsavel',
  );
  @override
  late final GeneratedColumn<String> responsavel = GeneratedColumn<String>(
    'responsavel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, responsavel, criadoEm];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'estabelecimentos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Estabelecimento> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('responsavel')) {
      context.handle(
        _responsavelMeta,
        responsavel.isAcceptableOrUnknown(
          data['responsavel']!,
          _responsavelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responsavelMeta);
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    } else if (isInserting) {
      context.missing(_criadoEmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Estabelecimento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Estabelecimento(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      responsavel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}responsavel'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
    );
  }

  @override
  $EstabelecimentosTable createAlias(String alias) {
    return $EstabelecimentosTable(attachedDatabase, alias);
  }
}

class Estabelecimento extends DataClass implements Insertable<Estabelecimento> {
  final String id;
  final String nome;
  final String responsavel;
  final DateTime criadoEm;
  const Estabelecimento({
    required this.id,
    required this.nome,
    required this.responsavel,
    required this.criadoEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nome'] = Variable<String>(nome);
    map['responsavel'] = Variable<String>(responsavel);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    return map;
  }

  EstabelecimentosCompanion toCompanion(bool nullToAbsent) {
    return EstabelecimentosCompanion(
      id: Value(id),
      nome: Value(nome),
      responsavel: Value(responsavel),
      criadoEm: Value(criadoEm),
    );
  }

  factory Estabelecimento.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Estabelecimento(
      id: serializer.fromJson<String>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      responsavel: serializer.fromJson<String>(json['responsavel']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nome': serializer.toJson<String>(nome),
      'responsavel': serializer.toJson<String>(responsavel),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
    };
  }

  Estabelecimento copyWith({
    String? id,
    String? nome,
    String? responsavel,
    DateTime? criadoEm,
  }) => Estabelecimento(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    responsavel: responsavel ?? this.responsavel,
    criadoEm: criadoEm ?? this.criadoEm,
  );
  Estabelecimento copyWithCompanion(EstabelecimentosCompanion data) {
    return Estabelecimento(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      responsavel: data.responsavel.present
          ? data.responsavel.value
          : this.responsavel,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Estabelecimento(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('responsavel: $responsavel, ')
          ..write('criadoEm: $criadoEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, responsavel, criadoEm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Estabelecimento &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.responsavel == this.responsavel &&
          other.criadoEm == this.criadoEm);
}

class EstabelecimentosCompanion extends UpdateCompanion<Estabelecimento> {
  final Value<String> id;
  final Value<String> nome;
  final Value<String> responsavel;
  final Value<DateTime> criadoEm;
  final Value<int> rowid;
  const EstabelecimentosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.responsavel = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EstabelecimentosCompanion.insert({
    required String id,
    required String nome,
    required String responsavel,
    required DateTime criadoEm,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nome = Value(nome),
       responsavel = Value(responsavel),
       criadoEm = Value(criadoEm);
  static Insertable<Estabelecimento> custom({
    Expression<String>? id,
    Expression<String>? nome,
    Expression<String>? responsavel,
    Expression<DateTime>? criadoEm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (responsavel != null) 'responsavel': responsavel,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EstabelecimentosCompanion copyWith({
    Value<String>? id,
    Value<String>? nome,
    Value<String>? responsavel,
    Value<DateTime>? criadoEm,
    Value<int>? rowid,
  }) {
    return EstabelecimentosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      responsavel: responsavel ?? this.responsavel,
      criadoEm: criadoEm ?? this.criadoEm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (responsavel.present) {
      map['responsavel'] = Variable<String>(responsavel.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EstabelecimentosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('responsavel: $responsavel, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdministradoresTable extends Administradores
    with TableInfo<$AdministradoresTable, Administrador> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdministradoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estabelecimentoIdMeta = const VerificationMeta(
    'estabelecimentoId',
  );
  @override
  late final GeneratedColumn<String> estabelecimentoId =
      GeneratedColumn<String>(
        'estabelecimento_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES estabelecimentos (id)',
        ),
      );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usuarioMeta = const VerificationMeta(
    'usuario',
  );
  @override
  late final GeneratedColumn<String> usuario = GeneratedColumn<String>(
    'usuario',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _senhaHashMeta = const VerificationMeta(
    'senhaHash',
  );
  @override
  late final GeneratedColumn<String> senhaHash = GeneratedColumn<String>(
    'senha_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    estabelecimentoId,
    nome,
    usuario,
    senhaHash,
    criadoEm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'administradores';
  @override
  VerificationContext validateIntegrity(
    Insertable<Administrador> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('estabelecimento_id')) {
      context.handle(
        _estabelecimentoIdMeta,
        estabelecimentoId.isAcceptableOrUnknown(
          data['estabelecimento_id']!,
          _estabelecimentoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estabelecimentoIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('usuario')) {
      context.handle(
        _usuarioMeta,
        usuario.isAcceptableOrUnknown(data['usuario']!, _usuarioMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioMeta);
    }
    if (data.containsKey('senha_hash')) {
      context.handle(
        _senhaHashMeta,
        senhaHash.isAcceptableOrUnknown(data['senha_hash']!, _senhaHashMeta),
      );
    } else if (isInserting) {
      context.missing(_senhaHashMeta);
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    } else if (isInserting) {
      context.missing(_criadoEmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Administrador map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Administrador(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      estabelecimentoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estabelecimento_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      usuario: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario'],
      )!,
      senhaHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}senha_hash'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
    );
  }

  @override
  $AdministradoresTable createAlias(String alias) {
    return $AdministradoresTable(attachedDatabase, alias);
  }
}

class Administrador extends DataClass implements Insertable<Administrador> {
  final String id;
  final String estabelecimentoId;
  final String nome;
  final String usuario;
  final String senhaHash;
  final DateTime criadoEm;
  const Administrador({
    required this.id,
    required this.estabelecimentoId,
    required this.nome,
    required this.usuario,
    required this.senhaHash,
    required this.criadoEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['estabelecimento_id'] = Variable<String>(estabelecimentoId);
    map['nome'] = Variable<String>(nome);
    map['usuario'] = Variable<String>(usuario);
    map['senha_hash'] = Variable<String>(senhaHash);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    return map;
  }

  AdministradoresCompanion toCompanion(bool nullToAbsent) {
    return AdministradoresCompanion(
      id: Value(id),
      estabelecimentoId: Value(estabelecimentoId),
      nome: Value(nome),
      usuario: Value(usuario),
      senhaHash: Value(senhaHash),
      criadoEm: Value(criadoEm),
    );
  }

  factory Administrador.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Administrador(
      id: serializer.fromJson<String>(json['id']),
      estabelecimentoId: serializer.fromJson<String>(json['estabelecimentoId']),
      nome: serializer.fromJson<String>(json['nome']),
      usuario: serializer.fromJson<String>(json['usuario']),
      senhaHash: serializer.fromJson<String>(json['senhaHash']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'estabelecimentoId': serializer.toJson<String>(estabelecimentoId),
      'nome': serializer.toJson<String>(nome),
      'usuario': serializer.toJson<String>(usuario),
      'senhaHash': serializer.toJson<String>(senhaHash),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
    };
  }

  Administrador copyWith({
    String? id,
    String? estabelecimentoId,
    String? nome,
    String? usuario,
    String? senhaHash,
    DateTime? criadoEm,
  }) => Administrador(
    id: id ?? this.id,
    estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
    nome: nome ?? this.nome,
    usuario: usuario ?? this.usuario,
    senhaHash: senhaHash ?? this.senhaHash,
    criadoEm: criadoEm ?? this.criadoEm,
  );
  Administrador copyWithCompanion(AdministradoresCompanion data) {
    return Administrador(
      id: data.id.present ? data.id.value : this.id,
      estabelecimentoId: data.estabelecimentoId.present
          ? data.estabelecimentoId.value
          : this.estabelecimentoId,
      nome: data.nome.present ? data.nome.value : this.nome,
      usuario: data.usuario.present ? data.usuario.value : this.usuario,
      senhaHash: data.senhaHash.present ? data.senhaHash.value : this.senhaHash,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Administrador(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('nome: $nome, ')
          ..write('usuario: $usuario, ')
          ..write('senhaHash: $senhaHash, ')
          ..write('criadoEm: $criadoEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, estabelecimentoId, nome, usuario, senhaHash, criadoEm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Administrador &&
          other.id == this.id &&
          other.estabelecimentoId == this.estabelecimentoId &&
          other.nome == this.nome &&
          other.usuario == this.usuario &&
          other.senhaHash == this.senhaHash &&
          other.criadoEm == this.criadoEm);
}

class AdministradoresCompanion extends UpdateCompanion<Administrador> {
  final Value<String> id;
  final Value<String> estabelecimentoId;
  final Value<String> nome;
  final Value<String> usuario;
  final Value<String> senhaHash;
  final Value<DateTime> criadoEm;
  final Value<int> rowid;
  const AdministradoresCompanion({
    this.id = const Value.absent(),
    this.estabelecimentoId = const Value.absent(),
    this.nome = const Value.absent(),
    this.usuario = const Value.absent(),
    this.senhaHash = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdministradoresCompanion.insert({
    required String id,
    required String estabelecimentoId,
    required String nome,
    required String usuario,
    required String senhaHash,
    required DateTime criadoEm,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       estabelecimentoId = Value(estabelecimentoId),
       nome = Value(nome),
       usuario = Value(usuario),
       senhaHash = Value(senhaHash),
       criadoEm = Value(criadoEm);
  static Insertable<Administrador> custom({
    Expression<String>? id,
    Expression<String>? estabelecimentoId,
    Expression<String>? nome,
    Expression<String>? usuario,
    Expression<String>? senhaHash,
    Expression<DateTime>? criadoEm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estabelecimentoId != null) 'estabelecimento_id': estabelecimentoId,
      if (nome != null) 'nome': nome,
      if (usuario != null) 'usuario': usuario,
      if (senhaHash != null) 'senha_hash': senhaHash,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdministradoresCompanion copyWith({
    Value<String>? id,
    Value<String>? estabelecimentoId,
    Value<String>? nome,
    Value<String>? usuario,
    Value<String>? senhaHash,
    Value<DateTime>? criadoEm,
    Value<int>? rowid,
  }) {
    return AdministradoresCompanion(
      id: id ?? this.id,
      estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
      nome: nome ?? this.nome,
      usuario: usuario ?? this.usuario,
      senhaHash: senhaHash ?? this.senhaHash,
      criadoEm: criadoEm ?? this.criadoEm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (estabelecimentoId.present) {
      map['estabelecimento_id'] = Variable<String>(estabelecimentoId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (usuario.present) {
      map['usuario'] = Variable<String>(usuario.value);
    }
    if (senhaHash.present) {
      map['senha_hash'] = Variable<String>(senhaHash.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdministradoresCompanion(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('nome: $nome, ')
          ..write('usuario: $usuario, ')
          ..write('senhaHash: $senhaHash, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GarconsTable extends Garcons with TableInfo<$GarconsTable, Garcom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GarconsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estabelecimentoIdMeta = const VerificationMeta(
    'estabelecimentoId',
  );
  @override
  late final GeneratedColumn<String> estabelecimentoId =
      GeneratedColumn<String>(
        'estabelecimento_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES estabelecimentos (id)',
        ),
      );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<String> codigo = GeneratedColumn<String>(
    'codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _ativoMeta = const VerificationMeta('ativo');
  @override
  late final GeneratedColumn<bool> ativo = GeneratedColumn<bool>(
    'ativo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("ativo" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    estabelecimentoId,
    nome,
    codigo,
    ativo,
    criadoEm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'garcons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Garcom> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('estabelecimento_id')) {
      context.handle(
        _estabelecimentoIdMeta,
        estabelecimentoId.isAcceptableOrUnknown(
          data['estabelecimento_id']!,
          _estabelecimentoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estabelecimentoIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('codigo')) {
      context.handle(
        _codigoMeta,
        codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta),
      );
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('ativo')) {
      context.handle(
        _ativoMeta,
        ativo.isAcceptableOrUnknown(data['ativo']!, _ativoMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    } else if (isInserting) {
      context.missing(_criadoEmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Garcom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Garcom(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      estabelecimentoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estabelecimento_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      codigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo'],
      )!,
      ativo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}ativo'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
    );
  }

  @override
  $GarconsTable createAlias(String alias) {
    return $GarconsTable(attachedDatabase, alias);
  }
}

class Garcom extends DataClass implements Insertable<Garcom> {
  final String id;
  final String estabelecimentoId;
  final String nome;
  final String codigo;
  final bool ativo;
  final DateTime criadoEm;
  const Garcom({
    required this.id,
    required this.estabelecimentoId,
    required this.nome,
    required this.codigo,
    required this.ativo,
    required this.criadoEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['estabelecimento_id'] = Variable<String>(estabelecimentoId);
    map['nome'] = Variable<String>(nome);
    map['codigo'] = Variable<String>(codigo);
    map['ativo'] = Variable<bool>(ativo);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    return map;
  }

  GarconsCompanion toCompanion(bool nullToAbsent) {
    return GarconsCompanion(
      id: Value(id),
      estabelecimentoId: Value(estabelecimentoId),
      nome: Value(nome),
      codigo: Value(codigo),
      ativo: Value(ativo),
      criadoEm: Value(criadoEm),
    );
  }

  factory Garcom.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Garcom(
      id: serializer.fromJson<String>(json['id']),
      estabelecimentoId: serializer.fromJson<String>(json['estabelecimentoId']),
      nome: serializer.fromJson<String>(json['nome']),
      codigo: serializer.fromJson<String>(json['codigo']),
      ativo: serializer.fromJson<bool>(json['ativo']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'estabelecimentoId': serializer.toJson<String>(estabelecimentoId),
      'nome': serializer.toJson<String>(nome),
      'codigo': serializer.toJson<String>(codigo),
      'ativo': serializer.toJson<bool>(ativo),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
    };
  }

  Garcom copyWith({
    String? id,
    String? estabelecimentoId,
    String? nome,
    String? codigo,
    bool? ativo,
    DateTime? criadoEm,
  }) => Garcom(
    id: id ?? this.id,
    estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
    nome: nome ?? this.nome,
    codigo: codigo ?? this.codigo,
    ativo: ativo ?? this.ativo,
    criadoEm: criadoEm ?? this.criadoEm,
  );
  Garcom copyWithCompanion(GarconsCompanion data) {
    return Garcom(
      id: data.id.present ? data.id.value : this.id,
      estabelecimentoId: data.estabelecimentoId.present
          ? data.estabelecimentoId.value
          : this.estabelecimentoId,
      nome: data.nome.present ? data.nome.value : this.nome,
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      ativo: data.ativo.present ? data.ativo.value : this.ativo,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Garcom(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('nome: $nome, ')
          ..write('codigo: $codigo, ')
          ..write('ativo: $ativo, ')
          ..write('criadoEm: $criadoEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, estabelecimentoId, nome, codigo, ativo, criadoEm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Garcom &&
          other.id == this.id &&
          other.estabelecimentoId == this.estabelecimentoId &&
          other.nome == this.nome &&
          other.codigo == this.codigo &&
          other.ativo == this.ativo &&
          other.criadoEm == this.criadoEm);
}

class GarconsCompanion extends UpdateCompanion<Garcom> {
  final Value<String> id;
  final Value<String> estabelecimentoId;
  final Value<String> nome;
  final Value<String> codigo;
  final Value<bool> ativo;
  final Value<DateTime> criadoEm;
  final Value<int> rowid;
  const GarconsCompanion({
    this.id = const Value.absent(),
    this.estabelecimentoId = const Value.absent(),
    this.nome = const Value.absent(),
    this.codigo = const Value.absent(),
    this.ativo = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GarconsCompanion.insert({
    required String id,
    required String estabelecimentoId,
    required String nome,
    required String codigo,
    this.ativo = const Value.absent(),
    required DateTime criadoEm,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       estabelecimentoId = Value(estabelecimentoId),
       nome = Value(nome),
       codigo = Value(codigo),
       criadoEm = Value(criadoEm);
  static Insertable<Garcom> custom({
    Expression<String>? id,
    Expression<String>? estabelecimentoId,
    Expression<String>? nome,
    Expression<String>? codigo,
    Expression<bool>? ativo,
    Expression<DateTime>? criadoEm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estabelecimentoId != null) 'estabelecimento_id': estabelecimentoId,
      if (nome != null) 'nome': nome,
      if (codigo != null) 'codigo': codigo,
      if (ativo != null) 'ativo': ativo,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GarconsCompanion copyWith({
    Value<String>? id,
    Value<String>? estabelecimentoId,
    Value<String>? nome,
    Value<String>? codigo,
    Value<bool>? ativo,
    Value<DateTime>? criadoEm,
    Value<int>? rowid,
  }) {
    return GarconsCompanion(
      id: id ?? this.id,
      estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
      nome: nome ?? this.nome,
      codigo: codigo ?? this.codigo,
      ativo: ativo ?? this.ativo,
      criadoEm: criadoEm ?? this.criadoEm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (estabelecimentoId.present) {
      map['estabelecimento_id'] = Variable<String>(estabelecimentoId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (ativo.present) {
      map['ativo'] = Variable<bool>(ativo.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GarconsCompanion(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('nome: $nome, ')
          ..write('codigo: $codigo, ')
          ..write('ativo: $ativo, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MesasTable extends Mesas with TableInfo<$MesasTable, Mesa> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MesasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estabelecimentoIdMeta = const VerificationMeta(
    'estabelecimentoId',
  );
  @override
  late final GeneratedColumn<String> estabelecimentoId =
      GeneratedColumn<String>(
        'estabelecimento_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES estabelecimentos (id)',
        ),
      );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<int> numero = GeneratedColumn<int>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capacidadeMeta = const VerificationMeta(
    'capacidade',
  );
  @override
  late final GeneratedColumn<int> capacidade = GeneratedColumn<int>(
    'capacidade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MesaStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(MesaStatus.disponivel.name),
      ).withConverter<MesaStatus>($MesasTable.$converterstatus);
  static const VerificationMeta _observacaoMeta = const VerificationMeta(
    'observacao',
  );
  @override
  late final GeneratedColumn<String> observacao = GeneratedColumn<String>(
    'observacao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    estabelecimentoId,
    numero,
    capacidade,
    status,
    observacao,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mesas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Mesa> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('estabelecimento_id')) {
      context.handle(
        _estabelecimentoIdMeta,
        estabelecimentoId.isAcceptableOrUnknown(
          data['estabelecimento_id']!,
          _estabelecimentoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estabelecimentoIdMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('capacidade')) {
      context.handle(
        _capacidadeMeta,
        capacidade.isAcceptableOrUnknown(data['capacidade']!, _capacidadeMeta),
      );
    } else if (isInserting) {
      context.missing(_capacidadeMeta);
    }
    if (data.containsKey('observacao')) {
      context.handle(
        _observacaoMeta,
        observacao.isAcceptableOrUnknown(data['observacao']!, _observacaoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mesa map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mesa(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      estabelecimentoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estabelecimento_id'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numero'],
      )!,
      capacidade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacidade'],
      )!,
      status: $MesasTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      observacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacao'],
      ),
    );
  }

  @override
  $MesasTable createAlias(String alias) {
    return $MesasTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MesaStatus, String, String> $converterstatus =
      const EnumNameConverter<MesaStatus>(MesaStatus.values);
}

class Mesa extends DataClass implements Insertable<Mesa> {
  final String id;
  final String estabelecimentoId;
  final int numero;
  final int capacidade;
  final MesaStatus status;
  final String? observacao;
  const Mesa({
    required this.id,
    required this.estabelecimentoId,
    required this.numero,
    required this.capacidade,
    required this.status,
    this.observacao,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['estabelecimento_id'] = Variable<String>(estabelecimentoId);
    map['numero'] = Variable<int>(numero);
    map['capacidade'] = Variable<int>(capacidade);
    {
      map['status'] = Variable<String>(
        $MesasTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String>(observacao);
    }
    return map;
  }

  MesasCompanion toCompanion(bool nullToAbsent) {
    return MesasCompanion(
      id: Value(id),
      estabelecimentoId: Value(estabelecimentoId),
      numero: Value(numero),
      capacidade: Value(capacidade),
      status: Value(status),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
    );
  }

  factory Mesa.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mesa(
      id: serializer.fromJson<String>(json['id']),
      estabelecimentoId: serializer.fromJson<String>(json['estabelecimentoId']),
      numero: serializer.fromJson<int>(json['numero']),
      capacidade: serializer.fromJson<int>(json['capacidade']),
      status: $MesasTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      observacao: serializer.fromJson<String?>(json['observacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'estabelecimentoId': serializer.toJson<String>(estabelecimentoId),
      'numero': serializer.toJson<int>(numero),
      'capacidade': serializer.toJson<int>(capacidade),
      'status': serializer.toJson<String>(
        $MesasTable.$converterstatus.toJson(status),
      ),
      'observacao': serializer.toJson<String?>(observacao),
    };
  }

  Mesa copyWith({
    String? id,
    String? estabelecimentoId,
    int? numero,
    int? capacidade,
    MesaStatus? status,
    Value<String?> observacao = const Value.absent(),
  }) => Mesa(
    id: id ?? this.id,
    estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
    numero: numero ?? this.numero,
    capacidade: capacidade ?? this.capacidade,
    status: status ?? this.status,
    observacao: observacao.present ? observacao.value : this.observacao,
  );
  Mesa copyWithCompanion(MesasCompanion data) {
    return Mesa(
      id: data.id.present ? data.id.value : this.id,
      estabelecimentoId: data.estabelecimentoId.present
          ? data.estabelecimentoId.value
          : this.estabelecimentoId,
      numero: data.numero.present ? data.numero.value : this.numero,
      capacidade: data.capacidade.present
          ? data.capacidade.value
          : this.capacidade,
      status: data.status.present ? data.status.value : this.status,
      observacao: data.observacao.present
          ? data.observacao.value
          : this.observacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mesa(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('numero: $numero, ')
          ..write('capacidade: $capacidade, ')
          ..write('status: $status, ')
          ..write('observacao: $observacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    estabelecimentoId,
    numero,
    capacidade,
    status,
    observacao,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mesa &&
          other.id == this.id &&
          other.estabelecimentoId == this.estabelecimentoId &&
          other.numero == this.numero &&
          other.capacidade == this.capacidade &&
          other.status == this.status &&
          other.observacao == this.observacao);
}

class MesasCompanion extends UpdateCompanion<Mesa> {
  final Value<String> id;
  final Value<String> estabelecimentoId;
  final Value<int> numero;
  final Value<int> capacidade;
  final Value<MesaStatus> status;
  final Value<String?> observacao;
  final Value<int> rowid;
  const MesasCompanion({
    this.id = const Value.absent(),
    this.estabelecimentoId = const Value.absent(),
    this.numero = const Value.absent(),
    this.capacidade = const Value.absent(),
    this.status = const Value.absent(),
    this.observacao = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MesasCompanion.insert({
    required String id,
    required String estabelecimentoId,
    required int numero,
    required int capacidade,
    this.status = const Value.absent(),
    this.observacao = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       estabelecimentoId = Value(estabelecimentoId),
       numero = Value(numero),
       capacidade = Value(capacidade);
  static Insertable<Mesa> custom({
    Expression<String>? id,
    Expression<String>? estabelecimentoId,
    Expression<int>? numero,
    Expression<int>? capacidade,
    Expression<String>? status,
    Expression<String>? observacao,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estabelecimentoId != null) 'estabelecimento_id': estabelecimentoId,
      if (numero != null) 'numero': numero,
      if (capacidade != null) 'capacidade': capacidade,
      if (status != null) 'status': status,
      if (observacao != null) 'observacao': observacao,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MesasCompanion copyWith({
    Value<String>? id,
    Value<String>? estabelecimentoId,
    Value<int>? numero,
    Value<int>? capacidade,
    Value<MesaStatus>? status,
    Value<String?>? observacao,
    Value<int>? rowid,
  }) {
    return MesasCompanion(
      id: id ?? this.id,
      estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
      numero: numero ?? this.numero,
      capacidade: capacidade ?? this.capacidade,
      status: status ?? this.status,
      observacao: observacao ?? this.observacao,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (estabelecimentoId.present) {
      map['estabelecimento_id'] = Variable<String>(estabelecimentoId.value);
    }
    if (numero.present) {
      map['numero'] = Variable<int>(numero.value);
    }
    if (capacidade.present) {
      map['capacidade'] = Variable<int>(capacidade.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $MesasTable.$converterstatus.toSql(status.value),
      );
    }
    if (observacao.present) {
      map['observacao'] = Variable<String>(observacao.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MesasCompanion(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('numero: $numero, ')
          ..write('capacidade: $capacidade, ')
          ..write('status: $status, ')
          ..write('observacao: $observacao, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriasTable extends Categorias
    with TableInfo<$CategoriasTable, Categoria> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estabelecimentoIdMeta = const VerificationMeta(
    'estabelecimentoId',
  );
  @override
  late final GeneratedColumn<String> estabelecimentoId =
      GeneratedColumn<String>(
        'estabelecimento_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES estabelecimentos (id)',
        ),
      );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ordemMeta = const VerificationMeta('ordem');
  @override
  late final GeneratedColumn<int> ordem = GeneratedColumn<int>(
    'ordem',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, estabelecimentoId, nome, ordem];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categorias';
  @override
  VerificationContext validateIntegrity(
    Insertable<Categoria> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('estabelecimento_id')) {
      context.handle(
        _estabelecimentoIdMeta,
        estabelecimentoId.isAcceptableOrUnknown(
          data['estabelecimento_id']!,
          _estabelecimentoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estabelecimentoIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('ordem')) {
      context.handle(
        _ordemMeta,
        ordem.isAcceptableOrUnknown(data['ordem']!, _ordemMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categoria map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Categoria(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      estabelecimentoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estabelecimento_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      ordem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordem'],
      )!,
    );
  }

  @override
  $CategoriasTable createAlias(String alias) {
    return $CategoriasTable(attachedDatabase, alias);
  }
}

class Categoria extends DataClass implements Insertable<Categoria> {
  final String id;
  final String estabelecimentoId;
  final String nome;
  final int ordem;
  const Categoria({
    required this.id,
    required this.estabelecimentoId,
    required this.nome,
    required this.ordem,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['estabelecimento_id'] = Variable<String>(estabelecimentoId);
    map['nome'] = Variable<String>(nome);
    map['ordem'] = Variable<int>(ordem);
    return map;
  }

  CategoriasCompanion toCompanion(bool nullToAbsent) {
    return CategoriasCompanion(
      id: Value(id),
      estabelecimentoId: Value(estabelecimentoId),
      nome: Value(nome),
      ordem: Value(ordem),
    );
  }

  factory Categoria.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Categoria(
      id: serializer.fromJson<String>(json['id']),
      estabelecimentoId: serializer.fromJson<String>(json['estabelecimentoId']),
      nome: serializer.fromJson<String>(json['nome']),
      ordem: serializer.fromJson<int>(json['ordem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'estabelecimentoId': serializer.toJson<String>(estabelecimentoId),
      'nome': serializer.toJson<String>(nome),
      'ordem': serializer.toJson<int>(ordem),
    };
  }

  Categoria copyWith({
    String? id,
    String? estabelecimentoId,
    String? nome,
    int? ordem,
  }) => Categoria(
    id: id ?? this.id,
    estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
    nome: nome ?? this.nome,
    ordem: ordem ?? this.ordem,
  );
  Categoria copyWithCompanion(CategoriasCompanion data) {
    return Categoria(
      id: data.id.present ? data.id.value : this.id,
      estabelecimentoId: data.estabelecimentoId.present
          ? data.estabelecimentoId.value
          : this.estabelecimentoId,
      nome: data.nome.present ? data.nome.value : this.nome,
      ordem: data.ordem.present ? data.ordem.value : this.ordem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Categoria(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('nome: $nome, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estabelecimentoId, nome, ordem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Categoria &&
          other.id == this.id &&
          other.estabelecimentoId == this.estabelecimentoId &&
          other.nome == this.nome &&
          other.ordem == this.ordem);
}

class CategoriasCompanion extends UpdateCompanion<Categoria> {
  final Value<String> id;
  final Value<String> estabelecimentoId;
  final Value<String> nome;
  final Value<int> ordem;
  final Value<int> rowid;
  const CategoriasCompanion({
    this.id = const Value.absent(),
    this.estabelecimentoId = const Value.absent(),
    this.nome = const Value.absent(),
    this.ordem = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriasCompanion.insert({
    required String id,
    required String estabelecimentoId,
    required String nome,
    this.ordem = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       estabelecimentoId = Value(estabelecimentoId),
       nome = Value(nome);
  static Insertable<Categoria> custom({
    Expression<String>? id,
    Expression<String>? estabelecimentoId,
    Expression<String>? nome,
    Expression<int>? ordem,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estabelecimentoId != null) 'estabelecimento_id': estabelecimentoId,
      if (nome != null) 'nome': nome,
      if (ordem != null) 'ordem': ordem,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriasCompanion copyWith({
    Value<String>? id,
    Value<String>? estabelecimentoId,
    Value<String>? nome,
    Value<int>? ordem,
    Value<int>? rowid,
  }) {
    return CategoriasCompanion(
      id: id ?? this.id,
      estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
      nome: nome ?? this.nome,
      ordem: ordem ?? this.ordem,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (estabelecimentoId.present) {
      map['estabelecimento_id'] = Variable<String>(estabelecimentoId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (ordem.present) {
      map['ordem'] = Variable<int>(ordem.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriasCompanion(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('nome: $nome, ')
          ..write('ordem: $ordem, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItensCardapioTable extends ItensCardapio
    with TableInfo<$ItensCardapioTable, ItemCardapio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItensCardapioTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estabelecimentoIdMeta = const VerificationMeta(
    'estabelecimentoId',
  );
  @override
  late final GeneratedColumn<String> estabelecimentoId =
      GeneratedColumn<String>(
        'estabelecimento_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES estabelecimentos (id)',
        ),
      );
  static const VerificationMeta _categoriaIdMeta = const VerificationMeta(
    'categoriaId',
  );
  @override
  late final GeneratedColumn<String> categoriaId = GeneratedColumn<String>(
    'categoria_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categorias (id)',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descricaoMeta = const VerificationMeta(
    'descricao',
  );
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
    'descricao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _precoCentavosMeta = const VerificationMeta(
    'precoCentavos',
  );
  @override
  late final GeneratedColumn<int> precoCentavos = GeneratedColumn<int>(
    'preco_centavos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _disponivelMeta = const VerificationMeta(
    'disponivel',
  );
  @override
  late final GeneratedColumn<bool> disponivel = GeneratedColumn<bool>(
    'disponivel',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("disponivel" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    estabelecimentoId,
    categoriaId,
    nome,
    descricao,
    precoCentavos,
    disponivel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'itens_cardapio';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemCardapio> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('estabelecimento_id')) {
      context.handle(
        _estabelecimentoIdMeta,
        estabelecimentoId.isAcceptableOrUnknown(
          data['estabelecimento_id']!,
          _estabelecimentoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estabelecimentoIdMeta);
    }
    if (data.containsKey('categoria_id')) {
      context.handle(
        _categoriaIdMeta,
        categoriaId.isAcceptableOrUnknown(
          data['categoria_id']!,
          _categoriaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoriaIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(
        _descricaoMeta,
        descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta),
      );
    }
    if (data.containsKey('preco_centavos')) {
      context.handle(
        _precoCentavosMeta,
        precoCentavos.isAcceptableOrUnknown(
          data['preco_centavos']!,
          _precoCentavosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precoCentavosMeta);
    }
    if (data.containsKey('disponivel')) {
      context.handle(
        _disponivelMeta,
        disponivel.isAcceptableOrUnknown(data['disponivel']!, _disponivelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemCardapio map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemCardapio(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      estabelecimentoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estabelecimento_id'],
      )!,
      categoriaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      descricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descricao'],
      ),
      precoCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preco_centavos'],
      )!,
      disponivel: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}disponivel'],
      )!,
    );
  }

  @override
  $ItensCardapioTable createAlias(String alias) {
    return $ItensCardapioTable(attachedDatabase, alias);
  }
}

class ItemCardapio extends DataClass implements Insertable<ItemCardapio> {
  final String id;
  final String estabelecimentoId;
  final String categoriaId;
  final String nome;
  final String? descricao;
  final int precoCentavos;
  final bool disponivel;
  const ItemCardapio({
    required this.id,
    required this.estabelecimentoId,
    required this.categoriaId,
    required this.nome,
    this.descricao,
    required this.precoCentavos,
    required this.disponivel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['estabelecimento_id'] = Variable<String>(estabelecimentoId);
    map['categoria_id'] = Variable<String>(categoriaId);
    map['nome'] = Variable<String>(nome);
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    map['preco_centavos'] = Variable<int>(precoCentavos);
    map['disponivel'] = Variable<bool>(disponivel);
    return map;
  }

  ItensCardapioCompanion toCompanion(bool nullToAbsent) {
    return ItensCardapioCompanion(
      id: Value(id),
      estabelecimentoId: Value(estabelecimentoId),
      categoriaId: Value(categoriaId),
      nome: Value(nome),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      precoCentavos: Value(precoCentavos),
      disponivel: Value(disponivel),
    );
  }

  factory ItemCardapio.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemCardapio(
      id: serializer.fromJson<String>(json['id']),
      estabelecimentoId: serializer.fromJson<String>(json['estabelecimentoId']),
      categoriaId: serializer.fromJson<String>(json['categoriaId']),
      nome: serializer.fromJson<String>(json['nome']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      precoCentavos: serializer.fromJson<int>(json['precoCentavos']),
      disponivel: serializer.fromJson<bool>(json['disponivel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'estabelecimentoId': serializer.toJson<String>(estabelecimentoId),
      'categoriaId': serializer.toJson<String>(categoriaId),
      'nome': serializer.toJson<String>(nome),
      'descricao': serializer.toJson<String?>(descricao),
      'precoCentavos': serializer.toJson<int>(precoCentavos),
      'disponivel': serializer.toJson<bool>(disponivel),
    };
  }

  ItemCardapio copyWith({
    String? id,
    String? estabelecimentoId,
    String? categoriaId,
    String? nome,
    Value<String?> descricao = const Value.absent(),
    int? precoCentavos,
    bool? disponivel,
  }) => ItemCardapio(
    id: id ?? this.id,
    estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
    categoriaId: categoriaId ?? this.categoriaId,
    nome: nome ?? this.nome,
    descricao: descricao.present ? descricao.value : this.descricao,
    precoCentavos: precoCentavos ?? this.precoCentavos,
    disponivel: disponivel ?? this.disponivel,
  );
  ItemCardapio copyWithCompanion(ItensCardapioCompanion data) {
    return ItemCardapio(
      id: data.id.present ? data.id.value : this.id,
      estabelecimentoId: data.estabelecimentoId.present
          ? data.estabelecimentoId.value
          : this.estabelecimentoId,
      categoriaId: data.categoriaId.present
          ? data.categoriaId.value
          : this.categoriaId,
      nome: data.nome.present ? data.nome.value : this.nome,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      precoCentavos: data.precoCentavos.present
          ? data.precoCentavos.value
          : this.precoCentavos,
      disponivel: data.disponivel.present
          ? data.disponivel.value
          : this.disponivel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemCardapio(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('categoriaId: $categoriaId, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('precoCentavos: $precoCentavos, ')
          ..write('disponivel: $disponivel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    estabelecimentoId,
    categoriaId,
    nome,
    descricao,
    precoCentavos,
    disponivel,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemCardapio &&
          other.id == this.id &&
          other.estabelecimentoId == this.estabelecimentoId &&
          other.categoriaId == this.categoriaId &&
          other.nome == this.nome &&
          other.descricao == this.descricao &&
          other.precoCentavos == this.precoCentavos &&
          other.disponivel == this.disponivel);
}

class ItensCardapioCompanion extends UpdateCompanion<ItemCardapio> {
  final Value<String> id;
  final Value<String> estabelecimentoId;
  final Value<String> categoriaId;
  final Value<String> nome;
  final Value<String?> descricao;
  final Value<int> precoCentavos;
  final Value<bool> disponivel;
  final Value<int> rowid;
  const ItensCardapioCompanion({
    this.id = const Value.absent(),
    this.estabelecimentoId = const Value.absent(),
    this.categoriaId = const Value.absent(),
    this.nome = const Value.absent(),
    this.descricao = const Value.absent(),
    this.precoCentavos = const Value.absent(),
    this.disponivel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItensCardapioCompanion.insert({
    required String id,
    required String estabelecimentoId,
    required String categoriaId,
    required String nome,
    this.descricao = const Value.absent(),
    required int precoCentavos,
    this.disponivel = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       estabelecimentoId = Value(estabelecimentoId),
       categoriaId = Value(categoriaId),
       nome = Value(nome),
       precoCentavos = Value(precoCentavos);
  static Insertable<ItemCardapio> custom({
    Expression<String>? id,
    Expression<String>? estabelecimentoId,
    Expression<String>? categoriaId,
    Expression<String>? nome,
    Expression<String>? descricao,
    Expression<int>? precoCentavos,
    Expression<bool>? disponivel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estabelecimentoId != null) 'estabelecimento_id': estabelecimentoId,
      if (categoriaId != null) 'categoria_id': categoriaId,
      if (nome != null) 'nome': nome,
      if (descricao != null) 'descricao': descricao,
      if (precoCentavos != null) 'preco_centavos': precoCentavos,
      if (disponivel != null) 'disponivel': disponivel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItensCardapioCompanion copyWith({
    Value<String>? id,
    Value<String>? estabelecimentoId,
    Value<String>? categoriaId,
    Value<String>? nome,
    Value<String?>? descricao,
    Value<int>? precoCentavos,
    Value<bool>? disponivel,
    Value<int>? rowid,
  }) {
    return ItensCardapioCompanion(
      id: id ?? this.id,
      estabelecimentoId: estabelecimentoId ?? this.estabelecimentoId,
      categoriaId: categoriaId ?? this.categoriaId,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      precoCentavos: precoCentavos ?? this.precoCentavos,
      disponivel: disponivel ?? this.disponivel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (estabelecimentoId.present) {
      map['estabelecimento_id'] = Variable<String>(estabelecimentoId.value);
    }
    if (categoriaId.present) {
      map['categoria_id'] = Variable<String>(categoriaId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (precoCentavos.present) {
      map['preco_centavos'] = Variable<int>(precoCentavos.value);
    }
    if (disponivel.present) {
      map['disponivel'] = Variable<bool>(disponivel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItensCardapioCompanion(')
          ..write('id: $id, ')
          ..write('estabelecimentoId: $estabelecimentoId, ')
          ..write('categoriaId: $categoriaId, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('precoCentavos: $precoCentavos, ')
          ..write('disponivel: $disponivel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AtendimentosTable extends Atendimentos
    with TableInfo<$AtendimentosTable, Atendimento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AtendimentosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mesaIdMeta = const VerificationMeta('mesaId');
  @override
  late final GeneratedColumn<String> mesaId = GeneratedColumn<String>(
    'mesa_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES mesas (id)',
    ),
  );
  static const VerificationMeta _garcomIdMeta = const VerificationMeta(
    'garcomId',
  );
  @override
  late final GeneratedColumn<String> garcomId = GeneratedColumn<String>(
    'garcom_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES garcons (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AtendimentoStatus, String>
  status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(AtendimentoStatus.aberto.name),
  ).withConverter<AtendimentoStatus>($AtendimentosTable.$converterstatus);
  static const VerificationMeta _aberturaMeta = const VerificationMeta(
    'abertura',
  );
  @override
  late final GeneratedColumn<DateTime> abertura = GeneratedColumn<DateTime>(
    'abertura',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _encerramentoMeta = const VerificationMeta(
    'encerramento',
  );
  @override
  late final GeneratedColumn<DateTime> encerramento = GeneratedColumn<DateTime>(
    'encerramento',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mesaId,
    garcomId,
    status,
    abertura,
    encerramento,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'atendimentos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Atendimento> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mesa_id')) {
      context.handle(
        _mesaIdMeta,
        mesaId.isAcceptableOrUnknown(data['mesa_id']!, _mesaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mesaIdMeta);
    }
    if (data.containsKey('garcom_id')) {
      context.handle(
        _garcomIdMeta,
        garcomId.isAcceptableOrUnknown(data['garcom_id']!, _garcomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_garcomIdMeta);
    }
    if (data.containsKey('abertura')) {
      context.handle(
        _aberturaMeta,
        abertura.isAcceptableOrUnknown(data['abertura']!, _aberturaMeta),
      );
    } else if (isInserting) {
      context.missing(_aberturaMeta);
    }
    if (data.containsKey('encerramento')) {
      context.handle(
        _encerramentoMeta,
        encerramento.isAcceptableOrUnknown(
          data['encerramento']!,
          _encerramentoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Atendimento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Atendimento(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mesaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mesa_id'],
      )!,
      garcomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}garcom_id'],
      )!,
      status: $AtendimentosTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      abertura: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}abertura'],
      )!,
      encerramento: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}encerramento'],
      ),
    );
  }

  @override
  $AtendimentosTable createAlias(String alias) {
    return $AtendimentosTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AtendimentoStatus, String, String>
  $converterstatus = const EnumNameConverter<AtendimentoStatus>(
    AtendimentoStatus.values,
  );
}

class Atendimento extends DataClass implements Insertable<Atendimento> {
  final String id;
  final String mesaId;
  final String garcomId;
  final AtendimentoStatus status;
  final DateTime abertura;
  final DateTime? encerramento;
  const Atendimento({
    required this.id,
    required this.mesaId,
    required this.garcomId,
    required this.status,
    required this.abertura,
    this.encerramento,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mesa_id'] = Variable<String>(mesaId);
    map['garcom_id'] = Variable<String>(garcomId);
    {
      map['status'] = Variable<String>(
        $AtendimentosTable.$converterstatus.toSql(status),
      );
    }
    map['abertura'] = Variable<DateTime>(abertura);
    if (!nullToAbsent || encerramento != null) {
      map['encerramento'] = Variable<DateTime>(encerramento);
    }
    return map;
  }

  AtendimentosCompanion toCompanion(bool nullToAbsent) {
    return AtendimentosCompanion(
      id: Value(id),
      mesaId: Value(mesaId),
      garcomId: Value(garcomId),
      status: Value(status),
      abertura: Value(abertura),
      encerramento: encerramento == null && nullToAbsent
          ? const Value.absent()
          : Value(encerramento),
    );
  }

  factory Atendimento.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Atendimento(
      id: serializer.fromJson<String>(json['id']),
      mesaId: serializer.fromJson<String>(json['mesaId']),
      garcomId: serializer.fromJson<String>(json['garcomId']),
      status: $AtendimentosTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      abertura: serializer.fromJson<DateTime>(json['abertura']),
      encerramento: serializer.fromJson<DateTime?>(json['encerramento']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mesaId': serializer.toJson<String>(mesaId),
      'garcomId': serializer.toJson<String>(garcomId),
      'status': serializer.toJson<String>(
        $AtendimentosTable.$converterstatus.toJson(status),
      ),
      'abertura': serializer.toJson<DateTime>(abertura),
      'encerramento': serializer.toJson<DateTime?>(encerramento),
    };
  }

  Atendimento copyWith({
    String? id,
    String? mesaId,
    String? garcomId,
    AtendimentoStatus? status,
    DateTime? abertura,
    Value<DateTime?> encerramento = const Value.absent(),
  }) => Atendimento(
    id: id ?? this.id,
    mesaId: mesaId ?? this.mesaId,
    garcomId: garcomId ?? this.garcomId,
    status: status ?? this.status,
    abertura: abertura ?? this.abertura,
    encerramento: encerramento.present ? encerramento.value : this.encerramento,
  );
  Atendimento copyWithCompanion(AtendimentosCompanion data) {
    return Atendimento(
      id: data.id.present ? data.id.value : this.id,
      mesaId: data.mesaId.present ? data.mesaId.value : this.mesaId,
      garcomId: data.garcomId.present ? data.garcomId.value : this.garcomId,
      status: data.status.present ? data.status.value : this.status,
      abertura: data.abertura.present ? data.abertura.value : this.abertura,
      encerramento: data.encerramento.present
          ? data.encerramento.value
          : this.encerramento,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Atendimento(')
          ..write('id: $id, ')
          ..write('mesaId: $mesaId, ')
          ..write('garcomId: $garcomId, ')
          ..write('status: $status, ')
          ..write('abertura: $abertura, ')
          ..write('encerramento: $encerramento')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mesaId, garcomId, status, abertura, encerramento);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Atendimento &&
          other.id == this.id &&
          other.mesaId == this.mesaId &&
          other.garcomId == this.garcomId &&
          other.status == this.status &&
          other.abertura == this.abertura &&
          other.encerramento == this.encerramento);
}

class AtendimentosCompanion extends UpdateCompanion<Atendimento> {
  final Value<String> id;
  final Value<String> mesaId;
  final Value<String> garcomId;
  final Value<AtendimentoStatus> status;
  final Value<DateTime> abertura;
  final Value<DateTime?> encerramento;
  final Value<int> rowid;
  const AtendimentosCompanion({
    this.id = const Value.absent(),
    this.mesaId = const Value.absent(),
    this.garcomId = const Value.absent(),
    this.status = const Value.absent(),
    this.abertura = const Value.absent(),
    this.encerramento = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AtendimentosCompanion.insert({
    required String id,
    required String mesaId,
    required String garcomId,
    this.status = const Value.absent(),
    required DateTime abertura,
    this.encerramento = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mesaId = Value(mesaId),
       garcomId = Value(garcomId),
       abertura = Value(abertura);
  static Insertable<Atendimento> custom({
    Expression<String>? id,
    Expression<String>? mesaId,
    Expression<String>? garcomId,
    Expression<String>? status,
    Expression<DateTime>? abertura,
    Expression<DateTime>? encerramento,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mesaId != null) 'mesa_id': mesaId,
      if (garcomId != null) 'garcom_id': garcomId,
      if (status != null) 'status': status,
      if (abertura != null) 'abertura': abertura,
      if (encerramento != null) 'encerramento': encerramento,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AtendimentosCompanion copyWith({
    Value<String>? id,
    Value<String>? mesaId,
    Value<String>? garcomId,
    Value<AtendimentoStatus>? status,
    Value<DateTime>? abertura,
    Value<DateTime?>? encerramento,
    Value<int>? rowid,
  }) {
    return AtendimentosCompanion(
      id: id ?? this.id,
      mesaId: mesaId ?? this.mesaId,
      garcomId: garcomId ?? this.garcomId,
      status: status ?? this.status,
      abertura: abertura ?? this.abertura,
      encerramento: encerramento ?? this.encerramento,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mesaId.present) {
      map['mesa_id'] = Variable<String>(mesaId.value);
    }
    if (garcomId.present) {
      map['garcom_id'] = Variable<String>(garcomId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $AtendimentosTable.$converterstatus.toSql(status.value),
      );
    }
    if (abertura.present) {
      map['abertura'] = Variable<DateTime>(abertura.value);
    }
    if (encerramento.present) {
      map['encerramento'] = Variable<DateTime>(encerramento.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AtendimentosCompanion(')
          ..write('id: $id, ')
          ..write('mesaId: $mesaId, ')
          ..write('garcomId: $garcomId, ')
          ..write('status: $status, ')
          ..write('abertura: $abertura, ')
          ..write('encerramento: $encerramento, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PedidosTable extends Pedidos with TableInfo<$PedidosTable, Pedido> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PedidosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atendimentoIdMeta = const VerificationMeta(
    'atendimentoId',
  );
  @override
  late final GeneratedColumn<String> atendimentoId = GeneratedColumn<String>(
    'atendimento_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES atendimentos (id)',
    ),
  );
  static const VerificationMeta _itemCardapioIdMeta = const VerificationMeta(
    'itemCardapioId',
  );
  @override
  late final GeneratedColumn<String> itemCardapioId = GeneratedColumn<String>(
    'item_cardapio_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES itens_cardapio (id)',
    ),
  );
  static const VerificationMeta _quantidadeMeta = const VerificationMeta(
    'quantidade',
  );
  @override
  late final GeneratedColumn<int> quantidade = GeneratedColumn<int>(
    'quantidade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _precoUnitarioCentavosMeta =
      const VerificationMeta('precoUnitarioCentavos');
  @override
  late final GeneratedColumn<int> precoUnitarioCentavos = GeneratedColumn<int>(
    'preco_unitario_centavos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _observacaoMeta = const VerificationMeta(
    'observacao',
  );
  @override
  late final GeneratedColumn<String> observacao = GeneratedColumn<String>(
    'observacao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ItemPedidoStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(ItemPedidoStatus.pendente.name),
      ).withConverter<ItemPedidoStatus>($PedidosTable.$converterstatus);
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    atendimentoId,
    itemCardapioId,
    quantidade,
    precoUnitarioCentavos,
    observacao,
    status,
    criadoEm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pedidos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pedido> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('atendimento_id')) {
      context.handle(
        _atendimentoIdMeta,
        atendimentoId.isAcceptableOrUnknown(
          data['atendimento_id']!,
          _atendimentoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_atendimentoIdMeta);
    }
    if (data.containsKey('item_cardapio_id')) {
      context.handle(
        _itemCardapioIdMeta,
        itemCardapioId.isAcceptableOrUnknown(
          data['item_cardapio_id']!,
          _itemCardapioIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itemCardapioIdMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
        _quantidadeMeta,
        quantidade.isAcceptableOrUnknown(data['quantidade']!, _quantidadeMeta),
      );
    }
    if (data.containsKey('preco_unitario_centavos')) {
      context.handle(
        _precoUnitarioCentavosMeta,
        precoUnitarioCentavos.isAcceptableOrUnknown(
          data['preco_unitario_centavos']!,
          _precoUnitarioCentavosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precoUnitarioCentavosMeta);
    }
    if (data.containsKey('observacao')) {
      context.handle(
        _observacaoMeta,
        observacao.isAcceptableOrUnknown(data['observacao']!, _observacaoMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    } else if (isInserting) {
      context.missing(_criadoEmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pedido map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pedido(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      atendimentoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}atendimento_id'],
      )!,
      itemCardapioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_cardapio_id'],
      )!,
      quantidade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantidade'],
      )!,
      precoUnitarioCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preco_unitario_centavos'],
      )!,
      observacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacao'],
      ),
      status: $PedidosTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
    );
  }

  @override
  $PedidosTable createAlias(String alias) {
    return $PedidosTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ItemPedidoStatus, String, String> $converterstatus =
      const EnumNameConverter<ItemPedidoStatus>(ItemPedidoStatus.values);
}

class Pedido extends DataClass implements Insertable<Pedido> {
  final String id;
  final String atendimentoId;
  final String itemCardapioId;
  final int quantidade;
  final int precoUnitarioCentavos;
  final String? observacao;
  final ItemPedidoStatus status;
  final DateTime criadoEm;
  const Pedido({
    required this.id,
    required this.atendimentoId,
    required this.itemCardapioId,
    required this.quantidade,
    required this.precoUnitarioCentavos,
    this.observacao,
    required this.status,
    required this.criadoEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['atendimento_id'] = Variable<String>(atendimentoId);
    map['item_cardapio_id'] = Variable<String>(itemCardapioId);
    map['quantidade'] = Variable<int>(quantidade);
    map['preco_unitario_centavos'] = Variable<int>(precoUnitarioCentavos);
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String>(observacao);
    }
    {
      map['status'] = Variable<String>(
        $PedidosTable.$converterstatus.toSql(status),
      );
    }
    map['criado_em'] = Variable<DateTime>(criadoEm);
    return map;
  }

  PedidosCompanion toCompanion(bool nullToAbsent) {
    return PedidosCompanion(
      id: Value(id),
      atendimentoId: Value(atendimentoId),
      itemCardapioId: Value(itemCardapioId),
      quantidade: Value(quantidade),
      precoUnitarioCentavos: Value(precoUnitarioCentavos),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
      status: Value(status),
      criadoEm: Value(criadoEm),
    );
  }

  factory Pedido.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pedido(
      id: serializer.fromJson<String>(json['id']),
      atendimentoId: serializer.fromJson<String>(json['atendimentoId']),
      itemCardapioId: serializer.fromJson<String>(json['itemCardapioId']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      precoUnitarioCentavos: serializer.fromJson<int>(
        json['precoUnitarioCentavos'],
      ),
      observacao: serializer.fromJson<String?>(json['observacao']),
      status: $PedidosTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'atendimentoId': serializer.toJson<String>(atendimentoId),
      'itemCardapioId': serializer.toJson<String>(itemCardapioId),
      'quantidade': serializer.toJson<int>(quantidade),
      'precoUnitarioCentavos': serializer.toJson<int>(precoUnitarioCentavos),
      'observacao': serializer.toJson<String?>(observacao),
      'status': serializer.toJson<String>(
        $PedidosTable.$converterstatus.toJson(status),
      ),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
    };
  }

  Pedido copyWith({
    String? id,
    String? atendimentoId,
    String? itemCardapioId,
    int? quantidade,
    int? precoUnitarioCentavos,
    Value<String?> observacao = const Value.absent(),
    ItemPedidoStatus? status,
    DateTime? criadoEm,
  }) => Pedido(
    id: id ?? this.id,
    atendimentoId: atendimentoId ?? this.atendimentoId,
    itemCardapioId: itemCardapioId ?? this.itemCardapioId,
    quantidade: quantidade ?? this.quantidade,
    precoUnitarioCentavos: precoUnitarioCentavos ?? this.precoUnitarioCentavos,
    observacao: observacao.present ? observacao.value : this.observacao,
    status: status ?? this.status,
    criadoEm: criadoEm ?? this.criadoEm,
  );
  Pedido copyWithCompanion(PedidosCompanion data) {
    return Pedido(
      id: data.id.present ? data.id.value : this.id,
      atendimentoId: data.atendimentoId.present
          ? data.atendimentoId.value
          : this.atendimentoId,
      itemCardapioId: data.itemCardapioId.present
          ? data.itemCardapioId.value
          : this.itemCardapioId,
      quantidade: data.quantidade.present
          ? data.quantidade.value
          : this.quantidade,
      precoUnitarioCentavos: data.precoUnitarioCentavos.present
          ? data.precoUnitarioCentavos.value
          : this.precoUnitarioCentavos,
      observacao: data.observacao.present
          ? data.observacao.value
          : this.observacao,
      status: data.status.present ? data.status.value : this.status,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pedido(')
          ..write('id: $id, ')
          ..write('atendimentoId: $atendimentoId, ')
          ..write('itemCardapioId: $itemCardapioId, ')
          ..write('quantidade: $quantidade, ')
          ..write('precoUnitarioCentavos: $precoUnitarioCentavos, ')
          ..write('observacao: $observacao, ')
          ..write('status: $status, ')
          ..write('criadoEm: $criadoEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    atendimentoId,
    itemCardapioId,
    quantidade,
    precoUnitarioCentavos,
    observacao,
    status,
    criadoEm,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pedido &&
          other.id == this.id &&
          other.atendimentoId == this.atendimentoId &&
          other.itemCardapioId == this.itemCardapioId &&
          other.quantidade == this.quantidade &&
          other.precoUnitarioCentavos == this.precoUnitarioCentavos &&
          other.observacao == this.observacao &&
          other.status == this.status &&
          other.criadoEm == this.criadoEm);
}

class PedidosCompanion extends UpdateCompanion<Pedido> {
  final Value<String> id;
  final Value<String> atendimentoId;
  final Value<String> itemCardapioId;
  final Value<int> quantidade;
  final Value<int> precoUnitarioCentavos;
  final Value<String?> observacao;
  final Value<ItemPedidoStatus> status;
  final Value<DateTime> criadoEm;
  final Value<int> rowid;
  const PedidosCompanion({
    this.id = const Value.absent(),
    this.atendimentoId = const Value.absent(),
    this.itemCardapioId = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.precoUnitarioCentavos = const Value.absent(),
    this.observacao = const Value.absent(),
    this.status = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PedidosCompanion.insert({
    required String id,
    required String atendimentoId,
    required String itemCardapioId,
    this.quantidade = const Value.absent(),
    required int precoUnitarioCentavos,
    this.observacao = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime criadoEm,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       atendimentoId = Value(atendimentoId),
       itemCardapioId = Value(itemCardapioId),
       precoUnitarioCentavos = Value(precoUnitarioCentavos),
       criadoEm = Value(criadoEm);
  static Insertable<Pedido> custom({
    Expression<String>? id,
    Expression<String>? atendimentoId,
    Expression<String>? itemCardapioId,
    Expression<int>? quantidade,
    Expression<int>? precoUnitarioCentavos,
    Expression<String>? observacao,
    Expression<String>? status,
    Expression<DateTime>? criadoEm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (atendimentoId != null) 'atendimento_id': atendimentoId,
      if (itemCardapioId != null) 'item_cardapio_id': itemCardapioId,
      if (quantidade != null) 'quantidade': quantidade,
      if (precoUnitarioCentavos != null)
        'preco_unitario_centavos': precoUnitarioCentavos,
      if (observacao != null) 'observacao': observacao,
      if (status != null) 'status': status,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PedidosCompanion copyWith({
    Value<String>? id,
    Value<String>? atendimentoId,
    Value<String>? itemCardapioId,
    Value<int>? quantidade,
    Value<int>? precoUnitarioCentavos,
    Value<String?>? observacao,
    Value<ItemPedidoStatus>? status,
    Value<DateTime>? criadoEm,
    Value<int>? rowid,
  }) {
    return PedidosCompanion(
      id: id ?? this.id,
      atendimentoId: atendimentoId ?? this.atendimentoId,
      itemCardapioId: itemCardapioId ?? this.itemCardapioId,
      quantidade: quantidade ?? this.quantidade,
      precoUnitarioCentavos:
          precoUnitarioCentavos ?? this.precoUnitarioCentavos,
      observacao: observacao ?? this.observacao,
      status: status ?? this.status,
      criadoEm: criadoEm ?? this.criadoEm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (atendimentoId.present) {
      map['atendimento_id'] = Variable<String>(atendimentoId.value);
    }
    if (itemCardapioId.present) {
      map['item_cardapio_id'] = Variable<String>(itemCardapioId.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    if (precoUnitarioCentavos.present) {
      map['preco_unitario_centavos'] = Variable<int>(
        precoUnitarioCentavos.value,
      );
    }
    if (observacao.present) {
      map['observacao'] = Variable<String>(observacao.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $PedidosTable.$converterstatus.toSql(status.value),
      );
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PedidosCompanion(')
          ..write('id: $id, ')
          ..write('atendimentoId: $atendimentoId, ')
          ..write('itemCardapioId: $itemCardapioId, ')
          ..write('quantidade: $quantidade, ')
          ..write('precoUnitarioCentavos: $precoUnitarioCentavos, ')
          ..write('observacao: $observacao, ')
          ..write('status: $status, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EstabelecimentosTable estabelecimentos = $EstabelecimentosTable(
    this,
  );
  late final $AdministradoresTable administradores = $AdministradoresTable(
    this,
  );
  late final $GarconsTable garcons = $GarconsTable(this);
  late final $MesasTable mesas = $MesasTable(this);
  late final $CategoriasTable categorias = $CategoriasTable(this);
  late final $ItensCardapioTable itensCardapio = $ItensCardapioTable(this);
  late final $AtendimentosTable atendimentos = $AtendimentosTable(this);
  late final $PedidosTable pedidos = $PedidosTable(this);
  late final MesasDao mesasDao = MesasDao(this as AppDatabase);
  late final GarconsDao garconsDao = GarconsDao(this as AppDatabase);
  late final AdminsDao adminsDao = AdminsDao(this as AppDatabase);
  late final CardapioDao cardapioDao = CardapioDao(this as AppDatabase);
  late final AtendimentosDao atendimentosDao = AtendimentosDao(
    this as AppDatabase,
  );
  late final PedidosDao pedidosDao = PedidosDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    estabelecimentos,
    administradores,
    garcons,
    mesas,
    categorias,
    itensCardapio,
    atendimentos,
    pedidos,
  ];
}

typedef $$EstabelecimentosTableCreateCompanionBuilder =
    EstabelecimentosCompanion Function({
      required String id,
      required String nome,
      required String responsavel,
      required DateTime criadoEm,
      Value<int> rowid,
    });
typedef $$EstabelecimentosTableUpdateCompanionBuilder =
    EstabelecimentosCompanion Function({
      Value<String> id,
      Value<String> nome,
      Value<String> responsavel,
      Value<DateTime> criadoEm,
      Value<int> rowid,
    });

final class $$EstabelecimentosTableReferences
    extends
        BaseReferences<_$AppDatabase, $EstabelecimentosTable, Estabelecimento> {
  $$EstabelecimentosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$AdministradoresTable, List<Administrador>>
  _administradoresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.administradores,
    aliasName: $_aliasNameGenerator(
      db.estabelecimentos.id,
      db.administradores.estabelecimentoId,
    ),
  );

  $$AdministradoresTableProcessedTableManager get administradoresRefs {
    final manager =
        $$AdministradoresTableTableManager($_db, $_db.administradores).filter(
          (f) => f.estabelecimentoId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _administradoresRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GarconsTable, List<Garcom>> _garconsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.garcons,
    aliasName: $_aliasNameGenerator(
      db.estabelecimentos.id,
      db.garcons.estabelecimentoId,
    ),
  );

  $$GarconsTableProcessedTableManager get garconsRefs {
    final manager = $$GarconsTableTableManager($_db, $_db.garcons).filter(
      (f) => f.estabelecimentoId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_garconsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MesasTable, List<Mesa>> _mesasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.mesas,
    aliasName: $_aliasNameGenerator(
      db.estabelecimentos.id,
      db.mesas.estabelecimentoId,
    ),
  );

  $$MesasTableProcessedTableManager get mesasRefs {
    final manager = $$MesasTableTableManager($_db, $_db.mesas).filter(
      (f) => f.estabelecimentoId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_mesasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CategoriasTable, List<Categoria>>
  _categoriasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categorias,
    aliasName: $_aliasNameGenerator(
      db.estabelecimentos.id,
      db.categorias.estabelecimentoId,
    ),
  );

  $$CategoriasTableProcessedTableManager get categoriasRefs {
    final manager = $$CategoriasTableTableManager($_db, $_db.categorias).filter(
      (f) => f.estabelecimentoId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_categoriasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ItensCardapioTable, List<ItemCardapio>>
  _itensCardapioRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.itensCardapio,
    aliasName: $_aliasNameGenerator(
      db.estabelecimentos.id,
      db.itensCardapio.estabelecimentoId,
    ),
  );

  $$ItensCardapioTableProcessedTableManager get itensCardapioRefs {
    final manager = $$ItensCardapioTableTableManager($_db, $_db.itensCardapio)
        .filter(
          (f) => f.estabelecimentoId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_itensCardapioRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EstabelecimentosTableFilterComposer
    extends Composer<_$AppDatabase, $EstabelecimentosTable> {
  $$EstabelecimentosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responsavel => $composableBuilder(
    column: $table.responsavel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> administradoresRefs(
    Expression<bool> Function($$AdministradoresTableFilterComposer f) f,
  ) {
    final $$AdministradoresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.administradores,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdministradoresTableFilterComposer(
            $db: $db,
            $table: $db.administradores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> garconsRefs(
    Expression<bool> Function($$GarconsTableFilterComposer f) f,
  ) {
    final $$GarconsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.garcons,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GarconsTableFilterComposer(
            $db: $db,
            $table: $db.garcons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mesasRefs(
    Expression<bool> Function($$MesasTableFilterComposer f) f,
  ) {
    final $$MesasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mesas,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MesasTableFilterComposer(
            $db: $db,
            $table: $db.mesas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> categoriasRefs(
    Expression<bool> Function($$CategoriasTableFilterComposer f) f,
  ) {
    final $$CategoriasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableFilterComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> itensCardapioRefs(
    Expression<bool> Function($$ItensCardapioTableFilterComposer f) f,
  ) {
    final $$ItensCardapioTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableFilterComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EstabelecimentosTableOrderingComposer
    extends Composer<_$AppDatabase, $EstabelecimentosTable> {
  $$EstabelecimentosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responsavel => $composableBuilder(
    column: $table.responsavel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EstabelecimentosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EstabelecimentosTable> {
  $$EstabelecimentosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get responsavel => $composableBuilder(
    column: $table.responsavel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  Expression<T> administradoresRefs<T extends Object>(
    Expression<T> Function($$AdministradoresTableAnnotationComposer a) f,
  ) {
    final $$AdministradoresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.administradores,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdministradoresTableAnnotationComposer(
            $db: $db,
            $table: $db.administradores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> garconsRefs<T extends Object>(
    Expression<T> Function($$GarconsTableAnnotationComposer a) f,
  ) {
    final $$GarconsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.garcons,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GarconsTableAnnotationComposer(
            $db: $db,
            $table: $db.garcons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mesasRefs<T extends Object>(
    Expression<T> Function($$MesasTableAnnotationComposer a) f,
  ) {
    final $$MesasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mesas,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MesasTableAnnotationComposer(
            $db: $db,
            $table: $db.mesas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> categoriasRefs<T extends Object>(
    Expression<T> Function($$CategoriasTableAnnotationComposer a) f,
  ) {
    final $$CategoriasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableAnnotationComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> itensCardapioRefs<T extends Object>(
    Expression<T> Function($$ItensCardapioTableAnnotationComposer a) f,
  ) {
    final $$ItensCardapioTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.estabelecimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableAnnotationComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EstabelecimentosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EstabelecimentosTable,
          Estabelecimento,
          $$EstabelecimentosTableFilterComposer,
          $$EstabelecimentosTableOrderingComposer,
          $$EstabelecimentosTableAnnotationComposer,
          $$EstabelecimentosTableCreateCompanionBuilder,
          $$EstabelecimentosTableUpdateCompanionBuilder,
          (Estabelecimento, $$EstabelecimentosTableReferences),
          Estabelecimento,
          PrefetchHooks Function({
            bool administradoresRefs,
            bool garconsRefs,
            bool mesasRefs,
            bool categoriasRefs,
            bool itensCardapioRefs,
          })
        > {
  $$EstabelecimentosTableTableManager(
    _$AppDatabase db,
    $EstabelecimentosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EstabelecimentosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EstabelecimentosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EstabelecimentosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> responsavel = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EstabelecimentosCompanion(
                id: id,
                nome: nome,
                responsavel: responsavel,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nome,
                required String responsavel,
                required DateTime criadoEm,
                Value<int> rowid = const Value.absent(),
              }) => EstabelecimentosCompanion.insert(
                id: id,
                nome: nome,
                responsavel: responsavel,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EstabelecimentosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                administradoresRefs = false,
                garconsRefs = false,
                mesasRefs = false,
                categoriasRefs = false,
                itensCardapioRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (administradoresRefs) db.administradores,
                    if (garconsRefs) db.garcons,
                    if (mesasRefs) db.mesas,
                    if (categoriasRefs) db.categorias,
                    if (itensCardapioRefs) db.itensCardapio,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (administradoresRefs)
                        await $_getPrefetchedData<
                          Estabelecimento,
                          $EstabelecimentosTable,
                          Administrador
                        >(
                          currentTable: table,
                          referencedTable: $$EstabelecimentosTableReferences
                              ._administradoresRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EstabelecimentosTableReferences(
                                db,
                                table,
                                p0,
                              ).administradoresRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.estabelecimentoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (garconsRefs)
                        await $_getPrefetchedData<
                          Estabelecimento,
                          $EstabelecimentosTable,
                          Garcom
                        >(
                          currentTable: table,
                          referencedTable: $$EstabelecimentosTableReferences
                              ._garconsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EstabelecimentosTableReferences(
                                db,
                                table,
                                p0,
                              ).garconsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.estabelecimentoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mesasRefs)
                        await $_getPrefetchedData<
                          Estabelecimento,
                          $EstabelecimentosTable,
                          Mesa
                        >(
                          currentTable: table,
                          referencedTable: $$EstabelecimentosTableReferences
                              ._mesasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EstabelecimentosTableReferences(
                                db,
                                table,
                                p0,
                              ).mesasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.estabelecimentoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (categoriasRefs)
                        await $_getPrefetchedData<
                          Estabelecimento,
                          $EstabelecimentosTable,
                          Categoria
                        >(
                          currentTable: table,
                          referencedTable: $$EstabelecimentosTableReferences
                              ._categoriasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EstabelecimentosTableReferences(
                                db,
                                table,
                                p0,
                              ).categoriasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.estabelecimentoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (itensCardapioRefs)
                        await $_getPrefetchedData<
                          Estabelecimento,
                          $EstabelecimentosTable,
                          ItemCardapio
                        >(
                          currentTable: table,
                          referencedTable: $$EstabelecimentosTableReferences
                              ._itensCardapioRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EstabelecimentosTableReferences(
                                db,
                                table,
                                p0,
                              ).itensCardapioRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.estabelecimentoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EstabelecimentosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EstabelecimentosTable,
      Estabelecimento,
      $$EstabelecimentosTableFilterComposer,
      $$EstabelecimentosTableOrderingComposer,
      $$EstabelecimentosTableAnnotationComposer,
      $$EstabelecimentosTableCreateCompanionBuilder,
      $$EstabelecimentosTableUpdateCompanionBuilder,
      (Estabelecimento, $$EstabelecimentosTableReferences),
      Estabelecimento,
      PrefetchHooks Function({
        bool administradoresRefs,
        bool garconsRefs,
        bool mesasRefs,
        bool categoriasRefs,
        bool itensCardapioRefs,
      })
    >;
typedef $$AdministradoresTableCreateCompanionBuilder =
    AdministradoresCompanion Function({
      required String id,
      required String estabelecimentoId,
      required String nome,
      required String usuario,
      required String senhaHash,
      required DateTime criadoEm,
      Value<int> rowid,
    });
typedef $$AdministradoresTableUpdateCompanionBuilder =
    AdministradoresCompanion Function({
      Value<String> id,
      Value<String> estabelecimentoId,
      Value<String> nome,
      Value<String> usuario,
      Value<String> senhaHash,
      Value<DateTime> criadoEm,
      Value<int> rowid,
    });

final class $$AdministradoresTableReferences
    extends
        BaseReferences<_$AppDatabase, $AdministradoresTable, Administrador> {
  $$AdministradoresTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EstabelecimentosTable _estabelecimentoIdTable(_$AppDatabase db) =>
      db.estabelecimentos.createAlias(
        $_aliasNameGenerator(
          db.administradores.estabelecimentoId,
          db.estabelecimentos.id,
        ),
      );

  $$EstabelecimentosTableProcessedTableManager get estabelecimentoId {
    final $_column = $_itemColumn<String>('estabelecimento_id')!;

    final manager = $$EstabelecimentosTableTableManager(
      $_db,
      $_db.estabelecimentos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_estabelecimentoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AdministradoresTableFilterComposer
    extends Composer<_$AppDatabase, $AdministradoresTable> {
  $$AdministradoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuario => $composableBuilder(
    column: $table.usuario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senhaHash => $composableBuilder(
    column: $table.senhaHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  $$EstabelecimentosTableFilterComposer get estabelecimentoId {
    final $$EstabelecimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableFilterComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdministradoresTableOrderingComposer
    extends Composer<_$AppDatabase, $AdministradoresTable> {
  $$AdministradoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuario => $composableBuilder(
    column: $table.usuario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senhaHash => $composableBuilder(
    column: $table.senhaHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  $$EstabelecimentosTableOrderingComposer get estabelecimentoId {
    final $$EstabelecimentosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableOrderingComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdministradoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdministradoresTable> {
  $$AdministradoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get usuario =>
      $composableBuilder(column: $table.usuario, builder: (column) => column);

  GeneratedColumn<String> get senhaHash =>
      $composableBuilder(column: $table.senhaHash, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  $$EstabelecimentosTableAnnotationComposer get estabelecimentoId {
    final $$EstabelecimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdministradoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdministradoresTable,
          Administrador,
          $$AdministradoresTableFilterComposer,
          $$AdministradoresTableOrderingComposer,
          $$AdministradoresTableAnnotationComposer,
          $$AdministradoresTableCreateCompanionBuilder,
          $$AdministradoresTableUpdateCompanionBuilder,
          (Administrador, $$AdministradoresTableReferences),
          Administrador,
          PrefetchHooks Function({bool estabelecimentoId})
        > {
  $$AdministradoresTableTableManager(
    _$AppDatabase db,
    $AdministradoresTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdministradoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdministradoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdministradoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> estabelecimentoId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> usuario = const Value.absent(),
                Value<String> senhaHash = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdministradoresCompanion(
                id: id,
                estabelecimentoId: estabelecimentoId,
                nome: nome,
                usuario: usuario,
                senhaHash: senhaHash,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String estabelecimentoId,
                required String nome,
                required String usuario,
                required String senhaHash,
                required DateTime criadoEm,
                Value<int> rowid = const Value.absent(),
              }) => AdministradoresCompanion.insert(
                id: id,
                estabelecimentoId: estabelecimentoId,
                nome: nome,
                usuario: usuario,
                senhaHash: senhaHash,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AdministradoresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({estabelecimentoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (estabelecimentoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.estabelecimentoId,
                                referencedTable:
                                    $$AdministradoresTableReferences
                                        ._estabelecimentoIdTable(db),
                                referencedColumn:
                                    $$AdministradoresTableReferences
                                        ._estabelecimentoIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AdministradoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdministradoresTable,
      Administrador,
      $$AdministradoresTableFilterComposer,
      $$AdministradoresTableOrderingComposer,
      $$AdministradoresTableAnnotationComposer,
      $$AdministradoresTableCreateCompanionBuilder,
      $$AdministradoresTableUpdateCompanionBuilder,
      (Administrador, $$AdministradoresTableReferences),
      Administrador,
      PrefetchHooks Function({bool estabelecimentoId})
    >;
typedef $$GarconsTableCreateCompanionBuilder =
    GarconsCompanion Function({
      required String id,
      required String estabelecimentoId,
      required String nome,
      required String codigo,
      Value<bool> ativo,
      required DateTime criadoEm,
      Value<int> rowid,
    });
typedef $$GarconsTableUpdateCompanionBuilder =
    GarconsCompanion Function({
      Value<String> id,
      Value<String> estabelecimentoId,
      Value<String> nome,
      Value<String> codigo,
      Value<bool> ativo,
      Value<DateTime> criadoEm,
      Value<int> rowid,
    });

final class $$GarconsTableReferences
    extends BaseReferences<_$AppDatabase, $GarconsTable, Garcom> {
  $$GarconsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EstabelecimentosTable _estabelecimentoIdTable(_$AppDatabase db) =>
      db.estabelecimentos.createAlias(
        $_aliasNameGenerator(
          db.garcons.estabelecimentoId,
          db.estabelecimentos.id,
        ),
      );

  $$EstabelecimentosTableProcessedTableManager get estabelecimentoId {
    final $_column = $_itemColumn<String>('estabelecimento_id')!;

    final manager = $$EstabelecimentosTableTableManager(
      $_db,
      $_db.estabelecimentos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_estabelecimentoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AtendimentosTable, List<Atendimento>>
  _atendimentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.atendimentos,
    aliasName: $_aliasNameGenerator(db.garcons.id, db.atendimentos.garcomId),
  );

  $$AtendimentosTableProcessedTableManager get atendimentosRefs {
    final manager = $$AtendimentosTableTableManager(
      $_db,
      $_db.atendimentos,
    ).filter((f) => f.garcomId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_atendimentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GarconsTableFilterComposer
    extends Composer<_$AppDatabase, $GarconsTable> {
  $$GarconsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get ativo => $composableBuilder(
    column: $table.ativo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  $$EstabelecimentosTableFilterComposer get estabelecimentoId {
    final $$EstabelecimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableFilterComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> atendimentosRefs(
    Expression<bool> Function($$AtendimentosTableFilterComposer f) f,
  ) {
    final $$AtendimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.garcomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableFilterComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GarconsTableOrderingComposer
    extends Composer<_$AppDatabase, $GarconsTable> {
  $$GarconsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ativo => $composableBuilder(
    column: $table.ativo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  $$EstabelecimentosTableOrderingComposer get estabelecimentoId {
    final $$EstabelecimentosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableOrderingComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GarconsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GarconsTable> {
  $$GarconsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get codigo =>
      $composableBuilder(column: $table.codigo, builder: (column) => column);

  GeneratedColumn<bool> get ativo =>
      $composableBuilder(column: $table.ativo, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  $$EstabelecimentosTableAnnotationComposer get estabelecimentoId {
    final $$EstabelecimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> atendimentosRefs<T extends Object>(
    Expression<T> Function($$AtendimentosTableAnnotationComposer a) f,
  ) {
    final $$AtendimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.garcomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GarconsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GarconsTable,
          Garcom,
          $$GarconsTableFilterComposer,
          $$GarconsTableOrderingComposer,
          $$GarconsTableAnnotationComposer,
          $$GarconsTableCreateCompanionBuilder,
          $$GarconsTableUpdateCompanionBuilder,
          (Garcom, $$GarconsTableReferences),
          Garcom,
          PrefetchHooks Function({
            bool estabelecimentoId,
            bool atendimentosRefs,
          })
        > {
  $$GarconsTableTableManager(_$AppDatabase db, $GarconsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GarconsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GarconsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GarconsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> estabelecimentoId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> codigo = const Value.absent(),
                Value<bool> ativo = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GarconsCompanion(
                id: id,
                estabelecimentoId: estabelecimentoId,
                nome: nome,
                codigo: codigo,
                ativo: ativo,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String estabelecimentoId,
                required String nome,
                required String codigo,
                Value<bool> ativo = const Value.absent(),
                required DateTime criadoEm,
                Value<int> rowid = const Value.absent(),
              }) => GarconsCompanion.insert(
                id: id,
                estabelecimentoId: estabelecimentoId,
                nome: nome,
                codigo: codigo,
                ativo: ativo,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GarconsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({estabelecimentoId = false, atendimentosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (atendimentosRefs) db.atendimentos,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (estabelecimentoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.estabelecimentoId,
                                    referencedTable: $$GarconsTableReferences
                                        ._estabelecimentoIdTable(db),
                                    referencedColumn: $$GarconsTableReferences
                                        ._estabelecimentoIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (atendimentosRefs)
                        await $_getPrefetchedData<
                          Garcom,
                          $GarconsTable,
                          Atendimento
                        >(
                          currentTable: table,
                          referencedTable: $$GarconsTableReferences
                              ._atendimentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GarconsTableReferences(
                                db,
                                table,
                                p0,
                              ).atendimentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.garcomId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GarconsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GarconsTable,
      Garcom,
      $$GarconsTableFilterComposer,
      $$GarconsTableOrderingComposer,
      $$GarconsTableAnnotationComposer,
      $$GarconsTableCreateCompanionBuilder,
      $$GarconsTableUpdateCompanionBuilder,
      (Garcom, $$GarconsTableReferences),
      Garcom,
      PrefetchHooks Function({bool estabelecimentoId, bool atendimentosRefs})
    >;
typedef $$MesasTableCreateCompanionBuilder =
    MesasCompanion Function({
      required String id,
      required String estabelecimentoId,
      required int numero,
      required int capacidade,
      Value<MesaStatus> status,
      Value<String?> observacao,
      Value<int> rowid,
    });
typedef $$MesasTableUpdateCompanionBuilder =
    MesasCompanion Function({
      Value<String> id,
      Value<String> estabelecimentoId,
      Value<int> numero,
      Value<int> capacidade,
      Value<MesaStatus> status,
      Value<String?> observacao,
      Value<int> rowid,
    });

final class $$MesasTableReferences
    extends BaseReferences<_$AppDatabase, $MesasTable, Mesa> {
  $$MesasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EstabelecimentosTable _estabelecimentoIdTable(_$AppDatabase db) =>
      db.estabelecimentos.createAlias(
        $_aliasNameGenerator(
          db.mesas.estabelecimentoId,
          db.estabelecimentos.id,
        ),
      );

  $$EstabelecimentosTableProcessedTableManager get estabelecimentoId {
    final $_column = $_itemColumn<String>('estabelecimento_id')!;

    final manager = $$EstabelecimentosTableTableManager(
      $_db,
      $_db.estabelecimentos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_estabelecimentoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AtendimentosTable, List<Atendimento>>
  _atendimentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.atendimentos,
    aliasName: $_aliasNameGenerator(db.mesas.id, db.atendimentos.mesaId),
  );

  $$AtendimentosTableProcessedTableManager get atendimentosRefs {
    final manager = $$AtendimentosTableTableManager(
      $_db,
      $_db.atendimentos,
    ).filter((f) => f.mesaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_atendimentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MesasTableFilterComposer extends Composer<_$AppDatabase, $MesasTable> {
  $$MesasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacidade => $composableBuilder(
    column: $table.capacidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MesaStatus, MesaStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnFilters(column),
  );

  $$EstabelecimentosTableFilterComposer get estabelecimentoId {
    final $$EstabelecimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableFilterComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> atendimentosRefs(
    Expression<bool> Function($$AtendimentosTableFilterComposer f) f,
  ) {
    final $$AtendimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.mesaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableFilterComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MesasTableOrderingComposer
    extends Composer<_$AppDatabase, $MesasTable> {
  $$MesasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacidade => $composableBuilder(
    column: $table.capacidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnOrderings(column),
  );

  $$EstabelecimentosTableOrderingComposer get estabelecimentoId {
    final $$EstabelecimentosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableOrderingComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MesasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MesasTable> {
  $$MesasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<int> get capacidade => $composableBuilder(
    column: $table.capacidade,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<MesaStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => column,
  );

  $$EstabelecimentosTableAnnotationComposer get estabelecimentoId {
    final $$EstabelecimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> atendimentosRefs<T extends Object>(
    Expression<T> Function($$AtendimentosTableAnnotationComposer a) f,
  ) {
    final $$AtendimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.mesaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MesasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MesasTable,
          Mesa,
          $$MesasTableFilterComposer,
          $$MesasTableOrderingComposer,
          $$MesasTableAnnotationComposer,
          $$MesasTableCreateCompanionBuilder,
          $$MesasTableUpdateCompanionBuilder,
          (Mesa, $$MesasTableReferences),
          Mesa,
          PrefetchHooks Function({
            bool estabelecimentoId,
            bool atendimentosRefs,
          })
        > {
  $$MesasTableTableManager(_$AppDatabase db, $MesasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MesasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MesasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MesasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> estabelecimentoId = const Value.absent(),
                Value<int> numero = const Value.absent(),
                Value<int> capacidade = const Value.absent(),
                Value<MesaStatus> status = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MesasCompanion(
                id: id,
                estabelecimentoId: estabelecimentoId,
                numero: numero,
                capacidade: capacidade,
                status: status,
                observacao: observacao,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String estabelecimentoId,
                required int numero,
                required int capacidade,
                Value<MesaStatus> status = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MesasCompanion.insert(
                id: id,
                estabelecimentoId: estabelecimentoId,
                numero: numero,
                capacidade: capacidade,
                status: status,
                observacao: observacao,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$MesasTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({estabelecimentoId = false, atendimentosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (atendimentosRefs) db.atendimentos,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (estabelecimentoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.estabelecimentoId,
                                    referencedTable: $$MesasTableReferences
                                        ._estabelecimentoIdTable(db),
                                    referencedColumn: $$MesasTableReferences
                                        ._estabelecimentoIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (atendimentosRefs)
                        await $_getPrefetchedData<
                          Mesa,
                          $MesasTable,
                          Atendimento
                        >(
                          currentTable: table,
                          referencedTable: $$MesasTableReferences
                              ._atendimentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MesasTableReferences(
                                db,
                                table,
                                p0,
                              ).atendimentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mesaId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MesasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MesasTable,
      Mesa,
      $$MesasTableFilterComposer,
      $$MesasTableOrderingComposer,
      $$MesasTableAnnotationComposer,
      $$MesasTableCreateCompanionBuilder,
      $$MesasTableUpdateCompanionBuilder,
      (Mesa, $$MesasTableReferences),
      Mesa,
      PrefetchHooks Function({bool estabelecimentoId, bool atendimentosRefs})
    >;
typedef $$CategoriasTableCreateCompanionBuilder =
    CategoriasCompanion Function({
      required String id,
      required String estabelecimentoId,
      required String nome,
      Value<int> ordem,
      Value<int> rowid,
    });
typedef $$CategoriasTableUpdateCompanionBuilder =
    CategoriasCompanion Function({
      Value<String> id,
      Value<String> estabelecimentoId,
      Value<String> nome,
      Value<int> ordem,
      Value<int> rowid,
    });

final class $$CategoriasTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriasTable, Categoria> {
  $$CategoriasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EstabelecimentosTable _estabelecimentoIdTable(_$AppDatabase db) =>
      db.estabelecimentos.createAlias(
        $_aliasNameGenerator(
          db.categorias.estabelecimentoId,
          db.estabelecimentos.id,
        ),
      );

  $$EstabelecimentosTableProcessedTableManager get estabelecimentoId {
    final $_column = $_itemColumn<String>('estabelecimento_id')!;

    final manager = $$EstabelecimentosTableTableManager(
      $_db,
      $_db.estabelecimentos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_estabelecimentoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ItensCardapioTable, List<ItemCardapio>>
  _itensCardapioRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.itensCardapio,
    aliasName: $_aliasNameGenerator(
      db.categorias.id,
      db.itensCardapio.categoriaId,
    ),
  );

  $$ItensCardapioTableProcessedTableManager get itensCardapioRefs {
    final manager = $$ItensCardapioTableTableManager(
      $_db,
      $_db.itensCardapio,
    ).filter((f) => f.categoriaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itensCardapioRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriasTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriasTable> {
  $$CategoriasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnFilters(column),
  );

  $$EstabelecimentosTableFilterComposer get estabelecimentoId {
    final $$EstabelecimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableFilterComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> itensCardapioRefs(
    Expression<bool> Function($$ItensCardapioTableFilterComposer f) f,
  ) {
    final $$ItensCardapioTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.categoriaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableFilterComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriasTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriasTable> {
  $$CategoriasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnOrderings(column),
  );

  $$EstabelecimentosTableOrderingComposer get estabelecimentoId {
    final $$EstabelecimentosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableOrderingComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoriasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriasTable> {
  $$CategoriasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<int> get ordem =>
      $composableBuilder(column: $table.ordem, builder: (column) => column);

  $$EstabelecimentosTableAnnotationComposer get estabelecimentoId {
    final $$EstabelecimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> itensCardapioRefs<T extends Object>(
    Expression<T> Function($$ItensCardapioTableAnnotationComposer a) f,
  ) {
    final $$ItensCardapioTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.categoriaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableAnnotationComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriasTable,
          Categoria,
          $$CategoriasTableFilterComposer,
          $$CategoriasTableOrderingComposer,
          $$CategoriasTableAnnotationComposer,
          $$CategoriasTableCreateCompanionBuilder,
          $$CategoriasTableUpdateCompanionBuilder,
          (Categoria, $$CategoriasTableReferences),
          Categoria,
          PrefetchHooks Function({
            bool estabelecimentoId,
            bool itensCardapioRefs,
          })
        > {
  $$CategoriasTableTableManager(_$AppDatabase db, $CategoriasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> estabelecimentoId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<int> ordem = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriasCompanion(
                id: id,
                estabelecimentoId: estabelecimentoId,
                nome: nome,
                ordem: ordem,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String estabelecimentoId,
                required String nome,
                Value<int> ordem = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriasCompanion.insert(
                id: id,
                estabelecimentoId: estabelecimentoId,
                nome: nome,
                ordem: ordem,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({estabelecimentoId = false, itensCardapioRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (itensCardapioRefs) db.itensCardapio,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (estabelecimentoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.estabelecimentoId,
                                    referencedTable: $$CategoriasTableReferences
                                        ._estabelecimentoIdTable(db),
                                    referencedColumn:
                                        $$CategoriasTableReferences
                                            ._estabelecimentoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (itensCardapioRefs)
                        await $_getPrefetchedData<
                          Categoria,
                          $CategoriasTable,
                          ItemCardapio
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriasTableReferences
                              ._itensCardapioRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriasTableReferences(
                                db,
                                table,
                                p0,
                              ).itensCardapioRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoriaId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriasTable,
      Categoria,
      $$CategoriasTableFilterComposer,
      $$CategoriasTableOrderingComposer,
      $$CategoriasTableAnnotationComposer,
      $$CategoriasTableCreateCompanionBuilder,
      $$CategoriasTableUpdateCompanionBuilder,
      (Categoria, $$CategoriasTableReferences),
      Categoria,
      PrefetchHooks Function({bool estabelecimentoId, bool itensCardapioRefs})
    >;
typedef $$ItensCardapioTableCreateCompanionBuilder =
    ItensCardapioCompanion Function({
      required String id,
      required String estabelecimentoId,
      required String categoriaId,
      required String nome,
      Value<String?> descricao,
      required int precoCentavos,
      Value<bool> disponivel,
      Value<int> rowid,
    });
typedef $$ItensCardapioTableUpdateCompanionBuilder =
    ItensCardapioCompanion Function({
      Value<String> id,
      Value<String> estabelecimentoId,
      Value<String> categoriaId,
      Value<String> nome,
      Value<String?> descricao,
      Value<int> precoCentavos,
      Value<bool> disponivel,
      Value<int> rowid,
    });

final class $$ItensCardapioTableReferences
    extends BaseReferences<_$AppDatabase, $ItensCardapioTable, ItemCardapio> {
  $$ItensCardapioTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EstabelecimentosTable _estabelecimentoIdTable(_$AppDatabase db) =>
      db.estabelecimentos.createAlias(
        $_aliasNameGenerator(
          db.itensCardapio.estabelecimentoId,
          db.estabelecimentos.id,
        ),
      );

  $$EstabelecimentosTableProcessedTableManager get estabelecimentoId {
    final $_column = $_itemColumn<String>('estabelecimento_id')!;

    final manager = $$EstabelecimentosTableTableManager(
      $_db,
      $_db.estabelecimentos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_estabelecimentoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriasTable _categoriaIdTable(_$AppDatabase db) =>
      db.categorias.createAlias(
        $_aliasNameGenerator(db.itensCardapio.categoriaId, db.categorias.id),
      );

  $$CategoriasTableProcessedTableManager get categoriaId {
    final $_column = $_itemColumn<String>('categoria_id')!;

    final manager = $$CategoriasTableTableManager(
      $_db,
      $_db.categorias,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoriaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PedidosTable, List<Pedido>> _pedidosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pedidos,
    aliasName: $_aliasNameGenerator(
      db.itensCardapio.id,
      db.pedidos.itemCardapioId,
    ),
  );

  $$PedidosTableProcessedTableManager get pedidosRefs {
    final manager = $$PedidosTableTableManager(
      $_db,
      $_db.pedidos,
    ).filter((f) => f.itemCardapioId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_pedidosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ItensCardapioTableFilterComposer
    extends Composer<_$AppDatabase, $ItensCardapioTable> {
  $$ItensCardapioTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get precoCentavos => $composableBuilder(
    column: $table.precoCentavos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get disponivel => $composableBuilder(
    column: $table.disponivel,
    builder: (column) => ColumnFilters(column),
  );

  $$EstabelecimentosTableFilterComposer get estabelecimentoId {
    final $$EstabelecimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableFilterComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriasTableFilterComposer get categoriaId {
    final $$CategoriasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoriaId,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableFilterComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> pedidosRefs(
    Expression<bool> Function($$PedidosTableFilterComposer f) f,
  ) {
    final $$PedidosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.itemCardapioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableFilterComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItensCardapioTableOrderingComposer
    extends Composer<_$AppDatabase, $ItensCardapioTable> {
  $$ItensCardapioTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get precoCentavos => $composableBuilder(
    column: $table.precoCentavos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get disponivel => $composableBuilder(
    column: $table.disponivel,
    builder: (column) => ColumnOrderings(column),
  );

  $$EstabelecimentosTableOrderingComposer get estabelecimentoId {
    final $$EstabelecimentosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableOrderingComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriasTableOrderingComposer get categoriaId {
    final $$CategoriasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoriaId,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableOrderingComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItensCardapioTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItensCardapioTable> {
  $$ItensCardapioTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<int> get precoCentavos => $composableBuilder(
    column: $table.precoCentavos,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get disponivel => $composableBuilder(
    column: $table.disponivel,
    builder: (column) => column,
  );

  $$EstabelecimentosTableAnnotationComposer get estabelecimentoId {
    final $$EstabelecimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.estabelecimentoId,
      referencedTable: $db.estabelecimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EstabelecimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.estabelecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriasTableAnnotationComposer get categoriaId {
    final $$CategoriasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoriaId,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableAnnotationComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> pedidosRefs<T extends Object>(
    Expression<T> Function($$PedidosTableAnnotationComposer a) f,
  ) {
    final $$PedidosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.itemCardapioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableAnnotationComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItensCardapioTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItensCardapioTable,
          ItemCardapio,
          $$ItensCardapioTableFilterComposer,
          $$ItensCardapioTableOrderingComposer,
          $$ItensCardapioTableAnnotationComposer,
          $$ItensCardapioTableCreateCompanionBuilder,
          $$ItensCardapioTableUpdateCompanionBuilder,
          (ItemCardapio, $$ItensCardapioTableReferences),
          ItemCardapio,
          PrefetchHooks Function({
            bool estabelecimentoId,
            bool categoriaId,
            bool pedidosRefs,
          })
        > {
  $$ItensCardapioTableTableManager(_$AppDatabase db, $ItensCardapioTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItensCardapioTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItensCardapioTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItensCardapioTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> estabelecimentoId = const Value.absent(),
                Value<String> categoriaId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String?> descricao = const Value.absent(),
                Value<int> precoCentavos = const Value.absent(),
                Value<bool> disponivel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItensCardapioCompanion(
                id: id,
                estabelecimentoId: estabelecimentoId,
                categoriaId: categoriaId,
                nome: nome,
                descricao: descricao,
                precoCentavos: precoCentavos,
                disponivel: disponivel,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String estabelecimentoId,
                required String categoriaId,
                required String nome,
                Value<String?> descricao = const Value.absent(),
                required int precoCentavos,
                Value<bool> disponivel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItensCardapioCompanion.insert(
                id: id,
                estabelecimentoId: estabelecimentoId,
                categoriaId: categoriaId,
                nome: nome,
                descricao: descricao,
                precoCentavos: precoCentavos,
                disponivel: disponivel,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ItensCardapioTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                estabelecimentoId = false,
                categoriaId = false,
                pedidosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (pedidosRefs) db.pedidos],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (estabelecimentoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.estabelecimentoId,
                                    referencedTable:
                                        $$ItensCardapioTableReferences
                                            ._estabelecimentoIdTable(db),
                                    referencedColumn:
                                        $$ItensCardapioTableReferences
                                            ._estabelecimentoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (categoriaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoriaId,
                                    referencedTable:
                                        $$ItensCardapioTableReferences
                                            ._categoriaIdTable(db),
                                    referencedColumn:
                                        $$ItensCardapioTableReferences
                                            ._categoriaIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (pedidosRefs)
                        await $_getPrefetchedData<
                          ItemCardapio,
                          $ItensCardapioTable,
                          Pedido
                        >(
                          currentTable: table,
                          referencedTable: $$ItensCardapioTableReferences
                              ._pedidosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ItensCardapioTableReferences(
                                db,
                                table,
                                p0,
                              ).pedidosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itemCardapioId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ItensCardapioTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItensCardapioTable,
      ItemCardapio,
      $$ItensCardapioTableFilterComposer,
      $$ItensCardapioTableOrderingComposer,
      $$ItensCardapioTableAnnotationComposer,
      $$ItensCardapioTableCreateCompanionBuilder,
      $$ItensCardapioTableUpdateCompanionBuilder,
      (ItemCardapio, $$ItensCardapioTableReferences),
      ItemCardapio,
      PrefetchHooks Function({
        bool estabelecimentoId,
        bool categoriaId,
        bool pedidosRefs,
      })
    >;
typedef $$AtendimentosTableCreateCompanionBuilder =
    AtendimentosCompanion Function({
      required String id,
      required String mesaId,
      required String garcomId,
      Value<AtendimentoStatus> status,
      required DateTime abertura,
      Value<DateTime?> encerramento,
      Value<int> rowid,
    });
typedef $$AtendimentosTableUpdateCompanionBuilder =
    AtendimentosCompanion Function({
      Value<String> id,
      Value<String> mesaId,
      Value<String> garcomId,
      Value<AtendimentoStatus> status,
      Value<DateTime> abertura,
      Value<DateTime?> encerramento,
      Value<int> rowid,
    });

final class $$AtendimentosTableReferences
    extends BaseReferences<_$AppDatabase, $AtendimentosTable, Atendimento> {
  $$AtendimentosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MesasTable _mesaIdTable(_$AppDatabase db) => db.mesas.createAlias(
    $_aliasNameGenerator(db.atendimentos.mesaId, db.mesas.id),
  );

  $$MesasTableProcessedTableManager get mesaId {
    final $_column = $_itemColumn<String>('mesa_id')!;

    final manager = $$MesasTableTableManager(
      $_db,
      $_db.mesas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mesaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GarconsTable _garcomIdTable(_$AppDatabase db) =>
      db.garcons.createAlias(
        $_aliasNameGenerator(db.atendimentos.garcomId, db.garcons.id),
      );

  $$GarconsTableProcessedTableManager get garcomId {
    final $_column = $_itemColumn<String>('garcom_id')!;

    final manager = $$GarconsTableTableManager(
      $_db,
      $_db.garcons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_garcomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PedidosTable, List<Pedido>> _pedidosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pedidos,
    aliasName: $_aliasNameGenerator(
      db.atendimentos.id,
      db.pedidos.atendimentoId,
    ),
  );

  $$PedidosTableProcessedTableManager get pedidosRefs {
    final manager = $$PedidosTableTableManager(
      $_db,
      $_db.pedidos,
    ).filter((f) => f.atendimentoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_pedidosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AtendimentosTableFilterComposer
    extends Composer<_$AppDatabase, $AtendimentosTable> {
  $$AtendimentosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AtendimentoStatus, AtendimentoStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get abertura => $composableBuilder(
    column: $table.abertura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get encerramento => $composableBuilder(
    column: $table.encerramento,
    builder: (column) => ColumnFilters(column),
  );

  $$MesasTableFilterComposer get mesaId {
    final $$MesasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mesaId,
      referencedTable: $db.mesas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MesasTableFilterComposer(
            $db: $db,
            $table: $db.mesas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GarconsTableFilterComposer get garcomId {
    final $$GarconsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.garcomId,
      referencedTable: $db.garcons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GarconsTableFilterComposer(
            $db: $db,
            $table: $db.garcons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> pedidosRefs(
    Expression<bool> Function($$PedidosTableFilterComposer f) f,
  ) {
    final $$PedidosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.atendimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableFilterComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AtendimentosTableOrderingComposer
    extends Composer<_$AppDatabase, $AtendimentosTable> {
  $$AtendimentosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get abertura => $composableBuilder(
    column: $table.abertura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get encerramento => $composableBuilder(
    column: $table.encerramento,
    builder: (column) => ColumnOrderings(column),
  );

  $$MesasTableOrderingComposer get mesaId {
    final $$MesasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mesaId,
      referencedTable: $db.mesas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MesasTableOrderingComposer(
            $db: $db,
            $table: $db.mesas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GarconsTableOrderingComposer get garcomId {
    final $$GarconsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.garcomId,
      referencedTable: $db.garcons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GarconsTableOrderingComposer(
            $db: $db,
            $table: $db.garcons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AtendimentosTableAnnotationComposer
    extends Composer<_$AppDatabase, $AtendimentosTable> {
  $$AtendimentosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AtendimentoStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get abertura =>
      $composableBuilder(column: $table.abertura, builder: (column) => column);

  GeneratedColumn<DateTime> get encerramento => $composableBuilder(
    column: $table.encerramento,
    builder: (column) => column,
  );

  $$MesasTableAnnotationComposer get mesaId {
    final $$MesasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mesaId,
      referencedTable: $db.mesas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MesasTableAnnotationComposer(
            $db: $db,
            $table: $db.mesas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GarconsTableAnnotationComposer get garcomId {
    final $$GarconsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.garcomId,
      referencedTable: $db.garcons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GarconsTableAnnotationComposer(
            $db: $db,
            $table: $db.garcons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> pedidosRefs<T extends Object>(
    Expression<T> Function($$PedidosTableAnnotationComposer a) f,
  ) {
    final $$PedidosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.atendimentoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableAnnotationComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AtendimentosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AtendimentosTable,
          Atendimento,
          $$AtendimentosTableFilterComposer,
          $$AtendimentosTableOrderingComposer,
          $$AtendimentosTableAnnotationComposer,
          $$AtendimentosTableCreateCompanionBuilder,
          $$AtendimentosTableUpdateCompanionBuilder,
          (Atendimento, $$AtendimentosTableReferences),
          Atendimento,
          PrefetchHooks Function({bool mesaId, bool garcomId, bool pedidosRefs})
        > {
  $$AtendimentosTableTableManager(_$AppDatabase db, $AtendimentosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AtendimentosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AtendimentosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AtendimentosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mesaId = const Value.absent(),
                Value<String> garcomId = const Value.absent(),
                Value<AtendimentoStatus> status = const Value.absent(),
                Value<DateTime> abertura = const Value.absent(),
                Value<DateTime?> encerramento = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AtendimentosCompanion(
                id: id,
                mesaId: mesaId,
                garcomId: garcomId,
                status: status,
                abertura: abertura,
                encerramento: encerramento,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mesaId,
                required String garcomId,
                Value<AtendimentoStatus> status = const Value.absent(),
                required DateTime abertura,
                Value<DateTime?> encerramento = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AtendimentosCompanion.insert(
                id: id,
                mesaId: mesaId,
                garcomId: garcomId,
                status: status,
                abertura: abertura,
                encerramento: encerramento,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AtendimentosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({mesaId = false, garcomId = false, pedidosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (pedidosRefs) db.pedidos],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (mesaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.mesaId,
                                    referencedTable:
                                        $$AtendimentosTableReferences
                                            ._mesaIdTable(db),
                                    referencedColumn:
                                        $$AtendimentosTableReferences
                                            ._mesaIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (garcomId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.garcomId,
                                    referencedTable:
                                        $$AtendimentosTableReferences
                                            ._garcomIdTable(db),
                                    referencedColumn:
                                        $$AtendimentosTableReferences
                                            ._garcomIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (pedidosRefs)
                        await $_getPrefetchedData<
                          Atendimento,
                          $AtendimentosTable,
                          Pedido
                        >(
                          currentTable: table,
                          referencedTable: $$AtendimentosTableReferences
                              ._pedidosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AtendimentosTableReferences(
                                db,
                                table,
                                p0,
                              ).pedidosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.atendimentoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AtendimentosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AtendimentosTable,
      Atendimento,
      $$AtendimentosTableFilterComposer,
      $$AtendimentosTableOrderingComposer,
      $$AtendimentosTableAnnotationComposer,
      $$AtendimentosTableCreateCompanionBuilder,
      $$AtendimentosTableUpdateCompanionBuilder,
      (Atendimento, $$AtendimentosTableReferences),
      Atendimento,
      PrefetchHooks Function({bool mesaId, bool garcomId, bool pedidosRefs})
    >;
typedef $$PedidosTableCreateCompanionBuilder =
    PedidosCompanion Function({
      required String id,
      required String atendimentoId,
      required String itemCardapioId,
      Value<int> quantidade,
      required int precoUnitarioCentavos,
      Value<String?> observacao,
      Value<ItemPedidoStatus> status,
      required DateTime criadoEm,
      Value<int> rowid,
    });
typedef $$PedidosTableUpdateCompanionBuilder =
    PedidosCompanion Function({
      Value<String> id,
      Value<String> atendimentoId,
      Value<String> itemCardapioId,
      Value<int> quantidade,
      Value<int> precoUnitarioCentavos,
      Value<String?> observacao,
      Value<ItemPedidoStatus> status,
      Value<DateTime> criadoEm,
      Value<int> rowid,
    });

final class $$PedidosTableReferences
    extends BaseReferences<_$AppDatabase, $PedidosTable, Pedido> {
  $$PedidosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AtendimentosTable _atendimentoIdTable(_$AppDatabase db) =>
      db.atendimentos.createAlias(
        $_aliasNameGenerator(db.pedidos.atendimentoId, db.atendimentos.id),
      );

  $$AtendimentosTableProcessedTableManager get atendimentoId {
    final $_column = $_itemColumn<String>('atendimento_id')!;

    final manager = $$AtendimentosTableTableManager(
      $_db,
      $_db.atendimentos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_atendimentoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ItensCardapioTable _itemCardapioIdTable(_$AppDatabase db) =>
      db.itensCardapio.createAlias(
        $_aliasNameGenerator(db.pedidos.itemCardapioId, db.itensCardapio.id),
      );

  $$ItensCardapioTableProcessedTableManager get itemCardapioId {
    final $_column = $_itemColumn<String>('item_cardapio_id')!;

    final manager = $$ItensCardapioTableTableManager(
      $_db,
      $_db.itensCardapio,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemCardapioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PedidosTableFilterComposer
    extends Composer<_$AppDatabase, $PedidosTable> {
  $$PedidosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get precoUnitarioCentavos => $composableBuilder(
    column: $table.precoUnitarioCentavos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ItemPedidoStatus, ItemPedidoStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  $$AtendimentosTableFilterComposer get atendimentoId {
    final $$AtendimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.atendimentoId,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableFilterComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ItensCardapioTableFilterComposer get itemCardapioId {
    final $$ItensCardapioTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemCardapioId,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableFilterComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PedidosTableOrderingComposer
    extends Composer<_$AppDatabase, $PedidosTable> {
  $$PedidosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get precoUnitarioCentavos => $composableBuilder(
    column: $table.precoUnitarioCentavos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  $$AtendimentosTableOrderingComposer get atendimentoId {
    final $$AtendimentosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.atendimentoId,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableOrderingComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ItensCardapioTableOrderingComposer get itemCardapioId {
    final $$ItensCardapioTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemCardapioId,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableOrderingComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PedidosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PedidosTable> {
  $$PedidosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => column,
  );

  GeneratedColumn<int> get precoUnitarioCentavos => $composableBuilder(
    column: $table.precoUnitarioCentavos,
    builder: (column) => column,
  );

  GeneratedColumn<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ItemPedidoStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  $$AtendimentosTableAnnotationComposer get atendimentoId {
    final $$AtendimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.atendimentoId,
      referencedTable: $db.atendimentos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AtendimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.atendimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ItensCardapioTableAnnotationComposer get itemCardapioId {
    final $$ItensCardapioTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemCardapioId,
      referencedTable: $db.itensCardapio,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItensCardapioTableAnnotationComposer(
            $db: $db,
            $table: $db.itensCardapio,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PedidosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PedidosTable,
          Pedido,
          $$PedidosTableFilterComposer,
          $$PedidosTableOrderingComposer,
          $$PedidosTableAnnotationComposer,
          $$PedidosTableCreateCompanionBuilder,
          $$PedidosTableUpdateCompanionBuilder,
          (Pedido, $$PedidosTableReferences),
          Pedido,
          PrefetchHooks Function({bool atendimentoId, bool itemCardapioId})
        > {
  $$PedidosTableTableManager(_$AppDatabase db, $PedidosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PedidosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PedidosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PedidosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> atendimentoId = const Value.absent(),
                Value<String> itemCardapioId = const Value.absent(),
                Value<int> quantidade = const Value.absent(),
                Value<int> precoUnitarioCentavos = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<ItemPedidoStatus> status = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PedidosCompanion(
                id: id,
                atendimentoId: atendimentoId,
                itemCardapioId: itemCardapioId,
                quantidade: quantidade,
                precoUnitarioCentavos: precoUnitarioCentavos,
                observacao: observacao,
                status: status,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String atendimentoId,
                required String itemCardapioId,
                Value<int> quantidade = const Value.absent(),
                required int precoUnitarioCentavos,
                Value<String?> observacao = const Value.absent(),
                Value<ItemPedidoStatus> status = const Value.absent(),
                required DateTime criadoEm,
                Value<int> rowid = const Value.absent(),
              }) => PedidosCompanion.insert(
                id: id,
                atendimentoId: atendimentoId,
                itemCardapioId: itemCardapioId,
                quantidade: quantidade,
                precoUnitarioCentavos: precoUnitarioCentavos,
                observacao: observacao,
                status: status,
                criadoEm: criadoEm,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PedidosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({atendimentoId = false, itemCardapioId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (atendimentoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.atendimentoId,
                                    referencedTable: $$PedidosTableReferences
                                        ._atendimentoIdTable(db),
                                    referencedColumn: $$PedidosTableReferences
                                        ._atendimentoIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (itemCardapioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.itemCardapioId,
                                    referencedTable: $$PedidosTableReferences
                                        ._itemCardapioIdTable(db),
                                    referencedColumn: $$PedidosTableReferences
                                        ._itemCardapioIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$PedidosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PedidosTable,
      Pedido,
      $$PedidosTableFilterComposer,
      $$PedidosTableOrderingComposer,
      $$PedidosTableAnnotationComposer,
      $$PedidosTableCreateCompanionBuilder,
      $$PedidosTableUpdateCompanionBuilder,
      (Pedido, $$PedidosTableReferences),
      Pedido,
      PrefetchHooks Function({bool atendimentoId, bool itemCardapioId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(_db, _db.estabelecimentos);
  $$AdministradoresTableTableManager get administradores =>
      $$AdministradoresTableTableManager(_db, _db.administradores);
  $$GarconsTableTableManager get garcons =>
      $$GarconsTableTableManager(_db, _db.garcons);
  $$MesasTableTableManager get mesas =>
      $$MesasTableTableManager(_db, _db.mesas);
  $$CategoriasTableTableManager get categorias =>
      $$CategoriasTableTableManager(_db, _db.categorias);
  $$ItensCardapioTableTableManager get itensCardapio =>
      $$ItensCardapioTableTableManager(_db, _db.itensCardapio);
  $$AtendimentosTableTableManager get atendimentos =>
      $$AtendimentosTableTableManager(_db, _db.atendimentos);
  $$PedidosTableTableManager get pedidos =>
      $$PedidosTableTableManager(_db, _db.pedidos);
}

mixin _$MesasDaoMixin on DatabaseAccessor<AppDatabase> {
  $EstabelecimentosTable get estabelecimentos =>
      attachedDatabase.estabelecimentos;
  $MesasTable get mesas => attachedDatabase.mesas;
  MesasDaoManager get managers => MesasDaoManager(this);
}

class MesasDaoManager {
  final _$MesasDaoMixin _db;
  MesasDaoManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(
        _db.attachedDatabase,
        _db.estabelecimentos,
      );
  $$MesasTableTableManager get mesas =>
      $$MesasTableTableManager(_db.attachedDatabase, _db.mesas);
}

mixin _$GarconsDaoMixin on DatabaseAccessor<AppDatabase> {
  $EstabelecimentosTable get estabelecimentos =>
      attachedDatabase.estabelecimentos;
  $GarconsTable get garcons => attachedDatabase.garcons;
  GarconsDaoManager get managers => GarconsDaoManager(this);
}

class GarconsDaoManager {
  final _$GarconsDaoMixin _db;
  GarconsDaoManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(
        _db.attachedDatabase,
        _db.estabelecimentos,
      );
  $$GarconsTableTableManager get garcons =>
      $$GarconsTableTableManager(_db.attachedDatabase, _db.garcons);
}

mixin _$AdminsDaoMixin on DatabaseAccessor<AppDatabase> {
  $EstabelecimentosTable get estabelecimentos =>
      attachedDatabase.estabelecimentos;
  $AdministradoresTable get administradores => attachedDatabase.administradores;
  AdminsDaoManager get managers => AdminsDaoManager(this);
}

class AdminsDaoManager {
  final _$AdminsDaoMixin _db;
  AdminsDaoManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(
        _db.attachedDatabase,
        _db.estabelecimentos,
      );
  $$AdministradoresTableTableManager get administradores =>
      $$AdministradoresTableTableManager(
        _db.attachedDatabase,
        _db.administradores,
      );
}

mixin _$CardapioDaoMixin on DatabaseAccessor<AppDatabase> {
  $EstabelecimentosTable get estabelecimentos =>
      attachedDatabase.estabelecimentos;
  $CategoriasTable get categorias => attachedDatabase.categorias;
  $ItensCardapioTable get itensCardapio => attachedDatabase.itensCardapio;
  CardapioDaoManager get managers => CardapioDaoManager(this);
}

class CardapioDaoManager {
  final _$CardapioDaoMixin _db;
  CardapioDaoManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(
        _db.attachedDatabase,
        _db.estabelecimentos,
      );
  $$CategoriasTableTableManager get categorias =>
      $$CategoriasTableTableManager(_db.attachedDatabase, _db.categorias);
  $$ItensCardapioTableTableManager get itensCardapio =>
      $$ItensCardapioTableTableManager(_db.attachedDatabase, _db.itensCardapio);
}

mixin _$AtendimentosDaoMixin on DatabaseAccessor<AppDatabase> {
  $EstabelecimentosTable get estabelecimentos =>
      attachedDatabase.estabelecimentos;
  $MesasTable get mesas => attachedDatabase.mesas;
  $GarconsTable get garcons => attachedDatabase.garcons;
  $AtendimentosTable get atendimentos => attachedDatabase.atendimentos;
  AtendimentosDaoManager get managers => AtendimentosDaoManager(this);
}

class AtendimentosDaoManager {
  final _$AtendimentosDaoMixin _db;
  AtendimentosDaoManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(
        _db.attachedDatabase,
        _db.estabelecimentos,
      );
  $$MesasTableTableManager get mesas =>
      $$MesasTableTableManager(_db.attachedDatabase, _db.mesas);
  $$GarconsTableTableManager get garcons =>
      $$GarconsTableTableManager(_db.attachedDatabase, _db.garcons);
  $$AtendimentosTableTableManager get atendimentos =>
      $$AtendimentosTableTableManager(_db.attachedDatabase, _db.atendimentos);
}

mixin _$PedidosDaoMixin on DatabaseAccessor<AppDatabase> {
  $EstabelecimentosTable get estabelecimentos =>
      attachedDatabase.estabelecimentos;
  $MesasTable get mesas => attachedDatabase.mesas;
  $GarconsTable get garcons => attachedDatabase.garcons;
  $AtendimentosTable get atendimentos => attachedDatabase.atendimentos;
  $CategoriasTable get categorias => attachedDatabase.categorias;
  $ItensCardapioTable get itensCardapio => attachedDatabase.itensCardapio;
  $PedidosTable get pedidos => attachedDatabase.pedidos;
  PedidosDaoManager get managers => PedidosDaoManager(this);
}

class PedidosDaoManager {
  final _$PedidosDaoMixin _db;
  PedidosDaoManager(this._db);
  $$EstabelecimentosTableTableManager get estabelecimentos =>
      $$EstabelecimentosTableTableManager(
        _db.attachedDatabase,
        _db.estabelecimentos,
      );
  $$MesasTableTableManager get mesas =>
      $$MesasTableTableManager(_db.attachedDatabase, _db.mesas);
  $$GarconsTableTableManager get garcons =>
      $$GarconsTableTableManager(_db.attachedDatabase, _db.garcons);
  $$AtendimentosTableTableManager get atendimentos =>
      $$AtendimentosTableTableManager(_db.attachedDatabase, _db.atendimentos);
  $$CategoriasTableTableManager get categorias =>
      $$CategoriasTableTableManager(_db.attachedDatabase, _db.categorias);
  $$ItensCardapioTableTableManager get itensCardapio =>
      $$ItensCardapioTableTableManager(_db.attachedDatabase, _db.itensCardapio);
  $$PedidosTableTableManager get pedidos =>
      $$PedidosTableTableManager(_db.attachedDatabase, _db.pedidos);
}
