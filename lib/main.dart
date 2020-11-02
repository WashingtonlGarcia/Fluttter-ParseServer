import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'app/routes/app_pages.dart';
import 'app/ui/theme/app_theme.dart';

void main() async {
  await DotEnv().load();
  final DotEnv dotEnv = DotEnv();
  await Parse().initialize(
    dotEnv.env['KEY_APPLICATION_ID'],
    dotEnv.env['KEY_PARSER_SERVER_URL'],
    masterKey: dotEnv.env['MASTER_KEY'],
    liveQueryUrl: dotEnv.env['LIVE_QUERY_URL'],
  );
 
  runApp(MaterialApp(
    theme: theme,
    initialRoute: AppPages.initialRoute,
    onGenerateRoute: AppPages.onGenerateRoute,
  ));
}
