import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropstam_task/controller/home_controller.dart';
import 'package:ropstam_task/view/screens/login_screen.dart';
import 'package:ropstam_task/view/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_)=> Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
               DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(child: CustomText(text: 'Ropstam Solutions',color: Colors.white,fontWeight: FontWeight.bold,)),
              ),
              ListTile(
                trailing: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  await controller.clearSession();
                  Get.off(()=>LoginScreen());
                },
              ),
            ],
          ),
        ),
        body: controller.isLoading ? const Center(child: CircularProgressIndicator(),):
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: controller.model.length,
              itemBuilder: (BuildContext ctx,int i){
                return Material(
                  elevation: 3,
                  child: ExpansionTile(
                    title: CustomText(text: controller.model[i].title.toString(),fontWeight: FontWeight.bold),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(text: controller.model[i].body.toString(),fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
