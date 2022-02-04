import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubit/users_cubit.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UsersCubit>(context).fetchUsers();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Users List'),
        ),
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is! UsersLoaded) {
              return const Center(child: CupertinoActivityIndicator());
            }
            final users = (state).users;
            return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Center(
                            child: Text(users[index].name.toString()[0]),
                          ),
                        ),
                        title: Text("${users[index].name}"),
                        subtitle: Text("${users[index].email}"),
                        trailing: const Icon(CupertinoIcons.profile_circled),
                        onTap: () {},
                      ),
                    ),
                  );
                });
            /*
            return SingleChildScrollView(
              child: Column(
                children: users!.map((e) => _user(e, context)).toList(),
              ),
            );
            */
          },
        ));
  }

  // Widget _user(User user, context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
  //     child: Row(
  //       children: [Text(user.name.toString())],
  //     ),
  //   );
  // }
}
