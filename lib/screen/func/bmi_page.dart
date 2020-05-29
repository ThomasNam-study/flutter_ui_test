import 'package:flutter/material.dart';

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "키"),
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  validator: (value) {
                    if (value.trim().isEmpty) return '키를 입력하세요';

                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: '몸무게'),
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  validator: (value) {
                    if (value.trim().isEmpty) return '뭄무게를 입력하세요';

                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => _BmiResult(
                                    double.parse(_heightController.text.trim()),
                                    double.parse(
                                        _weightController.text.trim()))));
                      }
                    },
                    child: Text('결과'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _BmiResult extends StatelessWidget {
  final double height;

  final double weight;

  _BmiResult(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    print("bmi : $bmi");

    return Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_calcBmi(bmi), style: TextStyle(fontSize: 36)),
              SizedBox(
                height: 16,
              ),
              _buildIcon(bmi),
            ],
          ),
        ));
  }

  Widget _buildIcon(double bmi) {
    if (bmi >= 23) {
      return Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.red,
        size: 100,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    }
  }

  String _calcBmi(double bmi) {
    var result = '저체중';

    if (bmi >= 35)
      result = '고도 비만';
    else if (bmi >= 30)
      result = '2단계 비만';
    else if (bmi >= 25)
      result = '1단계 비만';
    else if (bmi >= 23)
      result = '과체중';
    else if (bmi >= 18.5) result = '정상';

    return result;
  }
}
