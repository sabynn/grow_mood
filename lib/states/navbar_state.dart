import 'global_state.dart';

class NavbarState{
  String _route = '/home';
  String? get getRoute => _route;


  Future<void> setRoutes(String route) async {
    await navbarRM.setState((s) {
      s._route = route;
      return;
    });
  }
}