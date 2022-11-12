import 'package:firstproject/Screens/in_Screen.dart';
import 'package:flutter/material.dart';

import '../widgets/theme.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All categories",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors:[
              CustomTheme.loginGradientStart,
              CustomTheme.loginGradientEnd,
            ] )
          ),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(icon: Icon(Icons.search)),
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => const ListScreen(), ));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.network("https://img.freepik.com/free-photo/abstract-grunge-decorative-relief-navy-blue-stucco-wall-texture-wide-angle-rough-colored-background_1258-28311.jpg?w=996&t=st=1668067985~exp=1668068585~hmac=3676cf9fea445fb5a2d2c8aea509a9a83533393bd4e21c121c9a0063b14b78cd",fit:BoxFit.cover,),
                          ),
                          const Center(child: Text("Category",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))]),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
