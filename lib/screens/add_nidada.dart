import 'package:flutter/material.dart';
import '../models/nidada.dart';
import '../models/species.dart';
import '../services/database_service.dart';
import '../services/notification_service.dart';

class AddNidadaScreen extends StatefulWidget {
  const AddNidadaScreen({super.key});

  @override
  State<AddNidadaScreen> createState() => _AddNidadaScreenState();
}

class _AddNidadaScreenState extends State<AddNidadaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  List<Species> _speciesList = [];
  Species? _selectedSpecies;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSpecies();
  }

  Future<void> _loadSpecies() async {
    final species = await DatabaseService.getAllSpecies();
    setState(() {
      _speciesList = species;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Nidada'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre de la Pareja / Jaula',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home_work_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa un nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<Species>(
                      value: _selectedSpecies,
                      decoration: const InputDecoration(
                        labelText: 'Especie',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.pets),
                      ),
                      items: _speciesList.map((species) {
                        return DropdownMenuItem(
                          value: species,
                          child: Text(species.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSpecies = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor selecciona una especie';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveNidada,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('INICIAR PUESTA'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _saveNidada() async {
    if (_formKey.currentState!.validate()) {
      try {
        final nidada = Nidada(
          pairName: _nameController.text,
          startDate: DateTime.now(),
          status: NidadaStatus.puesta,
          currentEggCount: 1,
        );
        
        nidada.species.value = _selectedSpecies;
        
        await DatabaseService.saveNidada(nidada);
        
        if (_selectedSpecies != null) {
          await NotificationService.scheduleLayingNotifications(nidada, _selectedSpecies!);
        }

        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nidada iniciada y notificaciones programadas.')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar: $e')),
          );
        }
      }
    }
  }
}
