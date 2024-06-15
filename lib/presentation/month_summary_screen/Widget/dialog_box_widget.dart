import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AlertDialog monthSummaryDialogBox()
{
  return AlertDialog(
    title: Text('Welcome'),           // To display the title it is optional
    content: Text('GeeksforGeeks'),   // Message which will be pop up on the screen
    // Action widget which will provide the user to acknowledge the choice
    actions: [

    ],
  );
}