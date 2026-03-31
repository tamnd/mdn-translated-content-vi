---
title: Biểu mẫu tạo tác giả
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_author_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài viết con này cho thấy cách định nghĩa một trang để tạo các đối tượng `Author`.

## Import các phương thức kiểm tra hợp lệ và làm sạch

Như với [biểu mẫu thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_genre_form), để sử dụng _express-validator_, chúng ta phải _require_ các hàm mà chúng ta muốn sử dụng.

Mở tệp **/controllers/authorController.js**, và thêm dòng sau vào đầu tệp (trên các hàm route):

```js
const { body, validationResult } = require("express-validator");
```

## Bộ điều khiển — route GET

Tìm phương thức bộ điều khiển `author_create_get()` đã được xuất và thay thế bằng đoạn mã sau. Điều này hiển thị view **author_form.pug**, truyền vào một biến `title`.

```js
// Display Author create form on GET.
exports.author_create_get = (req, res, next) => {
  res.render("author_form", { title: "Create Author" });
};
```

## Bộ điều khiển — route POST

Tìm phương thức bộ điều khiển `author_create_post()` đã được xuất, và thay thế bằng đoạn mã sau.

```js
// Handle Author create on POST.
exports.author_create_post = [
  // Validate and sanitize fields.
  body("first_name")
    .trim()
    .isLength({ min: 1 })
    .escape()
    .withMessage("First name must be specified.")
    .isAlphanumeric()
    .withMessage("First name has non-alphanumeric characters."),
  body("family_name")
    .trim()
    .isLength({ min: 1 })
    .escape()
    .withMessage("Family name must be specified.")
    .isAlphanumeric()
    .withMessage("Family name has non-alphanumeric characters."),
  body("date_of_birth", "Invalid date of birth")
    .optional({ values: "falsy" })
    .isISO8601()
    .toDate(),
  body("date_of_death", "Invalid date of death")
    .optional({ values: "falsy" })
    .isISO8601()
    .toDate(),

  // Process request after validation and sanitization.
  async (req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    // Create Author object with escaped and trimmed data
    const author = new Author({
      first_name: req.body.first_name,
      family_name: req.body.family_name,
      date_of_birth: req.body.date_of_birth,
      date_of_death: req.body.date_of_death,
    });

    if (!errors.isEmpty()) {
      // There are errors. Render form again with sanitized values/errors messages.
      res.render("author_form", {
        title: "Create Author",
        author,
        errors: errors.array(),
      });
      return;
    }

    // Data from form is valid.
    // Save and redirect to new author record.
    await author.save();
    res.redirect(author.url);
  },
];
```

> [!WARNING]
> Đừng bao giờ kiểm tra hợp lệ _tên_ sử dụng `isAlphanumeric()` (như chúng ta đã làm ở trên) vì có nhiều tên sử dụng các bộ ký tự khác.
> Chúng ta làm ở đây để trình bày cách sử dụng validator, và cách nó có thể được nối với các validator khác và báo cáo lỗi.

Cấu trúc và hành vi của mã này gần như hoàn toàn giống như khi tạo một đối tượng `Genre`. Đầu tiên chúng ta kiểm tra hợp lệ và làm sạch dữ liệu. Nếu dữ liệu không hợp lệ thì chúng ta hiển thị lại biểu mẫu cùng với dữ liệu mà người dùng đã nhập ban đầu và danh sách thông báo lỗi. Nếu dữ liệu hợp lệ thì chúng ta lưu bản ghi tác giả mới và chuyển hướng người dùng đến trang chi tiết tác giả.

Không giống như với trình xử lý POST của `Genre`, chúng ta không kiểm tra xem đối tượng `Author` đã tồn tại trước khi lưu nó hay không. Có lẽ chúng ta nên, mặc dù như bây giờ chúng ta có thể có nhiều tác giả với cùng tên.

Mã kiểm tra hợp lệ trình bày một số tính năng mới:

- Chúng ta có thể nối các validator, sử dụng `withMessage()` để chỉ định thông báo lỗi cần hiển thị nếu phương thức kiểm tra hợp lệ trước đó thất bại.
  Điều này giúp cung cấp các thông báo lỗi cụ thể rất dễ dàng mà không cần nhiều mã trùng lặp.

  ```js
  [
    // Validate and sanitize fields.
    body("first_name")
      .trim()
      .isLength({ min: 1 })
      .escape()
      .withMessage("First name must be specified.")
      .isAlphanumeric()
      .withMessage("First name has non-alphanumeric characters."),
    // …
  ];
  ```

