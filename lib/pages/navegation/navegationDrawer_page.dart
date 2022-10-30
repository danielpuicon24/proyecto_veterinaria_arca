
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../listaAnimales/listAnimals_page.dart';
import '../../usuario/usuario_conntroller.dart';
import '../home/home_controller.dart';
import '../registerAnimal/registerAnimal_page.dart';

class NavegationDrawerPage extends StatefulWidget {
  const NavegationDrawerPage({super.key});

  @override
  State<NavegationDrawerPage> createState() => _NavegationDrawerPageState();
}

class _NavegationDrawerPageState extends State<NavegationDrawerPage> {
  HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3A4F83),
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _mostrarUsuario(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.paw,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Adoptar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListAnimals()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Favoritos',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: 200.0,
                                height: 306.0,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Exoge la opción que se ajuste a lo que quieres anunciar',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[500]),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xFF3D4E80),
                                          shadowColor: Color(0xFF3D4E80),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          minimumSize: Size(200, 80),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Animal perdido',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Si tu animal de compañia se ha perdido o escapado')
                                          ],
                                        ),
                                        onPressed: () {},
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xFF3D4E80),
                                          shadowColor: Color(0xFF3D4E80),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          minimumSize: Size(200, 80),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Animal econtrado',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Si has visto o entrado a un animal perdido')
                                          ],
                                        ),
                                        onPressed: () {},
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xFF3D4E80),
                                          shadowColor: Color(0xFF3D4E80),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          minimumSize: Size(200, 80),
                                        ),
                                        child: Column(
                                          children: const [
                                            Text(
                                              'Dar en adopción',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Si necesitas que adopten a tu animal de compañia')
                                          ],
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterAnimalPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Agregar Mascota',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.add_alert_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Alertas',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Ajustes',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => con.cerrarSesion(),
                child: Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _mostrarUsuario() {
  UsuarioController conU = Get.put(UsuarioController());
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Icon(Icons.person),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${conU.usuario.nombres ?? ''} ${conU.usuario.apellidos ?? ''}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      )
    ],
  );
}

Widget _butonIniciarSesion(BuildContext context) {
  return GestureDetector(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF3D4E80),
        onPrimary: Colors.white,
        shadowColor: Color(0xFF3D4E80),
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: Size(200, 40),
      ),
      child: const Text(
        'Iniciar Sesión',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {},
    ),
  );
}

AlertDialog alartDialog(String title, String content, BuildContext context) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      Column(
        children: [
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black38)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black38)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ],
  );
}
