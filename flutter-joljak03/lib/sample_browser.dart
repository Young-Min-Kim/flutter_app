/// dart imports
import 'dart:io' show Platform;

/// package imports
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// local imports
import 'model/helper.dart';
import 'model/model.dart';
import 'model/web_view.dart';
import 'widgets/animate_opacity_widget.dart';
import 'widgets/search_bar.dart';
// developer_info 임포트
//import 'developer_info.dart';

/// Root widget of the sample browser
/// Contains the Homepage wrapped with a MaterialApp widget
class SampleBrowser extends StatefulWidget {
  /// Creates sample browser widget
  const SampleBrowser();

  @override
  _SampleBrowserState createState() => _SampleBrowserState();
}

class _SampleBrowserState extends State<SampleBrowser> {
  late SampleModel _sampleListModel;
  @override
  void initState() {
    _sampleListModel = SampleModel.instance;
    _initializeProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> navigationRoutes = <String, WidgetBuilder>{
      _sampleListModel.isWebFullView ? '/' : '/demos': (BuildContext context) =>
      const HomePage()
    };
    for (int i = 0; i < _sampleListModel.routes!.length; i++) {
      final SampleRoute sampleRoute = _sampleListModel.routes![i];
      WidgetCategory? category;
      for (int j = 0; j < _sampleListModel.categoryList.length; j++) {
        if (sampleRoute.subItem!.categoryName ==
            _sampleListModel.categoryList[j].categoryName) {
          category = _sampleListModel.categoryList[j];
          break;
        }
      }
      navigationRoutes[sampleRoute.routeName!] = (BuildContext context) =>
          WebLayoutPage(
              key: GlobalKey<State>(),
              routeName: sampleRoute.routeName!,
              sampleModel: _sampleListModel,
              category: category,
              subItem: sampleRoute.subItem);
    }
    if (_sampleListModel.isWebFullView) {
      _sampleListModel.currentThemeData = ThemeData.light();
      _sampleListModel.paletteBorderColors = <Color>[];
      _sampleListModel.changeTheme(_sampleListModel.currentThemeData!);
    }

    ///Avoiding page poping on escape key press
    final Map<LogicalKeySet, Intent> shortcuts =
    Map<LogicalKeySet, Intent>.of(WidgetsApp.defaultShortcuts)
      ..remove(LogicalKeySet(LogicalKeyboardKey.escape));
    return _sampleListModel.isWebFullView
        ? MaterialApp(
      shortcuts: shortcuts,
      initialRoute: '/',
      routes: navigationRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Demos & Examples of Syncfusion Flutter Widgets',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    )
        : MaterialApp(
        initialRoute: '/demos',
        routes: navigationRoutes,
        debugShowCheckedModeBanner: false,
        title: 'Demos & Examples of Syncfusion Flutter Widgets',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: Builder(builder: (BuildContext context) {
          _sampleListModel.systemTheme = Theme.of(context);
          _sampleListModel.currentThemeData ??=
          _sampleListModel.systemTheme.brightness != Brightness.dark
              ? ThemeData.light()
              : ThemeData.dark();
          _sampleListModel.changeTheme(_sampleListModel.currentThemeData!);
          return const HomePage();
        }));
  }

  void _initializeProperties() {
    final SampleModel model = SampleModel.instance;
    model.isWebFullView =
        kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux;
    if (kIsWeb) {
      model.isWeb = true;
    } else {
      model.isAndroid = Platform.isAndroid;
      model.isIOS = Platform.isIOS;
      model.isLinux = Platform.isLinux;
      model.isWindows = Platform.isWindows;
      model.isMacOS = Platform.isMacOS;
      model.isDesktop =
          Platform.isLinux || Platform.isMacOS || Platform.isWindows;
      model.isMobile = Platform.isAndroid || Platform.isIOS;
    }
  }
}

/// Home page of the sample browser for both mobile and web
class HomePage extends StatefulWidget {
  /// creates the home page layout
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SampleModel sampleListModel;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    sampleListModel = SampleModel.instance;
    _addColors();
    sampleListModel.addListener(_handleChange);
    super.initState();
  }

