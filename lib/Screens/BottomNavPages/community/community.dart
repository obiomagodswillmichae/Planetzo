import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planet_b/Services/auth_service.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Widgets/custom_button.dart';

import '../../../../Styles/colors.dart';
import '../../../../Utils/page_service.dart';
import '../../../../Widgets/custom_text_form_field.dart';
import '../../../Utils/busy_overlay.dart';
import 'community_tabs/action_message.dart';

class CommunityPage extends StatefulWidget {
  final String groupName;
  const CommunityPage({Key? key, required this.groupName}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.primaryColor,
          onPressed: (){
            showModalBottomSheet(context: context, builder: (context) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
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
                          Navigator.pop(context);
                        }
                      }, text: 'Create', bgColor: AppColor.primaryColor, textColor: AppColor.white)
                    ],
                  ),
                ),
              ),
            ),);

          },
          icon: Icon(Icons.add),
          label: Text("Add", style: PageService.whitelabelStyle,)),
      appBar: AppBar(
        elevation: 0,
        title: Text("Action and Collaboration", style: PageService.bigHeaderStyle,),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: actionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const BusyOverlay(title: 'Loading Please wait..', child: Text(""),); // You can display a loading indicator.
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No messages in this group.'); // Display a message for no messages.
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var message = snapshot.data!.docs[index];
                String title = message['title'];
                String body = message['body'];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    title: Text(title, style: const TextStyle(fontSize: 16)),
                    subtitle: Text(body, style: const TextStyle(fontSize: 14)),
                  ),
                );
              },
            ),
          );
        },
      ),

    );
  }
}
