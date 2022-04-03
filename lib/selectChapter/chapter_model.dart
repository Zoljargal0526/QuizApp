class ChapterModel {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  ChapterModel(this.id, this.title, this.description, this.imagePath);
}

List<ChapterModel> chaptersList = [
  ChapterModel(1, "Бүлэг-1", "Үсгэн ертөнцөд орсон хүүгийн ой дахь адал явдал ", "lib/assets/chapterImages/chapter1.png"),
  ChapterModel(2, "Бүлэг-2", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter2.gif"),
  ChapterModel(3, "Бүлэг-3", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter1.png"),
  ChapterModel(4, "Бүлэг-4", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter2.gif"),
];
