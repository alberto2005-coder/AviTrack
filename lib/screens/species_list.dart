import 'package:flutter/material.dart';
import '../models/species.dart';
import '../services/database_service.dart';

class SpeciesListScreen extends StatefulWidget {
  const SpeciesListScreen({super.key});

  @override
  State<SpeciesListScreen> createState() => _SpeciesListScreenState();
}

class _SpeciesListScreenState extends State<SpeciesListScreen> {
  List<Species> _species = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSpecies();
  }

  Future<void> _loadSpecies() async {
    final species = await DatabaseService.getAllSpecies();
    setState(() {
      _species = species;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diccionario de Aves'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _species.length,
              itemBuilder: (context, index) {
                final s = _species[index];
                return ListTile(
                  title: Text(s.name),
                  subtitle: Text('${s.scientificName} • ${s.incubationDays} días incu.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _editSpecies(s),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _editSpecies(null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editSpecies(Species? species) {
    // For now, a simple dialog to edit incubation days or add new
    final nameController = TextEditingController(text: species?.name ?? '');
    final incuController = TextEditingController(text: species?.incubationDays.toString() ?? '13');
    final marginController = TextEditingController(text: species?.marginDays.toString() ?? '2');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(species == null ? 'Nueva Especie' : 'Editar ${species.name}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                enabled: species == null,
              ),
              TextField(
                controller: incuController,
                decoration: const InputDecoration(labelText: 'Días Incubación'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: marginController,
                decoration: const InputDecoration(labelText: 'Días Margen'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              final newSpecies = species ?? Species(
                name: nameController.text,
                scientificName: '',
                incubationDays: int.parse(incuController.text),
                marginDays: int.parse(marginController.text),
                layingType: 'Diaria',
                layingFrequencyDays: 1,
              );
              
              if (species != null) {
                newSpecies.incubationDays = int.parse(incuController.text);
                newSpecies.marginDays = int.parse(marginController.text);
              }

              await DatabaseService.isar.writeTxn(() async {
                await DatabaseService.isar.species.put(newSpecies);
              });
              
              if (context.mounted) Navigator.pop(context);
              _loadSpecies();
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
