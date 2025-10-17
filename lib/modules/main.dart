import 'package:camping_pro/helpers/hex_colors.dart';
import 'package:camping_pro/modules/camp_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CampingApp());
}

class CampingApp extends StatelessWidget {
  const CampingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camping Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'SF Pro Display',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    HomeContent(),
    HomeContent(),
    HomeContent(),
    HomeContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.95),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.home, 'Home', 0),
                    _buildNavItem(Icons.photo_library, 'Gallery', 1),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4A7C59),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    _buildNavItem(Icons.chat_bubble_outline, 'Chat', 3),
                    _buildNavItem(Icons.settings, 'Settings', 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityOption(String city, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              city == 'Los Angeles'
                  ? '🏖️'
                  : city == 'Chicago'
                  ? '🏙️'
                  : city == 'Houston'
                  ? '🚀'
                  : '🌴',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          city,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4A5568),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF4A7C59) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? const Color(0xFF4A7C59) : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final List<Map<String, String>> recommendedData = [
    {
      "img": "assets/images/frame3.png",
      "date": "10",
      "month": "April",
      "title": "Camp Granite Lake",
      "sub": "Golden, Colorado, US",
    },
    {
      "img": "assets/images/frame10.png",
      "date": "15",
      "month": "May",
      "title": "Camp Big Sky Adventure",
      "sub": "Yellowstone National Park, Wyoming, US",
    },
    {
      "img": "assets/images/frame8.png",
      "date": "18",
      "month": "June",
      "title": "Pine Creek Camp",
      "sub": "Houston, Texas",
    },
    {
      "img": "assets/images/frame9.png",
      "date": "20",
      "month": "July",
      "title": "Horizon Campgrounds",
      "sub": "Emberwood, Meadowview, US",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [
        //         Color(0xFFF5E6D3),
        //         Color(0xFFE8D5C4),
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          color: Colors.amber,
          height: 300,
          child: Image.asset('assets/images/frame4.png', fit: BoxFit.fitHeight),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Hello, Orely',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    height: 90,
                  ),

                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Search camp',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        Icon(Icons.tune, color: Colors.grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 5),
                    decoration: BoxDecoration(
                      // color: const Color(0xFFB8D4A8).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [HexColor("##b9c884"), HexColor("##ccce91")],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nearby camp',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Turn on your location service',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4A5568),
                          ),
                        ),
                        // const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D3748),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Turn on location',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 170,
                              height: 95,
                              decoration: BoxDecoration(
                                // color: Colors.blue.shade200,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              // child:  Image.asset('assets/images/test2.png', fit: BoxFit.cover),
                              child: Image.asset(
                                'assets/images/test3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCityOption(
                        'Los Angeles',
                        Colors.brown,
                        "assets/images/site4.png",
                      ),
                      _buildCityOption(
                        'Chicago',
                        Colors.green,
                        "assets/images/site1.png",
                      ),
                      _buildCityOption(
                        'Houston',
                        Colors.blue,
                        "assets/images/site5.png",
                      ),
                      _buildCityOption(
                        'San Diego',
                        Colors.orange,
                        "assets/images/site3.png",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Recommendation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 16),

                  ListView.builder(
                    itemCount: recommendedData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = recommendedData[index];
                      return _buildRecommendationCard(
                        item["img"]!,
                        item["date"]!,
                        item["month"]!,
                        item["title"]!,
                        item["sub"]!,
                        context, // pass context properly
                      );
                    },
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCityOption(String city, Color color, String imagePath) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            height: 60.0,
            width: 60.0,
            fit: BoxFit.cover, //change image fill type
          ),
        ),

        const SizedBox(height: 8),
        Text(
          city,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4A5568),
          ),
        ),
      ],
    );
  }

  static Widget _buildRecommendationCard(
    String imageUrl,
    String date,
    String month,
    String title,
    String subTitle,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CampDetailScreen(
              imageUrl: date != '10' ? imageUrl : 'assets/images/banner1.png',
              date: date,
              month: month,
              title: title,
              subTitle: subTitle,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08), // light shadow
              blurRadius: 15, // smooth blur
              spreadRadius: 5, // subtle spread
              offset: Offset(0, 2), // vertical shadow like in image
            ),
          ],
        ),
        child: Column(
          children: [
            //* banner image for card
            Container(
              // width: MediaQuery.sizeOf(context).width,
              height: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xFFB8D4A8), Color(0xFF9CBF8A)],
                ),
                image: DecorationImage(
                  image: AssetImage(
                    imageUrl,
                    // fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //* card footer [data, title, subtitle]
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Column(
                    children: [
                      //! day
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFB8D4A8), Color(0xFF9CBF8A)],
                          ),
                        ),

                        child: Center(
                          child: Text(
                            date,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 30, 84, 41),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 3),
                      //! month
                      Text(
                        month,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 22),

                  //* [title, subtitle]
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! title
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 2),

                      //!subtitle
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
