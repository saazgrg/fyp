import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandlordScreen extends StatefulWidget {
  final String location;
  final String price;
  final String description;
  final String phoneNumber;
  final Function(String, String, String, String, Uint8List?) onUploadPressed;

  LandlordScreen({
    required this.location,
    required this.price,
    required this.description,
    required this.phoneNumber,
    required this.onUploadPressed,
  });

  @override
  _LandlordScreenState createState() => _LandlordScreenState();
}

class _LandlordScreenState extends State<LandlordScreen> {
  Uint8List? _image;
  late TextEditingController _locationController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.location);
    _priceController = TextEditingController(text: widget.price);
    _descriptionController = TextEditingController(text: widget.description);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landlord Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Upload Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            _buildImagePicker(),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Location',
              ),
              controller: _locationController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              controller: _priceController,
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              controller: _descriptionController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
              controller: _phoneNumberController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleUpload,
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _selectImage,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: _image != null
            ? Image.memory(
                _image!,
                fit: BoxFit.cover,
              )
            : Icon(Icons.add_photo_alternate),
      ),
    );
  }

  void _selectImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path).readAsBytesSync();
      });
    }
  }

  void _handleUpload() {
    final location = _locationController.text;
    final price = _priceController.text;
    final description = _descriptionController.text;
    final phoneNumber = _phoneNumberController.text;

    widget.onUploadPressed(location, price, description, phoneNumber, _image);
  }
}
