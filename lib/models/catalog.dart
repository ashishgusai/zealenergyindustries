class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iphone 12 pro",
        desc: "Apple iphoner 12th generation with advanced features",
        price: 50000,
        color: "#f46e6e",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwB_ISj1jklfaZfGRiHFR5OFQQ9TTZInlFY6SI0otyCu6r36tgzcJjkbv5kLhc5L_J8WGz-X8&usqp=CAc")
  ];
}

class Item {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? imageUrl;

  Item({this.id, this.name, this.desc, this.price, this.color, this.imageUrl});
}
