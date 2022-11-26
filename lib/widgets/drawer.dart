import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/services/services_auth.dart';

import '../screens/index.dart';

class DrawerST extends StatelessWidget {
  DrawerST({
    Key? key,
  }) : super(key: key);
  String imagen = Preferences.img;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color.fromARGB(248, 4, 68, 80),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Color.fromARGB(179, 103, 201, 11),
                    width: 5,
                  )),

                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(12),
                  //     bottomRight: Radius.circular(12)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2020/03/07/11/54/the-fog-4909513__340.jpg'),
                      fit: BoxFit.fitWidth),
                ),
                child: Row(
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        //deberia direccionar a PerfilScreen
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProfileScreen()!));
                      },
                      elevation: 1.0,
                      fillColor: Colors.white,
                      padding: EdgeInsets.all(5.0),
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(Preferences.img != ""
                            ? Preferences.img
                            : "https://images.pexels.com/photos/1438081/pexels-photo-1438081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (Preferences.usuario == '')
                                ? 'User123'
                                : Preferences.usuario,
                            style: Styles.titleDrawer,
                            softWrap: true,
                          ),
                          Text('Ingenieria de Sistemas',
                              style: Styles.subtitleDrawer)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTileCustomized(
                    height: 50,
                    title: 'Perfil',
                    icon: Icons.person,
                    trailing: Text('', style: TextStyle(fontSize: 12)),
                    onTap: PerfilScreen(),
                  ),
                  ListTileCustomized(
                    height: 50,
                    title: 'Configuraciones',
                    icon: Icons.settings,
                    trailing: Text('', style: TextStyle(fontSize: 12)),
                    onTap: ConfigScreem(),
                  ),
                  Divider(),
                  ListTileCustomized(
                    height: 35,
                    title: 'Notificaciones',
                    icon: Icons.messenger_outline_outlined,
                    trailing: Text('15', style: TextStyle(fontSize: 12)),
                    onTap: HomeScreem(),
                  ),
                  // ListTileCustomized(
                  //   height: 35,
                  //   title: 'Social',
                  //   icon: Icons.people,
                  //   trailing: ChipWidget(
                  //     text: '14 new',
                  //     color: Colors.lightBlue,
                  //   ),
                  //   onTap: HomeScreen(),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  ///////////////////////////////////////////////
                  Text(
                    'Mis Tramites',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  //////////////////////////////////////////////
                  ListTileCustomized(
                    height: 35,
                    title: 'Generar Tramite',
                    icon: Icons.add,
                    trailing: Text(''),
                    onTap: GenerarTramitesScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Estado de Tramites',
                    icon: Icons.border_all_outlined,
                    trailing: Text(''),
                    onTap: EstadoTramitesScreen(),
                  ),
                  // ListTileCustomized(
                  //   height: 35,
                  //   title: 'Important',
                  //   icon: Icons.label_important,
                  //   trailing: Text('1', style: TextStyle(fontSize: 12)),
                  //   onTap: HomeScreen(),
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Cerrar Sesion',
                    icon: Icons.logout_outlined,
                    trailing: Text(''),
                    onTap: LoginScreen(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final Color? color;
  final String? text;

  const ChipWidget({super.key, this.color, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: color,
        label: Text(
          '$text',
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class ListTileCustomized extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final Widget? onTap;
  final IconData? icon;
  final double? height;

  const ListTileCustomized(
      {super.key,
      this.title,
      this.trailing,
      this.onTap,
      this.icon,
      this.height});

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        leading: Icon(icon),
        title: Text(
          '$title',
          style: TextStyle(fontSize: 13),
        ),
        horizontalTitleGap: 3,
        trailing: trailing,
        onTap: () {
          if (title == 'Cerrar Sesion') {
            authServices.logOut();

            Preferences.usuario = '';
            Preferences.password = '';
          }
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => onTap!));
        },
      ),
    );
  }
}
