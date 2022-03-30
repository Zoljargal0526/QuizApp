class ChapterModel {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  ChapterModel(this.id, this.title, this.description, this.imagePath);
}

List<ChapterModel> chaptersList = [
  ChapterModel(1, "chapter1", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter1.jpg"),
  ChapterModel(2, "chapter2", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter2.gif"),
  ChapterModel(3, "chapter3", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter1.jpg"),
  ChapterModel(4, "chapter4", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter2.gif"),
];
