---
title: Biểu mẫu tạo thể loại
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_genre_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài viết con này cho thấy cách chúng ta định nghĩa trang để tạo các đối tượng `Genre` (đây là nơi tốt để bắt đầu vì `Genre` chỉ có một trường, `name`, và không có phụ thuộc). Như bất kỳ trang nào khác, chúng ta cần thiết lập các route, bộ điều khiển và view.

## Import các phương thức kiểm tra hợp lệ và làm sạch

Để sử dụng _express-validator_ trong các bộ điều khiển của chúng ta, chúng ta phải _require_ các hàm chúng ta muốn sử dụng từ module `'express-validator'`.

Mở tệp **/controllers/genreController.js**, và thêm dòng sau vào đầu tệp, trước bất kỳ hàm xử lý route nào:

```js
const { body, validationResult } = require("express-validator");
```

Lưu ý rằng `require("express-validator")` chỉ là một lời gọi hàm trả về một đối tượng, và chúng ta [phân rã](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) hai thuộc tính, `body` và `validationResult`, từ đối tượng, vì vậy chúng ta có thể sử dụng chúng trực tiếp như các biến.

## Bộ điều khiển — route GET

Tìm phương thức bộ điều khiển `genre_create_get()` đã được xuất và thay thế bằng đoạn mã sau.
Điều này hiển thị view **genre_form.pug**, truyền vào biến title.

```js
// Display Genre create form on GET.
exports.genre_create_get = (req, res, next) => {
  res.render("genre_form", { title: "Create Genre" });
};
```

## Bộ điều khiển — route POST

Tìm phương thức bộ điều khiển `genre_create_post()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Handle Genre create on POST.
exports.genre_create_post = [
  // Validate and sanitize the name field.
  body("name", "Genre name must contain at least 3 characters")
    .trim()
    .isLength({ min: 3 })
    .escape(),

  // Process request after validation and sanitization.
  async (req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    // Create a genre object with escaped and trimmed data.
    const genre = new Genre({ name: req.body.name });

    if (!errors.isEmpty()) {
      // There are errors. Render the form again with sanitized values/error messages.
      res.render("genre_form", {
        title: "Create Genre",
        genre,
        errors: errors.array(),
      });
      return;
    }

    // Data from form is valid.
    // Check if Genre with same name already exists.
    const genreExists = await Genre.findOne({ name: req.body.name })
      .collation({ locale: "en", strength: 2 })
      .exec();
    if (genreExists) {
      // Genre exists, redirect to its detail page.
      res.redirect(genreExists.url);
      return;
    }

    // New genre. Save and redirect to its detail page.
    await genre.save();
    res.redirect(genre.url);
  },
];
```

Điều đầu tiên cần lưu ý là thay vì là một hàm middleware đơn (với các đối số `(req, res, next)`), bộ điều khiển chỉ định một _mảng_ các hàm middleware.
Mảng này được truyền vào hàm router và mỗi phương thức được gọi theo thứ tự.

> [!NOTE]
> Cách tiếp cận này là cần thiết, vì các validator là các hàm middleware.

Phương thức đầu tiên trong mảng định nghĩa một body validator (`body()`) để kiểm tra hợp lệ và làm sạch trường. Điều này sử dụng `trim()` để xóa bất kỳ khoảng trắng nào ở đầu/cuối, kiểm tra rằng trường _name_ không rỗng, và sau đó sử dụng `escape()` để xóa bất kỳ ký tự HTML nguy hiểm nào).

```js
[
  // Validate that the name field is not empty.
  body("name", "Genre name must contain at least 3 characters")
    .trim()
    .isLength({ min: 3 })
    .escape(),
  // …
];
```

Sau khi chỉ định các validator, chúng ta tạo một hàm middleware để trích xuất bất kỳ lỗi kiểm tra hợp lệ nào. Chúng ta sử dụng `isEmpty()` để kiểm tra xem có lỗi nào trong kết quả kiểm tra hợp lệ không. Nếu có thì chúng ta hiển thị lại biểu mẫu, truyền vào đối tượng genre đã được làm sạch và mảng thông báo lỗi (`errors.array()`).

