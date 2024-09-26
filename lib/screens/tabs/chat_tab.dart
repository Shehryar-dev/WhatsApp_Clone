import 'package:flutter/material.dart';
import '../data/records.dart';
import '../ui/chat_ui.dart';

class chat_tab extends StatefulWidget {
  const chat_tab({super.key});
  @override
  State<chat_tab> createState() => _chat_tabState();
}

class _chat_tabState extends State<chat_tab> {
   user_records users = new user_records();

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: users.imgArr.length,
        // padding: EdgeInsets.all(10),
        itemBuilder: (context, ind) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WhatsAppChatScreen()));
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/avatars/${users.imgArr[ind]}"),
            ),
            title:  Text(users.names[ind],style:const TextStyle(fontFamily: "Helvetica-reg",),),
            subtitle: const Row(
              children: [
                Icon(Icons.check,color: Colors.grey,),
                SizedBox(
                  width: 8,
                ),
                Text("Lorem Ipsum dolor",style: TextStyle(
                  fontFamily: "Helvetica-reg",),)
              ],
            ),
            trailing:  Text(users.times[ind] ,style:const TextStyle(fontFamily: "Helvetica-reg",color: Color(0xff02CD3D)),),
          );
        });
  }
}
