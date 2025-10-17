import 'package:camping_pro/helpers/hex_colors.dart';
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              size: 20,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.bookmark_border,
                            size: 20,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.share,
                            size: 20,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Add some spacing instead of Spacer to allow scrolling
                  SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Camp Big Sky Adventure',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2D3748),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Yellowstone National Park, Wyoming',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F5E8),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Column(
                                  children: [
                                    Text(
                                      '28',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4A7C59),
                                      ),
                                    ),
                                    Text(
                                      'June',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4A7C59),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4A5568),
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'Explore Yellowstone and beyond! Get your feet wet and your hands dirty, while you explore and ',
                                ),
                                TextSpan(
                                  text: 'read more...',
                                  style: TextStyle(
                                    color: Color(0xFFE53E3E),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Camp Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildDetailItem(
                                  '📅',
                                  'Period',
                                  '3 Months',
                                ),
                              ),
                              Expanded(
                                child: _buildDetailItem(
                                  '👥',
                                  'Age Group',
                                  '9-12 years old',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildDetailItem(
                                  '🏕️',
                                  'Inside / Outside',
                                  'Outside',
                                ),
                              ),
                              Expanded(
                                child: _buildDetailItem(
                                  '🍔',
                                  'Meals Provided',
                                  'Yes',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: HexColor("#678032"),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Reserve a spot',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: HexColor("#678032"),
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child:  Icon(
                                  Icons.calendar_month,
                                  color: HexColor("#678032"),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String emoji, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
