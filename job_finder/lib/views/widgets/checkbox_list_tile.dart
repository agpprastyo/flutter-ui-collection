import 'package:flutter/material.dart';
import 'package:job_finder/core/styles/color.dart';
import 'package:job_finder/core/utils/extensions.dart';

class MainCheckBoxListTile extends StatefulWidget {
  const MainCheckBoxListTile({super.key});

  @override
  State<MainCheckBoxListTile> createState() => _MainCheckBoxListTileState();
}

class _MainCheckBoxListTileState extends State<MainCheckBoxListTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        checkColor: AppColors.primary,
        contentPadding: const EdgeInsets.all(0),
        controlAffinity: ListTileControlAffinity.leading,
        visualDensity: VisualDensity.standard,
        fillColor: WidgetStateProperty.all(AppColors.secondary),
        side: BorderSide.none,
        title: Text('Remember me',
            maxLines: 1,
            softWrap: false,
            style: context.textTheme.bodyMedium),
        value: value, onChanged: (value) {
      setState(() {
        this.value = value!;
      });

    });
  }
}
