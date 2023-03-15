import 'package:flutter/material.dart';
import 'package:rest/model/user.dart';
import 'package:rest/viewModel/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('RestApi')),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(user.picture.thumbnail)),
            title: Text(user.fullname),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Future<void> fetchUsers() async {
    final reponse = await UserApi.fetchUsers();
    setState(() {
      users = reponse;
    });
  }
}
