import 'package:dogs/data/repositories/dogs_repository_impl.dart';
import 'package:dogs/presentation/bloc/dogs_bloc.dart';
import 'package:dogs/presentation/pages/dogs_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogs',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DogsBloc(DogsRepositoryImpl())..add(LoadDogs()),
        child: const DogsListPage(),
      ),
    );
  }
}