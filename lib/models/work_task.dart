import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:routinica/models/AddToDo.dart';
import 'package:http/http.dart' as http;

class WorkScreen extends StatefulWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  List items = [];

  void initState() {
    //initstate done whenver a widget/ method gets rendered
    super.initState();
    fetchToDo();
  }

  @override
  Widget build(BuildContext context) {
    // FROM HERE IS ACTUALLY WHERE WE BEGIN THE APP
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      // here after calling API n storing it displaying it by List View
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item =
                items[index] as Map; //here as we know each TO DO ITEM is a MAP
            return ListTile(
              leading: CircleAvatar(
                  child: Text(
                      '${index + 1}')), //for countin & giving idea of how many elements
              title:
                  Text(item['title']), //cos of this here sampleText can be seen
              subtitle: Text(item['description']),
            );
            // as its infinite data that comes hv to git length so itemCount
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add Todo'),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddToDo(),
    );
    Navigator.push(context, route);
  }

// here comes API GET ALL i.e getting all data i.e there in device on server
  Future<void> fetchToDo() async {
    // method won't worki until u call fetchToDo method
    // here making a GET request n then getting the data
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // await there hence sync in method
    if (response.statusCode == 200) {
      //its a success then
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result; // declared at top items
      });
    } else {
      // show error
    }
  }
}
