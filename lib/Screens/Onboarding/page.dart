import 'package:flutter/material.dart';

import '../../Styles/colors.dart';

class Pages extends StatefulWidget {
  final String? description;
  final String? imagePath;

  Pages({this.description,  this.imagePath, Key? key})
      : super(key: key);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: Column(
        children: [

          //Image
          Image(
            image: AssetImage(widget.imagePath!),
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 72.22,),



          ///Title

          //Description
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.description!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: AppColor.black, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
