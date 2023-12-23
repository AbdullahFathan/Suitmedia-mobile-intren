import 'package:flutter/material.dart';
import 'package:suitmedia_test/screens/second_screen.dart';
import 'package:suitmedia_test/widgets/button.dart';
import 'package:suitmedia_test/widgets/pop_up.dart';
import 'package:suitmedia_test/widgets/text_form.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController palindromeTextController =
      TextEditingController();

  @override
  void dispose() {
    nameTextController.dispose();
    palindromeTextController.dispose();
    super.dispose();
  }

  String checkPalindrome(String input) {
    String words = input.replaceAll(" ", "").toLowerCase();

    bool isPalindrome = words == words.split('').reversed.join('');

    return isPalindrome ? "isPalindrome" : "not palindrome";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 32,
          right: 33,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 51),
              child: Image.asset("assets/images/ic_photo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormWidget(
                textEditingController: nameTextController,
                hintText: "Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 53),
              child: TextFormWidget(
                textEditingController: palindromeTextController,
                hintText: "Palindrome",
              ),
            ),
            ButtonWidget(
              textButton: "CHECK",
              onPressed: () {
                if (palindromeTextController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const PopUpWidget(text: "Paliandrome required"),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => PopUpWidget(
                        text: checkPalindrome(palindromeTextController.text)),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: ButtonWidget(
                textButton: "NEXT",
                onPressed: () {
                  if (nameTextController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          const PopUpWidget(text: "Name required"),
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SecondScreen(
                            name: nameTextController.text,
                          ),
                        ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
