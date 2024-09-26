import 'package:flutter/material.dart';

import '../data/records.dart';
import '../ui/call_ui.dart';

class calls_tab extends StatefulWidget {
  const calls_tab({super.key});

  @override
  State<calls_tab> createState() => _calls_tabState();
}

class _calls_tabState extends State<calls_tab> {
   user_records users = user_records();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: users.names.length,
          itemBuilder: (context, ind) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WhatsAppCallScreen()));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/avatars/${users.imgArr[ind]}"),
              ),
              title:  Text("${users.names[ind]} (${users.arrNum[ind].toString()})",style:const TextStyle(fontFamily: "Helvetica-reg",fontSize: 18),),
              subtitle:  Row(
                children: [
                 const Icon(
                    Icons.arrow_outward,
                    color: Colors.teal,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(users.daytime[ind],style:const TextStyle(fontFamily: "Helvetica-reg"),)
                ],
              ),
              trailing: const Icon(
                Icons.call,
                color: Color(0xff128c7e),
              ),
            );
          });
  }
}
