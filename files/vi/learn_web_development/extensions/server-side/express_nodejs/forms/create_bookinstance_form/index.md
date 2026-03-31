---
title: Biểu mẫu tạo BookInstance
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_BookInstance_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài viết con này cho thấy cách định nghĩa một trang/biểu mẫu để tạo các đối tượng `BookInstance`.
Điều này rất giống với biểu mẫu chúng ta đã sử dụng để [tạo các đối tượng `Book`](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_book_form).

## Import các phương thức kiểm tra hợp lệ và làm sạch

Mở tệp **/controllers/bookinstanceController.js**, và thêm các dòng sau vào đầu tệp:

```js
const { body, validationResult } = require("express-validator");
```

## Bộ điều khiển — route GET

Ở đầu tệp, yêu cầu module _Book_ (cần thiết vì mỗi `BookInstance` được liên kết với một `Book` cụ thể).

```js
const Book = require("../models/book");
```

Tìm phương thức bộ điều khiển `bookinstance_create_get()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display BookInstance create form on GET.
exports.bookinstance_create_get = async (req, res, next) => {
  const allBooks = await Book.find({}, "title").sort({ title: 1 }).exec();

  res.render("bookinstance_form", {
    title: "Create BookInstance",
    book_list: allBooks,
  });
};
```

Bộ điều khiển lấy danh sách đã sắp xếp của tất cả sách (`allBooks`) và truyền nó thông qua `book_list` đến view **`bookinstance_form.pug`** (cùng với `title`).
Lưu ý rằng không có sách nào được chọn khi chúng ta hiển thị biểu mẫu này lần đầu, vì vậy chúng ta không truyền biến `selected_book` vào `render()`.
Vì điều này, `selected_book` sẽ có giá trị `undefined` trong template.

## Bộ điều khiển — route POST

Tìm phương thức bộ điều khiển `bookinstance_create_post()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Handle BookInstance create on POST.
exports.bookinstance_create_post = [
  // Validate and sanitize fields.
  body("book", "Book must be specified").trim().isLength({ min: 1 }).escape(),
  body("imprint", "Imprint must be specified")
    .trim()
    .isLength({ min: 1 })
    .escape(),
  body("status").escape(),
  body("due_back", "Invalid date")
    .optional({ values: "falsy" })
    .isISO8601()
    .toDate(),

  // Process request after validation and sanitization.
  async (req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    // Create a BookInstance object with escaped and trimmed data.
    const bookInstance = new BookInstance({
      book: req.body.book,
      imprint: req.body.imprint,
      status: req.body.status,
      due_back: req.body.due_back,
    });

    if (!errors.isEmpty()) {
      // There are errors.
      // Render form again with sanitized values and error messages.
      const allBooks = await Book.find({}, "title").sort({ title: 1 }).exec();

      res.render("bookinstance_form", {
        title: "Create BookInstance",
        book_list: allBooks,
        selected_book: bookInstance.book._id,
        errors: errors.array(),
        bookinstance: bookInstance,
      });
      return;
    }

    // Data from form is valid
    await bookInstance.save();
    res.redirect(bookInstance.url);
  },
];
```

Cấu trúc và hành vi của mã này giống như khi tạo các đối tượng khác của chúng ta.
Đầu tiên chúng ta kiểm tra hợp lệ và làm sạch dữ liệu. Nếu dữ liệu không hợp lệ, chúng ta hiển thị lại biểu mẫu cùng với dữ liệu mà người dùng đã nhập ban đầu và danh sách thông báo lỗi.
Nếu dữ liệu hợp lệ, chúng ta lưu bản ghi `BookInstance` mới và chuyển hướng người dùng đến trang chi tiết.

## View

Tạo tệp **/views/bookinstance_form.pug** và sao chép nội dung văn bản dưới đây vào.

