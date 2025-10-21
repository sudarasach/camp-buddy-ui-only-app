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
      body: 
      Padding(
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
                    builder: (_) => ImagePreviewSlider(
                      imageUrls: imageUrls,
                      initialIndex: index,
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


class ImagePreviewSlider extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const ImagePreviewSlider({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  State<ImagePreviewSlider> createState() => _ImagePreviewSliderState();
}

class _ImagePreviewSliderState extends State<ImagePreviewSlider> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              final imageUrl = widget.imageUrls[index];
              return GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: Hero(
                    tag: 'image_$index',
                    child: InteractiveViewer(
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${_currentIndex + 1} / ${widget.imageUrls.length}',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
