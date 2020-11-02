import 'package:flutter/material.dart';
import '../widgets/dashboard/dashboard.dart';
import '../../controllers/dashboard_controller.dart';

import '../../data/models/user.dart';
import '../../routes/app_routes.dart';
import '../widgets/dashboard/list_tile_widget.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();
  final DashboardController _dashboardController = DashboardController();
  Future<List<User>> _futureListUser;

  void onError(String message) {
    _keyScaffold.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  @override
  void initState() {
    _futureListUser = _dashboardController.handleGetAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo2.png',
              height: 30,
              width: 30,
              color: Colors.white,
            ),
            const Text(
              'GOIANO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.create),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.registerUser),
          ),
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _dashboardController.handleSignOut().then((_) {
                    Navigator.of(context).pop();
                  }).catchError((err) {
                    onError(err);
                  }))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _futureListUser = _dashboardController.handleGetAll();
          });
        },
        child: FutureBuilder<List<User>>(
          future: _futureListUser,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Align(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return Visibility(
                  visible: snapshot.data != null && snapshot.data.isNotEmpty,
                  replacement: MessageWidget(),
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: ListTileWidget(
                              user: snapshot.data[index],
                            ),
                          )),
                );
              default:
                return MessageWidget();
            }
          },
        ),
      ),
    );
  }
}
