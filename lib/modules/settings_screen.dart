import 'package:camping_pro/helpers/hex_colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final List<Map<String, String>> chatDataList = [
    {
      "img": "assets/images/user2.png",
      "header": "Camp Granite Lake",
      "title": "John Stark",
      "sub": "Camp PIC",
    },
    {
      "img": "assets/images/user1.png",
      "header": "Spring Heaven Camp",
      "title": "Emma Martin",
      "sub": "Heaven Camp",
    },
    {
      "img": "assets/images/user3.png",
      "header": "Camp Big Sky Adventure",
      "title": "Michael Johnson",
      "sub": "Adventure Camp",
    },
    {
      "img": "assets/images/user4.png",
      "header": "Pine Creek Camp",
      "title": "Andrew Mathew",
      "sub": "Creek Camp",
    },

    // {
    //   "img": "assets/images/frame10.png",
    //   "header": "Pine Creek Camp",
    //   "title": "Andrew Mathew",
    //   "sub": "Creek Camp",
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Chat List',
      //     style: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.w600,
      //       color: Color(0xFF2D3748),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              // borderRadius: BorderRadius.only(10),
              image: DecorationImage(
                image: AssetImage('assets/images/frame11.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              Container(height: 200),

              //! profile image
              Container(
                padding: const EdgeInsets.all(3), // border thickness
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // border color
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/user3.png',
                    height: 90.0,
                    width: 90.0,
                    fit: BoxFit.cover, //change image fill type
                  ),
                ),
              ),

              SizedBox(height: 5),
              //! username
              Text(
                'Michael Johnson',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 2),

              //!email
              Text(
                'michaeljohnson@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 40),

              _buildSettingsCard(
                  Icons.person_outline_outlined,
                  "Personal Details",
                  context),

                  _buildSettingsCard(
                  Icons.question_mark_outlined,
                  "Help & Support",
                  context),

                  _buildSettingsCard(
                  Icons.privacy_tip_outlined,
                  "Privacy & Policy",
                  context),

                   _buildSettingsCard(
                  Icons.content_paste_search_outlined,
                  "Terms & Conditions",
                  context),

            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingsCard(IconData icon, String title, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //!icon
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 143, 190, 146),
                borderRadius: BorderRadius.circular(10),
              ),
              child: 
              Icon(
               icon,
                size: 23,
                color: const Color.fromARGB(255, 21, 100, 44),
              ),
            ),
            SizedBox(width: 20),
            //!subtitle
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        //!arrow icon
        Icon(
          Icons.arrow_forward_ios_outlined,
          size: 22,
          color: const Color.fromARGB(255, 21, 100, 44),
        ),
      ],
    ),
  );
}
