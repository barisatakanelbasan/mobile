import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_cubit_app/data/models/user.dart';
import 'package:simple_cubit_app/data/repository/repository.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final Repository? repository;

  UsersCubit({this.repository}) : super(UsersInitial());

  void fetchUsers() {
    Timer(
      const Duration(seconds: 3),
      () {
        repository!.fetchUsers().then(
          (users) {
            emit(UsersLoaded(users: users));
          },
        );
      },
    );
  }
}
