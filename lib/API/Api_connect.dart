
class ApiConnect {
  static const hostConnect = "https://b387-202-67-46-229.ngrok-free.app";
  static const connectApi ="$hostConnect/api";
  static const login = "$connectApi/login";
  static const barang = "$connectApi/getDataBarang";
    static const favorit = "$connectApi/getDataBarangFav";
  static const register = "$connectApi/";
  static const add_datakeranjang = "$connectApi/addDataKeranjang";
  static const add_datafavorit = "$connectApi/addDataFavorit";
    static const del_datafavorit = "$connectApi/deleteDataFavorit";
        static const keranjang = "$connectApi/getDataKeranjang";
        static const addQty = "$connectApi/updateDataKeranjang";
         static const minQty = "$connectApi/updateQty";
         static const total = "$connectApi/getTotalKeranjang";



}