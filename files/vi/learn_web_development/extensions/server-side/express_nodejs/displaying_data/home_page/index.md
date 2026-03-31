---
title: Trang chủ
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Home_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

Trang đầu tiên chúng tôi sẽ tạo là trang chủ của trang web, có thể truy cập từ gốc trang web (`/`) hoặc catalog (`catalog/`). Trang này sẽ hiển thị một số văn bản tĩnh mô tả trang web, cùng với các "bộ đếm" được tính toán động về số lượng bản ghi khác nhau trong cơ sở dữ liệu.

Chúng tôi đã tạo tuyến đường cho trang chủ. Để hoàn thiện trang, chúng ta cần cập nhật hàm bộ điều khiển để lấy các "bộ đếm" bản ghi từ cơ sở dữ liệu và tạo view (mẫu) mà chúng ta có thể sử dụng để render trang.

> [!NOTE]
> Chúng tôi sẽ sử dụng Mongoose để lấy thông tin cơ sở dữ liệu.
> Trước khi tiếp tục, bạn có thể muốn đọc lại phần [nhập môn Mongoose](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose#mongoose_primer) về [tìm kiếm bản ghi](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose#searching_for_records).

## Tuyến đường

Chúng tôi đã tạo các tuyến đường trang index trong [hướng dẫn trước](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes).
Để nhắc lại, tất cả các hàm tuyến đường được định nghĩa trong **/routes/catalog.js**:

```js
// GET catalog home page.
router.get("/", book_controller.index); // This actually maps to /catalog/ because we import the route with a /catalog prefix
```

Hàm bộ điều khiển index của sách được truyền vào dưới dạng tham số (`book_controller.index`) có một triển khai "giả" được định nghĩa trong **/controllers/bookController.js**:

```js
exports.index = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Site Home Page");
};
```

Đây là hàm bộ điều khiển mà chúng tôi mở rộng để lấy thông tin từ mô hình và sau đó render nó bằng mẫu (view).

## Bộ điều khiển

Hàm bộ điều khiển index cần lấy thông tin về số lượng bản ghi `Book`, `BookInstance` (tất cả), `BookInstance` (có sẵn), `Author` và `Genre` trong cơ sở dữ liệu, render dữ liệu này trong mẫu để tạo trang HTML và trả về trong phản hồi HTTP.

Mở **/controllers/bookController.js**. Gần đầu tệp, bạn sẽ thấy hàm `index()` được xuất.

```js
const Book = require("../models/book");

exports.index = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Site Home Page");
};
```

Thay thế tất cả mã ở trên bằng đoạn mã sau.
Điều đầu tiên nó làm là import (`require()`) tất cả các mô hình.
Chúng ta cần làm điều này vì chúng ta sẽ sử dụng chúng để đếm số lượng tài liệu.

```js
const Book = require("../models/book");
const Author = require("../models/author");
const Genre = require("../models/genre");
const BookInstance = require("../models/bookinstance");

exports.index = async (req, res, next) => {
  // Get details of books, book instances, authors and genre counts (in parallel)
  const [
    numBooks,
    numBookInstances,
    numAvailableBookInstances,
    numAuthors,
    numGenres,
  ] = await Promise.all([
    Book.countDocuments({}).exec(),
    BookInstance.countDocuments({}).exec(),
    BookInstance.countDocuments({ status: "Available" }).exec(),
    Author.countDocuments({}).exec(),
    Genre.countDocuments({}).exec(),
  ]);

  res.render("index", {
    title: "Local Library Home",
    book_count: numBooks,
    book_instance_count: numBookInstances,
    book_instance_available_count: numAvailableBookInstances,
    author_count: numAuthors,
    genre_count: numGenres,
  });
};
```

Chúng tôi sử dụng phương thức [`countDocuments()`](<https://mongoosejs.com/docs/api/model.html#Model.countDocuments()>) để lấy số lượng phiên bản của mỗi mô hình.
Phương thức này được gọi trên một mô hình, với một tập hợp điều kiện tùy chọn để khớp, và trả về một đối tượng `Query`.
Truy vấn có thể được thực thi bằng cách gọi [`exec()`](https://mongoosejs.com/docs/api/query.html#Query.prototype.exec), trả về một `Promise` được thực hiện với kết quả hoặc bị từ chối nếu có lỗi cơ sở dữ liệu.

Vì các truy vấn đếm tài liệu độc lập với nhau nên chúng tôi sử dụng [`Promise.all()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) để chạy chúng song song.
Phương thức trả về một promise mới mà chúng tôi [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) để hoàn thành (thực thi tạm dừng trong _hàm này_ tại `await`).
Khi tất cả các truy vấn hoàn thành, promise được trả về bởi `all()` được thực hiện, tiếp tục thực thi hàm xử lý tuyến đường và điền vào mảng với kết quả của các truy vấn cơ sở dữ liệu.

Sau đó, chúng tôi gọi [`res.render()`](https://expressjs.com/en/5x/api.html#res.render), chỉ định view (mẫu) có tên '**index**' và các đối tượng ánh xạ kết quả của truy vấn cơ sở dữ liệu đến mẫu view.
Dữ liệu được cung cấp dưới dạng cặp khóa-giá trị và có thể được truy cập trong mẫu bằng khóa.

> [!NOTE]
> Nếu bạn sử dụng khóa/biến trong mẫu Pug chưa được truyền vào, thì nó sẽ render dưới dạng chuỗi rỗng và được đánh giá là `false` trong các biểu thức.
> Các ngôn ngữ mẫu khác có thể yêu cầu bạn truyền giá trị cho tất cả các đối tượng bạn sử dụng.

Lưu ý rằng mã rất đơn giản vì chúng ta có thể giả sử rằng các truy vấn cơ sở dữ liệu thành công.
Nếu bất kỳ thao tác cơ sở dữ liệu nào thất bại, ngoại lệ được ném ra sẽ khiến Promise bị từ chối và Express sẽ chuyển lỗi đến trình xử lý middleware `next` trong chuỗi.

## View

Mở **/views/index.pug** và thay thế nội dung của nó bằng văn bản dưới đây.

```pug
extends layout

block content
  h1= title
  p Welcome to #[em LocalLibrary], a very basic Express website developed as a tutorial example on the Mozilla Developer Network.

  h2 Dynamic content

  p The library has the following record counts:

  ul
    li #[strong Books:] !{book_count}
    li #[strong Copies:] !{book_instance_count}
    li #[strong Copies available:] !{book_instance_available_count}
    li #[strong Authors:] !{author_count}
    li #[strong Genres:] !{genre_count}
```

View này rất đơn giản. Chúng tôi mở rộng mẫu cơ sở **layout.pug**, ghi đè `block` có tên '**content**'. Tiêu đề `h1` đầu tiên sẽ là văn bản đã được escape cho biến `title` được truyền vào hàm `render()`—lưu ý cách sử dụng `h1=` để văn bản tiếp theo được xử lý như biểu thức JavaScript. Sau đó chúng tôi bao gồm một đoạn giới thiệu về LocalLibrary.

Dưới tiêu đề _Dynamic content_, chúng tôi liệt kê số lượng bản sao của mỗi mô hình.
Lưu ý rằng các giá trị mẫu cho dữ liệu là các khóa được chỉ định khi `render()` được gọi trong hàm xử lý tuyến đường.

> [!NOTE]
> Chúng tôi không escape các giá trị đếm (tức là chúng tôi đã sử dụng cú pháp `!{}`) vì các giá trị đếm được tính toán. Nếu thông tin được cung cấp bởi người dùng cuối thì chúng tôi sẽ escape biến để hiển thị.

## Trông như thế nào?

Ở thời điểm này, chúng ta đã tạo mọi thứ cần thiết để hiển thị trang index. Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`. Nếu mọi thứ được thiết lập đúng, trang web của bạn sẽ trông giống ảnh chụp màn hình sau đây.

![Home page - Express Local Library site](locallibary_express_home.png)

> [!NOTE]
> Bạn sẽ chưa thể _sử dụng_ các liên kết trên thanh bên vì URL, views và mẫu cho những trang đó chưa được định nghĩa. Nếu bạn thử sẽ nhận được lỗi như "NOT IMPLEMENTED: Book list" chẳng hạn, tùy thuộc vào liên kết bạn nhấp vào. Các chuỗi ký tự này (sẽ được thay thế bằng dữ liệu thực) được chỉ định trong các bộ điều khiển khác nhau trong tệp "controllers" của bạn.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiến tới bài viết con tiếp theo của phần 5: [Trang danh sách sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Book_list_page).
