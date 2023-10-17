import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationWidget extends StatefulWidget {
  final String groupName; // Pass the groupName as a parameter.

  NotificationWidget(this.groupName);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late Stream<QuerySnapshot> actionStream;

  @override
  void initState() {
    super.initState();
    // Call the function to fetch data from the 'Action' collection with the provided groupName.
    fetchActionGroupMessages(widget.groupName);
  }

  // Function to fetch data from the 'Action' collection
  void fetchActionGroupMessages(String groupName) async {
    CollectionReference actionGroupRef =
    FirebaseFirestore.instance.collection('Action').doc(groupName).collection('message');
    actionStream = actionGroupRef.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: actionStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // You can display a loading indicator.
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No messages in this group.'); // Display a message for no messages.
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var message = snapshot.data!.docs[index];
            String title = message['title'];
            String body = message['body'];

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  // Handle message tap action.
                },
                leading: Image.asset("assets/images/foot.png", width: 30),
                title: Text(title, style: TextStyle(fontSize: 16)),
                subtitle: Text(body, style: TextStyle(fontSize: 14)),
              ),
            );
          },
        );
      },
    );
  }
}
