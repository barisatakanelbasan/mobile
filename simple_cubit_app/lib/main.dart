import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/ui/screens/user_list_screen.dart';
import 'cubit/users_cubit.dart';
import 'data/repository/repository.dart';
import 'data/services/api.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late Repository repository;
  late UsersCubit usersCubit;

  MyApp({Key? key}) : super(key: key) {
    repository = Repository(api: Api());
    usersCubit = UsersCubit(repository: repository);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => UsersCubit(repository: repository),
        child: const UserListScreen(),
      ),
    );
  }
}
