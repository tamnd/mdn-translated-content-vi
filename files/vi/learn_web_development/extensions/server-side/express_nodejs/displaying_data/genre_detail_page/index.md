---
title: Trang chi tiết thể loại
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Genre_detail_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

Trang _chi tiết_ thể loại cần hiển thị thông tin cho một thể loại cụ thể, sử dụng giá trị trường `_id` được tạo tự động làm mã định danh.
ID của bản ghi thể loại cần thiết được mã hóa ở cuối URL và được trích xuất tự động dựa trên định nghĩa tuyến đường (**/genre/:id**).
Sau đó nó được truy cập trong bộ điều khiển thông qua các tham số yêu cầu: `req.params.id`.

Trang nên hiển thị tên thể loại và danh sách tất cả sách trong thể loại đó với các liên kết đến trang chi tiết của từng cuốn sách.

## Bộ điều khiển

Mở tệp **/controllers/genreController.js** và yêu cầu module `Book` ở đầu tệp (tệp đó đã có lệnh `require()` module `Genre` rồi).

```js
const Book = require("../models/book");
```

Tìm phương thức bộ điều khiển `genre_detail()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display detail page for a specific Genre.
exports.genre_detail = async (req, res, next) => {
  // Get details of genre and all associated books (in parallel)
  const [genre, booksInGenre] = await Promise.all([
    Genre.findById(req.params.id).exec(),
    Book.find({ genre: req.params.id }, "title summary").exec(),
  ]);
  if (genre === null) {
    // No results.
    const err = new Error("Genre not found");
    err.status = 404;
    return next(err);
  }

  res.render("genre_detail", {
    title: "Genre Detail",
    genre,
    genre_books: booksInGenre,
  });
};
```

Đầu tiên chúng ta dùng `Genre.findById()` để lấy thông tin Thể loại theo ID cụ thể, và `Book.find()` để lấy tất cả bản ghi sách có cùng ID thể loại liên kết đó.
Vì hai yêu cầu không phụ thuộc vào nhau, chúng ta dùng `Promise.all()` để chạy các truy vấn cơ sở dữ liệu song song (cách tiếp cận tương tự để chạy truy vấn song song đã được trình bày trong [trang chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Home_page#controller)).

Chúng ta `await` promise được trả về, và một khi nó kết thúc chúng ta kiểm tra các kết quả.
Nếu thể loại không tồn tại trong cơ sở dữ liệu (tức là, nó có thể đã bị xóa) thì `findById()` sẽ trả về thành công mà không có kết quả.
Trong trường hợp này chúng ta muốn hiển thị trang "không tìm thấy", vì vậy chúng ta tạo một đối tượng `Error` và truyền nó vào hàm middleware `next` trong chuỗi.

> [!NOTE]
> Các lỗi được truyền vào hàm middleware `next` sẽ lan truyền đến mã xử lý lỗi của chúng ta (điều này được thiết lập khi chúng ta [tạo ra khung ứng dụng](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website#app.js). Để biết thêm thông tin, xem [Xử lý Lỗi](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction#handling_errors) và [Xử lý lỗi và ngoại lệ trong các hàm tuyến đường](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes#handling_errors_and_exceptions_in_the_route_functions)).

Nếu `genre` được tìm thấy, thì chúng ta gọi `render()` để hiển thị view.
Template view là **genre_detail** (.pug).
Các giá trị cho title, `genre` và `booksInGenre` được truyền vào template sử dụng các khóa tương ứng (`title`, `genre` và `genre_books`).

## View

Tạo tệp **/views/genre_detail.pug** và điền nội dung dưới đây:

```pug
extends layout

block content

  h1 Genre: #{genre.name}

  div(style='margin-left:20px;margin-top:20px')

    h2(style='font-size: 1.5rem;') Books
    if genre_books.length
      dl
        each book in genre_books
          dt
            a(href=book.url) #{book.title}
          dd #{book.summary}
    else
      p This genre has no books.
```

View này rất giống với tất cả các template khác của chúng ta. Sự khác biệt chính là chúng ta không sử dụng `title` được truyền vào cho tiêu đề đầu tiên (mặc dù nó được sử dụng trong template **layout.pug** cơ bản để đặt tiêu đề trang).

## Kết quả trông như thế nào?

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`. Chọn liên kết _All genres_, sau đó chọn một trong các thể loại (ví dụ: "Fantasy"). Nếu mọi thứ được thiết lập đúng, trang của bạn trông giống như ảnh chụp màn hình sau.

![Genre Detail Page - Express Local Library site](locallibary_express_genre_detail.png)

> [!NOTE]
> Bạn có thể gặp lỗi tương tự như dưới đây nếu `req.params.id` (hoặc bất kỳ ID nào khác) không thể được chuyển đổi sang [`mongoose.Types.ObjectId()`](https://mongoosejs.com/docs/api/mongoose.html#Mongoose.prototype.Types).
>
> ```bash
> Cast to ObjectId failed for value " 59347139895ea23f9430ecbb" at path "_id" for model "Genre"
> ```
>
> Nguyên nhân có khả năng nhất là ID được truyền vào các phương thức mongoose thực ra không phải là ID hợp lệ.
> [`Mongoose.prototype.isValidObjectId()`](<https://mongoosejs.com/docs/api/mongoose.html#Mongoose.prototype.isValidObjectId()>) có thể được dùng để kiểm tra xem một ID cụ thể có hợp lệ hay không.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiếp tục đến bài viết con tiếp theo của phần 5: [Trang chi tiết sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Book_detail_page).
