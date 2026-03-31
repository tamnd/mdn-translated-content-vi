---
title: Trang danh sách phiên bản sách
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/BookInstance_list_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

Tiếp theo, chúng tôi sẽ triển khai danh sách tất cả các bản sao sách (`BookInstance`) trong thư viện. Trang này cần bao gồm tiêu đề của `Book` liên quan đến mỗi `BookInstance` (liên kết đến trang chi tiết của nó) cùng với các thông tin khác trong mô hình `BookInstance`, bao gồm trạng thái, nhà xuất bản và id duy nhất của mỗi bản sao. Văn bản id duy nhất nên được liên kết đến trang chi tiết `BookInstance`.

## Bộ điều khiển

Hàm bộ điều khiển danh sách `BookInstance` cần lấy danh sách tất cả các phiên bản sách, điền thông tin sách liên quan và sau đó truyền danh sách đến mẫu để render.

Mở `/controllers/bookinstanceController.js`.
Tìm phương thức bộ điều khiển `bookinstance_list()` được xuất và thay thế nó bằng mã sau.

```js
// Display list of all BookInstances.
exports.bookinstance_list = async (req, res, next) => {
  const allBookInstances = await BookInstance.find().populate("book").exec();

  res.render("bookinstance_list", {
    title: "Book Instance List",
    bookinstance_list: allBookInstances,
  });
};
```

Trình xử lý route gọi hàm `find()` trên mô hình `BookInstance`, sau đó nối chuỗi một lời gọi đến `populate()` với trường `book`—điều này sẽ thay thế id sách được lưu trữ cho mỗi `BookInstance` bằng tài liệu `Book` đầy đủ.
`exec()` sau đó được nối chuỗi vào cuối để thực thi truy vấn và trả về promise.

Trình xử lý route sử dụng `await` để chờ promise, tạm dừng thực thi cho đến khi nó được giải quyết.
Nếu promise được thực hiện, kết quả của truy vấn được lưu vào biến `allBookInstances` và trình xử lý route tiếp tục thực thi.

Phần cuối của mã gọi `render()`, chỉ định mẫu **bookinstance_list** (.pug) và truyền các giá trị cho `title` và `bookinstance_list` vào mẫu.

## View

Tạo **/views/bookinstance_list.pug** và sao chép văn bản dưới đây vào.

```pug
extends layout

block content
  h1= title

  if bookinstance_list.length
    ul
      each val in bookinstance_list
        li
          a(href=val.url) #{val.book.title} : #{val.imprint} -&nbsp;
          if val.status=='Available'
            span.text-success #{val.status}
          else if val.status=='Maintenance'
            span.text-danger #{val.status}
          else
            span.text-warning #{val.status}
          if val.status!='Available'
            span  (Due: #{val.due_back} )

  else
    p There are no book copies in this library.
```

View này rất giống với tất cả các view khác. Nó mở rộng layout, thay thế khối _content_, hiển thị `title` được truyền từ bộ điều khiển và lặp qua tất cả các bản sao sách trong `bookinstance_list`. Với mỗi bản sao, chúng tôi hiển thị trạng thái của nó (có màu sắc) và nếu sách không có sẵn, ngày dự kiến trả về. Một tính năng mới được giới thiệu—chúng ta có thể sử dụng ký hiệu chấm sau một thẻ để gán một lớp. Vì vậy `span.text-success` sẽ được biên dịch thành `<span class="text-success">` (và cũng có thể được viết bằng Pug như `span(class="text-success")`).

## Trông như thế nào?

Chạy ứng dụng, mở trình duyệt đến `http://localhost:3000/`, sau đó chọn liên kết _All book-instances_. Nếu mọi thứ được thiết lập đúng, trang web của bạn sẽ trông giống ảnh chụp màn hình sau đây.

![BookInstance List Page - Express Local Library site](locallibary_express_bookinstance_list.png)

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiến tới bài viết con tiếp theo của phần 5: [Định dạng ngày bằng luxon](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Date_formatting_using_moment).
