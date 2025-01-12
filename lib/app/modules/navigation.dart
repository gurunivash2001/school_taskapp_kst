import 'package:flutter/material.dart';
import 'package:schooltask/app/modules/home/home_screen.dart';
import 'package:schooltask/app/modules/profile/profile_screen.dart';

class NavigationMenu extends StatefulWidget {
  final String userName;

  const NavigationMenu({super.key, required this.userName});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomeScreen(userName: widget.userName),
      Container(color: Colors.amber),  
      Container(color: Colors.red),    
      ProfileScreen(),                
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.indigo : Colors.grey,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.menu_book,
              color: _selectedIndex == 1 ? Colors.indigo : Colors.grey,
            ),
            label: 'Home Work',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.message,
              color: _selectedIndex == 2 ? Colors.indigo : Colors.grey,
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 3 ? Colors.indigo : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
