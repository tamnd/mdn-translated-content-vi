---
title: Trang chi tiết BookInstance và thử thách
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/BookInstance_detail_page_and_challenge
page-type: learn-module-chapter
sidebar: learnsidebar
---

## Trang chi tiết BookInstance

Trang chi tiết `BookInstance` cần hiển thị thông tin cho mỗi `BookInstance`, được xác định bằng giá trị trường `_id` (được tạo tự động) của nó. Điều này sẽ bao gồm tên `Book` (dưới dạng liên kết đến _trang chi tiết Sách_) cùng với thông tin khác trong bản ghi.

### Bộ điều khiển

Mở tệp **/controllers/bookinstanceController.js**.
Tìm phương thức bộ điều khiển `bookinstance_detail()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display detail page for a specific BookInstance.
exports.bookinstance_detail = async (req, res, next) => {
  const bookInstance = await BookInstance.findById(req.params.id)
    .populate("book")
    .exec();

  if (bookInstance === null) {
    // No results.
    const err = new Error("Book copy not found");
    err.status = 404;
    return next(err);
  }

  res.render("bookinstance_detail", {
    title: "Book:",
    bookinstance: bookInstance,
  });
};
```

Việc triển khai rất giống với cách được sử dụng cho các trang chi tiết model khác.
Hàm bộ điều khiển route gọi `BookInstance.findById()` với ID của một bản sao sách cụ thể được trích xuất từ URL (sử dụng route), và được truy cập trong bộ điều khiển thông qua các tham số yêu cầu: `req.params.id`.
Sau đó nó gọi `populate()` để lấy thông tin chi tiết của `Book` liên kết.
Nếu không tìm thấy `BookInstance` phù hợp, một lỗi sẽ được gửi đến middleware Express.
Nếu không, dữ liệu được trả về sẽ được hiển thị bằng view **bookinstance_detail.pug**.

### View

Tạo tệp **/views/bookinstance_detail.pug** và sao chép nội dung dưới đây vào.

```pug
extends layout

block content

  h1 ID: #{bookinstance._id}

  p #[strong Title: ]
    a(href=bookinstance.book.url) #{bookinstance.book.title}
  p #[strong Imprint:] #{bookinstance.imprint}

  p #[strong Status: ]
    if bookinstance.status=='Available'
      span.text-success #{bookinstance.status}
    else if bookinstance.status=='Maintenance'
      span.text-danger #{bookinstance.status}
    else
      span.text-warning #{bookinstance.status}

  if bookinstance.status!='Available'
    p #[strong Due back:] #{bookinstance.due_back}
```

Mọi thứ trong template này đã được trình bày trong các phần trước.

### Kết quả trông như thế nào?

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`. Chọn liên kết _All book-instances_, sau đó chọn một trong các mục. Nếu mọi thứ được thiết lập đúng, trang web của bạn trông giống như ảnh chụp màn hình sau.

![BookInstance Detail Page - Express Local Library site](locallibary_express_bookinstance_detail.png)

## Thử thách

Hiện tại hầu hết các _ngày tháng_ được hiển thị trên trang web sử dụng định dạng JavaScript mặc định (ví dụ: _Tue Oct 06 2020 15:49:58 GMT+1100 (AUS Eastern Daylight Time))_. Thử thách cho bài viết này là cải thiện giao diện hiển thị ngày tháng cho thông tin vòng đời `Author` (ngày mất/ngày sinh) và cho các trang _chi tiết BookInstance_ để sử dụng định dạng: Oct 6th, 2016.

> [!NOTE]
> Bạn có thể sử dụng cách tiếp cận tương tự như chúng ta đã sử dụng cho _Danh sách Bản sao Sách_ (thêm thuộc tính ảo cho vòng đời vào model `Author` và sử dụng [luxon](https://www.npmjs.com/package/luxon) để định dạng các chuỗi ngày tháng).

Để hoàn thành thử thách này, bạn phải:

1. Thay thế biến `due_back` bằng `due_back_formatted` trong trang _chi tiết BookInstance_.
2. Cập nhật model `Author` để thêm thuộc tính ảo về vòng đời. Vòng đời nên trông như: _date_of_birth - date_of_death_, trong đó cả hai giá trị có cùng định dạng ngày tháng như `BookInstance.due_back_formatted`.
3. Sử dụng `Author.lifespan` trong tất cả các view nơi bạn hiện đang sử dụng trực tiếp `date_of_birth` và `date_of_death`.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data#displaying_library_data_tutorial_subarticles).
