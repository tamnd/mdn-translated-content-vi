---
title: Trang chi tiết sách
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Book_detail_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

_Trang chi tiết sách_ cần hiển thị thông tin cho một `Book` cụ thể (được xác định bằng giá trị trường `_id` được tạo tự động), cùng với thông tin về từng bản sao liên kết trong thư viện (`BookInstance`). Bất cứ nơi nào chúng ta hiển thị tác giả, thể loại, hoặc bản sao sách, chúng nên được liên kết đến trang chi tiết liên quan của mục đó.

## Bộ điều khiển

Mở tệp **/controllers/bookController.js**. Tìm phương thức bộ điều khiển `book_detail()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display detail page for a specific book.
exports.book_detail = async (req, res, next) => {
  // Get details of books, book instances for specific book
  const [book, bookInstances] = await Promise.all([
    Book.findById(req.params.id).populate("author").populate("genre").exec(),
    BookInstance.find({ book: req.params.id }).exec(),
  ]);

  if (book === null) {
    // No results.
    const err = new Error("Book not found");
    err.status = 404;
    return next(err);
  }

  res.render("book_detail", {
    title: book.title,
    book,
    book_instances: bookInstances,
  });
};
```

> [!NOTE]
> Chúng ta không cần yêu cầu thêm bất kỳ module nào trong bước này, vì chúng ta đã import các phụ thuộc khi triển khai bộ điều khiển trang chủ.

Cách tiếp cận này hoàn toàn giống như được mô tả cho [trang chi tiết Thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Genre_detail_page).
Hàm bộ điều khiển route sử dụng `Promise.all()` để truy vấn `Book` được chỉ định và các bản sao liên kết (`BookInstance`) song song.
Nếu không tìm thấy sách nào phù hợp, một đối tượng `Error` được trả về với lỗi "404: Not Found".
Nếu sách được tìm thấy, thì thông tin cơ sở dữ liệu được truy xuất sẽ được hiển thị bằng template "book_detail".
Vì khóa 'title' được sử dụng để đặt tên cho trang web (như được định nghĩa trong header của 'layout.pug'), lần này chúng ta đang truyền `results.book.title` khi hiển thị trang web.

## View

Tạo tệp **/views/book_detail.pug** và thêm đoạn văn bản dưới đây.

```pug
extends layout

block content
  h1 Title: !{book.title}

  p #[strong Author: ]
    a(href=book.author.url) #{book.author.name}
  p #[strong Summary:] !{book.summary}
  p #[strong ISBN:] #{book.isbn}
  p #[strong Genre: ]
    each val, index in book.genre
      a(href=val.url) #{val.name}
      if index < book.genre.length - 1
        |,&nbsp;

  div(style='margin-left:20px;margin-top:20px')
    h2(style='font-size: 1.5rem;') Copies

    each val in book_instances
      hr
      if val.status=='Available'
        p.text-success #{val.status}
      else if val.status=='Maintenance'
        p.text-danger #{val.status}
      else
        p.text-warning #{val.status}
      p #[strong Imprint:] #{val.imprint}
      if val.status!='Available'
        p #[strong Due back:] #{val.due_back}
      p #[strong Id: ]
        a(href=val.url) #{val._id}

    else
      p There are no copies of this book in the library.
```

Lưu ý dấu `!` đứng trước trong `!{book.title}` và `!{book.summary}`, điều này đảm bảo rằng các giá trị không bị escape khi hiển thị.
Điều đó được thực hiện vì chúng ta đã làm sạch dữ liệu mà chúng ta đang hiển thị theo cách lập trình, và việc làm sạch thêm lần nữa sẽ hiển thị "đánh dấu đã được làm sạch" của chúng ta thay vì phiên bản an toàn của văn bản gốc.
Chúng ta đã chọn không làm điều tương tự cho Tác giả, Thể loại, v.v. (mặc dù chúng ta có thể), vì chúng ta không mong đợi chúng chứa bất kỳ ký tự "nguy hiểm" nào cần làm sạch.

Hầu hết mọi thứ khác trong template này đã được trình bày trong các phần trước.

> [!NOTE]
> Danh sách các thể loại liên kết với sách được triển khai trong template như dưới đây. Điều này thêm dấu phẩy và khoảng trắng không ngắt sau mỗi thể loại liên kết với sách ngoại trừ thể loại cuối cùng.
>
> ```pug
>   p #[strong Genre: ]
>     each val, index in book.genre
>       a(href=val.url) #{val.name}
>       if index < book.genre.length - 1
>         |,&nbsp;
> ```

## Kết quả trông như thế nào?

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`. Chọn liên kết _All books_, sau đó chọn một trong các cuốn sách. Nếu mọi thứ được thiết lập đúng, trang của bạn trông giống như ảnh chụp màn hình sau.

![Book Detail Page - Express Local Library site](locallibary_express_book_detail.png)

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiếp tục đến bài viết con tiếp theo của phần 5: [Trang chi tiết tác giả](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Author_detail_page).
