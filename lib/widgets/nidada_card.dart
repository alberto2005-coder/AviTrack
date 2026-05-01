import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import '../models/nidada.dart';

class NidadaCard extends StatelessWidget {
  final Nidada nidada;
  final VoidCallback onDelete;
  final VoidCallback onStartIncubation;
  final VoidCallback onFinish;

  const NidadaCard({
    super.key,
    required this.nidada,
    required this.onDelete,
    required this.onStartIncubation,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color statusColor;
    String statusText;
    String detailText = '';

    switch (nidada.status) {
      case NidadaStatus.puesta:
        statusColor = Colors.grey;
        statusText = 'En Puesta';
        final eggCount = nidada.currentEggCount;
        detailText = 'Huevos: $eggCount';
        break;
      case NidadaStatus.incubando:
        statusColor = colorScheme.primary;
        statusText = 'Incubando';
        final hatchingDate = nidada.expectedHatchingDate;
        if (hatchingDate != null) {
          final remaining = hatchingDate.difference(DateTime.now()).inDays;
          detailText = remaining >= 0 
              ? 'Faltan $remaining días' 
              : 'Día de eclosión!';
        }
        break;
      case NidadaStatus.margen:
        statusColor = Colors.orange;
        statusText = 'En Margen';
        final limitDate = nidada.marginLimitDate;
        if (limitDate != null) {
          final remaining = limitDate.difference(DateTime.now()).inDays;
          detailText = remaining >= 0 
              ? 'Esperando... ($remaining d)' 
              : 'Revisar nido urg.';
        }
        break;
      case NidadaStatus.finalizada:
        statusColor = Colors.green;
        statusText = 'Finalizada';
        detailText = 'Cría concluida';
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nidada.pairName,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      nidada.species.value?.name ?? 'Especie desconocida',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    statusText,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  detailText,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDelete,
                  color: colorScheme.error,
                  tooltip: 'Eliminar',
                ),
                if (nidada.status == NidadaStatus.puesta)
                  ElevatedButton.icon(
                    onPressed: () => _showFinPuestaDialog(context),
                    icon: const Icon(Icons.timer),
                    label: const Text('Fin Puesta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                if (nidada.status == NidadaStatus.incubando || nidada.status == NidadaStatus.margen)
                   ElevatedButton.icon(
                    onPressed: onFinish,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Finalizar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showFinPuestaDialog(BuildContext context) {
    final marginController = TextEditingController(
      text: nidada.species.value?.marginDays.toString() ?? '2'
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Finalizar Puesta'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Se iniciará el periodo de incubación.'),
            const SizedBox(height: 16),
            TextField(
              controller: marginController,
              decoration: const InputDecoration(
                labelText: 'Días de Margen Extra',
                helperText: 'Días adicionales tras la fecha prevista de eclosión',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              final margin = int.tryParse(marginController.text) ?? 2;
              await _finishLaying(context, margin);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Iniciar Incubación'),
          ),
        ],
      ),
    );
  }

  Future<void> _finishLaying(BuildContext context, int margin) async {
    final species = nidada.species.value;
    if (species == null) return;

    nidada.incubationStartDate = DateTime.now();
    nidada.status = NidadaStatus.incubando;
    nidada.customMarginDays = margin;

    await DatabaseService.isar.writeTxn(() async {
      await DatabaseService.isar.nidadas.put(nidada);
    });

    await NotificationService.scheduleHatchingNotifications(nidada, species);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incubación iniciada con $margin días de margen')),
      );
      onStartIncubation();
    }
  }
}
