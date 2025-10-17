import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  
  final String imageUrl;
  final String date;
  final String month;
  final String title;
  final String subTitle;
  
   const GalleryScreen({
    super.key,
    required this.imageUrl,
    required this.date,
    required this.month,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
            // height: 270,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 290,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child:Container(), 
              ),
          ),
        ],
      ),
    );
  }

  }
