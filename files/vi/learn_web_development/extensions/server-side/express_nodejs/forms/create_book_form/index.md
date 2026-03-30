---
title: Biểu mẫu tạo sách
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_book_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài viết con này cho thấy cách định nghĩa một trang/biểu mẫu để tạo các đối tượng `Book`. Điều này phức tạp hơn một chút so với các trang `Author` hoặc `Genre` tương đương vì chúng ta cần lấy và hiển thị các bản ghi `Author` và `Genre` có sẵn trong biểu mẫu `Book` của mình.

## Import các phương thức kiểm tra hợp lệ và làm sạch

Mở tệp **/controllers/bookController.js**, và thêm dòng sau vào đầu tệp (trước các hàm tuyến đường):

```js
const { body, validationResult } = require("express-validator");
```

## Bộ điều khiển — tuyến đường GET

Tìm phương thức bộ điều khiển `book_create_get()` đã được xuất và thay thế bằng đoạn mã sau:

```js
// Display book create form on GET.
exports.book_create_get = async (req, res, next) => {
  // Get all authors and genres, which we can use for adding to our book.
  const [allAuthors, allGenres] = await Promise.all([
    Author.find().sort({ family_name: 1 }).exec(),
    Genre.find().sort({ name: 1 }).exec(),
  ]);

  res.render("book_form", {
    title: "Create Book",
    authors: allAuthors,
    genres: allGenres,
  });
};
```

Điều này sử dụng `await` trên kết quả của `Promise.all()` để lấy tất cả các đối tượng `Author` và `Genre` song song (cách tiếp cận tương tự được sử dụng trong [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data)).
Chúng sau đó được truyền vào view **`book_form.pug`** như các biến có tên `authors` và `genres` (cùng với `title` của trang).

## Bộ điều khiển — tuyến đường POST

Tìm phương thức bộ điều khiển `book_create_post()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Handle book create on POST.
exports.book_create_post = [
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

    // Create a Book object with escaped and trimmed data.
    const book = new Book({
      title: req.body.title,
      author: req.body.author,
      summary: req.body.summary,
      isbn: req.body.isbn,
      genre: req.body.genre,
    });

    if (!errors.isEmpty()) {
      // There are errors. Render form again with sanitized values/error messages.

      // Get all authors and genres for form.
      const [allAuthors, allGenres] = await Promise.all([
        Author.find().sort({ family_name: 1 }).exec(),
        Genre.find().sort({ name: 1 }).exec(),
      ]);

      // Mark our selected genres as checked.
      for (const genre of allGenres) {
        if (book.genre.includes(genre._id)) {
          genre.checked = "true";
        }
      }
      res.render("book_form", {
        title: "Create Book",
        authors: allAuthors,
        genres: allGenres,
        book,
        errors: errors.array(),
      });
      return;
    }

    // Data from form is valid. Save book.
    await book.save();
    res.redirect(book.url);
  },
];
```

Cấu trúc và hành vi của mã này gần như hoàn toàn giống như các hàm tuyến đường POST cho các biểu mẫu [`Genre`](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_genre_form) và [`Author`](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_author_form). Đầu tiên chúng ta kiểm tra hợp lệ và làm sạch dữ liệu. Nếu dữ liệu không hợp lệ thì chúng ta hiển thị lại biểu mẫu cùng với dữ liệu mà người dùng đã nhập ban đầu và danh sách thông báo lỗi. Nếu dữ liệu hợp lệ, chúng ta lưu bản ghi `Book` mới và chuyển hướng người dùng đến trang chi tiết sách.

Sự khác biệt chính so với mã xử lý biểu mẫu khác là cách chúng ta làm sạch thông tin thể loại.
Biểu mẫu trả về một mảng các mục `Genre` (trong khi với các trường khác nó trả về một chuỗi).
Để kiểm tra hợp lệ thông tin, trước tiên chúng ta chuyển đổi yêu cầu thành một mảng (cần thiết cho bước tiếp theo).

```js
[
  // Convert the genre to an array.
  (req, res, next) => {
    if (!Array.isArray(req.body.genre)) {
      req.body.genre =
        typeof req.body.genre === "undefined" ? [] : [req.body.genre];
    }
    next();
  },
  // …
];
```

Sau đó chúng ta sử dụng ký tự đại diện (`*`) trong sanitizer để kiểm tra hợp lệ từng mục mảng thể loại một cách riêng lẻ. Đoạn mã dưới đây cho thấy cách — điều này dịch thành "làm sạch mọi mục dưới khóa `genre`".

```js
[
  // …
  body("genre.*").escape(),
  // …
];
```

