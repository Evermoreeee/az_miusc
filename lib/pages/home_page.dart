import 'package:flutter/material.dart';

import './SidebarPage.dart';  //侧边栏

import './TopTabPages/TopTabPage_1.dart';
import './TopTabPages/TopTabPage_2.dart';
import './TopTabPages/TopTabPage_3.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

   String title;

   changeTilte(String t){
     setState((){
       title = t;
     });
   }
  //定义底部导航项目
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(text: '音乐人',icon: new Icon(Icons.home),),    //icon和text的显示顺序已经内定，如需自定义，到child属性里面加吧
    new Tab(icon: new Icon(Icons.wc),text: '艺术家',),
    new Tab(icon: new Icon(Icons.accessibility),text: '程序员',),
  ];

  //定义底部导航Tab
  TabController _bottomNavigation;

  //初始化导航Tab控制器
  @override
  void initState() {
    super.initState();
    _bottomNavigation = new TabController(
      vsync: this,    //动画处理参数
      length: _bottomTabs.length    //控制Tab的数量
      );   //底部主导航栏控制器
  }
  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _bottomNavigation.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.deepOrange,
            title: new Text('音乐人阿庄'),
          ),   //头部的标题AppBar
          drawer: new Drawer(     //侧边栏按钮Drawer
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(   //Material内置控件
                  accountName: new Text('音乐人阿庄',
                    style: TextStyle(color: Colors.deepOrange),
                  ), //用户名
                  accountEmail: new Text('acczhaung@163.com',
                    style: TextStyle(color: Colors.deepOrange),
                  ),  //用户邮箱
                  currentAccountPicture: new GestureDetector( //用户头像
                    onTap: () => print('current user'),
                    child: new CircleAvatar(    //圆形图标控件
                      backgroundImage: new NetworkImage('https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike72%2C5%2C5%2C72%2C24/sign=f19430b6c8fc1e17e9b284632bf99d66/64380cd7912397dd13791fa45e82b2b7d0a2870a.jpg'),//图片调取自网络
                    ),
                  ),
                  otherAccountsPictures: <Widget>[    //粉丝头像
                    new GestureDetector(    //手势探测器，可以识别各种手势，这里只用到了onTap
                      onTap: () => print('other user'), //暂且先打印一下信息吧，以后再添加跳转页面的逻辑
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537246824983&di=a5966e6fce568bbac0bb18bc031ac3f1&imgtype=0&src=http%3A%2F%2Fs11.sinaimg.cn%2Fbmiddle%2F4b3b3242g6271fc2487ea'),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () => print('other user'),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/8346438/e3e45f12-b3c2-45a1-95ac-a608fa3b8960?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                        ),
                    ),
                  ],
                  decoration: new BoxDecoration(    //用一个BoxDecoration装饰器提供背景图片
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
                      //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
                      image: new ExactAssetImage('images/lake.jpg'),
                    ),
                  ),
                ),
                new ListTile(   //第一个功能项
                  title: new Text('支持音乐人阿庄'),
                  trailing: new Icon(Icons.audiotrack),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SidebarPage('支持音乐人阿庄')));
                  }
                ),
                new ListTile(   //第二个功能项
                  title: new Text('给音乐人阿庄点赞'),
                  trailing: new Icon(Icons.assistant_photo),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SidebarPage('我要给他点赞')));
                  } 
                ),
                new ListTile(   //第三个功能项
                  title: new Text('购买音乐人阿庄的专辑'),
                  trailing: new Icon(Icons.live_tv),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/a');
                  } 
                ),
                new Divider(),    //分割线控件
                new ListTile(   //退出按钮
                  title: new Text('关闭'),
                  trailing: new Icon(Icons.cancel),
                  onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
                ),
              ],
            ),
          ),
          body: new TabBarView(
              controller: _bottomNavigation,
              children:  [      //注意顺序与TabBar保持一直
                new News(data: '5'),
                new TabPage2(),
                new TabPage3(),
              ]
            ),
          bottomNavigationBar: new Material(
            color: Colors.deepOrange,   //底部导航栏主题颜色
            child: new TabBar(
              labelColor: Colors.white,
              labelStyle: new TextStyle(fontSize: 16.0),
              unselectedLabelColor: Colors.white70,
              unselectedLabelStyle: new TextStyle(fontSize: 12.0),
              controller: _bottomNavigation,
              tabs: _bottomTabs,
//              indicatorColor: Colors.white, //tab标签的下划线颜色
            ),
          )
    );
  }
}