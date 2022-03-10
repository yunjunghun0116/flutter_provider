import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/providers/providers.dart';

class TodoScreenTodoCard extends StatefulWidget {
  final Todo todo;
  const TodoScreenTodoCard({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoScreenTodoCard> createState() => _TodoScreenTodoCardState();
}

class _TodoScreenTodoCardState extends State<TodoScreenTodoCard> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      onDismissed: (DismissDirection direction) {
        Provider.of<TodoList>(context, listen: false).removeTodo(widget.todo);
      },
      confirmDismiss: (DismissDirection direction) {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you really want to delete?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text(
                    'No',
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text(
                    'Yes',
                  ),
                ),
              ],
            );
          },
        );
      },
      key: ValueKey(widget.todo.id),
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              bool _error = false;
              textController.text = widget.todo.desc;
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title: Text('Edit Todo'),
                  content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error?'Value cannot be empty':null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _error = textController.text.isEmpty ? true : false;
                        });
                        if (!_error) {
                          Provider.of<TodoList>(context, listen: false).editTodo(
                            widget.todo.id,
                            textController.text,
                          );
                          Navigator.pop(context);
                        }

                      },
                      child: Text(
                        'Edit',
                      ),
                    ),
                  ],
                );
              });
            },
          );
        },
        leading: Checkbox(
          value: widget.todo.completed,
          onChanged: (bool? value) {
            Provider.of<TodoList>(context, listen: false)
                .toggleTodo(widget.todo.id);
          },
        ),
        title: Text(
          widget.todo.desc,
        ),
      ),
    );
  }
}
