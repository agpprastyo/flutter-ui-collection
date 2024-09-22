import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/bloc/scroll_cubit.dart';

import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NotificationAppBar(),
        body: BlocBuilder<ScrollCubit, ScrollState>(
          builder: (context, state) {
            ScrollCubit cubit = BlocProvider.of<ScrollCubit>(context);
            ScrollController controller = cubit.scrollCubitController;
            return CustomScrollView(
              controller: controller,
              slivers: [
                SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: index == 9 ? 90 : 0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColors.placeholder, width: 0.2),
                        ),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1517705008128-361805f42e86?q=80&w=1987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: const Text(
                            'Your order #123456789 has been confirmed'),
                        subtitle: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. '),
                        onTap: () {},
                      ),
                    );
                  },
                )
              ],
            );
          },
        ));
  }
}

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: IconButton(
          icon: const Icon(IconlyLight.search),
          onPressed: () {},
        ),
      ),
      title: Text(
        'Notification',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
