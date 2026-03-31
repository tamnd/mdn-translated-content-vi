---
title: Trang danh sách tác giả và thử thách trang danh sách thể loại
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Author_list_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

Trang danh sách tác giả cần hiển thị danh sách tất cả tác giả trong cơ sở dữ liệu, với tên mỗi tác giả được liên kết đến trang chi tiết tác giả tương ứng. Ngày sinh và ngày mất nên được liệt kê sau tên trên cùng một dòng.

## Bộ điều khiển

Hàm bộ điều khiển danh sách tác giả cần lấy danh sách tất cả các phiên bản `Author` và sau đó truyền chúng đến mẫu để render.

Mở **/controllers/authorController.js**. Tìm phương thức bộ điều khiển `author_list()` được xuất gần đầu tệp và thay thế nó bằng mã sau.

```js
// Display list of all Authors.
exports.author_list = async (req, res, next) => {
  const allAuthors = await Author.find().sort({ family_name: 1 }).exec();
  res.render("author_list", {
    title: "Author List",
    author_list: allAuthors,
  });
};
```

Hàm bộ điều khiển tuyến đường tuân theo cùng một mẫu như cho các trang danh sách khác.
Nó định nghĩa một truy vấn trên mô hình `Author`, sử dụng hàm `find()` để lấy tất cả tác giả và phương thức `sort()` để sắp xếp chúng theo `family_name` theo thứ tự bảng chữ cái.
`exec()` được nối chuỗi vào cuối để thực thi truy vấn và trả về promise mà hàm có thể `await`.

Khi promise được thực hiện, trình xử lý tuyến đường render mẫu **author_list**(.pug), truyền `title` trang và danh sách tác giả (`allAuthors`) bằng các khóa mẫu.

## View

Tạo **/views/author_list.pug** và thay thế nội dung của nó bằng văn bản dưới đây.

```pug
extends layout

block content
  h1= title

  if author_list.length
    ul
      each author in author_list
        li
          a(href=author.url) #{author.name}
          |  (#{author.date_of_birth} - #{author.date_of_death})
  else
    p There are no authors.
```

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`. Sau đó chọn liên kết _All authors_. Nếu mọi thứ được thiết lập đúng, trang sẽ trông giống ảnh chụp màn hình sau đây.

![Author List Page - Express Local Library site](locallibary_express_author_list.png)

> [!NOTE]
> Giao diện của các ngày _lifespan_ của tác giả trông xấu! Bạn có thể cải thiện điều này bằng [cách tiếp cận tương tự](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Date_formatting_using_moment) như cách chúng tôi đã sử dụng cho danh sách `BookInstance` (thêm thuộc tính ảo cho lifespan vào mô hình `Author`).
>
> Tuy nhiên, vì tác giả có thể chưa mất hoặc có thể thiếu dữ liệu sinh/tử, trong trường hợp này chúng tôi cần bỏ qua các ngày thiếu hoặc tham chiếu đến các thuộc tính không tồn tại. Một cách để xử lý điều này là trả về ngày được định dạng hoặc chuỗi rỗng, tùy thuộc vào việc thuộc tính có được xác định hay không. Ví dụ:
>
> `return this.date_of_birth ? DateTime.fromJSDate(this.date_of_birth).toLocaleString(DateTime.DATE_MED) : '';`

## Trang danh sách thể loại—thử thách!

Trong phần này, bạn nên tự triển khai trang danh sách thể loại của mình. Trang nên hiển thị danh sách tất cả các thể loại trong cơ sở dữ liệu, với mỗi thể loại được liên kết đến trang chi tiết tương ứng. Ảnh chụp màn hình của kết quả mong đợi được hiển thị bên dưới.

![Genre List - Express Local Library site](locallibary_express_genre_list.png)

Hàm bộ điều khiển danh sách thể loại cần lấy danh sách tất cả các phiên bản `Genre` và sau đó truyền chúng đến mẫu để render.

1. Bạn sẽ cần chỉnh sửa `genre_list()` trong **/controllers/genreController.js**.
2. Triển khai gần như hoàn toàn giống với bộ điều khiển `author_list()`.
   - Sắp xếp kết quả theo tên, theo thứ tự tăng dần.

3. Mẫu được render nên có tên **genre_list.pug**.
4. Mẫu được render nên được truyền các biến `title` ('Genre List') và `genre_list` (danh sách thể loại được trả về từ `Genre.find()`).
5. View nên khớp với ảnh chụp màn hình/yêu cầu ở trên (view này nên có cấu trúc/định dạng rất giống với view danh sách Author, ngoại trừ việc các thể loại không có ngày).

## Các bước tiếp theo

Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).

Tiến tới bài viết con tiếp theo của phần 5: [Trang chi tiết thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Genre_detail_page).
