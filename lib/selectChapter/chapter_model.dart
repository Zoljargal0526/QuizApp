class ChapterModel {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  ChapterModel(this.id, this.title, this.description, this.imagePath);
}

List<ChapterModel> chaptersList = [
  ChapterModel(1, "title", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter1.jpg"),
  ChapterModel(2, "title1", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter2.gif"),
  ChapterModel(3, "title2", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter1.jpg"),
  ChapterModel(4, "title3", "asd hasdhas aod asoid aosid has ", "lib/assets/chapterImages/chapter2.gif"),
];
