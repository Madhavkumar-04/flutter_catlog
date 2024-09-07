import "package:flutter/material.dart";
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: Center(
          child:Column(
            children: [
              Image.asset('assets/images/login_image.png'),
              SizedBox(height: 20,),
              Text("Welcome", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                      hintText: 'Enter username',
                      label: Text("Username")
                    ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        label: Text("Password")
                    ),
                      obscureText: true,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: ()=>{print("Madhav  ")},
                  child: Text('Login'),
                  style: TextButton.styleFrom(),
              )
            ],
          )
      )
      ),
    );
  }
}
