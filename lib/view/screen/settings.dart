import 'package:zingoshop/controller/settings_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/image_assets.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zingoshop/view/animation/animated_backgound.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(SettingsControllerImpl());
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 height: h200,
//                 decoration: BoxDecoration(
//                     color: AppColors.primaryColor,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(r72),
//                       bottomRight: Radius.circular(r72),
//                     )),
//               ),
//               Container(
//                 alignment: Alignment.bottomCenter,
//                 // color: Colors.black,
//                 height: h240,
//                 child: Container(
//                   height: h96,
//                   width: w96,
//                   padding: AppSpacing.addEdgeInsetsAll(p4),
//                   decoration: const BoxDecoration(
//                       color: AppColors.whiteTextColor, shape: BoxShape.circle),
//                   child: const CircleAvatar(
//                     backgroundImage: AssetImage(AppImageAssets.avatar),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // AppSpacing.addHeigh(h24),
//           GetBuilder<SettingsControllerImpl>(
//             builder: (controller) => Expanded(
//               // color: Colors.blue,
//               //padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p16),

//               //height: h200,
//               child: ListView(
//                   padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p16),
//                   children: [
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         // onTap: () {},
//                         trailing: Switch(
//                             onChanged: (val) {
//                               controller.enableNotification(val);
//                             },
//                             value: controller.isNotificationEnabled),
//                         title: const Text("Disable Notificatios"),
//                       ),
//                     ),
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () => controller.goToAddress(),
//                         trailing: const Icon(Icons.location_on_outlined),
//                         title: const Text("Address"),
//                       ),
//                     ),
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () => controller.goToOrders(),
//                         trailing: const Icon(Icons.delivery_dining),
//                         title: const Text("Orders"),
//                       ),
//                     ),
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () => controller.goToArchive(),
//                         trailing: const Icon(Icons.archive_outlined),
//                         title: const Text("Archive"),
//                       ),
//                     ),
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () {},
//                         trailing: const Icon(Icons.help_outline_rounded),
//                         title: const Text("About us"),
//                       ),
//                     ),
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () async {
//                           await launchUrl(Uri.parse("tel:+201096632333"));
//                         },
//                         trailing: const Icon(Icons.phone_callback_outlined),
//                         title: const Text("Contact us"),
//                       ),
//                     ),
//                     Container(
//                       margin: AppSpacing.addEdgeInsetsSymmetric(
//                           vertical: m8, horizontal: m16),
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 3),
//                         borderRadius: BorderRadius.circular(r20),
//                         color: AppColors.white,
//                       ),
//                       child: ListTile(
//                         onTap: () {
//                           controller.logout();
//                         },
//                         title: const Text("Logout"),
//                         trailing: const Icon(Icons.exit_to_app),
//                       ),
//                     ),
//                   ]),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class _ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final double scrollOffset;

  _ProfileHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.scrollOffset,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final avatarSize = (120 * (1 - progress)).clamp(40.0, 120.0);
    final avatarTopMargin = (160 * (1 - progress)).clamp(20.0, 160.0);
    final opacity = (1 - progress).clamp(0.0, 1.0);
    Get.put(SettingsControllerImpl());
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedBackground(height: maxExtent),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: minHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: avatarTopMargin,
          left: 24,
          child: CircleAvatar(
            radius: (avatarSize / 2) - 2,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: (avatarSize / 2) - 4,
              backgroundImage: const AssetImage(AppImageAssets.avatar),
            ),
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 16,
          child: Opacity(
            opacity: opacity,
            child: GetBuilder<SettingsControllerImpl>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.email,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(_ProfileHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        scrollOffset != oldDelegate.scrollOffset;
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _AnimatedProfileScreenState();
}

class _AnimatedProfileScreenState extends State<SettingsScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    Get.put(SettingsControllerImpl());
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _ProfileHeaderDelegate(
              minHeight: 80,
              maxHeight: 280,
              scrollOffset: _scrollOffset,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildSettingsSection(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GetBuilder<SettingsControllerImpl>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buidSettingsNotification(
                icon: Icons.notifications_none,
                title: 'Notifications',
                subtitle: 'Manage your notifications',
                onChanged: (val) => controller.enableNotification(val),
                value: controller.isNotificationEnabled),
            _buildSettingsItem(
                icon: Icons.location_on_outlined,
                title: "Address",
                subtitle: "Manage your address",
                onTap: () => controller.goToAddress()),
            _buildSettingsItem(
                icon: Icons.archive_outlined,
                title: "Orders",
                subtitle: "View your pending orders",
                onTap: () => controller.goToOrders()),
            _buildSettingsItem(
                icon: Icons.archive_outlined,
                title: "Archive",
                subtitle: "View your archived orders",
                onTap: () => controller.goToArchive()),
            _buildSettingsItem(
              icon: Icons.lock_outline,
              title: 'Privacy',
              subtitle: 'Control your privacy settings',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get help or contact us',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'About',
              subtitle: 'Learn more about our app',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.exit_to_app,
              title: 'Logout',
              subtitle: 'Sign out of your account',
              onTap: () => controller.logout(),
              isDestructive: true,
            ),
          ],
        );
      }),
    );
  }

  _buidSettingsNotification({
    required IconData icon,
    required String title,
    required String subtitle,
    required Function(bool)? onChanged,
    required bool value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.fourthColor,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Switch(onChanged: onChanged, value: value),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey[100],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon,
            color: isDestructive ? Colors.red : AppColors.fourthColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey[100],
      ),
    );
  }
}
