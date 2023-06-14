import 'dart:convert';

import 'package:ecommerce_ui/SessionManager.dart';
import 'package:ecommerce_ui/models/model_barang.dart';
import 'package:ecommerce_ui/models/model_datakeranjang.dart';
import 'package:ecommerce_ui/models/model_favorit.dart';
import 'package:ecommerce_ui/models/model_user.dart';
import 'package:ecommerce_ui/screens/checkout_screen/checkout_screen.dart';
import 'package:ecommerce_ui/screens/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../API/Api_Service.dart';


import 'package:ecommerce_ui/constants.dart';
import '../../../API/Api_connect.dart';
import '../../details_screen/details_screen.dart';


class ProductF extends StatefulWidget {
  final String title;
  final List<GetDataFav> data;


  ProductF({
    Key? key,
    required this.title,
    required this.data,

  }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<ProductF> {
  late Future<List<GetDataFav>> listblog;
 late Map<int, bool> isLiked = {};



  List<GetDataFav> listViews = [];

  Future<List<GetDataFav>> fetchData() async {

    try {
      List<GetDataFav> data = await ServiceApiFavorit().getData();
      setState(() {
        listViews = data;
       isLiked = Map<int, bool>.fromIterable(data, key: (e) => e.idBarang, value: (e) => e.isLiked);
      });
      return data;
    } catch (error) {
      // Handle error jika terjadi kesalahan saat mengambil data dari API
      print('Error fetching data: $error');
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    listblog = fetchData();

  }

  Widget background(GetDataFav product) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            kPrimaryColor.withOpacity(0.2),
            kPrimaryColor.withOpacity(0.6),
          ],
        ),
      ),
    );
  }

  Widget text(GetDataFav product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (product.merkBarang != null && product.merkBarang!.isNotEmpty)
                Text("\n \n \n"+
                    product.merkBarang.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const Spacer(),
              if (product.harga != null)
                Text(
                  "\n \n \n"+

                      product.harga.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          if (product.deskripsi != null && product.deskripsi!.isNotEmpty)
            Text(
              product.deskripsi.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              style: TextStyle(
                fontSize: 9,
                color: kSecondaryColor.withOpacity(0.9),
              ),
            ),
        ],
      ),
    );
  }

  Widget image(GetDataFav product) {
    if (product.gambar != null) {
      String imageUrl =
          "https://2637-114-5-104-99.ngrok-free.app/" + product.gambar.toString();
      return Container(
        height: 148,
        width: 148,
        color: Colors.grey,

        decoration: BoxDecoration(
            border: Border.all(
                width: 4,
                color: Theme.of(context)
                    .scaffoldBackgroundColor),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 10))
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://b387-202-67-46-229.ngrok-free.app/" + product.gambar.toString(),
                ))),
        child: text(product),
      );
    } else {
      return Container(
        height: 120,
        color: Colors.grey,
      );
    }
  }

