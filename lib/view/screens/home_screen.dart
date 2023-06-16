import 'package:flutter/material.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/view/screens/classes/bathrooms.dart';
import 'package:furny/view/screens/classes/bedrooms.dart';
import 'package:furny/view/screens/classes/carpets.dart';
import 'package:furny/view/screens/classes/chairs.dart';
import 'package:furny/view/screens/classes/cupboards.dart';
import 'package:furny/view/screens/classes/paintings.dart';
import 'package:furny/view/screens/classes/sofas.dart';
import 'package:furny/view/screens/classes/tables.dart';
import 'package:furny/view/screens/favorite_screen.dart';
import 'package:furny/view/screens/objects_control_panel.dart';
import 'package:furny/view/screens/search_screen.dart';
import 'package:furny/view/widgets/custom_card.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget with Crud {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Furny",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontFamily: 'Nunito'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ObjectsCP(),
                ));
              },
              icon: const Icon(
                IconlyLight.password,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ));
              },
              icon: const Icon(
                IconlyBroken.search,
                color: Colors.black,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FavoriteScreen(),
          ));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          IconlyLight.heart,
          color: Colors.redAccent,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                CustomCard(
                  text: 'Chairs',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Chairs(),
                    ));
                  },
                  colour: Colors.lightBlue,
                ),
                const SizedBox(width: 20),
                CustomCard(
                  text: "Sofas",
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Sofas(),
                    ));
                  },
                  colour: Colors.greenAccent,
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                CustomCard(
                  text: 'Tables',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Tables(),
                    ));
                  },
                  colour: Colors.purpleAccent,
                ),
                const SizedBox(width: 20),
                CustomCard(
                  text: "Paintings",
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Paintings(),
                    ));
                  },
                  colour: Colors.orangeAccent,
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                CustomCard(
                  text: 'Bedrooms',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Bedrooms(),
                    ));
                  },
                  colour: Colors.lightGreen,
                ),
                const SizedBox(width: 20),
                CustomCard(
                    text: "Cupboards",
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Cupboards(),
                      ));
                    },
                    colour: Colors.pinkAccent),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                CustomCard(
                  text: 'Bathrooms',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Bathrooms(),
                    ));
                  },
                  colour: Colors.indigoAccent,
                ),
                const SizedBox(width: 20),
                CustomCard(
                    text: "Carpets",
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Carpets(),
                      ));
                    },
                    colour: Colors.teal),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
