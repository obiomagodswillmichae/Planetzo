import 'package:flutter/material.dart';

import '../../../../Styles/colors.dart';
import '../../../../Utils/page_service.dart';

class Network extends StatefulWidget {
  const Network({Key? key}) : super(key: key);

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColor.black,),
        title: Text("Networking and Community Building", style: PageService.bigHeaderStyle,),
      ),
    );
  }
}
