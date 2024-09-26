
import 'package:flutter/material.dart';
import '../data/records.dart';
import '../ui/full_screen_status.dart';

class status_tab extends StatefulWidget {
  const status_tab({super.key});
  @override
  State<status_tab> createState() => _status_tabState();
}


class _status_tabState extends State<status_tab> {
   status_record status_data = new status_record();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: status_data.imgArr.length, // Ensure this matches the number of items
      itemBuilder: (context, ind) {
        if (ind >= status_data.imgArr.length || ind >= status_data.names.length) {
          return const SizedBox(); // Return an empty widget if index is out of bounds
        }

        return  ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenStatus(
                  image: "assets/status/${status_data.status[ind]}", // Ensure imgArr[ind] is valid
                ),
              ),
            );
          },
          contentPadding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          leading: CircleAvatar(
            radius: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  border: Border.all(color:const Color(0xff25d366),width: 2.5,strokeAlign: BorderSide.strokeAlignCenter,style: BorderStyle.solid,),
              image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage("assets/avatars/${status_data.imgArr[ind]}"))
              ),

            ),
          ),
          title: Text(
            status_data.names[ind],
            style: const TextStyle(
              fontFamily: "Helvetica-obl",
            ),
          ),
          subtitle:const Text(
            "5:43 AM",
            style: TextStyle(
              fontFamily: "Helvetica-reg",
              color: Color(0xff02CD3D),
            ),
          ),
          trailing:  CircleAvatar(child: Text(status_data.arrNum[ind].toString(),style: TextStyle(color: Colors.white),),radius:12 ,backgroundColor: Color(0xff25D366),),
        );

      },
      separatorBuilder: ( context,  index) {
        return Divider(height: 0.5,color: Colors.grey.withOpacity(0.2),);
    },
    );

  }
}
