import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/nidada.dart';
import '../services/database_service.dart';
import '../services/notification_service.dart';
import '../widgets/nidada_card.dart';
import 'add_nidada.dart';
import 'species_list.dart';
import '../main.dart'; // Importar themeNotifier

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AviTrack Dashboard'),
        centerTitle: true,
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, mode, _) {
              IconData icon;
              if (mode == ThemeMode.dark) {
                icon = Icons.nightlight_round;
              } else {
                icon = Icons.wb_sunny;
              }
              return IconButton(
                icon: Icon(icon),
                onPressed: () async {
                  // Solo alternamos entre Claro y Oscuro
                  ThemeMode newMode = (mode == ThemeMode.dark) 
                      ? ThemeMode.light 
                      : ThemeMode.dark;
                  
                  themeNotifier.value = newMode;
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setInt('themeMode', newMode.index);

                  if (context.mounted) {
                    String modeName = newMode == ThemeMode.dark ? 'Oscuro' : 'Claro';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Modo $modeName activado'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
                tooltip: 'Cambiar tema',
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SpeciesListScreen()),
              );
            },
            tooltip: 'Diccionario de Aves',
          ),
        ],
      ),
      body: StreamBuilder<List<Nidada>>(
        stream: DatabaseService.watchNidadas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final nidadas = snapshot.data ?? [];

          if (nidadas.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 120,
                    errorBuilder: (context, error, stackTrace) => 
                        Icon(Icons.egg_outlined, size: 80, color: Colors.grey.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No hay nidadas activas',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _navigateToAddNidada(context),
                    child: const Text('Empezar nueva puesta'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: nidadas.length,
            itemBuilder: (context, index) {
              final nidada = nidadas[index];
              return NidadaCard(
                nidada: nidada,
                onDelete: () => _deleteNidada(nidada),
                onStartIncubation: () => _startIncubation(nidada),
                onFinish: () => _finishNidada(nidada),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToAddNidada(context),
        label: const Text('Nueva Nuesta'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddNidada(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddNidadaScreen()),
    );
  }

  Future<void> _deleteNidada(Nidada nidada) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Nidada'),
        content: const Text('¿Estás seguro de que quieres eliminar este seguimiento?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await NotificationService.cancelAllForNidada(nidada.id);
      await DatabaseService.deleteNidada(nidada.id);
    }
  }

  Future<void> _startIncubation(Nidada nidada) async {
    nidada.status = NidadaStatus.incubando;
    nidada.incubationStartDate = DateTime.now();
    
    await DatabaseService.saveNidada(nidada);
    if (nidada.species.value != null) {
      await NotificationService.scheduleHatchingNotifications(nidada, nidada.species.value!);
    }
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incubación iniciada. Alarmas programadas.')),
      );
    }
  }

  Future<void> _finishNidada(Nidada nidada) async {
    nidada.status = NidadaStatus.finalizada;
    await DatabaseService.saveNidada(nidada);
    await NotificationService.cancelAllForNidada(nidada.id);
  }
}
