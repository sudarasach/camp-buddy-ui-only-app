import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryScreen extends StatelessWidget {
   GalleryScreen({super.key});

  final List<String> imageUrls = [
    'assets/gallery/gallery_1.jpg',
    'assets/gallery/gallery_2.jpg',
    'assets/gallery/gallery_3.jpg',
    'assets/gallery/gallery_4.jpg',
    'assets/gallery/gallery_5.jpg',
    'assets/gallery/gallery_6.jpg',
    'assets/gallery/gallery_7.jpg',
    'assets/gallery/gallery_8.jpg',
    'assets/gallery/gallery_9.jpg',
    'assets/gallery/gallery_10.jpg',
    'assets/gallery/gallery_11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            final imageUrl = imageUrls[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ImagePreviewScreen(
                      imageUrl: imageUrl,
                      tag: 'image_$index',
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'image_$index',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class ImagePreviewScreen extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ImagePreviewScreen({
    super.key,
    required this.imageUrl,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: tag,
            child: InteractiveViewer(
              child: Image.asset(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