Sự khác biệt cuối cùng so với mã xử lý biểu mẫu khác là chúng ta cần truyền vào tất cả các thể loại và tác giả hiện có vào biểu mẫu.
Để đánh dấu các thể loại đã được người dùng chọn, chúng ta lặp qua tất cả các thể loại và thêm tham số `checked="true"` cho những thể loại nằm trong dữ liệu POST của chúng ta (như được tái tạo trong đoạn mã dưới đây).

```js
// Mark our selected genres as checked.
for (const genre of allGenres) {
  if (book.genre.includes(genre._id)) {
    genre.checked = "true";
  }
}
```

## View

Tạo tệp **/views/book_form.pug** và sao chép nội dung văn bản dưới đây vào.

```pug
extends layout

block content
  h1= title

  form(method='POST')
    div.form-group
      label(for='title') Title:
      input#title.form-control(type='text', placeholder='Name of book' name='title' required value=(undefined===book ? '' : book.title) )
    div.form-group
      label(for='author') Author:
      select#author.form-control(name='author' required)
        option(value='') --Please select an author--
        for author in authors
          if book
            if author._id.toString()===book.author._id.toString()
              option(value=author._id selected) #{author.name}
            else
              option(value=author._id) #{author.name}
          else
            option(value=author._id) #{author.name}
    div.form-group
      label(for='summary') Summary:
      textarea#summary.form-control(placeholder='Summary' name='summary' required)= undefined===book ? '' : book.summary
    div.form-group
      label(for='isbn') ISBN:
      input#isbn.form-control(type='text', placeholder='ISBN13' name='isbn' value=(undefined===book ? '' : book.isbn) required)
    div.form-group
      label Genre:
      div
        for genre in genres
          div(style='display: inline; padding-right:10px;')
            if genre.checked
              input.checkbox-input(type='checkbox', name='genre', id=genre._id, value=genre._id, checked)
            else
              input.checkbox-input(type='checkbox', name='genre', id=genre._id, value=genre._id)
            label(for=genre._id) &nbsp;#{genre.name}
    button.btn.btn-primary(type='submit') Submit

  if errors
    ul
      for error in errors
        li!= error.msg
```

Cấu trúc và hành vi của view gần như giống với template **genre_form.pug**.

Sự khác biệt chính là trong cách chúng ta triển khai các trường kiểu chọn: `Author` và `Genre`.

- Tập hợp các thể loại được hiển thị dưới dạng hộp kiểm, và sử dụng giá trị `checked` mà chúng ta đặt trong bộ điều khiển để xác định xem hộp có nên được chọn hay không.
- Tập hợp các tác giả được hiển thị dưới dạng danh sách thả xuống chọn đơn được sắp xếp theo thứ tự bảng chữ cái (danh sách được truyền vào template đã được sắp xếp, vì vậy chúng ta không cần làm điều đó trong template).
  Nếu người dùng đã chọn tác giả của cuốn sách trước đó (tức là khi sửa các giá trị trường không hợp lệ sau khi gửi biểu mẫu ban đầu, hoặc khi cập nhật chi tiết sách) thì tác giả sẽ được chọn lại khi biểu mẫu được hiển thị. Ở đây chúng ta xác định tác giả nào cần chọn bằng cách so sánh id của tùy chọn tác giả hiện tại với giá trị mà người dùng đã nhập trước đó (được truyền vào thông qua biến `book`).

> [!NOTE]
> Nếu có lỗi trong biểu mẫu đã gửi, thì khi biểu mẫu cần được hiển thị lại, id của tác giả sách mới và id của tác giả sách hiện có sẽ có kiểu `Schema.Types.ObjectId`. Vì vậy để so sánh chúng, chúng ta phải chuyển đổi chúng thành chuỗi trước.

## Kết quả trông như thế nào?

Chạy ứng dụng, mở trình duyệt đến `http://localhost:3000/`, sau đó chọn liên kết _Create new book_. Nếu mọi thứ được thiết lập đúng, trang web của bạn trông giống như ảnh chụp màn hình sau. Sau khi bạn gửi một cuốn sách hợp lệ, nó sẽ được lưu và bạn sẽ được đưa đến trang chi tiết sách.

![Screenshot of empty Local library Create Book form on localhost:3000. The page is divided into two columns. The narrow left column has a vertical navigation bar with 10 links separated into two sections by a light-colored horizontal line. The top section link to already created data. The bottom links go to create new data forms. The wide right column has the create book form with a 'Create Book' heading and four input fields labeled 'Title', 'Author', 'Summary', 'ISBN' and 'Genre' followed by four genre checkboxes: fantasy, science fiction, french poetry and action. There is a 'Submit' button at the bottom of the form.](locallibary_express_book_create_empty.png)

## Các bước tiếp theo

Quay lại [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms).

Tiếp tục đến bài viết con tiếp theo của phần 6: [Biểu mẫu tạo BookInstance](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_BookInstance_form).
