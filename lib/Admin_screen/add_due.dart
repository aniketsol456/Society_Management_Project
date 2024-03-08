import 'package:flutter/material.dart';

void main() {
  runApp(AddDueScreen());
}

class AddDueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Due Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DueDateScreen(),
    );
  }
}

class DueDateScreen extends StatefulWidget {
  @override
  _DueDateScreenState createState() => _DueDateScreenState();
}

class _DueDateScreenState extends State<DueDateScreen> {
  late DateTime _selectedDate = DateTime.now(); // Initialize to current date
  late String _amount;
  late String _description;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Due Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _selectedDate == null
                  ? 'Select Due Date'
                  : 'Due Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                _amount = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                _description = value;
              },
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text('Select Due Date'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Submit button functionality
                if (_selectedDate != null) {
                  // Perform action with the selected due date
                  print('Due Date submitted: $_selectedDate');
                  print('Amount: $_amount');
                  print('Description: $_description');
                } else {
                  print('Please select a due date');
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
