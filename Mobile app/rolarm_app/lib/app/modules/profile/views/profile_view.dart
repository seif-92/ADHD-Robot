import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xD9F6F5F5),
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child:Icon(Icons.person, color: Colors.black,) ,
                    ),
                    SizedBox(width: 10,),
                    Text("Edit profile", style: TextStyle(fontSize: 16),),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,

                      child:SvgPicture.asset("assets/logout.svg") ,
                    ),
                    SizedBox(width: 10,),
                    Text("Logout", style: TextStyle(fontSize: 16),),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
