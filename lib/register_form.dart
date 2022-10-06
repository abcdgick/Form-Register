import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

enum Gender { pria, wanita }

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();

  String? selectedAgama;
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  Gender? _gender = Gender.pria;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            leading: const IconButton(
                onPressed: null,
                icon: Icon(Icons.menu, color: Colors.white),
                tooltip: "Navigation Menu"),
            centerTitle: true,
            title: const Text("Register Form",
                style: TextStyle(fontWeight: FontWeight.bold)),
            actions: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                tooltip: "Search",
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                tooltip: "More",
              )
            ]),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: _formKey,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            labelText: "Nama Lengkap",
                            labelStyle: const TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        controller: namaLengkap,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            labelText: "Telepon",
                            labelStyle: const TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        controller: telp,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 8,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.home),
                            labelText: "Alamat",
                            labelStyle: const TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        controller: alamat,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your home address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        value: selectedAgama,
                        items: <String>[
                          'Katolik',
                          'Kristen',
                          'Islam',
                          'Buddha',
                          'Hindu',
                          'Konghucu'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (agama) => setState(() {
                          selectedAgama = agama!;
                        }),
                        validator: (value) =>
                            value == null ? 'Please enter your religion' : null,
                        decoration: const InputDecoration(
                            labelText: "Pilih Agama",
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 2.0))),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            value: Gender.pria,
                            groupValue: _gender,
                            onChanged: (Gender? value) => setState(() {
                              _gender = value;
                            }),
                          ),
                          const Text("Pria"),
                          const SizedBox(
                            width: 100,
                          ),
                          Radio(
                            value: Gender.wanita,
                            groupValue: _gender,
                            onChanged: (Gender? value) => setState(() {
                              _gender = value;
                            }),
                          ),
                          const Text("Wanita"),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        cursorColor: Colors.blue,
                        obscureText: !_passwordVisible,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () => setState(() {
                                _passwordVisible = !_passwordVisible;
                              }),
                            ),
                            labelStyle: const TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                shadowColor: Colors.black),
                            child: const Text('Submit'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text("Informasi"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                  "Nama Lengkap: ${namaLengkap.text}"),
                                              Text("Email: ${email.text}"),
                                              Text("Telepon: ${telp.text}"),
                                              Text("Alamat: ${alamat.text}"),
                                              Text("Agama: $selectedAgama"),
                                              Text("Jenis Kelamin: $_gender"),
                                              //Text("Password: ${password.text}"),
                                            ],
                                          ),
                                        ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Are u retarded?')));
                              }
                            },
                          ))
                    ],
                  ))),
        ));
  }
}
