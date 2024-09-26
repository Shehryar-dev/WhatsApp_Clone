import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui/camera_screen.dart';

class camera_tab extends StatefulWidget {
  const camera_tab({super.key});

  @override
  State<camera_tab> createState() => _camera_tabState();
}

class _camera_tabState extends State<camera_tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Color(0xffEEEEEE),
        image: DecorationImage(image: AssetImage('assets/bg/dsa.png',),fit: BoxFit.cover),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xff128c7e),
            child: FaIcon(FontAwesomeIcons.camera,size: 50,color: Colors.white,),
            radius: 70,
          ),
          InkWell(
            child:const Text("Open Camera",style: TextStyle(fontSize: 22,
                color: Colors.teal,
                fontFamily: "Helvetica-reg",
                decoration: TextDecoration.underline,decorationColor: Colors.blueAccent),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
            },

          ),
        ],
      ) ,
    );
  }
}
