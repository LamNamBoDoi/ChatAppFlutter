import 'package:demo/base/base_event.dart';
import 'package:demo/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;
  DeleteTodoEvent(this.todo);
}
