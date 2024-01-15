import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/todo_cubit.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  TextEditingController todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add todo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(
                hintText: "title",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(context).addTodo(
                  todoTitleController.text.trim(),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
