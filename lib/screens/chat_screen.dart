import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  buildMessage(Message message, bool isMe) {
    return Row(
      children: <Widget>[
        Container(
          margin: isMe
              ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
              : EdgeInsets.only(top: 8, bottom: 8,),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).primaryColor : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(message.time,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              Text(message.text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),

        ),
         !isMe ?  IconButton(
               icon: message.isLiked ? Icon(
                        Icons.favorite)
                        : Icon(Icons.favorite_border),
                        iconSize: 20,
                        color:  message.isLiked
               ? Theme.of(context).primaryColor :
                        Colors.blueGrey,

                     onPressed: () {}):SizedBox.shrink(),

      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {}),
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                child: ListView.builder(
                    reverse: false,
                    padding: EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                      return buildMessage(message, isMe);
                    }),
              ),
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }
}
