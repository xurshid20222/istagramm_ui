
import 'package:flutter/material.dart';

import 'feed_page.dart';




class HomePage extends StatefulWidget {
  static const id = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 30,),
        title: const Text('Instagram', style: TextStyle(color: Colors.grey, fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.live_tv, color: Colors.grey,size: 30)),
          IconButton(onPressed: (){},
              icon: const Icon(Icons.telegram_sharp, color: Colors.grey, size: 30,))
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState((){
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Upload'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'like'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'account'
          )
        ],
      ),

    );
  }
}
