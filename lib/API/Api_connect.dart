
class ApiConnect {
      static const hostConnect = "https://fd01-202-154-18-72.ngrok-free.app";
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
    static const detilbarang = "$connectApi/getDetilBarang";

    static const updatebarang = "$connectApi/updateDataBarang";
    static const profil = "$connectApi/getUserById";
    static const updateprofil = "$connectApi/updateProfile";
      static const kategori = "$connectApi/kategori";
              static const triger = "$connectApi/updateDataBarang";
}