import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../models/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _story = [
    Story('assets/images/user_1.jpeg', 'Jasmin'),
    Story('assets/images/user_2.jpeg', 'Angela'),
    Story('assets/images/user_3.jpeg', 'Livana'),
    Story('assets/images/user_2.jpeg', 'Algarim'),
    Story('assets/images/user_1.jpeg', 'Sozonhe'),
    Story('assets/images/user_3.jpeg', 'Anna'),
    Story('assets/images/user_2.jpeg', 'Jhon'),
  ];

  final List<Post> _post = [
    Post(
        userImage: 'assets/images/user_1.jpeg',
        username: 'Bollena',
        postImage: 'assets/images/user_1.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur.'),
    Post(
        userImage: 'assets/images/user_2.jpeg',
        username: 'Anna',
        postImage: 'assets/images/user_2.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur.'),
    Post(
        userImage: 'assets/images/user_3.jpeg',
        username: 'Selena',
        postImage: 'assets/images/user_3.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur.'),
    Post(
        userImage: 'assets/images/user_1.jpeg',
        username: 'Anton',
        postImage: 'assets/images/user_1.jpeg',
        caption: 'Consequatur nihil aliquid omnis consequatur.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              // #storyes #watchall
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Stories',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'Watch all',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // #storyList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _story.map((story) {
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),

              // #postList
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _post.length,
                    itemBuilder: (cxc, i) {
                      return _itemOfPost(_post[i]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(story.name),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.postImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(post.username,style: const TextStyle(color: Colors.grey),)
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_option_key))
              ],
            ),
          ),
          FadeInImage(
            placeholder: const AssetImage('assets/images/placeholder.png'),
            image: AssetImage(post.postImage),
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border, color: Colors.grey),
              ),
            ],
          ),
          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children:[
                  TextSpan(
                    text: 'Liked By, ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Sigmund, ',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Yesenniya, ',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Diyana',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: '1263 others',
                    style: TextStyle(color: Colors.white),
                  ),
                ]
              ),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: '${post.caption}',style: const TextStyle(color: Colors.white)
                  ),
                ],
              ),
            ),
          ),
          // #postdata
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              'February 2022',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
