import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'LandlordScreen.dart'; // Import the LandlordScreen widget

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? uploadedLocation;
  String? uploadedPrice;
  String? uploadedDescription;
  String? uploadedPhoneNumber;
  late bool isFlatUploaded;

  @override
  void initState() {
    super.initState();
    isFlatUploaded = false;
  }

  @override
  Widget build(BuildContext context) {
    // Your build method implementation...

    return Scaffold(
      // Scaffold content...
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog when FloatingActionButton is pressed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // Return the AlertDialog
              return AlertDialog(
                title: Text('Do you want to list your flat?'),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                          // Navigate to the LandlordScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LandlordScreen(
                                location: 'initial location',
                                price: 'initial price',
                                description: 'initial description',
                                phoneNumber: 'initial phone number',
                                onUploadPressed: _handleFlatUpload,
                              ),
                            ),
                          );
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _handleFlatUpload(
    String location,
    String price,
    String description,
    String phoneNumber,
    Uint8List? image,
  ) {
    setState(() {
      uploadedLocation = location;
      uploadedPrice = price;
      uploadedDescription = description;
      uploadedPhoneNumber = phoneNumber;
      isFlatUploaded = true;
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