- Chúng ta có thể sử dụng hàm `optional()` để chạy một kiểm tra hợp lệ tiếp theo chỉ khi một trường đã được nhập (điều này cho phép chúng ta kiểm tra hợp lệ các trường tùy chọn).
  Ví dụ, dưới đây chúng ta kiểm tra rằng ngày sinh tùy chọn là ngày tuân thủ ISO8601 (đối tượng `{ values: "falsy" }` được truyền vào có nghĩa là chúng ta sẽ chấp nhận chuỗi rỗng hoặc `null` như một giá trị rỗng).

  ```js
  [
    body("date_of_birth", "Invalid date of birth")
      .optional({ values: "falsy" })
      .isISO8601()
      .toDate(),
  ];
  ```

- Các tham số được nhận từ yêu cầu dưới dạng chuỗi. Chúng ta có thể sử dụng `toDate()` (hoặc `toBoolean()`) để chuyển đổi chúng sang các kiểu JavaScript thích hợp (như được hiển thị ở cuối chuỗi validator ở trên).

## View

Tạo tệp **/views/author_form.pug** và sao chép nội dung văn bản dưới đây vào.

```pug
extends layout

block content
  h1=title

  form(method='POST')
    div.form-group
      label(for='first_name') First Name:
      input#first_name.form-control(type='text', placeholder='First name (Christian)' name='first_name' required value=(undefined===author ? '' : author.first_name) )
      label(for='family_name') Family Name:
      input#family_name.form-control(type='text', placeholder='Family name (Surname)' name='family_name' required value=(undefined===author ? '' : author.family_name))
    div.form-group
      label(for='date_of_birth') Date of birth:
      input#date_of_birth.form-control(type='date' name='date_of_birth' value=(undefined===author ? '' : author.date_of_birth) )
    button.btn.btn-primary(type='submit') Submit

  if errors
    ul
      for error in errors
        li!= error.msg
```

Cấu trúc và hành vi của view này giống hệt với template **genre_form.pug**, vì vậy chúng ta sẽ không mô tả lại nó.

> [!NOTE]
> Một số trình duyệt không hỗ trợ `input type="date"`, vì vậy bạn sẽ không nhận được widget datepicker hoặc placeholder `dd/mm/yyyy` mặc định, mà thay vào đó sẽ nhận được một trường văn bản thuần túy trống. Một giải pháp thay thế là thêm thuộc tính `placeholder='dd/mm/yyyy'` một cách rõ ràng để trên các trình duyệt kém khả năng hơn bạn vẫn có thông tin về định dạng văn bản mong muốn.

### Thử thách: Thêm trường ngày mất

Template trên thiếu trường để nhập `date_of_death`. Tạo trường theo cùng mẫu như nhóm biểu mẫu ngày sinh!

## Kết quả trông như thế nào?

Chạy ứng dụng, mở trình duyệt đến `http://localhost:3000/`, sau đó chọn liên kết _Create new author_. Nếu mọi thứ được thiết lập đúng, trang web của bạn trông giống như ảnh chụp màn hình sau. Sau khi bạn nhập một giá trị, nó sẽ được lưu và bạn sẽ được đưa đến trang chi tiết tác giả.

![Author Create Page - Express Local Library site](locallibary_express_author_create_empty.png)

> [!NOTE]
> Nếu bạn thử nghiệm với các định dạng ngày tháng khác nhau, bạn có thể thấy rằng định dạng `yyyy-mm-dd` hoạt động không đúng. Điều này là do JavaScript coi các chuỗi ngày tháng là bao gồm thời gian 0 giờ, nhưng ngoài ra còn coi các chuỗi ngày tháng theo định dạng đó (tiêu chuẩn ISO 8601) là bao gồm thời gian 0 giờ UTC, thay vì giờ địa phương. Nếu múi giờ của bạn ở phía tây UTC, màn hình ngày tháng, vì là giờ địa phương, sẽ là một ngày trước ngày bạn đã nhập. Đây là một trong một số phức tạp (chẳng hạn như tên họ gồm nhiều từ và sách có nhiều tác giả) mà chúng ta không giải quyết ở đây.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms).
- Tiếp tục đến bài viết con tiếp theo của phần 6: [Biểu mẫu tạo Sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_book_form).
