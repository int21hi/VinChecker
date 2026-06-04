import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/network/network_info.dart';
import 'core/theme/app_theme.dart';
import 'features/vin/data/datasources/vin_local_data_source.dart';
import 'features/vin/data/datasources/vin_remote_data_source.dart';
import 'features/vin/data/repositories/vin_repository_impl.dart';
import 'features/vin/domain/repositories/vin_repository.dart';
import 'features/vin/domain/usecases/decode_vin.dart';
import 'features/vin/domain/usecases/delete_vin_history.dart';
import 'features/vin/domain/usecases/get_vin_history.dart';
import 'features/vin/presentation/blocs/history/vin_history_cubit.dart';
import 'features/vin/presentation/blocs/search/vin_search_cubit.dart';
import 'features/vin/presentation/screens/main_screen.dart';

void main() async {
  // Ensure Flutter binding is initialized before Hive
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local Hive database
  await Hive.initFlutter();
  final Box historyBox = await Hive.openBox('vin_history');

  // Instantiate network client and information utility
  final Dio dio = Dio();
  final NetworkInfo networkInfo = NetworkInfoImpl();

  // Instantiate data sources
  final VinRemoteDataSource remoteDataSource = VinRemoteDataSourceImpl(dio);
  final VinLocalDataSource localDataSource = VinLocalDataSourceImpl(historyBox);

  // Instantiate repository implementation
  final VinRepository repository = VinRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
  );

  // Instantiate use cases
  final DecodeVinUseCase decodeVinUseCase = DecodeVinUseCase(repository);
  final GetVinHistoryUseCase getVinHistoryUseCase = GetVinHistoryUseCase(repository);
  final DeleteVinHistoryUseCase deleteVinHistoryUseCase = DeleteVinHistoryUseCase(repository);

  runApp(MyApp(
    decodeVinUseCase: decodeVinUseCase,
    getVinHistoryUseCase: getVinHistoryUseCase,
    deleteVinHistoryUseCase: deleteVinHistoryUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final DecodeVinUseCase decodeVinUseCase;
  final GetVinHistoryUseCase getVinHistoryUseCase;
  final DeleteVinHistoryUseCase deleteVinHistoryUseCase;

  const MyApp({
    super.key,
    required this.decodeVinUseCase,
    required this.getVinHistoryUseCase,
    required this.deleteVinHistoryUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VinSearchCubit>(
          create: (context) => VinSearchCubit(decodeVinUseCase: decodeVinUseCase),
        ),
        BlocProvider<VinHistoryCubit>(
          create: (context) => VinHistoryCubit(
            getVinHistoryUseCase: getVinHistoryUseCase,
            deleteVinHistoryUseCase: deleteVinHistoryUseCase,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'VIN Checker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, // Respect system light/dark theme settings
        home: const MainScreen(),
      ),
    );
  }
}
