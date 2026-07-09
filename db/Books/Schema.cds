namespace books;
using { cuid, managed, temporal, Country, Currency } from '@sap/cds/common';
entity Books : cuid, managed {
  Key bookNumber: String;
  Title: String(100);
  Author: String(100);
  PublishedYear: Integer;
  Address: String(500);
  a_authers:Association to Authors;
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
  Book: Association to Books;
  ChapterNumber: Integer;
  Content: LargeString;
}