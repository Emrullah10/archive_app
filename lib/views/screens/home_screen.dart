import 'package:archive_app/models/modal/archive_modal.dart';
import 'package:archive_app/models/services/archive_service.dart';
import 'package:archive_app/views/screens/login_screen.dart';
import 'package:archive_app/views/widgets/custom_card_widget.dart';
import 'package:archive_app/views/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArchiveService archiveService = ArchiveService();

  List<Datum> archiveList = [];

  @override
  void initState() {
    super.initState();
    archiveService.fetchusers().then((value) {
      setState(() {
        archiveList = value.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const titleText = "Ana Sayfa";
    const drawerMainCatagoryTextone = "Ana Kategori 1";
    const drawerMainCatagoryTexttwo = "Ana Kategori 2";
    const drawerSubCatagoryTextone = "Alt Kategori 1";
    const drawerSubCatagoryTexttwo = "Alt Kategori 2";
    const drawerSubCatagoryTextthree = "Alt Kategori 3";
    const drawerSubCatagoryTextfour = "Alt Kategori 4";
    return Scaffold(
      appBar: AppBar(
        title: const Text(titleText),
        actions: [
          Image.asset('assets/serdivanmini.jpg', width: 50, height: 50),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Ayarlar butonuna basıldığında yapılacak işlemler
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Üst kısım (Profil ve Kategoriler)
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Kullanıcı Adı'),
                  accountEmail: Text('kullanici@eposta.com'),
                  currentAccountPicture: CircleAvatar(
                    child: Text('K'),
                  ),
                ),

                // Ana Kategoriler ve Alt Kategoriler...
                ExpansionTile(
                  leading: Icon(Icons.category),
                  title: Text(drawerMainCatagoryTextone),
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0), // Merdiven efekti için sola kaydır
                        child: Text(drawerSubCatagoryTextone),
                      ),
                      onTap: () {
                        // Alt Kategori 1'e tıklandığında yapılacak işlemler
                      },
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0), // Daha fazla sola kaydır
                        child: Text(drawerSubCatagoryTexttwo),
                      ),
                      onTap: () {
                        // Alt Kategori 2'ye tıklandığında yapılacak işlemler
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.category),
                  title: Text(drawerMainCatagoryTexttwo),
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(drawerSubCatagoryTextthree),
                      ),
                      onTap: () {
                        // Alt Kategori 3'e tıklandığında yapılacak işlemler
                      },
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(drawerSubCatagoryTextfour),
                      ),
                      onTap: () {
                        // Alt Kategori 4'e tıklandığında yapılacak işlemler
                      },
                    ),
                  ],
                ),
              ],
            ),

            // Alt kısım (Log Out)
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Kullanıcıyı login sayfasına yönlendir ve geri dönmesini engelle
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) =>
                      false, // Önceki sayfaların geçmişini sil
                );
              },
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
            Expanded(
              child: ListView.builder(
                itemCount: archiveList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      child: CustomListTile(
                          title: archiveList[index].firstName!,
                          subtitle: archiveList[index].lastName!,
                          icon: Icons.archive,
                          onTap: () {
                            print("tıklandı");
                          }),
                    ),
                  );
                },
              ),
            ),

            // Diğer sayfa içeriği
          ],
        ),
      ),
    );
  }
}
