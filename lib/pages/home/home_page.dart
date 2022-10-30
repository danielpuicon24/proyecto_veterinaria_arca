
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/Categoria.dart';
import '../../models/Mascota.dart';
import '../../widgets/search_text.dart';
import '../InfoAnimal/InfoAnimal_page.dart';
import '../InfoAnimal/infoAnimal_controller.dart';
import '../navegation/navegationDrawer_page.dart';
import 'home_controller.dart';
import 'mascota_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  HomeController homeController = Get.put(HomeController());
  InfoAnimalController infoAnimalController = Get.put(InfoAnimalController());
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Stack(
        children: [
          NavegationDrawerPage(),
      AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)
              ..rotateY(isDrawerOpen ? -0.5 : 0),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 150;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                }),
                        Column(
                          children: [
                            Text('Localización'),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff416d6d),
                                ),
                                Text('La Libertada, Trujillo'),
                              ],
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Icon(Icons.person),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: SearchText(
                      hintText: "Buscar mascota por raza",
                      active: false,
                      icons: Icons.search,
                    ),
                  ),
                  /*
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.search),
                        Text('Buscar mascota para adoptar'),
                        Icon(Icons.settings)
                      ],
                    ),
                  ),

                   */
                  SizedBox(
                    height: 120,
                    child: FutureBuilder(
                      future: homeController.listAllCategories(),
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        if (snap.hasData) {
                          List<CategoriaModel> listacategoria = snap.data;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listacategoria.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.network(
                                          listacategoria[index].imagen,
                                          height: 70,
                                          width: 73,
                                        ),
                                        Text(listacategoria[index].descripcion)
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  /* SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: shadowList,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  categories[index]['iconPath'],
                                  height: 50,
                                  width: 50,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(categories[index]['name'])
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  */
                  SizedBox(
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FutureBuilder(
                              future: homeController.listAllAnimals(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snap) {
                                if (snap.hasData) {
                                  List<MascotaModel> mascotas = snap.data;
                                  return GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height /
                                              1.7),
                                    ),
                                    itemCount: mascotas.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return Obx(() => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          boxShadow: shadowList,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 70,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(5.0),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              mascotas[index]
                                                                  .imagen1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 25,
                                                    height: 25,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white38,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        infoAnimalController.addOrNotFavorite2();
                                                      },
                                                      padding: EdgeInsets.zero,
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        size: 15,
                                                        color: infoAnimalController.checkboxValue2.isTrue ? Colors.red: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    mascotas[index].tamanio.toUpperCase()
                                                        .toUpperCase(),
                                                    style: GoogleFonts
                                                        .openSans(
                                                        color: Color(
                                                            0XFF000000),
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    mascotas[index]
                                                        .raza
                                                        .toUpperCase(),
                                                    style: GoogleFonts
                                                        .openSans(
                                                        color: Color(
                                                            0XFFBCBABE)),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                  width: 120,
                                                  height: 3.5,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.0),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  homeController.eliminarMascota();
                                                  homeController.seleccionarMascota(mascotas[index]);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              InfoAnimalPage()));
                                                },
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF3D4E80),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          24.0)),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/perro.png",
                                                          color: Colors.white,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Center(
                                                          child: Text(
                                                            "ADOPTAR",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                    },
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoAnimalPage()));
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ejemplo()));
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoAnimalPage()));
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                  */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map> categories = [
  {'name': 'Gato', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Perro', 'iconPath': 'assets/images/dog.png'},
];

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Color.fromARGB(255, 226, 226, 226),
      blurRadius: 30,
      offset: Offset(0, 10))
];
