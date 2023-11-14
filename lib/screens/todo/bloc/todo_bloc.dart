import 'package:acl_flutter/core/bloc/bloc_helper.dart';
import 'package:acl_flutter/core/bloc/generic_bloc_state.dart';
import 'package:acl_flutter/data/model/todo/todo.dart';
import 'package:acl_flutter/screens/todo/bloc/todo_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/todo/todo_repository.dart';

typedef Emit = Emitter<GenericBlocState<ToDo>>;

class TodoBloc extends Bloc<TodoEvent, GenericBlocState<ToDo>> with BlocHelper<ToDo> {
  TodoBloc({required this.todoRepository}) : super(GenericBlocState.loading()) {
    on<TodoFetched>(getTodos);
    on<TodoCreated>(createTodo);
    on<TodoUpdated>(updateTodo);
    on<TodoDeleted>(deleteTodo);
  }

  final TodoRepository todoRepository;

  String get getTodoCount => "${state.data?.length ?? 0}";

  Future<void> getTodos(TodoFetched event, Emit emit) async {
    await getItems(todoRepository.getTodos(event.userId, status: event.status), emit);
  }

  Future<void> createTodo(TodoCreated event, Emit emit) async {
    await createItem(todoRepository.createTodo(event.todo), emit);
  }

  Future<void> updateTodo(TodoUpdated event, Emit emit) async {
    await updateItem(todoRepository.updateTodo(event.todo), emit);
  }

  Future<void> deleteTodo(TodoDeleted event, Emit emit) async {
    await deleteItem(todoRepository.deleteTodo(event.todo), emit);
  }
}
