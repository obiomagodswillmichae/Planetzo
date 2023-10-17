import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planet_b/Services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/Authentication/auth_provider.dart';
import '../../../../Styles/colors.dart';
import '../../../../Utils/busy_overlay.dart';
import '../../../../Utils/message.dart';

class ConversationScreen extends StatefulWidget {
  String title;
  String chatId;

  ConversationScreen({
    super.key,
    required this.title,
    required this.chatId,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _controller = TextEditingController();
  late Stream<QuerySnapshot<Map<String, dynamic>>> messageStream;

  @override
  void initState() {
    super.initState();
    // Call the function to fetch data from the 'Action' collection with the provided groupName.
    fetchActionGroupMessages(widget.title);
  }

  // Function to fetch data from the 'Action' collection
  void fetchActionGroupMessages(String groupName) async {
    CollectionReference actionGroupRef =
        FirebaseFirestore.instance.collection('Messages');
    messageStream =
        actionGroupRef.doc(widget.chatId).collection('chats').snapshots();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: AppColor.black,
        ),
        centerTitle: false,
        title: Text(
          widget.title.toString(),
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
            stream: messageStream,
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return _conversationWidget(snapshot.data);
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const BusyOverlay(
                  title: 'Loading Please wait..',
                  child: Text(""),
                );
              }
              return Container();
            }),
      ),
    );
  }

  _conversationWidget(QuerySnapshot? data) {
    List conversations = [];
    if (data != null || data!.docs.isNotEmpty) {
      conversations = data.docs;

      // ..sort((a, b) => b['date_created'].compareTo(a['date_created']));
    }
    final user = Provider.of<AuthenticationProvider>(context).currentUser;

    return Stack(
      children: [
        if (conversations.isEmpty)
          const Center(child: Text('Be the first to start a conversation')),
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: ListView.builder(
            reverse: true,
            itemCount: conversations.length,
            itemBuilder: (context, index) {
              final chats = conversations[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                minLeadingWidth: 2,
                leading: CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  radius: 15,
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(
                  chats['conversation'],
                  style: const TextStyle(),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: true,
            child: Container(
              decoration: BoxDecoration(color: AppColor.white),
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(

                          isDense: true,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (_controller.text.isEmpty) {
                                  return error(context,
                                      message: 'enter message');
                                } else {
                                  FAuth().sendMessage(
                                      widget.chatId, _controller.text.trim());
                                  _controller
                                      .clear(); // Clear the text in the TextEditingController

                                }
                              },
                              icon: Icon(
                                Icons.send_rounded,
                                size: 16,
                                color: AppColor.black,
                              )),
                          border:  OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.primaryColor)

                          ),
                          hintText: "Say something..."),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
