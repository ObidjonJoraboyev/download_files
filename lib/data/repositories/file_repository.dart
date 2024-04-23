import 'package:dowload_files/data/models/file_data_model.dart';

class FileRepository {
  List<FileDataModel> files = [
    FileDataModel(
      category: CategoryFile.programming,
      iconPath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Python.svg/1200px-Python.svg.png",
      fileName: "Python Book",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    ),
    FileDataModel(
      category: CategoryFile.programming,
      iconPath:
          "https://www.edx.org/contentful/ii9ehdcj88bc/5Fk8Zn3c8NnkOKI3zGxts1/0e87218f05be32b9567765dbae06c4a8/Math-1-1.jpg?w=1024&q=50&fm=webp",
      fileName: "Matematika",
      fileUrl:
          "https://api.ziyonet.uz/uploads/books/10001253/mfQgyLU7SfeTxYL.pdf",
    ),
    FileDataModel(
      category: CategoryFile.traffic,
      iconPath:
          "https://www.recruiter.com/recruiting/wp-content/uploads/2022/04/motivation.jpg",
      fileName: "AVTOREFERATI",
      fileUrl:
          "https://api.ziyonet.uz/uploads/books/10001253/C6GiNFCqGHeijpd.pdf",
    ),
    FileDataModel(
      category: CategoryFile.language,
      iconPath:
          "https://tneg.nl/wp-content/uploads/russisches-sprachstudio-jetzt-neu-beim-bahnhof-stadelhofen.jpg",
      fileName: "Rus tili",
      fileUrl:
          "https://api.ziyonet.uz/uploads/books/10000122/AUP4IYf59FwJtVk.pdf",
    ),
    FileDataModel(
      category: CategoryFile.improve,
      iconPath:
          "https://res.cloudinary.com/drt2tlz1j/images/f_auto,q_auto/v1688999281/fn1/Water-management-water-garden/Water-management-water-garden.jpg",
      fileName: "Suv xo'jaligi",
      fileUrl: "https://api.ziyonet.uz/uploads/books/7007/61b9f3cda54d6.pdf",
    ),
    FileDataModel(
      category: CategoryFile.traffic,
      iconPath:
          "https://millennialmagazine.com/wp-content/uploads/2021/11/traffic-laws.jpg",
      fileName: "Yo'l harakati qoidalari",
      fileUrl: "https://api.ziyonet.uz/uploads/books/635517/5e4b80494b31c.pdf",
    ),
  ];
}
