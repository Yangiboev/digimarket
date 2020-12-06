class Shops{
  String name;
  String phone;
  String workingHours;
  String address;
  String image;
  LatLng latLng;

  Shops(
      {this.name,
      this.phone,
      this.workingHours,
      this.address,
      this.image,
      this.latLng});
}

class LatLng{
  double long;
  double lat;

  LatLng({this.long, this.lat});
}

List<Shops> shops = [
  Shops(
    address: "<p>г. Ташкент, массив Чиланзар-6, ТЦ Bunyodkor</p>",
    image: "https://cdn.delever.uz/goodzone/3af8b7fb-f64a-4680-913e-f6c5187e3d6e",
    latLng: LatLng(
      lat: 41.283096,
      long: 69.211586,
    ),
    name: 'GOODZONE',
    phone: "+99871 207 03 07",
    workingHours: "с 10-00 до 21-00"
  ),
  Shops(
    address: "<p>15 Bunyodkor shoh ko'chasi, Тошкент</p>",
    image: "https://static-pano.maps.yandex.ru/v1/?panoid=1486677464_804339148_23_1570357988&size=500,240&azimuth=-65.1&tilt=10&signature=hBnHhJ3oSXRLsrIUmu0lKgKUAgUlfaItezUhlPijJp4=",
    latLng: LatLng(
      lat: 41.24539560672733,
      long: 69.16674139026753,
    ),
    name: 'Asaxiy',
    phone: "+99871 200 01 05",
    workingHours: "с 09-00 до 19-00"
  ),
  Shops(
    address: "<p>г. Ташкент, Яшнободский р-н, ул. Махтумкули, ТРЦ Atrium</p>",
    image: "https://olcha.uz/image/420x220/sliders/ru/zkXAfkPvURRgabkRfjGFarZ6bwj0LeczhzulxsmzQUGoagThN4ZeNtHEGpkv.png",
    latLng: LatLng(
      lat: 41.304638,
      long: 69.3077,
    ),
    name: 'Olcha',
    phone: "+99871 202 20 21",
    workingHours: "с 08-00 до 21-00",
  ),
  Shops(
    address: "<p>7Б Amir Temur Avenue, Tashkent 100093</p>",
    image: "https://texnomart.uz/files/global/icons/0b8e1468a6fcd267e536593c83c19a26.jpg",
    latLng: LatLng(
      lat: 41.304638,
      long: 69.3077,
    ),
    name: 'texnomart',
    phone: "+99871 209 99 44",
    workingHours: "с 09-00 до 20-30",
  ),
];