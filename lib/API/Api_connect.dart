
class ApiConnect {
  static const hostConnect = "https://67f2-202-67-40-235.ngrok-free.app";
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
       static const paymen = "$connectApi/getAllPaymen";
        static const jual = "$connectApi/storeJual";
         static const detiljual = "$connectApi/storeDetil";
         static const statusjual = "$connectApi/updateStatusKeranjang";
         static const getjual = "$connectApi/getDataJualByCustomer";
static const getNota = "$connectApi/getNota";
static const getKlaim = "$connectApi/getDetilJual";
static const bayar = "$connectApi/updateJual";

}