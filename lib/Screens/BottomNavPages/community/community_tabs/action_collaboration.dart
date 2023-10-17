import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planet_b/Services/auth_service.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Widgets/custom_button.dart';

import '../../../../Styles/colors.dart';
import '../../../../Utils/page_service.dart';
import '../../../../Widgets/custom_text_form_field.dart';
import 'action_message.dart';

class ActionAndCollabpration extends StatefulWidget {
  final String groupName;
  const ActionAndCollabpration({Key? key, required this.groupName}) : super(key: key);

  @override
  State<ActionAndCollabpration> createState() => _ActionAndCollabprationState();
}

class _ActionAndCollabprationState extends State<ActionAndCollabpration> {
  final TextEditingController _groupName = TextEditingController();
  final TextEditingController _groupPurpose = TextEditingController();

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
    FirebaseFirestore.instance.collection('Action').doc(groupName).collection('groups');
    actionStream = actionGroupRef.snapshots();
    setState(() {

    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor,
          onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Kindly inter the following information's to add a group base on this community level", style: PageService.headerStyle,),
                  PageService.textSpacexL,
                  CustomTextFormField(
                    labelText: 'Group Name',
                    controller: _groupName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    maxLines: 4,
                    labelText: 'Purpose of the group',
                    controller: _groupPurpose,
                  ),
                  PageService.textSpacexxL,
                  customButton(context, onTap: () {
                  if(_groupPurpose.text.isEmpty ||_groupName.text.isEmpty) {
                    return error(context, message: 'Fields are required');
                  } else {
                    FAuth().addActionGroup(_groupName.text.trim(), _groupPurpose.text.trim(), widget.groupName);
                  }
                  }, text: 'Create', bgColor: AppColor.primaryColor, textColor: AppColor.white)
                ],
              ),
            ),
          ),);

          }, label: Text("Add", style: PageService.whitelabelStyle,)),
        appBar: AppBar(
          leading: BackButton(color: AppColor.black,),
          title: Text("Action and Collaboration", style: PageService.bigHeaderStyle,),
        ),
      body: StreamBuilder<QuerySnapshot>(
        stream: actionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // You can display a loading indicator.
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No messages in this group.'); // Display a message for no messages.
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
                    nextPage(context, page: ConversationScreen( title: title, chatId: message.id,   ));
                  },
                  leading: Image.asset("assets/images/foot.png", width: 30),
                  title: Text(title, style: TextStyle(fontSize: 16)),
                  subtitle: Text(body, style: TextStyle(fontSize: 14)),
                ),
              );
            },
          );
        },
      ),

    );
  }
}
