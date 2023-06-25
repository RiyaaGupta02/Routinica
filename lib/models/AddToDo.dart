import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// so now all things defined under http need to be accessed using http alias

class AddToDo extends StatefulWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
//building up a controller
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  // attach them to resp. feild of theirs
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddToDo'),
      ),
      //creating a form here for adding whatever want to write in To DO list
      body: ListView(
        padding: EdgeInsets.all(
            20), //gives basically padding to all 4side used as an offset from 4sides
        children: [
          TextField(
            controller:
                titleController, //attaching respective comtroller to their textfeild
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller:
                descriptionController, //attaching respective comtroller to their textfeild
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            //so as its description that means multilines hence we do need to keep changing
            // the keyboard size will also change
            minLines: 3,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          //helps in giving the Elevation or say submitting the form
          ElevatedButton(
            onPressed:
                SubmitData, // need to call the SubmitData method when clicking on the button
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  // now comes the next phase i.e submitting whatever written in the to - do to the form
  // FORM HANDLING
  Future<void> SubmitData() async {
    //writing here async as await exprn can be used in async only
    //1.   Get the data from form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": "Updating AI project",
      "description": " check the project & work done",
      "is_completed": true
    };
    /* to get data into title or var we need controller building that 
       using these controller can hv the value in var & store it in the var
       when creating data hv some request body sending to the server
       submitting data to server --> using http
    */
    // 2. submit data to the server
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
      // also declare the content type in header i.e what type of data sending in the body
    );
    // here as true / false as bool can't go like this hence encoding the json data
    /* so here now in the POST cmd of API creating the data & getting the response back from the sever in request url 
    then passing on the data to final URI 
    when requesting body needs to be send hence inside the http.post theres body inside body
    */
    // 3. show success/ fail message based on status
    if (response.statusCode == 201) {
      // so here 201 is our  success code rest r our failure code
      // then comes resetting the form if successful
      titleController.text = '';
      descriptionController.text =
          ''; //so resets the form so that can write other task in it
      showSuccessMessage('Task created successfully');
    } else {
      //  print('Task failed');          //this shown on debug console
      showFailureMessage('task failed'); //this shown visually
    }
  }

  // giving a visual message for showing that msg success
  // showSuccessMessage method we r using
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // for failure showing visually by
  void showFailureMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors
          .red, //so whenever it will fail will come in red box failed message
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
