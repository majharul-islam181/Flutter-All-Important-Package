// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class NavbarVisibility extends StatefulWidget {
  const NavbarVisibility({super.key});

  @override
  _NavbarVisibilityState createState() => _NavbarVisibilityState();
}

class _NavbarVisibilityState extends State<NavbarVisibility>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isBottomBarVisible = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // Hide the bottom navigation bar when scrolling down
        if (_isBottomBarVisible) {
          setState(() {
            _isBottomBarVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Show the bottom navigation bar when scrolling up
        if (!_isBottomBarVisible) {
          setState(() {
            _isBottomBarVisible = true;
          });
        }
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Duration for the full zoom-in and zoom-out cycle
    )..repeat(
        reverse: true); // Repeat the animation in reverse (zoom in and out)

    _animation =
        Tween<double>(begin: 1.0, end: 1.2) // Zoom from 1.0 to 1.2 scale
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth curve for the animation
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scroll to Hide/Show Bottom Nav')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        height: _isBottomBarVisible ? 60.0 : 0.0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: SvgPicture.asset(
                "images/food-fruit-fruits-17-svgrepo-com.svg",
                height: 30,
              ),
            );
          },
        ),
        onPressed: () {
          // Handle button press
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
