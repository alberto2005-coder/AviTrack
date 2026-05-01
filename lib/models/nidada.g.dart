// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nidada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNidadaCollection on Isar {
  IsarCollection<Nidada> get nidadas => this.collection();
}

const NidadaSchema = CollectionSchema(
  name: r'Nidada',
  id: -3826251637558277779,
  properties: {
    r'currentEggCount': PropertySchema(
      id: 0,
      name: r'currentEggCount',
      type: IsarType.long,
    ),
    r'customMarginDays': PropertySchema(
      id: 1,
      name: r'customMarginDays',
      type: IsarType.long,
    ),
    r'expectedHatchingDate': PropertySchema(
      id: 2,
      name: r'expectedHatchingDate',
      type: IsarType.dateTime,
    ),
    r'incubationStartDate': PropertySchema(
      id: 3,
      name: r'incubationStartDate',
      type: IsarType.dateTime,
    ),
    r'marginLimitDate': PropertySchema(
      id: 4,
      name: r'marginLimitDate',
      type: IsarType.dateTime,
    ),
    r'pairName': PropertySchema(
      id: 5,
      name: r'pairName',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 6,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NidadastatusEnumValueMap,
    )
  },
  estimateSize: _nidadaEstimateSize,
  serialize: _nidadaSerialize,
  deserialize: _nidadaDeserialize,
  deserializeProp: _nidadaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'species': LinkSchema(
      id: -5250746609852425158,
      name: r'species',
      target: r'Species',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _nidadaGetId,
  getLinks: _nidadaGetLinks,
  attach: _nidadaAttach,
  version: '3.1.0+1',
);

int _nidadaEstimateSize(
  Nidada object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pairName.length * 3;
  return bytesCount;
}

void _nidadaSerialize(
  Nidada object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentEggCount);
  writer.writeLong(offsets[1], object.customMarginDays);
  writer.writeDateTime(offsets[2], object.expectedHatchingDate);
  writer.writeDateTime(offsets[3], object.incubationStartDate);
  writer.writeDateTime(offsets[4], object.marginLimitDate);
  writer.writeString(offsets[5], object.pairName);
  writer.writeDateTime(offsets[6], object.startDate);
  writer.writeByte(offsets[7], object.status.index);
}

Nidada _nidadaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Nidada(
    currentEggCount: reader.readLongOrNull(offsets[0]) ?? 0,
    customMarginDays: reader.readLongOrNull(offsets[1]),
    incubationStartDate: reader.readDateTimeOrNull(offsets[3]),
    pairName: reader.readString(offsets[5]),
    startDate: reader.readDateTimeOrNull(offsets[6]),
    status: _NidadastatusValueEnumMap[reader.readByteOrNull(offsets[7])] ??
        NidadaStatus.puesta,
  );
  object.id = id;
  return object;
}

P _nidadaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (_NidadastatusValueEnumMap[reader.readByteOrNull(offset)] ??
          NidadaStatus.puesta) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NidadastatusEnumValueMap = {
  'puesta': 0,
  'incubando': 1,
  'margen': 2,
  'finalizada': 3,
};
const _NidadastatusValueEnumMap = {
  0: NidadaStatus.puesta,
  1: NidadaStatus.incubando,
  2: NidadaStatus.margen,
  3: NidadaStatus.finalizada,
};

