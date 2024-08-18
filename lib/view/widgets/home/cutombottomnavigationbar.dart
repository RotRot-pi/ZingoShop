import 'package:zingoshop/controller/home_screen_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/home/cutombottomappbarbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomNavigationAppBar extends StatelessWidget {
  const CustomNavigationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // surfaceTintColor: AppColors.secondaryColor,
      // shadowColor: AppColors.secondaryColor,
      elevation: 100,
      clipBehavior: Clip.antiAlias,
      color: AppColors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: m12,
      child: GetBuilder<HomeScreenControllerImpl>(builder: (controller) {
        return Row(
          children: [
            for (int index = 0; index < controller.pages.length; index++) ...[
              Flexible(
                child: CustomBottomAppBarButton(
                  onPressed: () => controller.changePage(index),
                  name: controller.bottomAppBarItems[index]['name'],
                  icon: controller.bottomAppBarItems[index]['icon'],
                  isActive: controller.isPageActive(index),
                ),
              ),
              if (index == 1)
                const Spacer(), // Add a Spacer right after the second button
            ],
          ],
        );
      }),
    );
  }
}
