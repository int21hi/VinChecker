import 'package:flutter/material.dart';
import '../../domain/entities/vin_entity.dart';
import 'info_row.dart';

class VinResultCard extends StatelessWidget {
  final VinEntity vehicle;
  final bool showHeader;

  const VinResultCard({
    super.key,
    required this.vehicle,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: isDark ? 0 : 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withRed(130),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${vehicle.make} ${vehicle.model}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_rounded,
                        color: Colors.white70,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      SelectableText(
                        vehicle.vin,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontFamily: 'monospace',
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!showHeader) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.directions_car_rounded,
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${vehicle.make} ${vehicle.model}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                ],
                InfoRow(
                  icon: Icons.calendar_today_rounded,
                  label: 'Model Year',
                  value: vehicle.modelYear,
                  iconColor: Colors.blue,
                ),
                const Divider(height: 16, indent: 44),
                InfoRow(
                  icon: Icons.category_rounded,
                  label: 'Vehicle Type',
                  value: vehicle.vehicleType,
                  iconColor: Colors.teal,
                ),
                const Divider(height: 16, indent: 44),
                InfoRow(
                  icon: Icons.layers_rounded,
                  label: 'Body Class',
                  value: vehicle.bodyClass,
                  iconColor: Colors.orange,
                ),
                const Divider(height: 16, indent: 44),
                InfoRow(
                  icon: Icons.branding_watermark_rounded,
                  label: 'Model Family (Series)',
                  value: vehicle.family,
                  iconColor: Colors.purple,
                ),
                const Divider(height: 16, indent: 44),
                InfoRow(
                  icon: Icons.public_rounded,
                  label: 'Plant Country',
                  value: vehicle.plantCountry,
                  iconColor: Colors.green,
                ),
                const Divider(height: 16, indent: 44),
                // Render any additional fields returned by the API that are not shown above
                Builder(
                  builder: (context) {
                    final excludedKeys = {
                      'Make',
                      'Model',
                      'Model Year',
                      'Series',
                      'Model Family',
                      'Family',
                      'Body Class',
                      'Vehicle Type',
                      'Plant Country',
                      'Error Code',
                      'Error Text',
                    };

                    final extras = vehicle.rawResults.entries
                        .where(
                          (e) =>
                              !excludedKeys.contains(e.key) &&
                              e.value != null &&
                              e.value.toString().trim().isNotEmpty,
                        )
                        .toList();

                    if (extras.isEmpty) return const SizedBox.shrink();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: extras.map((e) {
                        return Column(
                          children: [
                            InfoRow(
                              icon: Icons.info_outline_rounded,
                              label: e.key,
                              value: e.value.toString(),
                              iconColor: Colors.grey.shade600,
                            ),
                            const Divider(height: 16, indent: 44),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
