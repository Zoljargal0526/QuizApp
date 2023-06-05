class ChapterModel {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  ChapterModel(this.id, this.title, this.description, this.imagePath);
}

List<ChapterModel> chaptersList = [
  ChapterModel(1, "Бүлэг-1", "Үсгэн ертөнцөд орсон хүүгийн ой дахь адал явдал ",
      "assets/chapterImages/chapter1.png"),
  ChapterModel(2, "Бүлэг-2", "Түүнд зөвийг олоход нь туслаарай ",
      "assets/chapterImages/chapter2.png"),
  ChapterModel(3, "Бүлэг-3", "Ойн амьтадтай танилцаарай ",
      "assets/chapterImages/chapter3.png"),
  ChapterModel(4, "Бүлэг-4", "Тэр юу хийж байна вэ? ",
      "assets/chapterImages/chapter4.png"),
  ChapterModel(5, "Нэмэлт бүлэг", "Минутанд хэдэн үг уншиж чадах вэ? ",
      "assets/chapterImages/chap5.jpg"),
  ChapterModel(6, "Үгсийн сан", "Энэ аpp-д ашигласан үгс",
      "assets/chapterImages/chap6.jpg"),
];
