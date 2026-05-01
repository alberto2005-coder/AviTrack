import 'package:isar/isar.dart';
import 'species.dart';

part 'nidada.g.dart';

enum NidadaStatus { puesta, incubando, margen, finalizada }

@collection
class Nidada {
  Id id = Isar.autoIncrement;

  late String pairName; // Name of the pair or cage number
  
  final species = IsarLink<Species>();

  late DateTime? startDate; // Date when laying started
  late DateTime? incubationStartDate; // Date when incubation started (End of laying)
  
  @enumerated
  late NidadaStatus status;

  int currentEggCount = 0;

  Nidada({
    required this.pairName,
    this.startDate,
    this.incubationStartDate,
    this.status = NidadaStatus.puesta,
    this.currentEggCount = 0,
  });

  // Calculate hatching date: incubationStartDate + incubationDays
  DateTime? get expectedHatchingDate {
    if (incubationStartDate == null || species.value == null) return null;
    return incubationStartDate!.add(Duration(days: species.value!.incubationDays));
  }

  // Calculate margin limit date: expectedHatchingDate + marginDays
  DateTime? get marginLimitDate {
    if (expectedHatchingDate == null || species.value == null) return null;
    return expectedHatchingDate!.add(Duration(days: species.value!.marginDays));
  }
}
