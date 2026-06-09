import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/history/vin_history_cubit.dart';
import '../blocs/search/vin_search_cubit.dart';
import '../blocs/search/vin_search_state.dart';
import '../widgets/error_display.dart';
import '../widgets/vin_result_card.dart';
import 'detail_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _vinController = TextEditingController();

  @override
  void dispose() {
    _vinController.dispose();
    super.dispose();
  }

  String? _validateVin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a VIN code.';
    }
    final cleanValue = value.trim().toUpperCase();
    if (cleanValue.length != 17) {
      return 'VIN code must have exactly 17 characters.';
    }

    // Check for forbidden characters I, O, Q
    if (RegExp(r'[IOQ]').hasMatch(cleanValue)) {
      return 'VIN code cannot contain letters I, O, or Q.';
    }

    // Final alphanumeric regex check without I, O, Q
    final regex = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');
    if (!regex.hasMatch(cleanValue)) {
      return 'VIN code contains invalid characters.';
    }
    return null;
  }

  void _submitSearch() {
    if (_formKey.currentState?.validate() ?? false) {
      // Hide keyboard
      FocusScope.of(context).unfocus();
      final vin = _vinController.text.trim().toUpperCase();
      context.read<VinSearchCubit>().searchVin(vin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('VIN Code Verification')),
      body: BlocListener<VinSearchCubit, VinSearchState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (vehicle) {
              // Automatically reload history when a search succeeds
              context.read<VinHistoryCubit>().loadHistory();

              // Navigate to a dedicated detail screen to show full results
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(vehicle: vehicle),
                ),
              );
            },
            error: (message) {
              if (message.contains('internet connection')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },
            orElse: () {},
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Intro header card
              Card(
                elevation: 0,
                color: theme.colorScheme.primary.withOpacity(
                  isDark ? 0.1 : 0.05,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.primary.withOpacity(0.15),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'VIN (Vehicle Identification Number) contains 17 characters and does not include the letters I, O, and Q. This service is optimized for VIN codes mostly from the USA and Canada.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? const Color(0xFF94A3B8)
                                : const Color(0xFF475569),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _vinController,
                      validator: _validateVin,
                      textCapitalization: TextCapitalization.characters,
                      textInputAction: TextInputAction.search,
                      maxLength: 17,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(17),
                        // Force uppercase representation
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return newValue.copyWith(
                            text: newValue.text.toUpperCase(),
                          );
                        }),
                      ],
                      decoration: InputDecoration(
                        labelText: 'VIN Code',
                        hintText: 'Enter VIN code consisting of 17 characters',
                        prefixIcon: const Icon(Icons.search_rounded),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear_rounded),
                          onPressed: () {
                            _vinController.clear();
                            context.read<VinSearchCubit>().reset();
                          },
                        ),
                        counterText: '',
                      ),
                      onFieldSubmitted: (_) => _submitSearch(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _submitSearch,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline_rounded),
                            SizedBox(width: 10),
                            Text('Verify VIN'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              // Results section
              BlocBuilder<VinSearchCubit, VinSearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.directions_car_filled_outlined,
                              size: 64,
                              color: theme.colorScheme.primary.withOpacity(0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Ready for Decoding',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: isDark
                                    ? const Color(0xFF64748B)
                                    : const Color(0xFF94A3B8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Enter the code and click the verify button.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: isDark
                                    ? const Color(0xFF475569)
                                    : const Color(0xFF64748B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 60.0),
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Downloading vehicle data...'),
                          ],
                        ),
                      ),
                    ),
                    success: (vehicle) => const SizedBox.shrink(),
                    error: (message) {
                      // Don't show network error twice if it's already shown as a snackbar,
                      // but let's show a user friendly inline message.
                      return ErrorDisplay(errorMessage: message);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
