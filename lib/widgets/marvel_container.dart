import 'package:flutter/material.dart';
import 'package:marvel/core/theme/app_theme.dart';

class MarvelContainer extends StatelessWidget {
  const MarvelContainer({super.key, required this.child, this.title});

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.lightBlue),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          title != null ? Text(title!, style: Theme.of(context).textTheme.titleLarge) : const SizedBox.shrink(),
          child,
        ],
      ),
    );
  }
}