Widget favoriteIcon(int index) {
  int? productId = listViews[index].idBarang;
  bool isProductLiked = isLiked[productId] ?? false;
  return Positioned(
    top: 20,
    right: 0,
    child: 
    
    listViews[index].isLiked! == true ?
    Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(20),
       
        ),
        color :  Colors.purple
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            isLiked[productId!] = !isProductLiked;
          });
          _handledeleteData(context, index);
          fetchData();
        },
        icon: Icon(
          FontAwesomeIcons.heart,
          size: 24,
          color:  Colors.white ,
        ),
      ),
    ) :
    Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topRight: Radius.circular(20),
       
        ),
        color :  Colors.white
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            isLiked[productId!] = !isProductLiked;
          });
          _handleAdddatafavorit(context, index);
                fetchData();
        },
        icon: Icon(
          FontAwesomeIcons.heart,
          size: 24,
          color: Colors.black,
        ),
      ),
    )
    ,
  );
}








  Widget productItem(BuildContext context, GetDataFav product, int index) {
    String imageUrl =
        "https://b387-202-67-46-229.ngrok-free.app/" + product.gambar.toString();
    return Stack(

      children: [
        Positioned.fill(
            child: Container(

              color: Colors.white,
              child:Column(
                  children :[
                  // InkWell(
                  // onTap: () {
                  //   Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //   builder: (_) => DetailsScreen(product: product),
                  //   ));
                  //   }),
                    Image.network(
                      imageUrl,
                      height: 148,
                      fit: BoxFit.cover,

                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 148,
                          color: Colors.grey,
                        );
                      },
                    ),
                    const SizedBox(height: 5,),
                    text(product)
                  ]),)
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 184,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  _handleAdddatakeranjang(context, index);
                },
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        favoriteIcon(index),

      ],
    );



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<GetDataFav>>(
        future: listblog,
        builder: (BuildContext context, AsyncSnapshot<List<GetDataFav>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<GetDataFav> data = snapshot.data!;
            return GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (BuildContext context, index) {
                return productItem(context, data[index], index);
              },
            );
          }
        },
      ),
    );
  }

  late SessionManager _sessionManager;
  
  Future<void> _handleAdddatakeranjang(BuildContext context, int index) async {
  _sessionManager = SessionManager();

  SessionManager.getIdCustomer().then((idCustomer) {
    var idCustomerString = idCustomer?.toString() ?? '';

    http.post(Uri.parse(ApiConnect.add_datakeranjang), body: {
      "id_customer": idCustomerString,
      "id_barang": listViews[index].idBarang.toString(),
      "qty": "1".toString(),
    }).then((response) {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final add_datakeranjang = AddChart.fromJson(jsonData);
        if (response.statusCode == 200) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CheckoutScreen()),
          );
        } else {
          Fluttertoast.showToast(
            msg: "Data Gagal masuk Keranjang",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: idCustomerString,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12,
        );
      }
    }).catchError((error) {
      // Handle error
      print('Error: $error');
    });
  });
}

Future<void> _handleAdddatafavorit(BuildContext context, int index) async {
    _sessionManager = SessionManager();

    SessionManager.getIdCustomer().then((idCustomer) {
      var idCustomerString = idCustomer?.toString() ?? '';



      http.post(Uri.parse(ApiConnect.add_datafavorit), body: {
        "id_customer": idCustomerString,
        "id_barang": listViews[index].idBarang.toString(),
      }).then((response) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final add_datafavorit = AddChart.fromJson(jsonData);
          if (response.statusCode == 200) {
            // Set status favorit menjadi true jika berhasil
        setState(() {
  isLiked[index] = true;
});

       
          } else {
            Fluttertoast.showToast(
              msg: "Data Gagal masuk Keranjang",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12,
            );
          }
        } else {
          Fluttertoast.showToast(
            msg: idCustomerString,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12,
          );
        }
      }).catchError((error) {
        // Handle error
        print('Error: $error');
      });
    });
  }


Future<void> _handledeleteData(BuildContext context, int index) async {
  _sessionManager = SessionManager();

  SessionManager.getIdCustomer().then((idCustomer) {
    var idCustomerString = idCustomer?.toString() ?? '';

    http.post(Uri.parse(ApiConnect.del_datafavorit), body: {
      "id_customer": idCustomerString,
      "id_barang": listViews[index].idBarang.toString(),
    }).then((response) {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final add_datafavorit = AddChart.fromJson(jsonData);
        if (response.statusCode == 200) {
          // Set status favorit menjadi true jika berhasil
          setState(() {
            isLiked[index] = true;
            listViews.removeAt(index); // Hapus item dari listViews
          });
        } else {
          Fluttertoast.showToast(
            msg: "Data Gagal masuk Keranjang",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: idCustomerString,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12,
        );
      }
    }).catchError((error) {
      // Handle error
      print('Error: $error');
    });
  });
}

}