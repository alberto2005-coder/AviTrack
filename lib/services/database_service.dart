import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/species.dart';
import '../models/nidada.dart';

class DatabaseService {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [SpeciesSchema, NidadaSchema],
      directory: dir.path,
    );

    // Preload species if empty
    final speciesCount = await isar.species.count();
    if (speciesCount == 0) {
      await _preloadSpecies();
    }
  }

  static Future<void> _preloadSpecies() async {
    final speciesList = [
      Species(
        name: 'Canario',
        scientificName: 'Serinus canaria',
        incubationDays: 13,
        marginDays: 2,
        layingType: 'Diaria',
        layingFrequencyDays: 1,
      ),
      Species(
        name: 'Periquito Australiano',
        scientificName: 'Melopsittacus undulatus',
        incubationDays: 18,
        marginDays: 2,
        layingType: 'Días alternos',
        layingFrequencyDays: 2,
      ),
      Species(
        name: 'Agapornis',
        scientificName: 'Agapornis spp.',
        incubationDays: 23,
        marginDays: 3,
        layingType: 'Días alternos',
        layingFrequencyDays: 2,
      ),
      Species(
        name: 'Ninfa',
        scientificName: 'Nymphicus hollandicus',
        incubationDays: 19,
        marginDays: 2,
        layingType: 'Días alternos',
        layingFrequencyDays: 2,
      ),
      Species(
        name: 'Diamante de Gould',
        scientificName: 'Erythrura gouldiae',
        incubationDays: 14,
        marginDays: 2,
        layingType: 'Diaria',
        layingFrequencyDays: 1,
      ),
      Species(
        name: 'Loro Gris (Yaco)',
        scientificName: 'Psittacus erithacus',
        incubationDays: 28,
        marginDays: 4,
        layingType: '3 días',
        layingFrequencyDays: 3,
      ),
      Species(
        name: 'Diamante Mandarín',
        scientificName: 'Taeniopygia guttata',
        incubationDays: 12,
        marginDays: 2,
        layingType: 'Diaria',
        layingFrequencyDays: 1,
      ),
      Species(
        name: 'Jilguero',
        scientificName: 'Carduelis carduelis',
        incubationDays: 13,
        marginDays: 2,
        layingType: 'Diaria',
        layingFrequencyDays: 1,
      ),
      Species(
        name: 'Cacatúa Blanca',
        scientificName: 'Cacatua alba',
        incubationDays: 25,
        marginDays: 3,
        layingType: '2-3 días',
        layingFrequencyDays: 2, // Approximating to 2 for notifications
      ),
      Species(
        name: 'Guacamayo Azul y Amarillo',
        scientificName: 'Ara ararauna',
        incubationDays: 26,
        marginDays: 4,
        layingType: '2 días',
        layingFrequencyDays: 2,
      ),
      Species(
        name: 'Paloma Mensajera',
        scientificName: 'Columba livia domestica',
        incubationDays: 18,
        marginDays: 1,
        layingType: '44 horas',
        layingFrequencyDays: 2, // Approximating to 2
      ),
      Species(
        name: 'Padda (Gorrión de Java)',
        scientificName: 'Lonchura oryzivora',
        incubationDays: 15,
        marginDays: 2,
        layingType: 'Diaria',
        layingFrequencyDays: 1,
      ),
      Species(
        name: 'Cotorra del Sol',
        scientificName: 'Aratinga solstitialis',
        incubationDays: 23,
        marginDays: 3,
        layingType: '2 días',
        layingFrequencyDays: 2,
      ),
    ];

    await isar.writeTxn(() async {
      await isar.species.putAll(speciesList);
    });
  }

  // CRUD for Nidada
  static Future<void> saveNidada(Nidada nidada) async {
    await isar.writeTxn(() async {
      await isar.nidadas.put(nidada);
      await nidada.species.save();
    });
  }

  static Stream<List<Nidada>> watchNidadas() {
    return isar.nidadas.where().watch(fireImmediately: true);
  }

  static Future<List<Species>> getAllSpecies() async {
    return await isar.species.where().findAll();
  }

  static Future<void> deleteNidada(int id) async {
    await isar.writeTxn(() async {
      await isar.nidadas.delete(id);
    });
  }
}
