
import 'package:chat_app/model/message.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Favorite Contacts',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 14,
                  letterSpacing: 1,
                ),),
                IconButton(icon: Icon(Icons.more_horiz,
                  color: Colors.blueGrey,size: 30,), onPressed: (){}),
              ],
            ),
          ),


       Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: favorites.length,
                    itemBuilder: (context , index){
                  return GestureDetector(
                    onTap: () => Navigator.push(context, 
                    MaterialPageRoute(builder: (_) => ChatScreen(user: favorites[index]),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:AssetImage(favorites[index].imageUrl),
                            radius: 35,
                          ),
                      SizedBox(height: 6,),
                      Text(favorites[index].name,
                        style: TextStyle(fontSize: 14,
                      color: Colors.blueGrey),
                      ),
                        ],
                      ),
                    ),
                  );

                }),

            ),

        ],
      ),
    );
  }
}
