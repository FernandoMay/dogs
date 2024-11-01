import 'package:dogs/data/datasources/local/database_helper.dart';
import 'package:dogs/data/datasources/remote/dogs_api_service.dart';
import 'package:dogs/data/repositories/dogs_repository_impl.dart';
import 'package:dogs/domain/repositories/dogs_repository.dart';
import 'package:dogs/presentation/bloc/dogs_bloc.dart';
import 'package:dogs/presentation/pages/dogs_list_page.dart';
import 'package:dogs/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

Future<void> setupDependencies() async {
  final dbHelper = DatabaseHelper();
  await dbHelper.init();

  getIt.registerSingleton<DatabaseHelper>(dbHelper);
  getIt.registerSingleton<DogsApiService>(DogsApiService());
  getIt.registerSingleton<DogsRepository>(
    DogsRepositoryImpl(
      apiService: getIt<DogsApiService>(),
      dbHelper: getIt<DatabaseHelper>(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Dogs',
      theme: const CupertinoThemeData(
        primaryColor: colorf8,
        barBackgroundColor: colorf8,
        scaffoldBackgroundColor: colorf8,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DogsBloc(getIt<DogsRepository>())..add(LoadDogs()),
        child: const DogsListPage(),
      ),
    );
  }
}
