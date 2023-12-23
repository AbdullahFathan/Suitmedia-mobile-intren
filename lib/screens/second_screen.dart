import 'package:flutter/material.dart';

import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/config/fonts.dart';
import 'package:suitmedia_test/screens/thrid_screen.dart';
import 'package:suitmedia_test/widgets/appbar.dart';
import 'package:suitmedia_test/widgets/button.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String userName = "John Doe";
  String selectedUserName = "Selected User Name";

  @override
  void initState() {
    userName = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Second Screen",
        context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: regulerFont(blackColor, 12),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              userName,
              style: semiBoldFont(blackColor, 18),
            ),
            Expanded(
                child: Center(
              child: Text(
                selectedUserName,
                style: semiBoldFont(blackColor, 24),
              ),
            )),
            ButtonWidget(
              textButton: "Choose a User",
              onPressed: () async {
                //get selected user name from thrid page
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ThirdScreen(),
                  ),
                );

                //update current selected user name
                setState(() {
                  selectedUserName = result;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
