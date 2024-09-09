import "package:flutter/material.dart";
import "package:flutter_catlog/utils/routes.dart";
import "package:velocity_x/velocity_x.dart";
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name  = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context, ) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: context.canvasColor,
      body: Form(
        key: _formKey,
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/login_image.png', fit: BoxFit.fill,),
              const SizedBox(height: 20,),
              Text("Welcome $name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                      hintText: 'Enter username',
                      label: Text("Username")
                    ),
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "required";
                        }
                        return null;
                      },

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                        label: Text("Password")
                    ),
                      obscureText: true,
                      validator: (value){
                        if(value!.isEmpty){
                          return "required";
                        }
                        return null;
                      } ,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Material(
                color: context.theme.highlightColor,
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                    ),
                    alignment: Alignment.center,
                    child: changeButton ? const Icon(Icons.done, weight: 10,) : const Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        
                  ),
                ),
              )
              // ElevatedButton(
              //     onPressed: ()=>{
              //       Navigator.pushNamed(context, MyRoutes.homePage)
              //     },
              //     child: Text('Login'),
              //     style: TextButton.styleFrom(
              //         minimumSize: Size(100, 50)
              //     ),
              // )
            ],
          ),
        )
        ),
      ),
    );
  }
}
