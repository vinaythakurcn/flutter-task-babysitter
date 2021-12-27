import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class BadgeHOC extends StatelessWidget {
  final Widget child;
  final String badge;
  const BadgeHOC({
    Key? key,
    required this.child,
    required this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.bottomStart(bottom: 4, start: 4),
      badgeColor: Theme.of(context).primaryColor,
      badgeContent: Text(badge, style: const TextStyle(color: Colors.white)),
      child: child,
    );
  }
}
