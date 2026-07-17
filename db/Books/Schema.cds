namespace books;
using { cuid, managed, temporal, Country, Currency } from '@sap/cds/common';
entity Books : cuid, managed {
  Key bookNumber: String;
  Title: String(100);
  PublishedYear: Integer;
  Address: String(500);
  a_authors: Association to Authors;
  a_chapters: Association to many Chapters on a_chapters.Book_ID = $self.ID;
}
entity Authors {
  key ID: Integer;
  Name: String(100);
  BirthYear: Integer;
  Nationality: String(50);
}

entity Chapters {
  key ID: Integer;
  Title: String(100);
  Book_ID: UUID;
  ChapterNumber: Integer;
  Content: LargeString;
}