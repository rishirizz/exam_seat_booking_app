import 'package:exam_seat_booking_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:transparent_image/transparent_image.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  Map examDetails = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print('object');
    getNames().then((response) {
      setState(() {
        examDetails = response;
        print('ExamDetails=====>$examDetails');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: FadeInImage.memoryNetwork(
                            imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) =>
                                Image.asset('images/inventory_image.png'),
                            fit: BoxFit.cover,
                            // width: 70,

                            placeholder: kTransparentImage,
                            image: examDetails['image'],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                examDetails['title'],
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Text(
                                examDetails['year'],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                examDetails['detail1'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
