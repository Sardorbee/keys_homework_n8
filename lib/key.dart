import 'package:flutter/material.dart';
import 'package:keys_homework_n8/mydata_model.dart';

class MyListDragAndDrop extends StatefulWidget {
  const MyListDragAndDrop({super.key});

  @override
  _MyListDragAndDropState createState() => _MyListDragAndDropState();
}

class _MyListDragAndDropState extends State<MyListDragAndDrop> {
  final List<MyData> _myDataList = [
    MyData(UniqueKey(), 'Name 1',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 2',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 3',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 4',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 5',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 6',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 7',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 8',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 9',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 10',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 11',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Name 12',"+998991234567",DateTime.now().toString()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Example'),
      ),
      body: ReorderableListView(
        children: _myDataList.map((MyData data) {
          return Dismissible(
            key: data.key,
            onDismissed: (direction) {
              setState(() {
                _myDataList.remove(data);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${data.name} removed'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            background: Container(
              color: Colors.red, // Background color when swiped
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: ListTile(
              key: data.key,
              title: Text(data.name),
              subtitle: Text(data.phone),
            ),
          );
        }).toList(),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final MyData item = _myDataList.removeAt(oldIndex);
            _myDataList.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
