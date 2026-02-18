import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeFeedScreen extends StatelessWidget {
  final List<String> images = [
    "https://images.unsplash.com/photo-1453614512568-c4024d13c247?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29mZmVlJTIwc2hvcHxlbnwwfHwwfHx8MA%3D%3D",
    "https://media.istockphoto.com/id/1400194993/photo/cappuccino-art.jpg?s=612x612&w=0&k=20&c=_nYOcyQ15cYEeUYgUzkC5qG946nkCwU06NiWKt1s8SE=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS-ZCLdBocYCKY-bnUjbOdnEw0chOzQLUcng&s",
    "https://img.freepik.com/premium-photo/white-coffee-cup-with-happy-face-coffee-feed_407474-10782.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA3CXjzVXank_4yIvoZuhkN9IeX8QpdiYTBg&s",
  ];

  CoffeeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.view_agenda, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.grid_view_outlined, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Coffee Feed",
              style: TextStyle(
                color: Colors.black,
                fontSize: isLandscape ? 15.sp : 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return isLandscape
                    ? _buildLandscapeItem(index)
                    : _buildPhoneItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          8.verticalSpace,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: images.map((img) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  img,
                  width: 70.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLandscapeItem(int index) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(images[index], fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Wrap(
              spacing: 8.r,
              runSpacing: 8.r,
              children: images.map((img) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    img,
                    width: 25.w,
                    height: 25.w,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
