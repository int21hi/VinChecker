import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/admob_service.dart';
import '../blocs/history/vin_history_cubit.dart';
import '../blocs/history/vin_history_state.dart';
import 'detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    // Load history when the screen is initialized
    context.read<VinHistoryCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification History'),
      ),
      body: BlocBuilder<VinHistoryCubit, VinHistoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            loaded: (history) {
              if (history.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history_rounded,
                          size: 64,
                          color: theme.colorScheme.primary.withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Empty History',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Successfully verified VIN codes will be displayed here.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark ? const Color(0xFF475569) : const Color(0xFF64748B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () => context.read<VinHistoryCubit>().loadHistory(),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final vehicle = history[index];
                    final formattedDate = DateFormat('dd.MM.yyyy, HH:mm').format(vehicle.scannedAt);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Dismissible(
                        key: Key(vehicle.vin),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.shade400,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.delete_sweep_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        onDismissed: (direction) {
                          // Perform delete operation in the cubit
                          context.read<VinHistoryCubit>().deleteRecord(vehicle.vin);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Vehicle with VIN ${vehicle.vin} has been deleted.'),
                              backgroundColor: Colors.grey.shade800,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: isDark ? 0 : 1,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.08),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.directions_car_filled_rounded,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            title: Text(
                              '${vehicle.make} ${vehicle.model}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  vehicle.vin,
                                  style: TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 13,
                                    color: isDark ? Colors.white70 : Colors.black87,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  formattedDate,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: theme.colorScheme.primary.withOpacity(0.5),
                            ),
                            onTap: () async {
                              await AdMobService.showInterstitial(
                                onAdDismissed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(vehicle: vehicle),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

