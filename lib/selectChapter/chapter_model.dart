class ChapterModel {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  ChapterModel(this.id, this.title, this.description, this.imagePath);
}

List<ChapterModel> chaptersList = [
  ChapterModel(1, "Бүлэг-1", "Үсгэн ертөнцөд орсон хүүгийн ой дахь адал явдал ", "lib/assets/chapterImages/chapter1.png"),
  ChapterModel(2, "Бүлэг-2", "Түүнд зөвийг олоход нь туслаарай ", "lib/assets/chapterImages/chapter2.png"),
  ChapterModel(3, "Бүлэг-3", "Ойн амьтадтай танилцаарай ", "lib/assets/chapterImages/chapter3.png"),
  ChapterModel(4, "Бүлэг-4", "Тэр юу хийж байна вэ? ", "lib/assets/chapterImages/chapter4.png"),
];
