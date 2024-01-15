import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/todo_cubit.dart';
import 'package:state_management/models/todo_models.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      //body
      body: BlocBuilder<TodoCubit, List<Todo>>(
        bloc: todoCubit,
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return ListTile(
                title: Text(
                  todo.name,
                ),
                subtitle: Text(
                  todo.createdAt.toString(),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: "Add Todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
