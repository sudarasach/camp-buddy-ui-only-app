import 'package:camping_pro/helpers/hex_colors.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

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
      appBar: AppBar(
        title: Text(
          'Chat List',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: chatDataList.length,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = chatDataList[index];
                return _buildChatCard(
                  item["img"]!,
                  item["header"]!,
                  item["title"]!,
                  item["sub"]!,
                  context, // pass context properly
                );
              },
            ),

            Container(),
          ],
        ),
      ),
    );
  }
}

Widget _buildChatCard(
  String imageUrl,
  String header,
  String title,
  String subTitle,
  BuildContext context,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 25),
    padding: EdgeInsets.all(15),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* header text
        Text(
          header,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* image & titles
            Row(
              children: [
                //! profile image
                ClipOval(
                  child: Image.asset(
                    imageUrl,
                    height: 40.0,
                    width: 40.0,
                    fit: BoxFit.cover, //change image fill type
                  ),
                ),

                SizedBox(width: 10),

                //* titles
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! title
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 2),

                    //!subtitle
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //* action icon buttons
            Row(
              children: [
                //! message icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // light shadow
                        blurRadius: 15, // smooth blur
                        spreadRadius: 5, // subtle spread
                        offset: Offset(0, 2), // vertical shadow like in image
                      ),
                    ],
                  ),
                  child:  Icon(
                    Icons.message,
                    size: 20,
                    color: HexColor("#678032"),
                  ),
                ),

                SizedBox(width: 10),

                //! call icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // light shadow
                        blurRadius: 15, // smooth blur
                        spreadRadius: 5, // subtle spread
                        offset: Offset(0, 2), // vertical shadow like in image
                      ),
                    ],
                  ),
                  child:  Icon(
                    Icons.call,
                    size: 20,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
