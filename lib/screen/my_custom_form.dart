import 'package:flutter/material.dart';

class MyCustomFormPage extends StatefulWidget {
  @override
  _MyCustomFormPageState createState() => _MyCustomFormPageState();
}

class _MyCustomFormPageState extends State<MyCustomFormPage> {
  final myController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    myController.addListener(_inputChange);
  }

  @override
  void dispose() {
    super.dispose();

    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('입력 데모'),),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty)
                    return "값을 입력하세요";

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: RaisedButton(child: Text('검증'),
                  onPressed: () {
                    if (_formKey.currentState.validate())
                      {
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('검증 완료'),));
                      }
                  },
                )
              )
            ],
          ),
        )
    );
  }

  void _inputChange() {
    print("두번째 데이터 : ${myController.text}");
  }
}
