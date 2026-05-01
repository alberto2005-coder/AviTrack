// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSpeciesCollection on Isar {
  IsarCollection<Species> get species => this.collection();
}

const SpeciesSchema = CollectionSchema(
  name: r'Species',
  id: -1724512414814962385,
  properties: {
    r'incubationDays': PropertySchema(
      id: 0,
      name: r'incubationDays',
      type: IsarType.long,
    ),
    r'layingFrequencyDays': PropertySchema(
      id: 1,
      name: r'layingFrequencyDays',
      type: IsarType.long,
    ),
    r'layingType': PropertySchema(
      id: 2,
      name: r'layingType',
      type: IsarType.string,
    ),
    r'marginDays': PropertySchema(
      id: 3,
      name: r'marginDays',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'scientificName': PropertySchema(
      id: 5,
      name: r'scientificName',
      type: IsarType.string,
    )
  },
  estimateSize: _speciesEstimateSize,
  serialize: _speciesSerialize,
  deserialize: _speciesDeserialize,
  deserializeProp: _speciesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _speciesGetId,
  getLinks: _speciesGetLinks,
  attach: _speciesAttach,
  version: '3.1.0+1',
);

int _speciesEstimateSize(
  Species object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.layingType.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.scientificName.length * 3;
  return bytesCount;
}

void _speciesSerialize(
  Species object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.incubationDays);
  writer.writeLong(offsets[1], object.layingFrequencyDays);
  writer.writeString(offsets[2], object.layingType);
  writer.writeLong(offsets[3], object.marginDays);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.scientificName);
}

Species _speciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Species(
    incubationDays: reader.readLong(offsets[0]),
    layingFrequencyDays: reader.readLong(offsets[1]),
    layingType: reader.readString(offsets[2]),
    marginDays: reader.readLong(offsets[3]),
    name: reader.readString(offsets[4]),
    scientificName: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _speciesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _speciesGetId(Species object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _speciesGetLinks(Species object) {
  return [];
}

void _speciesAttach(IsarCollection<dynamic> col, Id id, Species object) {
  object.id = id;
}

extension SpeciesQueryWhereSort on QueryBuilder<Species, Species, QWhere> {
  QueryBuilder<Species, Species, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SpeciesQueryWhere on QueryBuilder<Species, Species, QWhereClause> {
  QueryBuilder<Species, Species, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Species, Species, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> idBetween(
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

extension SpeciesQueryFilter
    on QueryBuilder<Species, Species, QFilterCondition> {
  QueryBuilder<Species, Species, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Species, Species, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Species, Species, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Species, Species, QAfterFilterCondition> incubationDaysEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incubationDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      incubationDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incubationDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> incubationDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incubationDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> incubationDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incubationDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      layingFrequencyDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layingFrequencyDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      layingFrequencyDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layingFrequencyDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      layingFrequencyDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layingFrequencyDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      layingFrequencyDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layingFrequencyDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'layingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'layingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'layingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'layingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layingType',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> layingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'layingType',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> marginDaysEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marginDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> marginDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marginDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> marginDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marginDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> marginDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marginDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> scientificNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      scientificNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> scientificNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> scientificNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scientificName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      scientificNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> scientificNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> scientificNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> scientificNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scientificName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      scientificNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
      scientificNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scientificName',
        value: '',
      ));
    });
  }
}

extension SpeciesQueryObject
    on QueryBuilder<Species, Species, QFilterCondition> {}

extension SpeciesQueryLinks
    on QueryBuilder<Species, Species, QFilterCondition> {}

extension SpeciesQuerySortBy on QueryBuilder<Species, Species, QSortBy> {
  QueryBuilder<Species, Species, QAfterSortBy> sortByIncubationDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationDays', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByIncubationDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationDays', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByLayingFrequencyDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingFrequencyDays', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByLayingFrequencyDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingFrequencyDays', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByLayingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingType', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByLayingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingType', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByMarginDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginDays', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByMarginDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginDays', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }
}

extension SpeciesQuerySortThenBy
    on QueryBuilder<Species, Species, QSortThenBy> {
  QueryBuilder<Species, Species, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByIncubationDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationDays', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByIncubationDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incubationDays', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByLayingFrequencyDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingFrequencyDays', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByLayingFrequencyDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingFrequencyDays', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByLayingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingType', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByLayingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layingType', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByMarginDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginDays', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByMarginDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marginDays', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }
}

extension SpeciesQueryWhereDistinct
    on QueryBuilder<Species, Species, QDistinct> {
  QueryBuilder<Species, Species, QDistinct> distinctByIncubationDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incubationDays');
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByLayingFrequencyDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layingFrequencyDays');
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByLayingType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layingType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByMarginDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marginDays');
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByScientificName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scientificName',
          caseSensitive: caseSensitive);
    });
  }
}

extension SpeciesQueryProperty
    on QueryBuilder<Species, Species, QQueryProperty> {
  QueryBuilder<Species, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Species, int, QQueryOperations> incubationDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incubationDays');
    });
  }

  QueryBuilder<Species, int, QQueryOperations> layingFrequencyDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layingFrequencyDays');
    });
  }

  QueryBuilder<Species, String, QQueryOperations> layingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layingType');
    });
  }

  QueryBuilder<Species, int, QQueryOperations> marginDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marginDays');
    });
  }

  QueryBuilder<Species, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Species, String, QQueryOperations> scientificNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scientificName');
    });
  }
}
