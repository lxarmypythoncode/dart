import 'dart:convert';
import 'dart:io';
import 'book.dart';

class Library {
  List<Book> bookList = [];

  Library(String dataFile) {
    loadBooks(dataFile);
  }

  void loadBooks(String dataFile) {
    final file = File(dataFile);
    if (file.existsSync()) {
      final jsonData = file.readAsStringSync();
      List<dynamic> booksData = json.decode(jsonData);
      bookList = booksData.map((data) => Book(
        title: data['title'],
        author: data['author'],
        yearPublished: data['yearPublished'],
      )).toList();
    } else {
      print('Data file does not exist.');
    }
  }

  void addBook(Book book) {
    bookList.add(book);
    print('Book "${book.title}" has been added.');
  }

  void searchBook(String title) {
    final results = bookList.where((book) => book.title.toLowerCase().contains(title.toLowerCase()));
    if (results.isNotEmpty) {
      results.forEach((book) {
        print('Found: ${book.title} by ${book.author} (${book.yearPublished})');
      });
    } else {
      print('No books found with title containing "$title".');
    }
  }
}