  ///Notify the framework by calling this method
  void _handleChange() {
    if (mounted) {
      setState(() {
        // The listenable's state was changed already.
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    ///Checking the download button is currently hovered
    bool isHoveringDownloadButton = false;

    ///Checking the get packages is currently hovered
    bool isHoveringPubDevButton = false;
    final bool isMaxxSize = MediaQuery.of(context).size.width >= 1000;
    final SampleModel model = sampleListModel;
    model.isMobileResolution = (MediaQuery.of(context).size.width) < 768;
    return Container(
      child: SafeArea(
          child: model.isMobileResolution
              ? Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: (!model.isWebFullView && Platform.isIOS)
                  ? null //Avoiding drawer in iOS platform
                  : getLeftSideDrawer(model),
              key: scaffoldKey,
              backgroundColor: model.webBackgroundColor,
              endDrawer:
              model.isWebFullView ? showWebThemeSettings(model) : null,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(46.0),



                  child: AppBar(
                    // 스크롤 내렸을때 보이는 위 부분?
                    leading: (!model.isWebFullView && Platform.isIOS)
                        ? Container()
                        : null,
                    elevation: 0.0,
                    backgroundColor: model.paletteColor,
                    title: AnimateOpacityWidget(
                        controller: controller,
                        opacity: 0,
                        child: const Text('스마트 에너지 메니저',
                            style: TextStyle(
                                fontSize: 18, fontFamily: 'HeeboMedium'))),
                    actions: <Widget>[
                      Container(
                        height: 40,
                        width: 40,

                        // 오른쪽 위 설정 버튼
                        child: IconButton(
                          icon: const Icon(Icons.settings,
                              color: Colors.white),
                          onPressed: () {
                            model.isWebFullView
                                ? scaffoldKey.currentState!.openEndDrawer()
                                : showBottomSettingsPanel(model, context);
                          },
                        ),
                      ),
                    ],
                  )),
              body: Container(
                  transform: Matrix4.translationValues(0, -1, 0),
                  child: _getScrollableWidget(model)))
              : Scaffold(


              bottomNavigationBar: getFooter(context, model),
              key: scaffoldKey,
              backgroundColor: model.webBackgroundColor,
              endDrawer: showWebThemeSettings(model),
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(90.0),
                  child: AppBar(
                    leading: Container(),
                    elevation: 0.0,
                    backgroundColor: model.paletteColor,
                    flexibleSpace: Container(
                        transform: Matrix4.translationValues(0, 4, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.fromLTRB(24, 10, 0, 0),
                              child: Text('스마트 에너지 메니저',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      letterSpacing: 0.53,
                                      fontFamily: 'Roboto-Bold')),
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                child: Text('Check Energy',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Roboto-Regular',
                                        letterSpacing: 0.26,
                                        fontWeight: FontWeight.normal))),
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                            ),
                            Container(
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,
                                height: kIsWeb ? 16 : 14,
                                decoration: BoxDecoration(
                                    color: model.webBackgroundColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: model.webBackgroundColor,
                                        offset: const Offset(0, 2.0),
                                        blurRadius: 0.25,
                                      )
                                    ]))
                          ],
                        )),
                    actions: <Widget>[
 
                      Padding(
                          padding:
                          EdgeInsets.only(left: isMaxxSize ? 15 : 0),
                          child: Container(
                            padding: MediaQuery.of(context).size.width < 500
                                ? const EdgeInsets.only(top: 20, left: 5)
                                : const EdgeInsets.only(top: 10, right: 15),
                            height: 60,
                            width: 60,

                            // 이부분 설정 버튼은 안먹음
                            child: IconButton(
                              icon: const Icon(Icons.settings,
                                  color: Colors.white),
                              onPressed: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                            ),
                          )),
                    ],
                  )),
              body: _CategorizedCards())),
    );
  }

  // 가장 위 큰 appBar 부분 시작
  /// get scrollable widget to getting stickable view
  Widget _getScrollableWidget(SampleModel model) {
    final List<Widget> searchResults = _getSearchedItems(model);
    return Container(
        color: model.paletteColor,
        child: GlowingOverscrollIndicator(
            color: model.paletteColor,
            axisDirection: AxisDirection.down,
            child: CustomScrollView(
              controller: controller,
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),

                          // 앱 가장 큰 제목
                          child: Text('스마트 에너지 매니저',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  letterSpacing: 0.53,
                                  fontFamily: 'HeeboBold',
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 8, 0, 20),
                          child: Text('Check Energy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 0.26,
                                  fontFamily: 'HeeboBold',
                                  fontWeight: FontWeight.normal)),
                        )
                      ],
                    )),

                //search bar 출력 부분
                // SliverPersistentHeader(
                //   pinned: true,
                //   delegate: _PersistentHeaderDelegate(model),
                // ),

                // 내용 List 출력 부분
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    Container(
                        color: model.webBackgroundColor,
                        child: searchResults.isNotEmpty
                            ? Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView(children: searchResults))
                            : _CategorizedCards()
                    ),
                  ]),
                )
              ],
            )));
  }

  /// Add the palette colors
  void _addColors() {
    sampleListModel.paletteColors = <Color>[
      const Color.fromRGBO(0, 116, 227, 1),
      const Color.fromRGBO(230, 74, 25, 1),
      const Color.fromRGBO(216, 27, 96, 1),
      const Color.fromRGBO(103, 58, 184, 1),
      const Color.fromRGBO(2, 137, 123, 1)
    ];
    sampleListModel.darkPaletteColors = <Color>[
      const Color.fromRGBO(68, 138, 255, 1),
      const Color.fromRGBO(255, 110, 64, 1),
      const Color.fromRGBO(238, 79, 132, 1),
      const Color.fromRGBO(180, 137, 255, 1),
      const Color.fromRGBO(29, 233, 182, 1)
    ];
    sampleListModel.paletteBorderColors = <Color>[
      const Color.fromRGBO(0, 116, 227, 1),
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ];
  }

  // search bar로 찾는 내용에 대한 코드
  // sample_details.json 파일에 있는 내용을 model.dart에서 가져온다.
  /// returns searched result
  List<Widget> _getSearchedItems(SampleModel model) {
    final List<Widget> items = <Widget>[];
    for (int i = 0; i < model.sampleList.length; i++) {
      items.add(Material(
          elevation: 0.0,
          color: model.webBackgroundColor,
          child: InkWell(
              splashColor: Colors.grey.withOpacity(0.4),
              onTap: () {
                Feedback.forLongPress(context);
                onTapExpandSample(context, model.sampleList[i], model);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  maxLines: 1,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: model.sampleList[i].control!.title,
                          style: TextStyle(
                              fontFamily: 'Roboto-Bold',
                              fontWeight: FontWeight.normal,
                              color: model.textColor,
                              letterSpacing: 0.3)),
                      TextSpan(
                          text: ' - ' + model.sampleList[i].title!,
                          style: TextStyle(
                              fontFamily: 'HeeboMedium',
                              fontWeight: FontWeight.normal,
                              color: model.textColor,
                              letterSpacing: 0.3)),
                    ],
                  ),
                ),
              ))));
      items.add(Divider(
        color: model.dividerColor,
        thickness: 1,
      ));
    }

    if (model.sampleList.isEmpty &&
        model.controlList.isEmpty &&
        model.editingController.text.trim() != '') {
      items.add(
        Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            color: model.webBackgroundColor,
            child: Center(
                child: Text('No results found',
                    style: TextStyle(color: model.textColor, fontSize: 15)))),
      );
    }
    return items;
  }
}

