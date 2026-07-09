using books from '../../db/Books/Schema';

@path: 'booksservice'
service BookService {
  entity Books   as projection on books.Books;
  entity Authors as projection on books.Authors;
  entity Chapters as projection on books.Chapters;
  action countChapters(bookId: UUID) returns Integer;
}


