import 'package:flutter/material.dart';

void main() => runApp(TaskManagerApp());

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      home: TaskManager(),
    );
  }
}

class TaskManager extends StatefulWidget {
  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Task Manager'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Enter Task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => addTask(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: addTask,
              child: Text('Add Task'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty
                  ? Center(child: Text('No tasks added yet.'))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(tasks[index]),
                            onTap: () => removeTask(index),
                            trailing: Icon(Icons.delete, color: Colors.red),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
