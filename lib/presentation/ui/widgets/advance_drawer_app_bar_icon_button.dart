import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class AdvanceDrawerAppBarIconButton extends StatefulWidget {
  final AdvancedDrawerController advancedDrawerController;
  final Color? color;

  const AdvanceDrawerAppBarIconButton({super.key, required this.advancedDrawerController, this.color});

  @override
  State<AdvanceDrawerAppBarIconButton> createState() => _AdvanceDrawerAppBarIconButtonState();
}

class _AdvanceDrawerAppBarIconButtonState extends State<AdvanceDrawerAppBarIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: _handleMenuButtonPressed, icon: ValueListenableBuilder<AdvancedDrawerValue>(
      valueListenable: widget.advancedDrawerController,
      builder: (_, value, __) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Icon(
            value.visible ? Icons.clear : Icons.menu,
            key: ValueKey<bool>(value.visible),
            color: widget.color,
          ),
        );
      },
    ),);
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    setState(() {
      if (widget.advancedDrawerController.value.visible) {
        widget.advancedDrawerController.hideDrawer(); // Hide if already open
      } else {
        widget.advancedDrawerController.showDrawer(); // Show if closed
      }
    });

    }
  }

