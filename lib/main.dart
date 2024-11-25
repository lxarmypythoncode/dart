import 'library.dart';
import 'book.dart';

void main() {
  final library = Library('data/books.json');

  // Example usage
  library.addBook(Book(title: 'Dart Programming', author: 'John Doe', yearPublished: 2022));
  library.searchBook('Dart');
}
