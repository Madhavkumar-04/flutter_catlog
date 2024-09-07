import "package:flutter/material.dart";
import "package:flutter_catlog/utils/routes.dart";
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/login_image.png', fit: BoxFit.fill,),
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
                onPressed: ()=>{
                  Navigator.pushNamed(context, MyRoutes.homePage)
                },
                child: Text('Login'),
                style: TextButton.styleFrom(
                    minimumSize: Size(100, 50)
                ),
            )
          ],
        ),
      )
      ),
    );
  }
}
