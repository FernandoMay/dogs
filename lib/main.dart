import 'package:dogs/data/datasources/local/database_helper.dart';
import 'package:dogs/data/repositories/dogs_repository_impl.dart';
import 'package:dogs/presentation/bloc/dogs_bloc.dart';
import 'package:dogs/presentation/pages/dogs_list_page.dart';
import 'package:dogs/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  final dbHelper = DatabaseHelper();
  await dbHelper.init();
  runApp(MyApp(dbHelper: dbHelper));
}

class MyApp extends StatelessWidget {
  final DatabaseHelper dbHelper;
  const MyApp({super.key, required this.dbHelper});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogs',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: colorf8,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DogsBloc(DogsRepositoryImpl(dbHelper: dbHelper))..add(LoadDogs()),
        child: const DogsListPage(),
      ),
    );
  }
}