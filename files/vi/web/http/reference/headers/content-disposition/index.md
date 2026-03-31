---
title: Content-Disposition header
short-title: Content-Disposition
slug: Web/HTTP/Reference/Headers/Content-Disposition
page-type: http-header
browser-compat: http.headers.Content-Disposition
sidebar: http
---

Tiêu đề HTTP **`Content-Disposition`** chỉ ra liệu nội dung có nên được hiển thị _trực tiếp_ trong trình duyệt như một trang web hoặc một phần của trang web hay được tải xuống như một _tệp đính kèm_ cục bộ.

Trong thân nhiều phần (multipart body), tiêu đề phải được sử dụng trên mỗi phần con để cung cấp thông tin về trường tương ứng của nó. Phần con được phân cách bởi _ranh giới_ được xác định trong tiêu đề {{HTTPHeader("Content-Type")}}. Khi được sử dụng trên chính thân, `Content-Disposition` không có hiệu lực.

Tiêu đề `Content-Disposition` được định nghĩa trong ngữ cảnh rộng hơn của các thông điệp MIME cho email, nhưng chỉ một tập con các tham số có thể áp dụng cho các biểu mẫu HTTP và yêu cầu {{HTTPMethod("POST")}}. Chỉ giá trị `form-data`, cũng như chỉ thị tùy chọn `name` và `filename`, có thể được sử dụng trong ngữ cảnh HTTP.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header", "Tiêu đề phản hồi")}} (cho thân chính),<br />{{Glossary("Request header", "Tiêu đề yêu cầu")}},
        {{Glossary("Response header", "Tiêu đề phản hồi")}} (cho phần con của thân nhiều phần)
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

### Là tiêu đề phản hồi cho thân chính

Tham số đầu tiên trong ngữ cảnh HTTP là `inline` (giá trị mặc định, chỉ ra rằng nó có thể hiển thị bên trong trang web, hoặc là trang web) hoặc `attachment` (chỉ ra rằng nó nên được tải xuống; hầu hết các trình duyệt trình bày hộp thoại 'Lưu thành', được điền trước với giá trị của các tham số `filename` nếu có).

```http
Content-Disposition: inline
Content-Disposition: attachment
Content-Disposition: attachment; filename="file name.jpg"
Content-Disposition: attachment; filename*=UTF-8''file%20name.jpg
```

Dấu nháy xung quanh tên tệp là tùy chọn, nhưng cần thiết nếu bạn sử dụng các ký tự đặc biệt trong tên tệp, chẳng hạn như khoảng trắng.

Các tham số `filename` và `filename*` chỉ khác nhau ở chỗ `filename*` sử dụng mã hóa được định nghĩa trong {{rfc("5987", "", "3.2")}}.
Khi cả `filename` và `filename*` đều có mặt trong một giá trị trường tiêu đề duy nhất, `filename*` được ưu tiên hơn `filename` khi cả hai đều được hiểu. Khuyến nghị bao gồm cả hai để tối đa khả năng tương thích.

### Là tiêu đề cho thân nhiều phần

Thân `multipart/form-data` yêu cầu tiêu đề `Content-Disposition` để cung cấp thông tin về mỗi phần con của biểu mẫu (ví dụ: cho mỗi trường biểu mẫu và bất kỳ tệp nào là một phần của dữ liệu trường).
Chỉ thị đầu tiên luôn là `form-data`, và tiêu đề cũng phải bao gồm tham số `name` để xác định trường liên quan.

```http
Content-Disposition: form-data; name="fieldName"
Content-Disposition: form-data; name="fieldName"; filename="filename.jpg"
```

#### Chỉ thị

- `name`
  - : Tiếp theo là chuỗi chứa tên của trường HTML trong biểu mẫu mà nội dung của phần con này đề cập đến. Khi xử lý nhiều tệp trong cùng một trường (ví dụ: thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple) của phần tử `{{HTMLElement("input","&lt;input type=\"file\"&gt;")}}`), có thể có nhiều phần con với cùng tên.

    Tên có giá trị `'_charset_'` chỉ ra rằng phần không phải là trường HTML, mà là bộ ký tự mặc định để sử dụng cho các phần không có thông tin bộ ký tự rõ ràng.

- `filename`
  - : Tiếp theo là chuỗi chứa tên gốc của tệp được truyền. Tham số này cung cấp chủ yếu thông tin chỉ dẫn. Các gợi ý trong [RFC2183](https://www.rfc-editor.org/rfc/rfc2183#section-2.3) áp dụng:
    - Ưu tiên các ký tự ASCII nếu có thể.
    - Bất kỳ thông tin đường dẫn nào nên bị xóa bỏ, chẳng hạn bằng cách thay thế `/` bằng `_`.
    - Khi ghi vào đĩa, không được ghi đè tệp hiện có.
    - Tránh tạo các tệp đặc biệt có các ảnh hưởng bảo mật.

## Ví dụ

### Kích hoạt hộp thoại tải xuống cho tài nguyên

Phản hồi sau kích hoạt hộp thoại "Lưu Thành" trong trình duyệt:

```http
200 OK
Content-Type: text/html; charset=utf-8
Content-Disposition: attachment; filename="cool.html"
Content-Length: 21

<HTML>Save me!</HTML>
```

Tệp HTML sẽ được tải xuống thay vì hiển thị trong trình duyệt. Hầu hết trình duyệt sẽ nhắc người dùng lưu nó với tên tệp `cool.html` theo mặc định.

### HTML gửi nội dung kiểu multipart/form-data

Ví dụ sau hiển thị biểu mẫu HTML được gửi bằng `multipart/form-data` sử dụng tiêu đề `Content-Disposition`.

```http
POST /test.html HTTP/1.1
Host: example.org
Content-Type: multipart/form-data;boundary="delimiter123"

--delimiter123
Content-Disposition: form-data; name="field1"

value1
--delimiter123
Content-Disposition: form-data; name="field2"; filename="example.txt"

value2
--delimiter123--
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTML Forms](/en-US/docs/Learn_web_development/Extensions/Forms)
- Tiêu đề {{HTTPHeader("Content-Type")}} định nghĩa ranh giới của thân nhiều phần.
- Giao diện {{domxref("FormData")}} được sử dụng để chuẩn bị dữ liệu biểu mẫu để sử dụng trong các API {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest")}}.
