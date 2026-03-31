---
title: POST request method
short-title: POST
slug: Web/HTTP/Reference/Methods/POST
page-type: http-method
browser-compat: http.methods.POST
sidebar: http
---

Phương thức HTTP **`POST`** gửi dữ liệu đến máy chủ. Kiểu của phần thân yêu cầu được chỉ định bởi tiêu đề {{HTTPHeader("Content-Type")}}.

Sự khác biệt giữa {{HTTPMethod("PUT")}} và `POST` là `PUT` có tính {{Glossary("idempotent", "bất biến")}}: gọi một lần không khác gì gọi nhiều lần liên tiếp (không có _tác dụng phụ_).
Các yêu cầu `POST` giống nhau liên tiếp có thể có các tác dụng bổ sung, chẳng hạn như tạo cùng một đơn hàng nhiều lần.

[Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) thường gửi dữ liệu bằng `POST` và điều này thường dẫn đến sự thay đổi trên máy chủ.
Với biểu mẫu HTML, định dạng/mã hóa của nội dung phần thân được xác định bởi thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của phần tử {{HTMLElement("form")}} hoặc thuộc tính [`formenctype`](/en-US/docs/Web/HTML/Reference/Elements/input#formenctype) của phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("button")}}.
Mã hóa có thể là một trong các loại sau:

- `application/x-www-form-urlencoded`: các khóa và giá trị được mã hóa thành các bộ giá trị khóa-giá trị phân tách bằng ký hiệu và (`&`), với ký hiệu bằng (`=`) giữa khóa và giá trị (ví dụ: `first-name=Frida&last-name=Kahlo`).
  Các ký tự không phải chữ-số trong cả khóa và giá trị đều được {{Glossary("Percent-encoding", "mã hóa phần trăm")}}: đây là lý do tại sao loại này không phù hợp để dùng với dữ liệu nhị phân và bạn nên dùng `multipart/form-data` cho mục đích đó.
- `multipart/form-data`: mỗi giá trị được gửi dưới dạng một khối dữ liệu ("phần thân"), với dấu phân cách do user agent xác định (ví dụ: `boundary="delimiter12345"`) phân tách từng phần.
  Các khóa được mô tả trong tiêu đề {{HTTPHeader("Content-Disposition")}} của mỗi phần hoặc khối dữ liệu.
- `text/plain`

Khi yêu cầu `POST` được gửi sau một lệnh gọi {{domxref("Window/fetch", "fetch()")}}, hoặc vì lý do nào đó không phải từ biểu mẫu HTML, phần thân có thể là bất kỳ loại nào.
Như được mô tả trong đặc tả HTTP 1.1, `POST` được thiết kế để cho phép một phương thức thống nhất bao quát các chức năng sau:

- Chú thích cho các tài nguyên hiện có
- Đăng một tin nhắn lên bảng tin, nhóm tin tức, danh sách thư, hoặc nhóm bài viết tương tự
- Thêm người dùng mới thông qua biểu mẫu đăng ký
- Cung cấp một khối dữ liệu, chẳng hạn như kết quả gửi biểu mẫu, đến một quy trình xử lý dữ liệu
- Mở rộng cơ sở dữ liệu thông qua thao tác nối thêm

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Safe/HTTP", "An toàn")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Idempotent", "Bất biến")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Cacheable", "Có thể lưu đệm")}}</th>
      <td>Chỉ khi có thông tin độ tươi mới</td>
    </tr>
    <tr>
      <th scope="row">
        Cho phép trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms">HTML forms</a>
      </th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
POST <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Gửi biểu mẫu mã hóa URL

Một biểu mẫu sử dụng mã hóa nội dung `application/x-www-form-urlencoded` (mặc định) gửi một yêu cầu trong đó phần thân chứa dữ liệu biểu mẫu ở dạng các cặp `key=value`, mỗi cặp được phân tách bằng ký hiệu `&`, như được hiển thị bên dưới:

```http
POST /test HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 27

field1=value1&field2=value2
```

### Gửi biểu mẫu multipart

Mã hóa `multipart/form-data` được sử dụng khi một biểu mẫu bao gồm tệp hoặc lượng lớn dữ liệu.
Phần thân yêu cầu này phân định từng phần của biểu mẫu bằng một chuỗi ranh giới.
Ví dụ về một yêu cầu theo định dạng này:

```http
POST /test HTTP/1.1
Host: example.com
Content-Type: multipart/form-data;boundary="delimiter12345"

--delimiter12345
Content-Disposition: form-data; name="field1"

value1
--delimiter12345
Content-Disposition: form-data; name="field2"; filename="example.txt"

value2
--delimiter12345--
```

Tiêu đề {{HTTPHeader("Content-Disposition")}} chỉ ra cách dữ liệu biểu mẫu sẽ được xử lý, chỉ định `name` (tên) trường và `filename` (tên tệp), nếu thích hợp.

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- Tiêu đề {{HTTPHeader("Content-Type")}}
- Tiêu đề {{HTTPHeader("Content-Disposition")}}
- Phương thức {{HTTPMethod("GET")}}
