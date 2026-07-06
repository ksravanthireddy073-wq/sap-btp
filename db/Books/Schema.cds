namespace books;
using { cuid, managed, temporal, Country, Currency } from '@sap/cds/common';
entity Books : cuid, managed {
  Key bookNumber: String;
  Title: String;
  Author: Association to Authors;
  PublishedYear: Integer;
  Address: String;
}
entity Authors {
  key ID: Integer;
  Name: String;
  BirthYear: Integer;
  Nationality: String;
}