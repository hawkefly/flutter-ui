import 'package:flutter/widgets.dart';
import 'package:fluro/fluro.dart';
//首页
import 'package:efox_flutter/page/home.dart' as HomePage;
import 'package:efox_flutter/widget/index.dart' as WidgetConfig;
import 'handles.dart';

class FluroRouter {
  static Router router;

  static Router initRouter() {
    FluroRouter.router = Router();
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return HomePage.Index();
        },
      ),
    );

    router.define('/webview', handler: webviewHandler);
    
    // 组件
    WidgetConfig.getAllWidgets().forEach((widgetsItem) {
      print('widgetsItem $widgetsItem');
      widgetsItem.widgetList.forEach((itemInfo) {
        router.define(
          widgetsItem.nameSpaces + itemInfo.title,
          handler: Handler(
              handlerFunc: (BuildContext context, Map<String, List> params) {
            return itemInfo.widget;
          }),
        );
      });
    });
    return router;
  }
}
