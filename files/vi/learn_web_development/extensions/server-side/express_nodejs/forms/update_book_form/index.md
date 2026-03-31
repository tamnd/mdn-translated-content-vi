---
title: Biểu mẫu cập nhật sách
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Update_Book_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài viết con cuối cùng này cho thấy cách định nghĩa một trang để cập nhật các đối tượng `Book`. Xử lý biểu mẫu khi cập nhật một cuốn sách rất giống như khi tạo sách, ngoại trừ bạn phải điền sẵn biểu mẫu trong route `GET` với các giá trị từ cơ sở dữ liệu.

## Bộ điều khiển — route GET

Mở tệp **/controllers/bookController.js**. Tìm phương thức bộ điều khiển `book_update_get()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display book update form on GET.
exports.book_update_get = async (req, res, next) => {
  // Get book, authors and genres for form.
  const [book, allAuthors, allGenres] = await Promise.all([
    Book.findById(req.params.id).populate("author").exec(),
    Author.find().sort({ family_name: 1 }).exec(),
    Genre.find().sort({ name: 1 }).exec(),
  ]);

  if (book === null) {
    // No results.
    const err = new Error("Book not found");
    err.status = 404;
    return next(err);
  }

  // Mark our selected genres as checked.
  allGenres.forEach((genre) => {
    if (book.genre.includes(genre._id)) genre.checked = "true";
  });

  res.render("book_form", {
    title: "Update Book",
    authors: allAuthors,
    genres: allGenres,
    book,
  });
};
```

Bộ điều khiển lấy id của `Book` cần cập nhật từ tham số URL (`req.params.id`).
Nó `awaits` trên promise được trả về bởi `Promise.all()` để lấy bản ghi `Book` được chỉ định (điền vào các trường thể loại và tác giả) và tất cả các bản ghi `Author` và `Genre`.

Khi các hoạt động hoàn tất, hàm kiểm tra xem có sách nào được tìm thấy không, và nếu không tìm thấy, sẽ gửi lỗi "Book not found" đến middleware xử lý lỗi.

> [!NOTE]
> Không tìm thấy bất kỳ kết quả sách nào **không phải là lỗi** đối với tìm kiếm, nhưng nó lại là lỗi cho ứng dụng này vì chúng ta biết phải có một bản ghi sách phù hợp! Đoạn mã trên kiểm tra (`book===null`) trong callback, nhưng nó cũng có thể đã nối phương thức [`orFail()`](<https://mongoosejs.com/docs/api/query.html#Query.prototype.orFail()>) vào truy vấn.

Sau đó chúng ta đánh dấu các thể loại hiện đang được chọn là checked và sau đó hiển thị view **book_form.pug**, truyền các biến cho `title`, book, tất cả `authors`, và tất cả `genres`.

## Bộ điều khiển — route POST

Tìm phương thức bộ điều khiển `book_update_post()` đã được xuất, và thay thế bằng đoạn mã sau.

```js
// Handle book update on POST.
exports.book_update_post = [
  // Convert the genre to an array.
  (req, res, next) => {
    if (!Array.isArray(req.body.genre)) {
      req.body.genre =
        typeof req.body.genre === "undefined" ? [] : [req.body.genre];
    }
    next();
  },

  // Validate and sanitize fields.
  body("title", "Title must not be empty.")
    .trim()
    .isLength({ min: 1 })
    .escape(),
  body("author", "Author must not be empty.")
    .trim()
    .isLength({ min: 1 })
    .escape(),
  body("summary", "Summary must not be empty.")
    .trim()
    .isLength({ min: 1 })
    .escape(),
  body("isbn", "ISBN must not be empty").trim().isLength({ min: 1 }).escape(),
  body("genre.*").escape(),

  // Process request after validation and sanitization.
  async (req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    // Create a Book object with escaped/trimmed data and old id.
    const book = new Book({
      title: req.body.title,
      author: req.body.author,
      summary: req.body.summary,
      isbn: req.body.isbn,
      genre: typeof req.body.genre === "undefined" ? [] : req.body.genre,
      _id: req.params.id, // This is required, or a new ID will be assigned!
    });

    if (!errors.isEmpty()) {
      // There are errors. Render form again with sanitized values/error messages.

      // Get all authors and genres for form
      const [allAuthors, allGenres] = await Promise.all([
        Author.find().sort({ family_name: 1 }).exec(),
        Genre.find().sort({ name: 1 }).exec(),
      ]);

      // Mark our selected genres as checked.
      for (const genre of allGenres) {
        if (book.genre.indexOf(genre._id) > -1) {
          genre.checked = "true";
        }
      }
      res.render("book_form", {
        title: "Update Book",
        authors: allAuthors,
        genres: allGenres,
        book,
        errors: errors.array(),
      });
      return;
    }

    // Data from form is valid. Update the record.
    const updatedBook = await Book.findByIdAndUpdate(req.params.id, book, {});
    // Redirect to book detail page.
    res.redirect(updatedBook.url);
  },
];
```

Điều này rất giống với route POST được sử dụng khi tạo một `Book`.
Đầu tiên chúng ta kiểm tra hợp lệ và làm sạch dữ liệu sách từ biểu mẫu và sử dụng nó để tạo một đối tượng `Book` mới (đặt giá trị `_id` của nó thành id của đối tượng cần cập nhật). Nếu có lỗi khi chúng ta kiểm tra hợp lệ dữ liệu thì chúng ta hiển thị lại biểu mẫu, ngoài ra còn hiển thị dữ liệu mà người dùng đã nhập, các lỗi, và danh sách các thể loại và tác giả. Nếu không có lỗi thì chúng ta gọi `Book.findByIdAndUpdate()` để cập nhật tài liệu `Book`, và sau đó chuyển hướng đến trang chi tiết của nó.

## View

Không cần thay đổi view cho biểu mẫu (**/views/book_form.pug**) vì cùng một template hoạt động cho cả việc tạo và cập nhật sách.

## Thêm nút cập nhật

Mở view **book_detail.pug** và đảm bảo có các liên kết để xóa và cập nhật sách ở cuối trang, như được hiển thị dưới đây.

```pug
  hr
  p
    a(href=book.url+'/delete') Delete Book
  p
    a(href=book.url+'/update') Update Book
```

Bây giờ bạn có thể cập nhật sách từ trang _chi tiết Sách_.

## Kết quả trông như thế nào?

Chạy ứng dụng, mở trình duyệt đến `http://localhost:3000/`, chọn liên kết _All books_, sau đó chọn một cuốn sách cụ thể. Cuối cùng chọn liên kết _Update Book_.

Biểu mẫu trông giống như trang _Create book_, chỉ với tiêu đề 'Update book', và được điền sẵn với các giá trị bản ghi.

![The update book section of the Local library application. The left column has a vertical navigation bar. The right column has a form to update the book with a heading that reads 'Update book'. There are five input fields labelled Title, Author, Summary, ISBN, Genre. Genre is a checkbox option field. There is a button labelled 'Submit' at the end.](locallibary_express_book_update_noerrors.png)

> [!NOTE]
> Các trang khác để cập nhật đối tượng có thể được triển khai theo cách tương tự. Chúng ta đã để điều đó như một thử thách.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms).
