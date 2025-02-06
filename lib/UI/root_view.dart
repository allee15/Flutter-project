import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/token_service.dart';
import 'package:flutter_application_1/UI/TabBar/tab_bar_screen.dart';
import 'package:provider/provider.dart';

class RootViewModel extends ChangeNotifier {
  final TokenService _tokenService = TokenService();
  bool isTokenReady = false;

  RootViewModel() {
    getToken();
  }

  Future<void> getToken() async {
    try {
      await _tokenService.getToken();
      isTokenReady = true;
      notifyListeners();
    } catch (error) {
      print('Error loading token $error');
    }
  }
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RootViewModel>(builder: (context, viewModel, child) {
      if (!viewModel.isTokenReady) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(body: TabBarScreen());
      }
    });
  }
}
