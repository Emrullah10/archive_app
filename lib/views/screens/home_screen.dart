import 'package:archive_app/views/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Ayarlar butonuna basıldığında yapılacak işlemler
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Profil Kısmı
            UserAccountsDrawerHeader(
              accountName: Text('Kullanıcı Adı'),
              accountEmail: Text('kullanici@eposta.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('K'),
              ),
            ),

            // Ana Kategori ve Alt Kategoriler
            ExpansionTile(
              leading: Icon(Icons.category),
              title: Text('Ana Kategori 1'),
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Merdiven efekti için sola kaydır
                    child: Text('Alt Kategori 1'),
                  ),
                  onTap: () {
                    // Alt Kategori 1'e tıklandığında yapılacak işlemler
                  },
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0), // Daha fazla sola kaydır
                    child: Text('Alt Kategori 2'),
                  ),
                  onTap: () {
                    // Alt Kategori 2'ye tıklandığında yapılacak işlemler
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.category),
              title: Text('Ana Kategori 2'),
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Alt Kategori 3'),
                  ),
                  onTap: () {
                    // Alt Kategori 3'e tıklandığında yapılacak işlemler
                  },
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text('Alt Kategori 4'),
                  ),
                  onTap: () {
                    // Alt Kategori 4'e tıklandığında yapılacak işlemler
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Arama Çubuğu ve Detaylı Arama Butonu
            Row(
              children: [
                // Arama Çubuğu
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ara...', // Placeholder
                      prefixIcon: Icon(Icons.search), // Arama ikonu
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Yuvarlak kenarlar
                      ),
                      filled: true,
                      fillColor: Colors.grey[200], // Arka plan rengi
                    ),
                    onChanged: (value) {
                      // Arama yapılacak terim: value
                      print('Arama Terimi: $value');
                    },
                  ),
                ),

                SizedBox(width: 10), // Arama çubuğu ile buton arasında boşluk

                // Detaylı Arama Butonu
                ElevatedButton(
                  onPressed: () {
                    // Detaylı Arama butonuna basıldığında yapılacak işlemler
                    print('Detaylı Arama butonuna basıldı.');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Yuvarlak kenarlar
                    ),
                  ),
                  child: Text('Detaylı Arama'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(
                  title: "Arşiv1",
                  subtitle: "burada paralar tutulmaktadır",
                  icon: Icons.money_outlined,
                  onTap: () {
                    // Arşiv1'e tıklandığında yapılacak işlemler
                    print("object");
                  }),
            ),

            // Diğer sayfa içeriği
          ],
        ),
      ),
    );
  }
}
