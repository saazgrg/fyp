import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String location;
  final String price;
  final String description;
  final String phoneNumber;
  final String imagePath;

  DetailsScreen({
    required this.location,
    required this.price,
    required this.description,
    required this.phoneNumber,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            // Location
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Location: $location',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Price: $price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description: $description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Phone Number
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Phone Number: $phoneNumber',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
