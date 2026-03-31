---
title: Trang danh sách sách
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Book_list_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

Tiếp theo, chúng tôi sẽ triển khai trang danh sách sách. Trang này cần hiển thị danh sách tất cả các sách trong cơ sở dữ liệu cùng với tác giả của chúng, với mỗi tiêu đề sách là một siêu liên kết đến trang chi tiết sách tương ứng.

## Bộ điều khiển

Hàm bộ điều khiển danh sách sách cần lấy danh sách tất cả các đối tượng `Book` trong cơ sở dữ liệu, sắp xếp chúng và sau đó truyền chúng đến mẫu để render.

Mở **/controllers/bookController.js**. Tìm phương thức bộ điều khiển `book_list()` được xuất và thay thế nó bằng mã sau.

```js
// Display list of all books.
exports.book_list = async (req, res, next) => {
  const allBooks = await Book.find({}, "title author")
    .sort({ title: 1 })
    .populate("author")
    .exec();

  res.render("book_list", { title: "Book List", book_list: allBooks });
};
```

Trình xử lý route gọi hàm `find()` trên mô hình `Book`, chọn chỉ trả về `title` và `author` vì chúng tôi không cần các trường khác (nó cũng sẽ trả về `_id` và các trường ảo) và sắp xếp kết quả theo thứ tự bảng chữ cái theo tiêu đề bằng phương thức `sort()`.
Chúng tôi cũng gọi `populate()` trên `Book`, chỉ định trường `author`—điều này sẽ thay thế id tác giả sách đã lưu trữ bằng thông tin tác giả đầy đủ.
`exec()` sau đó được nối chuỗi vào cuối để thực thi truy vấn và trả về promise.

Trình xử lý route sử dụng `await` để chờ promise, tạm dừng thực thi cho đến khi nó được giải quyết.
Nếu promise được thực hiện, kết quả của truy vấn được lưu vào biến `allBooks` và trình xử lý tiếp tục thực thi.

Phần cuối của trình xử lý route gọi `render()`, chỉ định mẫu **book_list** (.pug) và truyền các giá trị cho `title` và `book_list` vào mẫu.

## View

Tạo **/views/book_list.pug** và sao chép văn bản dưới đây vào.

```pug
extends layout

block content
  h1= title
  if book_list.length
    ul
      each book in book_list
        li
          a(href=book.url) !{book.title}
          |  (#{book.author.name})

  else
    p There are no books.
```

View mở rộng mẫu cơ sở **layout.pug** và ghi đè `block` có tên '**content**'. Nó hiển thị `title` mà chúng tôi đã truyền vào từ bộ điều khiển (qua phương thức `render()`) và lặp qua biến `book_list` bằng cú pháp `each`-`in`. Một mục danh sách được tạo cho mỗi sách hiển thị tiêu đề sách dưới dạng liên kết đến trang chi tiết sách theo sau là tên tác giả.
Nếu không có sách nào trong `book_list` thì mệnh đề `else` được thực thi và hiển thị văn bản 'There are no books'.

> [!NOTE]
> Chúng tôi sử dụng `book.url` để cung cấp liên kết đến bản ghi chi tiết cho mỗi sách (chúng tôi đã triển khai route này, nhưng chưa triển khai trang). Đây là thuộc tính ảo của mô hình `Book` sử dụng trường `_id` của phiên bản mô hình để tạo ra đường dẫn URL duy nhất.

Điều thú vị ở đây là mỗi sách được định nghĩa trên hai dòng, sử dụng ký tự pipe cho dòng thứ hai. Cách tiếp cận này cần thiết vì nếu tên tác giả nằm trên dòng trước thì nó sẽ là một phần của siêu liên kết.

## Trông như thế nào?

Chạy ứng dụng (xem [Kiểm thử các route](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes#testing_the_routes) để biết các lệnh liên quan) và mở trình duyệt đến `http://localhost:3000/`. Sau đó chọn liên kết _All books_. Nếu mọi thứ được thiết lập đúng, trang web của bạn sẽ trông giống ảnh chụp màn hình sau đây.

![Book List Page - Express Local Library site](new_book_list.png)

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiến tới bài viết con tiếp theo của phần 5: [Trang danh sách phiên bản sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/BookInstance_list_page).
