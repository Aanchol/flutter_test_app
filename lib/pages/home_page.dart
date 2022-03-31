import 'package:flutter/material.dart';
import 'package:flutter_test_app/provider/ecommerce_provider.dart';
import 'package:flutter_test_app/utils/search_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    didChangeDependencies();
  }

  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
    EcommerceProvider foodProvider = Provider.of<EcommerceProvider>(context,listen: false);
    await foodProvider.foodCategory();
  }


  List<String> imageLocationForCategories = [
    "assets/images/thai_food.jpg",
    "assets/images/indian_food.jpg",
    "assets/images/korean_food.jpg",
    "assets/images/bangladeshi_food.jpg"
  ];



  @override
  Widget build(BuildContext context) {


    return Consumer<EcommerceProvider>(
        builder: (_,provider,___) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width/10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.biking,
                          size:MediaQuery.of(context).size.width/10,
                          color: Colors.red,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("eFood",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                        ),
                        Icon(FontAwesomeIcons.bell),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/9,
                  ),
                  SearchField(searchIcon: Icons.search),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/12,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width/2,
                    width: MediaQuery.of(context).size.width/1.1,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30, left:10),
                          child: Text("All Categories",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width/10,
                        ),
                        provider.isLoading == false? CircularProgressIndicator():
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context,index){
                              return SizedBox(
                                width: MediaQuery.of(context).size.width/18,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.categories.data!.length,
                            itemBuilder: (context,index){
                              return Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:10),
                                      child: CircleAvatar(
                                        radius: 30,
                                        //backgroundColor: Colors.red,
                                        backgroundImage: AssetImage(imageLocationForCategories[index]),
                                      ),
                                    ),
                                    SizedBox(
                                        height:MediaQuery.of(context).size.width/35
                                    ),
                                    Text(provider.categories.data![index].link!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.width/14,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width/1.5,
                    width: MediaQuery.of(context).size.width/1.1,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0,top:13,right:8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Set Menu",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text("View all")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width/40,
                        ),
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (context,index){
                              return SizedBox(

                              );
                            },
                            itemCount: 5,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Container(
                                  height: MediaQuery.of(context).size.width/2.1,
                                  width: MediaQuery.of(context).size.width/2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.width/4,
                                        width: MediaQuery.of(context).size.width/1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/thai_food.jpg"
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        height:MediaQuery.of(context).size.width/50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Bengali Breakfast",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Set Menu",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:MediaQuery.of(context).size.width/20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("\$50",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.red,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.grey,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.heart),
                  label: "Favourites",
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Menu",
                  backgroundColor: Colors.green,
                ),

              ],
            ),
          );
        }
    );
  }
}