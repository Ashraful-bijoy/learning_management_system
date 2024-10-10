import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
class AdvanceDrawer extends StatefulWidget {
  final AdvancedDrawerController advancedDrawerController;
  final Widget child;
  final Widget drawer;

  const AdvanceDrawer({super.key, required this.advancedDrawerController, required this.child, required this.drawer,});

  @override
  State<AdvanceDrawer> createState() => _AdvanceDrawerState();
}
class _AdvanceDrawerState extends State<AdvanceDrawer> {

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: widget.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      //openScale: 0.92,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      drawer: widget.drawer,
      child: widget.child,
    );
  }


}
