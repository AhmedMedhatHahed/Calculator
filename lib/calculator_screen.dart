import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  dynamic displaytxt = 20;
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '÷') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '÷' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '÷') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: btncolor,
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () {
        calculation(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 30,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff0D0D0D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height * 0.33,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            '$text',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                  height: 0.0,
                  endIndent: 12.0,
                  indent: 12.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calcbutton(
                          'AC', const Color(0xff191919), Colors.orangeAccent),
                      calcbutton(
                          '+/-', const Color(0xff191919), Colors.orangeAccent),
                      calcbutton(
                          '%', const Color(0xff191919), Colors.orangeAccent),
                      calcbutton(
                          '÷', const Color(0xff191919), Colors.orangeAccent),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calcbutton('7', const Color(0xff323232), Colors.white),
                      calcbutton('8', const Color(0xff323232), Colors.white),
                      calcbutton('9', const Color(0xff323232), Colors.white),
                      calcbutton(
                          'x', const Color(0xff191919), Colors.orangeAccent),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calcbutton('4', const Color(0xff323232), Colors.white),
                      calcbutton('5', const Color(0xff323232), Colors.white),
                      calcbutton('6', const Color(0xff323232), Colors.white),
                      calcbutton(
                          '-', const Color(0xff191919), Colors.orangeAccent),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calcbutton('1', const Color(0xff323232), Colors.white),
                      calcbutton('2', const Color(0xff323232), Colors.white),
                      calcbutton('3', const Color(0xff323232), Colors.white),
                      calcbutton(
                          '+', const Color(0xff191919), Colors.orangeAccent),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xff323232),
                        ),
                        onPressed: () {
                          calculation('0');
                        },
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                      calcbutton('.', const Color(0xff323232), Colors.white),
                      calcbutton('=', Colors.orangeAccent, Colors.white),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