```js
// Process request after validation and sanitization.
async (req, res, next) => {
  // Extract the validation errors from a request.
  const errors = validationResult(req);

  // Create a genre object with escaped and trimmed data.
  const genre = new Genre({ name: req.body.name });

  if (!errors.isEmpty()) {
    // There are errors. Render the form again with sanitized values/error messages.
    res.render("genre_form", {
      title: "Create Genre",
      genre,
      errors: errors.array(),
    });
    return;
  }
  // Data from form is valid.
  // …
};
```

Nếu dữ liệu tên thể loại hợp lệ thì chúng ta thực hiện tìm kiếm không phân biệt chữ hoa chữ thường để xem liệu một `Genre` có tên tương tự đã tồn tại chưa (vì chúng ta không muốn tạo các bản ghi trùng lặp hoặc gần trùng lặp chỉ khác nhau về chữ hoa/thường, chẳng hạn như: "Fantasy", "fantasy", "FaNtAsY", v.v.).
Để bỏ qua chữ hoa/thường và dấu khi tìm kiếm, chúng ta nối phương thức [`collation()`](<https://mongoosejs.com/docs/api/query.html#Query.prototype.collation()>), chỉ định locale 'en' và strength 2 (để biết thêm thông tin xem chủ đề MongoDB [Collation](https://www.mongodb.com/docs/manual/reference/collation/)).

Nếu một `Genre` có tên phù hợp đã tồn tại, chúng ta chuyển hướng đến trang chi tiết của nó.
Nếu không, chúng ta lưu `Genre` mới và chuyển hướng đến trang chi tiết của nó.
Lưu ý rằng ở đây chúng ta `await` kết quả của truy vấn cơ sở dữ liệu, theo cùng mẫu như trong các trình xử lý route khác.

```js
// Check if Genre with same name already exists.
const genreExists = await Genre.findOne({ name: req.body.name })
  .collation({ locale: "en", strength: 2 })
  .exec();
if (genreExists) {
  // Genre exists, redirect to its detail page.
  res.redirect(genreExists.url);
}

// New genre. Save and redirect to its detail page.
await genre.save();
res.redirect(genre.url);
```

Mẫu tương tự này được sử dụng trong tất cả các bộ điều khiển POST của chúng ta: chúng ta chạy các validator (với sanitizers), sau đó kiểm tra lỗi và hiển thị lại biểu mẫu với thông tin lỗi hoặc lưu dữ liệu.

## View

Cùng một view được hiển thị trong cả bộ điều khiển/route `GET` và `POST` khi chúng ta tạo một `Genre` mới (và sau này nó cũng được sử dụng khi chúng ta _cập nhật_ một `Genre`). Trong trường hợp `GET`, biểu mẫu trống và chúng ta chỉ truyền vào biến title. Trong trường hợp `POST`, người dùng đã nhập dữ liệu không hợp lệ trước đó — trong biến `genre`, chúng ta truyền lại một phiên bản đã làm sạch của dữ liệu đã nhập và trong biến `errors`, chúng ta truyền lại một mảng thông báo lỗi.
Đoạn mã dưới đây cho thấy mã bộ điều khiển để hiển thị template trong cả hai trường hợp.

```js
// Render the GET route
res.render("genre_form", { title: "Create Genre" });

// Render the POST route
res.render("genre_form", {
  title: "Create Genre",
  genre,
  errors: errors.array(),
});
```

Tạo tệp **/views/genre_form.pug** và sao chép nội dung văn bản dưới đây vào.

```pug
extends layout

block content

  h1 #{title}

  form(method='POST')
    div.form-group
      label(for='name') Genre:
      input#name.form-control(type='text', placeholder='Fantasy, Poetry etc.' name='name' required value=(undefined===genre ? '' : genre.name) )
    button.btn.btn-primary(type='submit') Submit

  if errors
    ul
      for error in errors
        li!= error.msg
```

Phần lớn template này sẽ quen thuộc từ các hướng dẫn trước của chúng ta. Đầu tiên, chúng ta mở rộng template cơ sở **layout.pug** và ghi đè `block` có tên '**content**'. Sau đó chúng ta có một tiêu đề với `title` mà chúng ta truyền vào từ bộ điều khiển (thông qua phương thức `render()`).

Tiếp theo, chúng ta có mã pug cho biểu mẫu HTML sử dụng `method="POST"` để gửi dữ liệu đến máy chủ, và vì `action` là một chuỗi rỗng, sẽ gửi dữ liệu đến cùng URL như trang.

Biểu mẫu định nghĩa một trường bắt buộc duy nhất kiểu "text" có tên "name". _Giá trị_ mặc định của trường phụ thuộc vào việc biến `genre` có được định nghĩa hay không. Nếu được gọi từ route `GET`, nó sẽ rỗng vì đây là biểu mẫu mới. Nếu được gọi từ route `POST`, nó sẽ chứa giá trị (không hợp lệ) mà người dùng đã nhập ban đầu.

Phần cuối của trang là mã lỗi. Phần này in ra danh sách lỗi, nếu biến error đã được định nghĩa (nói cách khác, phần này sẽ không xuất hiện khi template được hiển thị trên route `GET`).

> [!NOTE]
> Đây chỉ là một cách để hiển thị lỗi. Bạn cũng có thể lấy tên của các trường bị ảnh hưởng từ biến error, và sử dụng chúng để kiểm soát nơi thông báo lỗi được hiển thị, có áp dụng CSS tùy chỉnh hay không, v.v.

## Kết quả trông như thế nào?

Chạy ứng dụng, mở trình duyệt đến `http://localhost:3000/`, rồi chọn liên kết _Create new genre_. Nếu mọi thứ được thiết lập đúng, trang web của bạn trông giống như ảnh chụp màn hình sau. Sau khi bạn nhập một giá trị, nó sẽ được lưu và bạn sẽ được đưa đến trang chi tiết thể loại.

![Genre Create Page - Express Local Library site](locallibary_express_genre_create_empty.png)

Lỗi duy nhất chúng ta kiểm tra hợp lệ ở phía máy chủ là trường thể loại phải có ít nhất ba ký tự. Ảnh chụp màn hình dưới đây cho thấy danh sách lỗi sẽ trông như thế nào nếu bạn cung cấp một thể loại chỉ có một hoặc hai ký tự (được tô sáng màu vàng).

![The Create Genre section of the Local library application. The left column has a vertical navigation bar. The right section is the create a new Genre from with a heading that reads 'Create Genre'. There is one input field labeled 'Genre'. There is a submit button at the bottom. There is an error message that reads 'Genre name required' directly below the Submit button. The error message was highlighted by the author of this article. There is no visual indication in the form that the genre is required nor that the error message only appears on error.](locallibary_express_genre_create_error.png)

> [!NOTE]
> Kiểm tra hợp lệ của chúng ta sử dụng `trim()` để đảm bảo rằng khoảng trắng không được chấp nhận như tên thể loại. Chúng ta cũng kiểm tra hợp lệ rằng trường không rỗng ở phía máy khách bằng cách thêm [thuộc tính boolean](/en-US/docs/Glossary/Boolean/HTML) `required` vào định nghĩa trường trong biểu mẫu:
>
> ```pug
> input#name.form-control(type='text', placeholder='Fantasy, Poetry etc.' name='name' required value=(undefined===genre ? '' : genre.name) )
> ```

## Các bước tiếp theo

1. Quay lại [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu.](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms)
2. Tiếp tục đến bài viết con tiếp theo của phần 6: [Biểu mẫu tạo Tác giả](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_author_form).