// // 위에 search bar 구현 부분
// /// Search bar, rounded corner
// class _PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
//   _PersistentHeaderDelegate(SampleModel sampleModel) {
//     _sampleListModel = sampleModel;
//   }
//   SampleModel? _sampleListModel;
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox(
//       height: 90,
//       child: Container(
//           color: _sampleListModel!.paletteColor,
//           child: Column(
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                 height: 70,
//                 child: SearchBar(sampleListModel: _sampleListModel),
//               ),
//               Container(
//                   height: 20,
//                   decoration: BoxDecoration(
//                       color: _sampleListModel!.webBackgroundColor,
//                       borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(12.0),
//                           topRight: Radius.circular(12.0)),
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                           color: _sampleListModel!.webBackgroundColor,
//                           offset: const Offset(0, 2.0),
//                           blurRadius: 0.25,
//                         )
//                       ])),
//             ],
//           )),
//     );
//   }
//
//   @override
//   double get maxExtent => 90;
//
//   @override
//   double get minExtent => 90;
//
//   @override
//   bool shouldRebuild(_PersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }

//실제 카테고리 배치가 이부분?
/// Positioning/aligning the categories as  cards
/// based on the screen width
class _CategorizedCards extends StatefulWidget {
  @override
  _CategorizedCardsState createState() => _CategorizedCardsState();
}

class _CategorizedCardsState extends State<_CategorizedCards> {
  SampleModel model = SampleModel.instance;
  late double _cardWidth;

  @override
  Widget build(BuildContext context) {
    return Container(child: _getCategorizedCards());
  }
  
  // 이부분 부터 리스트 출력 시작인듯
  Widget _getCategorizedCards() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    double padding;
    double _sidePadding = deviceWidth > 1060
        ? deviceWidth * 0.038
        : deviceWidth >= 768
        ? deviceWidth * 0.041
        : deviceWidth * 0.05;

    Widget? organizedCardWidget;

    if (deviceWidth > 1060) {
      padding = deviceWidth * 0.011;
      _cardWidth = (deviceWidth * 0.9) / 3;

      ///setting max cardwidth, spacing between cards in higher resolutions
      if (deviceWidth > 3000) {
        _cardWidth = 2800 / 3;
        _sidePadding = (deviceWidth - 2740) * 0.5;
        padding = 30;
      }
      //각 단계 위젯들 담을 리스트 생성
      final List<Widget> firstColumnWidgets = <Widget>[];
      final List<Widget> secondColumnWidgets = <Widget>[];
      final List<Widget> thirdColumnWidgets = <Widget>[];
      int firstColumnControlCount = 0;
      int secondColumnControlCount = 0;
      for (int i = 0; i < model.categoryList.length; i++) {
        if (firstColumnControlCount < model.controlList.length / 3) {
          firstColumnWidgets.add(_getCategoryWidget(model.categoryList[i]));
          firstColumnWidgets
              .add(Padding(padding: EdgeInsets.only(top: padding)));
          firstColumnControlCount += model.categoryList[i].controlList!.length;
        } else if (secondColumnControlCount < model.controlList.length / 3 &&
            (secondColumnControlCount +
                model.categoryList[i].controlList!.length <
                model.controlList.length / 3)) {
          secondColumnWidgets.add(_getCategoryWidget(model.categoryList[i]));
          secondColumnWidgets
              .add(Padding(padding: EdgeInsets.only(top: padding)));
          secondColumnControlCount += model.categoryList[i].controlList!.length;
        } else {
          thirdColumnWidgets.add(_getCategoryWidget(model.categoryList[i]));
          thirdColumnWidgets
              .add(Padding(padding: EdgeInsets.only(top: padding)));
        }
        organizedCardWidget = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: _sidePadding)),
            Column(children: firstColumnWidgets),
            Padding(padding: EdgeInsets.only(left: padding)),
            Column(children: secondColumnWidgets),
            Padding(padding: EdgeInsets.only(left: padding)),
            Column(children: thirdColumnWidgets),
            Padding(
              padding: EdgeInsets.only(left: _sidePadding),
            )
          ],
        );
      }
    } else if (deviceWidth >= 768) {
      padding = deviceWidth * 0.018;
      _cardWidth = (deviceWidth * 0.9) / 2;
      final List<Widget> firstColumnWidgets = <Widget>[];
      final List<Widget> secondColumnWidgets = <Widget>[];
      int firstColumnControlCount = 0;
      for (int i = 0; i < model.categoryList.length; i++) {
        if (firstColumnControlCount < model.controlList.length / 2) {
          firstColumnWidgets.add(_getCategoryWidget(model.categoryList[i]));
          firstColumnWidgets
              .add(Padding(padding: EdgeInsets.only(top: padding)));
          firstColumnControlCount += model.categoryList[i].controlList!.length;
        } else {
          secondColumnWidgets.add(_getCategoryWidget(model.categoryList[i]));
          secondColumnWidgets
              .add(Padding(padding: EdgeInsets.only(top: padding)));
        }
        organizedCardWidget = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: _sidePadding)),
            Column(children: firstColumnWidgets),
            Padding(padding: EdgeInsets.only(left: padding)),
            Column(children: secondColumnWidgets),
            Padding(
              padding: EdgeInsets.only(left: _sidePadding),
            )
          ],
        );
      }
    } else {
      _cardWidth = deviceWidth * 0.9;
      padding = deviceWidth * 0.035;
      _sidePadding = (deviceWidth * 0.1) / 2;
      final List<Widget> verticalOrderedWidgets = <Widget>[];
      for (int i = 0; i < model.categoryList.length; i++) {
        verticalOrderedWidgets.add(_getCategoryWidget(model.categoryList[i]));
        verticalOrderedWidgets
            .add(Padding(padding: EdgeInsets.only(top: padding)));
      }
      organizedCardWidget = Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: _sidePadding)),
          Column(children: verticalOrderedWidgets),
          Padding(
            padding: EdgeInsets.only(left: _sidePadding),
          )
        ],
      );
    }
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: deviceWidth > 1060 ? 15 : 10),
            child: organizedCardWidget));
  }

  /// get the rounded corner layout for given category
  Widget _getCategoryWidget(WidgetCategory category) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: model.cardColor,
            border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.12), width: 1.1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        width: _cardWidth,
        child: Column(children: <Widget>[

          // 각 카테고리 제목 출력
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 2),
            child: Text(
              // 카테고리 이름 글 부분
              category.categoryName!.toUpperCase(),

              //카테고리 style
              style: TextStyle(
                  color: model.backgroundColor,
                  fontSize: 16,
                  fontFamily: 'Roboto-Bold'),
            ),
          ),

          //카테고리와 내용 나누는 코드
          Divider(
            color: model.themeData.brightness == Brightness.dark
                ? const Color.fromRGBO(61, 61, 61, 1)
                : const Color.fromRGBO(238, 238, 238, 1),
            thickness: 1,
          ),

          // 카테고리 내용 부분 출력하는 함수
          Column(children: _getControlListView(category))
        ]));
  }

  // 카테고리 내용 출력 구현 부분
  /// get the list view of the controls in the specified category
  List<Widget> _getControlListView(WidgetCategory category) {
    final List<Widget> items = <Widget>[];
    for (int i = 0; i < category.controlList!.length; i++) {
      final Control control = category.controlList![i] as Control;
      final String? status =
      control.title == 'PDF Viewer' && !kIsWeb && Platform.isMacOS
          ? 'New'
          : control.status;
      items.add(Container(
        color: model.cardColor,
        child: Material(
            color: model.cardColor,
            elevation: 0.0,
            child: InkWell(
                splashFactory: InkRipple.splashFactory,
                hoverColor: Colors.grey.withOpacity(0.2),
                
                // 샘플 눌렀을때 기능 부분인 듯
                onTap: () {
                  // onTapControlInMobile: 탭하면 샘플이 선택된다.
                  !model.isWebFullView
                      ? onTapControlInMobile(context, model, category, i)
                      : onTapControlInWeb(context, model, category, i);
                  model.searchResults.clear();
                },

                //세부적인 메인 화면 버튼 외적 모습 출력
                child: Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(
                        12, 10, 0, category.controlList!.length > 3 ? 6 : 0),

                    // 왼쪽의 이미지 출력하는 코드
                    leading: Image.asset(control.image!, fit: BoxFit.cover),


                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text(
                              control.title!,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              textScaleFactor: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 0.1,
                                  color: model.textColor,
                                  fontFamily: 'Roboto-Bold'),
                            ),
                            if (!model.isWebFullView && Platform.isIOS)
                              Container()
                            else
                              control.isBeta == true
                                  ? Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: model.isWeb &&
                                          model.isMobileResolution
                                          ? const EdgeInsets.fromLTRB(
                                          3, 1.5, 3, 5.5)
                                          : const EdgeInsets.fromLTRB(
                                          3, 3, 3, 2),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Color.fromRGBO(
                                              245, 188, 14, 1)),
                                      child: const Text(
                                        'BETA',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.12,
                                            fontFamily: 'Roboto-Medium',
                                            color: Colors.black),
                                      )))
                                  : Container()
                          ]),
                          if (status != null)
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: status.toLowerCase() == 'new'
                                        ? const Color.fromRGBO(55, 153, 30, 1)
                                        : status.toLowerCase() == 'updated'
                                        ? const Color.fromRGBO(
                                        246, 117, 0, 1)
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                padding: model.isWeb && model.isMobileResolution
                                    ? const EdgeInsets.fromLTRB(6, 1.5, 4, 5.5)
                                    : const EdgeInsets.fromLTRB(6, 2.7, 4, 2.7),
                                child: Text(status,
                                    style: const TextStyle(
                                        fontFamily: 'Roboto-Medium',
                                        color: Colors.white,
                                        fontSize: 10.5)))
                          else
                            Container()
                        ]),
                    subtitle: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 7.0, 12.0, 0.0),
                          child: Text(
                            // 위에서 control에 기존 데이터 넣어 놨었다.
                            control.description!,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            textScaleFactor: 1,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color.fromRGBO(128, 128, 128, 1),
                            ),
                          ),
                        )),
                  ),
                ))),
      ));
    }
    return items;
  }
}
