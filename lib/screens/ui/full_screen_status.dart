import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FullScreenStatus extends StatefulWidget {
  final String image;

  FullScreenStatus({required this.image});

  @override
  _FullScreenStatusState createState() => _FullScreenStatusState();
}

class _FullScreenStatusState extends State<FullScreenStatus> {
  @override
  void initState() {
    super.initState();
    // Close the status screen after 30 seconds
    Timer(const Duration(seconds: 15), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.transparent,iconTheme: IconThemeData(color: Colors.white),),
        body: Column(
          children: [

            const SizedBox(
              height: 20,
            ),
            Expanded(
               child: Center(
                  child: Image.asset(widget.image, fit: BoxFit.cover),
                )
            ),
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Reply',
                        hintStyle:const TextStyle(color: Color(0xff909090)),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12),
                          child: FaIcon(
                            FontAwesomeIcons.faceLaugh,
                            color: Color(0xff909090),
                            size: 28,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                      ),
                    ),
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