Id _nidadaGetId(Nidada object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nidadaGetLinks(Nidada object) {
  return [object.species];
}

void _nidadaAttach(IsarCollection<dynamic> col, Id id, Nidada object) {
  object.id = id;
  object.species.attach(col, col.isar.collection<Species>(), r'species', id);
}

extension NidadaQueryWhereSort on QueryBuilder<Nidada, Nidada, QWhere> {
  QueryBuilder<Nidada, Nidada, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NidadaQueryWhere on QueryBuilder<Nidada, Nidada, QWhereClause> {
  QueryBuilder<Nidada, Nidada, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NidadaQueryFilter on QueryBuilder<Nidada, Nidada, QFilterCondition> {
  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> currentEggCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentEggCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      currentEggCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentEggCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> currentEggCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentEggCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> currentEggCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentEggCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> customMarginDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customMarginDays',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      customMarginDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customMarginDays',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> customMarginDaysEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customMarginDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      customMarginDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customMarginDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> customMarginDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customMarginDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> customMarginDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customMarginDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      expectedHatchingDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedHatchingDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      expectedHatchingDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedHatchingDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      expectedHatchingDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedHatchingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      expectedHatchingDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedHatchingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      expectedHatchingDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedHatchingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      expectedHatchingDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedHatchingDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      incubationStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'incubationStartDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      incubationStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'incubationStartDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      incubationStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incubationStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      incubationStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incubationStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      incubationStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incubationStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      incubationStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incubationStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> marginLimitDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marginLimitDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      marginLimitDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marginLimitDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> marginLimitDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marginLimitDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition>
      marginLimitDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marginLimitDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> marginLimitDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marginLimitDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> marginLimitDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marginLimitDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pairName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pairName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pairName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pairName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pairName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pairName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pairName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pairName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pairName',
        value: '',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> pairNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pairName',
        value: '',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> statusEqualTo(
      NidadaStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> statusGreaterThan(
    NidadaStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> statusLessThan(
    NidadaStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> statusBetween(
    NidadaStatus lower,
    NidadaStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NidadaQueryObject on QueryBuilder<Nidada, Nidada, QFilterCondition> {}

extension NidadaQueryLinks on QueryBuilder<Nidada, Nidada, QFilterCondition> {
  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> species(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'species');
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterFilterCondition> speciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'species', 0, true, 0, true);
    });
  }
}

extension NidadaQuerySortBy on QueryBuilder<Nidada, Nidada, QSortBy> {
  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByCurrentEggCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEggCount', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByCurrentEggCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEggCount', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByCustomMarginDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customMarginDays', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByCustomMarginDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customMarginDays', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByExpectedHatchingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedHatchingDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByExpectedHatchingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedHatchingDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByIncubationStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationStartDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByIncubationStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationStartDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByMarginLimitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginLimitDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByMarginLimitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginLimitDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByPairName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairName', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByPairNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairName', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension NidadaQuerySortThenBy on QueryBuilder<Nidada, Nidada, QSortThenBy> {
  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByCurrentEggCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEggCount', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByCurrentEggCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEggCount', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByCustomMarginDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customMarginDays', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByCustomMarginDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customMarginDays', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByExpectedHatchingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedHatchingDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByExpectedHatchingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedHatchingDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByIncubationStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationStartDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByIncubationStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationStartDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByMarginLimitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginLimitDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByMarginLimitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginLimitDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByPairName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairName', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByPairNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pairName', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Nidada, Nidada, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension NidadaQueryWhereDistinct on QueryBuilder<Nidada, Nidada, QDistinct> {
  QueryBuilder<Nidada, Nidada, QDistinct> distinctByCurrentEggCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentEggCount');
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByCustomMarginDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customMarginDays');
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByExpectedHatchingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedHatchingDate');
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByIncubationStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incubationStartDate');
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByMarginLimitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marginLimitDate');
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByPairName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pairName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<Nidada, Nidada, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension NidadaQueryProperty on QueryBuilder<Nidada, Nidada, QQueryProperty> {
  QueryBuilder<Nidada, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Nidada, int, QQueryOperations> currentEggCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentEggCount');
    });
  }

  QueryBuilder<Nidada, int?, QQueryOperations> customMarginDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customMarginDays');
    });
  }

  QueryBuilder<Nidada, DateTime?, QQueryOperations>
      expectedHatchingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedHatchingDate');
    });
  }

  QueryBuilder<Nidada, DateTime?, QQueryOperations>
      incubationStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incubationStartDate');
    });
  }

  QueryBuilder<Nidada, DateTime?, QQueryOperations> marginLimitDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marginLimitDate');
    });
  }

  QueryBuilder<Nidada, String, QQueryOperations> pairNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pairName');
    });
  }

  QueryBuilder<Nidada, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<Nidada, NidadaStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
