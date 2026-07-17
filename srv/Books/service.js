const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
  const { Books, Authors } = this.entities;

  // ── Books CRUD handlers ──────────────────────────────────────────────────

  this.before('CREATE', Books, async (req) => {
    if (!req.data.bookNumber) req.error(400, 'bookNumber is required');
    if (!req.data.Title) req.error(400, 'Title is required');
  });

  this.after('READ', Books, (books) => {
    // Post-processing hook – extend or mask fields if needed
    return books;
  });

  // ── Authors CRUD handlers ────────────────────────────────────────────────

  this.before('CREATE', Authors, async (req) => {
    if (!req.data.Name) req.error(400, 'Author Name is required');
  });

  this.after('READ', Authors, (authors) => {
    return authors;
  });

  // ── countChapters action ─────────────────────────────────────────────────
  //  Custom action: returns the number of chapters for a given book.
  //  Standard CRUD cannot return a computed aggregate like this directly.

  this.on('countChapters', async (req) => {
    const { bookId } = req.data;
    const { Books, Chapters } = this.entities;

    // 1. Verify the book exists
    const book = await SELECT.one.from(Books).where({ ID: bookId });
    if (!book) return req.error(404, `Book '${bookId}' not Created`);

    // 2. Count its chapters
    const { count } = await SELECT.one
      .from(Chapters)
      .columns('count(*) as count')
      .where({ Book_ID: bookId });

    return Number(count);
  });
});
