class Book {
  String title;
  String author;
  int yearPublished;
  bool isBorrowed;

  Book({required this.title, required this.author, required this.yearPublished})
      : isBorrowed = false;

  void borrow() {
    if (!isBorrowed) {
      isBorrowed = true;
      print('Book "$title" has been borrowed.');
    } else {
      print('Book "$title" is already borrowed.');
    }
  }

  void returnBook() {
    if (isBorrowed) {
      isBorrowed = false;
      print('Book "$title" has been returned.');
    } else {
      print('Book "$title" was not borrowed.');
    }
  }
}
