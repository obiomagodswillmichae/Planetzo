import 'package:flutter/material.dart';

import '../../../../Styles/colors.dart';
import '../../../../Utils/page_service.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColor.black,),
        title: Text("Education and Information sharing", style: PageService.bigHeaderStyle,),
      ),
    );
  }
}
