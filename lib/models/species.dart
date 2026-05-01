import 'package:isar/isar.dart';

part 'species.g.dart';

@collection
class Species {
  Id id = Isar.autoIncrement;

  late String name;
  late String scientificName;
  late int incubationDays;
  late int marginDays;
  late String layingType; // e.g., "Diaria", "Días alternos"
  late int layingFrequencyDays; // 1 for daily, 2 for alternate, 3 for every 3 days

  Species({
    required this.name,
    required this.scientificName,
    required this.incubationDays,
    required this.marginDays,
    required this.layingType,
    required this.layingFrequencyDays,
  });
}
