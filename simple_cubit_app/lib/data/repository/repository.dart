import 'package:simple_cubit_app/data/models/user.dart';
import 'package:simple_cubit_app/data/services/api.dart';

class Repository {
  final Api? api;

  Repository({this.api});
  Future<List<User>> fetchUsers() async {
    final raw = await api!.fetchUsers();
    return raw;
  }
}