```pug
extends layout

block content
  h1=title

  form(method='POST')
    div.form-group
      label(for='book') Book:
      select#book.form-control(name='book' required)
        option(value='') --Please select a book--
        for book in book_list
          if selected_book==book._id.toString()
            option(value=book._id, selected) #{book.title}
          else
            option(value=book._id) #{book.title}

    div.form-group
      label(for='imprint') Imprint:
      input#imprint.form-control(type='text' placeholder='Publisher and date information' name='imprint' required value=(undefined===bookinstance ? '' : bookinstance.imprint) )
    div.form-group
      label(for='due_back') Date when book available:
      input#due_back.form-control(type='date' name='due_back' value=(undefined===bookinstance ? '' : bookinstance.due_back_yyyy_mm_dd))

    div.form-group
      label(for='status') Status:
      select#status.form-control(name='status' required)
        option(value='') --Please select a status--
        each val in ['Maintenance', 'Available', 'Loaned', 'Reserved']
          if undefined===bookinstance || bookinstance.status!=val
            option(value=val)= val
          else
            option(value=val selected)= val

    button.btn.btn-primary(type='submit') Submit

  if errors
    ul
      for error in errors
        li!= error.msg
```

> [!NOTE]
> Template trên mã hóa cứng các giá trị _Status_ (Maintenance, Available, v.v.) và không "ghi nhớ" các giá trị người dùng đã nhập.
> Nếu bạn muốn, hãy xem xét triển khai lại danh sách, truyền dữ liệu tùy chọn từ bộ điều khiển và đặt giá trị đã chọn khi biểu mẫu được hiển thị lại.

Cấu trúc và hành vi của view gần như giống với template **book_form.pug**, vì vậy chúng ta sẽ không đi vào chi tiết.
Một điều cần lưu ý là dòng nơi chúng ta đặt ngày "hạn trả" thành `bookinstance.due_back_yyyy_mm_dd` nếu chúng ta đang điền vào date input cho một phiên bản hiện có.

```pug
input#due_back.form-control(type='date', name='due_back' value=(undefined===bookinstance ? '' : bookinstance.due_back_yyyy_mm_dd))
```

Giá trị ngày tháng phải được đặt theo định dạng `YYYY-MM-DD` vì đây là yêu cầu của [các phần tử `<input>` với `type="date"`](/en-US/docs/Web/HTML/Reference/Elements/input/date), tuy nhiên ngày tháng không được lưu trữ theo định dạng này nên chúng ta phải chuyển đổi nó trước khi đặt giá trị trong control.
Phương thức `due_back_yyyy_mm_dd()` được thêm vào model `BookInstance` trong phần tiếp theo.

## Model — phương thức ảo `due_back_yyyy_mm_dd()`

Mở tệp nơi bạn định nghĩa model `BookInstanceSchema` (**models/bookinstance.js**).
Thêm hàm ảo `due_back_yyyy_mm_dd()` được hiển thị dưới đây (sau hàm ảo `due_back_formatted()`):

```js
BookInstanceSchema.virtual("due_back_yyyy_mm_dd").get(function () {
  return DateTime.fromJSDate(this.due_back).toISODate(); // format 'YYYY-MM-DD'
});
```

## Kết quả trông như thế nào?

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`.
Sau đó chọn liên kết _Create new book instance (copy)_. Nếu mọi thứ được thiết lập đúng, trang web của bạn trông giống như ảnh chụp màn hình sau. Sau khi bạn gửi một `BookInstance` hợp lệ, nó sẽ được lưu và bạn sẽ được đưa đến trang chi tiết.

![Create BookInstance of the Local library application screenshot from localhost:3000. The page is divided into two columns. The narrow left column has a vertical navigation bar with 10 links separated into two sections by a light-colored horizontal line. The top section link to already created data. The bottom links go to create new data forms. The wide right column has the create book instance form with a 'Create BookInstance' heading and four input fields labeled 'Book', 'Imprint', 'Date when book available' and 'Status'. The form is filled. There is a 'Submit' button at the bottom of the form.](locallibary_express_bookinstance_create_empty.png)

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms).
- Tiếp tục đến bài viết con tiếp theo của phần 6: [Biểu mẫu xóa Tác giả](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Delete_author_form).
