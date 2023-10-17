import 'package:flutter/material.dart';

import '../../../../Styles/colors.dart';
import '../../../../Utils/page_service.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColor.black,),
        title: Text("Support  for Environmental Causes", style: PageService.bigHeaderStyle,),
      ),
    );
  }
}
