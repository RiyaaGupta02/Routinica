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
  //when loading should show something
  bool isLoading = true;
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

      //here after making List n all to refreshe need to call RefreshIndicator so wrapping List view code into RefreshIndicator
      // so onRefresh updates List as fetchToDo method called
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchToDo,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index]
                    as Map; //here as we know each TO DO ITEM is a MAP
                final id = item['_id']
                    as String; //as id being returened by API as_id and in form of String
                return ListTile(
                  leading: CircleAvatar(
                      child: Text(
                          '${index + 1}')), //for countin & giving idea of how many elements
                  title: Text(
                      item['title']), //cos of this here sampleText can be seen
                  subtitle: Text(item['description']),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'edit') {
                        navigateToEditPage();
                        //open edit page
                      } else if (value == 'delete') {
                        //delete & remove the item
                        deleteById(id);
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        // here each pop menu item takes a value which helps us realize which button was clicked
                        PopupMenuItem(
                          child: Text(
                              'Edit'), //will then show up the given method to perform
                          value: 'edit',
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          value: 'delete',
                        ),
                      ];
                    },
                  ),
                );
                // as its infinite data that comes hv to git length so itemCount
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add Todo'),
      ),
    );
  }

  void navigateToEditPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddToDo(),
    );
    Navigator.push(context, route);
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddToDo(),
    );
    Navigator.push(context, route);
  }

  Future<void> deleteById(String id) async {
    //1.  delete the item from the list ke liye --> API call
    // to delete we need some id getting it from the API so fetchToDo final url take n search will get id put it in delete one n execute will see its executed that shows its done
    // from there take request url
    final url =
        'https://api.nstack.in/v1/todos/$id'; //change the no last part of url to $id as itd id of to do which we want to delete
    final uri = Uri.parse(url);
    final response = await http
        .delete(uri); //can ignore header here as optional so won't write
    if (response.statusCode == 200) {
      //remove item from the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      //show error
      // showFailureMessage('Deletion failed');
    }
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
    }
    setState(() {
      isLoading = false;
    });
  }

  // void showFailureMessage(String message) {
  //   final snackBar = SnackBar(
  //     content: Text(
  //       message,
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     backgroundColor: Colors
  //         .red, //so whenever it will fail will come in red box failed message
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
