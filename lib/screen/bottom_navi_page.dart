import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BottomNaviPage extends StatefulWidget {
  @override
  _BottomNaviPageState createState() => _BottomNaviPageState();
}

class _BottomNaviPageState extends State<BottomNaviPage> {
  var _index = 0;

  var _pages = [
    _Page1(),
    _Page2(),
    _Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hard UI', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(title: Text('홈'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('이용서비스'), icon: Icon(Icons.assessment)),
          BottomNavigationBarItem(
              title: Text('내 정보'), icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  _buildTop() {
    return GestureDetector(
      onTap: () {
        print("클릭~");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
                Opacity(
                  opacity: 0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.local_taxi,
                        size: 40,
                      ),
                      Text('택시'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildMiddle() {
    final dummyItems = [
      'https://cdn.pixabay.com/photo/2018/11/12/18/44/thanksgiving-3811492_1280.jpg',
      'https://cdn.pixabay.com/photo/2019/10/30/15/33/tajikistan-4589831_1280.jpg',
      'https://cdn.pixabay.com/photo/2019/11/25/16/15/safari-4652364_1280.jpg',
    ];

    return CarouselSlider(
      height: 150,
      autoPlay: true,
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.amber),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  )),
            );
          },
        );
      }).toList(),
    );
  }

  _buildBottom() {
    final lists = List.generate(
        10,
        (index) => new ListTile(
              leading: Icon(Icons.notification_important),
              title: Text("이것은 공지사항 입니다."),
            ));

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: lists,
    );
    return Text('Bottom');
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '이용 서비스',
      style: TextStyle(fontSize: 40),
    ));
  }
}

class _Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '내 정보',
      style: TextStyle(fontSize: 40),
    ));
  }
}
