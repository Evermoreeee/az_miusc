//import 'package:flutter/material.dart';
//class MenusDemo extends StatefulWidget {
//  @override
//  _MenusDemoState createState() => new _MenusDemoState();
//}
//class _MenusDemoState extends State<MenusDemo> {
//  String _bodyStr = '豪哥的女朋友';
//  @override
//  Widget build(BuildContext context) {
//    return new DefaultTabController(
//      length: 3,
//      child: new Scaffold(
//        backgroundColor: Colors.green,
//        appBar: new AppBar(
//            backgroundColor: Colors.yellow,
//            title: new Text('豪哥的女朋友菜单',
//                style: new TextStyle(color: Colors.red)
//            ),
//            actions: <Widget>[
//              new PopupMenuButton<String>(
//                  onSelected: (String value) {
//                    setState(() {
//                      _bodyStr = value;
//                    });
//                  },
//                  itemBuilder: (BuildContext context) =>
//                  <PopupMenuItem<String>>[
//                    new PopupMenuItem<String>(
//                        value: '舒淇',
//                        child: new Text('大老婆',
//                          style: new TextStyle(
//                              fontSize: 18.0,
//                              color: Colors.red
//                          ),
//                        )
//                    ),
//                    new PopupMenuItem<String>(
//                        value: '杨幂',
//                        child: new Text('二老婆',
//                          style: new TextStyle(
//                              fontSize: 18.0,
//                              color: Colors.red
//                          ),)
//                    ),
//                    new PopupMenuItem<String>(
//                        value: '关晓彤',
//                        child: new Text('小老婆',
//                          style: new TextStyle(
//                              fontSize: 18.0,
//                              color: Colors.red
//                          ),)
//                    )
//                  ]
//              )
//            ]
//        ),
//        body: new Container(
//          constraints: new BoxConstraints.expand(
//            height: Theme
//                .of(context)
//                .textTheme
//                .display1
//                .fontSize * 1.1 + 200.0,
//          ),
//          decoration: new BoxDecoration(
//            border: new Border.all(width: 2.0, color: Colors.red),
//            color: Colors.grey,
//            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
//            image: new DecorationImage(
//              image: new NetworkImage(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537171681350&di=f54b0476c0ea8e21a5d0dcadbc475adc&imgtype=0&src=http%3A%2F%2F09.imgmini.eastday.com%2Fmobile%2F20180806%2F20180806204236_1e97ad6677bc33a7ee2b6c2212647eb7_2.jpeg'
//              ),
////              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//            ),
//          ),
//          padding: const EdgeInsets.all(8.0),
//          alignment: Alignment.center,
//          child: new Text(_bodyStr,
//              style: Theme
//                  .of(context)
//                  .textTheme
//                  .display1
//                  .copyWith(color: Colors.red)),
//          transform: new Matrix4.rotationZ(0.3),
//        ),
//        bottomNavigationBar:
//        new BottomNavigationBar(
//          items: <BottomNavigationBarItem>[
//            new BottomNavigationBarItem(
//                icon: const Icon(Icons.home),
//                title: new Text("主页")
//            ),
//            new BottomNavigationBarItem(
//                icon: const Icon(Icons.wc),
//                title: new Text("厕所")
//            ),
//            new BottomNavigationBarItem(
//                icon: const Icon(Icons.local_airport),
//                title: new Text("飞机")
//            ),
//          ],
//          currentIndex: _currentIndex,
//          onTap: (int i) {
//            setState(() {
//              index = i;
//            });
//          },
//          fixedColor: Colors.red,
//        ),
//      ),
//    )
//  }
//}
//void main() {
//  runApp(new MaterialApp(
//    title: '因为爱情',
//    home: new MenusDemo(),
//  ));
//}

import 'package:flutter/material.dart';

import './pages/home_page.dart';

import './pages/Articles/ArticleList.dart';

void main() => runApp(new MaterialApp(
  home: new HomePage(),
  routes: <String, WidgetBuilder> {
    '/a': (BuildContext context) => new ArticleList(),
  },
)
);

