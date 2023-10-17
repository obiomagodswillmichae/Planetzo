import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Utils/page_service.dart';
import '../../../Styles/colors.dart';
import 'survery_controller.dart';

class CarbonSurveryPage extends StatelessWidget {
  const CarbonSurveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarbonSurveyController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Carbon footprint",
          style: PageService.bigHeaderStyle,
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(height: 25),
            const Divider(),
            Expanded(
              child: PageView.builder(
                onPageChanged: (val) => controller.currentPage(val + 1),
                controller: controller.controller,
                itemCount: controller.questionPages.length,
                itemBuilder: (_, ind) {
                  return SingleChildScrollView(
                      child: controller.questionPages[ind]);
                },
              ),
            ),
            if (controller.currentPage.value < controller.questionPages.length)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarbonButton(
                      icon: Icons.arrow_back_ios_new,
                      onPressed: () => controller.controller.previousPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                    ),
                    Obx(
                      () => Text(
                        '${controller.currentPage.value}/${controller.questionPages.length - 1}',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                    CarbonButton(
                      icon: Icons.arrow_forward_ios,
                      onPressed: () => controller.controller.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CarbonButton extends StatelessWidget {
  const CarbonButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        // child: Image.asset(
        //   imagePath,
        //   fit: BoxFit.contain,
        // ),
        child: Icon(icon),
      ),
    );
  }
}
