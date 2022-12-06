import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab.3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyColors {
  static Color myGray = const Color(0xFFA9A7A7);
  static Color myDarkGray = const Color(0xFF969696);
  static Color myWhite = const Color(0xFFEEF0F2);
  static Color myPink = const Color(0xFFFF887D);
  static Color myGreen = const Color(0xFF11998E);
  static Color myBlack = const Color(0xFF252C32);
  static Color myDarkWhite = const Color(0xFFF5F5F5);
}

class MyIcons {
  static String backspace = 'resources/icons/Backspace.svg';
  static String impartire = 'resources/icons/Impartire.svg';
  static String inmultire = 'resources/icons/Inmultire.svg';
  static String minus = 'resources/icons/Minus.svg';
  static String plus = 'resources/icons/Plus.svg';
}

class _MyHomePageState extends State<MyHomePage> {
  String ecuatie = '';
  String rezultat = '';
  String expresie = '';

  //widget pentru butoanele cu cifre
  Widget calcButton(String buttonText, Color buttonColor, Color textColor) {
    return ElevatedButton(
        onPressed: () {
          calculation(buttonText);
        },
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            onPrimary: textColor,
            elevation: 0.0,
            shadowColor: Colors.transparent,
            minimumSize: const Size(82, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32,
            color: textColor,
          ),
        ));
  }

  //widget pentru butoanele cu icon-uri
  Widget iconButton(
      Color buttonColor, Color iconColor, String assetName, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        calculation(buttonText);
      },
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          minimumSize: const Size(82, 88),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
      child: SvgPicture.asset(
        assetName,
        color: iconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myDarkWhite,
        body: Padding(
          padding: const EdgeInsets.only(
              left: 16, right: 16, bottom: 50, top: 37 + 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Calculator',
                style: TextStyle(
                  color: MyColors.myBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        ecuatie,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: MyColors.myDarkGray, fontSize: 48),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        rezultat,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: MyColors.myDarkGray, fontSize: 48),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: MyColors.myWhite),
                  ),
                  //color: Colors.red,
                ),
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calcButton('C', Colors.transparent, MyColors.myPink),
                    const SizedBox(height: 88, width: 82),
                    iconButton(Colors.transparent, MyColors.myGreen,
                        MyIcons.backspace, 'del'),
                    iconButton(Colors.transparent, MyColors.myGreen,
                        MyIcons.impartire, '÷'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton('7', Colors.transparent, MyColors.myGray),
                  calcButton('8', Colors.transparent, MyColors.myGray),
                  calcButton('9', Colors.transparent, MyColors.myGray),
                  iconButton(Colors.transparent, MyColors.myGreen, MyIcons.inmultire, '×'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton('4', Colors.transparent, MyColors.myGray),
                  calcButton('5', Colors.transparent, MyColors.myGray),
                  calcButton('6', Colors.transparent, MyColors.myGray),
                  iconButton(Colors.transparent, MyColors.myGreen, MyIcons.minus, '-'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton('1', Colors.transparent, MyColors.myGray),
                  calcButton('2', Colors.transparent, MyColors.myGray),
                  calcButton('3', Colors.transparent, MyColors.myGray),
                  iconButton(Colors.transparent, MyColors.myGreen, MyIcons.plus, '+'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 88, width: 82),
                  calcButton('0', Colors.transparent, MyColors.myGray),
                  calcButton('.', Colors.transparent, MyColors.myGray),
                  calcButton('=', MyColors.myGreen, MyColors.myWhite),
                ],
              ),
            ],
          ),
        ));
  }

  void calculation(btnText) {
    setState(() {
      switch (btnText) {
        case 'C':
          ecuatie = '';
          rezultat = '';
          break;
        case 'del':
          if (ecuatie != '') {
            ecuatie = ecuatie.substring(0, ecuatie.length - 1);
          }
          break;
        case '=':
          expresie = ecuatie;
          expresie = expresie.replaceAll('×', '*');
          expresie = expresie.replaceAll('÷', '/');
          // daca este eroare de sintaxa, apare pe ecran 'Eroare'
          try {
            Parser p = Parser();
            Expression exp = p.parse(expresie);
            ContextModel cm = ContextModel();
            rezultat = '${exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(2)}';
          } catch (e) {
            rezultat = 'Eroare';
          }
          break;
        case '÷':
        case '×':
        case '-':
        case '+':
        case '.':
          var lastChar = ecuatie.substring(ecuatie.length - 1);
          // daca avem 2 simboluri la rand sa se stearga ultimul
          if (lastChar == '÷' || lastChar == '×' || lastChar == '-' || lastChar == '+' || lastChar == '.') {
            ecuatie = ecuatie.substring(0, ecuatie.length - 1);
          }
          ecuatie += btnText;
          break;
        default:
          //restul cifrelor
          ecuatie += btnText;
          break;
      }
    });
  }
}
