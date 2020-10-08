import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ud_subject/data/YouTubeVideos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'How it Works'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('how.it.works.flutter.channel');
  List<YouTubeVideo> _videos;

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler((call) => _handleNativeMethodCall(call));
  }

  _handleNativeMethodCall(MethodCall call) {
    switch (call.method) {
      case "GET_VIDEOS":
        _initVideos(call.arguments as String);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(
        cupertino: (_, __) => CupertinoNavigationBarData(
          leading: CupertinoNavigationBarBackButton()
        ),
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.black, fontFamily: 'america', fontWeight: FontWeight.w800)),
      ),
      body: Container(
        child: _renderListView(),
      ),
    );
  }

  Widget _renderListView() {
    if (_videos == null) return Container();

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) => _renderVideoRow(context, index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _videos.length);
  }

  Widget _renderVideoRow(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _playVideo(_videos[index].videoName),
      child: Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 24, 20),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(_videos[index].videoName,
                    style: TextStyle(color: Color(0xff151515), fontSize: 14, fontFamily: 'america', fontWeight: FontWeight.w200)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/images/play.svg'),
              )
            ],
          )
      ),
    );
  }

  void _initVideos(String arguments) {
    YouTubeVideos videos = YouTubeVideos.fromJson(jsonDecode(arguments));
    setState(() {
      _videos = videos.toList();
    });
  }

  void _playVideo(String name) async {
    await platform.invokeMethod('PLAY_VIDEO', _mapVideoByName(name));
  }

  String _mapVideoByName(String name) {
    switch (name) {
      case 'Introduction to Bond':
        return 'BOND_INTRODUCTION';
      case 'Monitoring Services':
        return 'MONITORING_SERVICES';
      case 'Security Agent':
        return 'SECURITY_AGENT';
      case 'Send A Car':
        return 'SEND_CAR';
      case 'Siren':
        return 'SIREN';
      default:
        return '';
    }
  }
}
