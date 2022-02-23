import 'package:exam_seat_booking_app/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExamSeatBookingApp());
}

class ExamSeatBookingApp extends StatelessWidget {
  const ExamSeatBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff075E54),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xff25D366)),
      ),
      home: const UserRegistrationScreen(),
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/main': (BuildContext context) => const UserRegistrationScreen(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
