---
title: Trang chi tiết tác giả
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Author_detail_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

Trang chi tiết tác giả cần hiển thị thông tin về `Author` được chỉ định, được xác định bằng giá trị trường `_id` (được tạo tự động) của họ, cùng với danh sách tất cả các đối tượng `Book` liên kết với `Author` đó.

## Bộ điều khiển

Mở tệp **/controllers/authorController.js**.

Thêm các dòng sau vào đầu tệp để `require()` module `Book` cần thiết cho trang chi tiết tác giả.

```js
const Book = require("../models/book");
```

Tìm phương thức bộ điều khiển `author_detail()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display detail page for a specific Author.
exports.author_detail = async (req, res, next) => {
  // Get details of author and all their books (in parallel)
  const [author, allBooksByAuthor] = await Promise.all([
    Author.findById(req.params.id).exec(),
    Book.find({ author: req.params.id }, "title summary").exec(),
  ]);

  if (author === null) {
    // No results.
    const err = new Error("Author not found");
    err.status = 404;
    return next(err);
  }

  res.render("author_detail", {
    title: "Author Detail",
    author,
    author_books: allBooksByAuthor,
  });
};
```

Cách tiếp cận này hoàn toàn giống như được mô tả cho [trang chi tiết Thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Genre_detail_page).
Hàm bộ điều khiển tuyến đường sử dụng `Promise.all()` để truy vấn `Author` được chỉ định và các phiên bản `Book` liên kết của họ song song.
Nếu không tìm thấy tác giả nào phù hợp, một đối tượng `Error` được gửi đến middleware xử lý lỗi Express.
Nếu tác giả được tìm thấy thì thông tin cơ sở dữ liệu được truy xuất sẽ được hiển thị bằng template "author_detail".

## View

Tạo tệp **/views/author_detail.pug** và sao chép nội dung sau vào.

```pug
extends layout

block content

  h1 Author: #{author.name}
  p #{author.date_of_birth} - #{author.date_of_death}

  div(style='margin-left:20px;margin-top:20px')

    h2(style='font-size: 1.5rem;') Books
    if author_books.length
      dl
        each book in author_books
          dt
            a(href=book.url) #{book.title}
          dd #{book.summary}
    else
      p This author has no books.
```

Mọi thứ trong template này đã được trình bày trong các phần trước.

## Kết quả trông như thế nào?

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`. Chọn liên kết _All Authors_, sau đó chọn một trong các tác giả. Nếu mọi thứ được thiết lập đúng, trang web của bạn trông giống như ảnh chụp màn hình sau.

![Author Detail Page - Express Local Library site](locallibary_express_author_detail.png)

> [!NOTE]
> Hình thức hiển thị ngày tháng _vòng đời_ của tác giả trông không đẹp! Chúng ta sẽ giải quyết điều đó trong thử thách cuối cùng của bài viết này.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiếp tục đến bài viết con cuối cùng của phần 5: [Trang chi tiết BookInstance và thử thách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/BookInstance_detail_page_and_challenge).
