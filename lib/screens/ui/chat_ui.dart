import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatsAppChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {'isSentByMe': true, 'message': 'Hey there! How are you?'},
    {'isSentByMe': false, 'message': 'I am good! How about you?'},
    {'isSentByMe': true, 'message': 'I am doing great! What are you up to?'},
    {'isSentByMe': false, 'message': 'Just working on a project. You?'},
    {'isSentByMe': true, 'message': 'Same here. Let’s catch up soon!'},
    {'isSentByMe': false, 'message': 'Sure! Let me know when you are free.'},
    {'isSentByMe': true, 'message': 'Lorem ipsum dolor'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 67,
        toolbarOpacity: 0.8,
        titleSpacing: 0,
        leadingWidth: 34,
        title:const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: 24,backgroundImage: AssetImage('assets/avatars/avatar-1.jpg'),),
           SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 2,),
                Text("James",style: TextStyle(
                    fontFamily: "Helvetica-reg",
                    color: Colors.white,fontSize: 20,),textAlign: TextAlign.end,),
                Text("online",style: TextStyle(
                    fontFamily: "Helvetica-reg",
                    fontSize: 13,color: Colors.white) ,textAlign: TextAlign.start,)
              ],
            )
          ],
        ),
        actions:const [
          FaIcon(FontAwesomeIcons.videoCamera,size: 22,color: Color(0xffFFFFFF),),
          // Icon(Icons.video_call_outlined,size: 25,),
          SizedBox(width: 15,),
          Icon(Icons.phone,size: 25,color: Color(0xffFFFFFF),),
          SizedBox(width: 32,),
          FaIcon(FontAwesomeIcons.ellipsisVertical),
          SizedBox(width: 20,)
        ],

        // backgroundColor: Color(0xff075E54), // WhatsApp theme color
        backgroundColor:const Color(0xff005B54),
        iconTheme:const IconThemeData(color: Colors.white),
      ),
      backgroundColor:const Color(0xffE2E2E2), // Light background
      body: Container(
        decoration:const BoxDecoration(
          color: Color(0xffE2E2E2),
            image: DecorationImage(image: AssetImage('assets/bg/dsa.png'),fit: BoxFit.cover)
        ),
        child: Column(
          children: [

            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message['isSentByMe']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      margin:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        color: message['isSentByMe']
                            ? const Color(0xffD7FEC9)
                            : const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: message['isSentByMe']
                              ? const Radius.circular(12)
                              : const Radius.circular(0),
                          bottomRight: message['isSentByMe']
                              ? const Radius.circular(0)
                              : const Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        message['message'],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
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

                        suffixIcon: const SizedBox(
                            width: 70,
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.paperclip,color: Color(0xff909090),),
                                SizedBox(width: 10,),
                               FaIcon(
                                  Icons.camera_alt,
                                  color: Color(0xff909090),
                                size: 28,
                                ),
                              ],
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 26,
                    backgroundColor:const Color(0xff075E54),
                    child: IconButton(
                      icon: const Icon(Icons.mic, color: Color(0xffFFFFFF)),
                      onPressed: () {},
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
