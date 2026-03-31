---
title: Content-Type header
short-title: Content-Type
slug: Web/HTTP/Reference/Headers/Content-Type
page-type: http-header
browser-compat: http.headers.Content-Type
sidebar: http
---

Tiêu đề HTTP **`Content-Type`** {{Glossary("representation header", "biểu diễn")}} được sử dụng để chỉ ra {{Glossary("MIME type", "kiểu phương tiện")}} gốc của tài nguyên trước khi áp dụng bất kỳ mã hóa nội dung nào.

Trong các phản hồi, tiêu đề `Content-Type` thông báo cho máy khách về kiểu phương tiện của dữ liệu được trả về.
Trong các yêu cầu như {{HTTPMethod("POST")}} hoặc {{HTTPMethod("PUT")}}, máy khách sử dụng tiêu đề `Content-Type` để chỉ định loại nội dung được gửi đến máy chủ.
Nếu triển khai hoặc cấu hình máy chủ nghiêm ngặt về xử lý kiểu nội dung, phản hồi lỗi máy khách {{HTTPStatus("415")}} có thể được trả về.

Tiêu đề `Content-Type` khác với {{HTTPHeader("Content-Encoding")}} ở chỗ `Content-Encoding` giúp người nhận hiểu cách giải mã dữ liệu về dạng gốc của nó.

> [!NOTE]
> Giá trị này có thể bị bỏ qua nếu trình duyệt thực hiện [MIME sniffing](/en-US/docs/Web/HTTP/Guides/MIME_types#mime_sniffing) (hoặc content sniffing) trên các phản hồi.
> Để ngăn trình duyệt sử dụng MIME sniffing, hãy đặt giá trị tiêu đề {{HTTPHeader("X-Content-Type-Options")}} thành `nosniff`.
> Xem [xác minh kiểu MIME](/en-US/docs/Web/Security/Practical_implementation_guides/MIME_types) để biết thêm chi tiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Representation header", "Tiêu đề biểu diễn")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>
        Có*
      </td>
    </tr>
  </tbody>
</table>

\* Giá trị không được chứa [byte tiêu đề yêu cầu không an toàn CORS](https://fetch.spec.whatwg.org/#cors-unsafe-request-header-byte): `"():<>?@[\]{},`, Delete `0x7F`, và các ký tự điều khiển `0x00` đến `0x19` ngoại trừ Tab `0x09`. Nó cũng cần có kiểu phương tiện của giá trị đã phân tích (bỏ qua các tham số) là `application/x-www-form-urlencoded`, `multipart/form-data`, hoặc `text/plain`.

## Cú pháp

```plain
Content-Type: <media-type>
```

Ví dụ:

```http
Content-Type: text/html; charset=utf-8
Content-Type: multipart/form-data; boundary=ExampleBoundaryString
```

## Chỉ thị

- `<media-type>`
  - : [Kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) của tài nguyên hoặc dữ liệu. Có thể chứa các tham số sau:
    - **`charset`**: Chỉ ra tiêu chuẩn {{Glossary("character encoding")}} được sử dụng. Giá trị không phân biệt chữ hoa/thường nhưng chữ thường được ưu tiên.
    - **`boundary`**: Đối với các thực thể nhiều phần, tham số `boundary` là bắt buộc. Nó được sử dụng để phân định ranh giới của nhiều phần của thông điệp.

## Ví dụ

### Phục vụ tài sản với kiểu nội dung chính xác

Trong hai phản hồi ví dụ sau, tài sản JavaScript và CSS được phục vụ bằng `text/javascript` cho JavaScript và `text/css` cho CSS.
Kiểu nội dung chính xác cho các tài nguyên này giúp trình duyệt xử lý chúng an toàn hơn và với hiệu suất tốt hơn.

```http
HTTP/1.1 200
content-encoding: br
content-type: text/javascript; charset=utf-8
vary: Accept-Encoding
date: Fri, 21 Jun 2024 14:02:25 GMT
content-length: 2978

const videoPlayer=document.getElementById...
```

```http
HTTP/3 200
server: nginx
date: Wed, 24 Jul 2024 16:53:02 GMT
content-type: text/css
vary: Accept-Encoding
content-encoding: br

.super-container{clear:both;max-width:100%}...
```

### `Content-Type` trong biểu mẫu nhiều phần

Trong yêu cầu {{HTTPMethod("POST")}} xuất phát từ việc gửi biểu mẫu HTML, `Content-Type` của yêu cầu được chỉ định bởi thuộc tính `enctype` trên phần tử {{HTMLElement("form")}}.

```html
<form action="/foo" method="post" enctype="multipart/form-data">
  <input type="text" name="description" value="Description input value" />
  <input type="file" name="myFile" />
  <button type="submit">Submit</button>
</form>
```

Yêu cầu trông như ví dụ sau với một số tiêu đề bị bỏ qua cho ngắn gọn. Trong yêu cầu, ranh giới `ExampleBoundaryString` được sử dụng để minh họa, nhưng trong thực tế, trình duyệt sẽ tạo chuỗi giống như `---------------------------1003363413119651595289485765`.

```http
POST /foo HTTP/1.1
Content-Length: 68137
Content-Type: multipart/form-data; boundary=ExampleBoundaryString

--ExampleBoundaryString
Content-Disposition: form-data; name="description"

Description input value
--ExampleBoundaryString
Content-Disposition: form-data; name="myFile"; filename="foo.txt"
Content-Type: text/plain

[content of the file foo.txt chosen by the user]
--ExampleBoundaryString--
```

### `Content-Type` trong gửi biểu mẫu được mã hóa URL

Khi các biểu mẫu không liên quan đến tải lên tệp và sử dụng các trường đơn giản hơn, biểu mẫu được mã hóa URL có thể thuận tiện hơn khi dữ liệu biểu mẫu được bao gồm trong thân yêu cầu:

```html
<form action="/submit" method="post">
  <label for="comment">Comment:</label>
  <input type="text" id="comment" name="comment" value="Hello!" />
  <button type="submit">Submit</button>
</form>
```

```http
POST /submit HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 16

comment=Hello%21
```

### `Content-Type` trong REST API sử dụng JSON

Nhiều {{Glossary("REST")}} API sử dụng `application/json` làm kiểu nội dung, thuận tiện cho giao tiếp máy-máy hoặc tương tác có lập trình.
Ví dụ sau hiển thị phản hồi {{HTTPStatus("201", "201 Created")}} cho thấy kết quả của yêu cầu thành công:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "message": "New user created",
  "user": {
    "id": 123,
    "firstName": "Paul",
    "lastName": "Klee",
    "email": "p.klee@example.com"
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề {{HTTPHeader("Accept")}}, {{HTTPHeader("Accept-Encoding")}}, {{HTTPHeader("Accept-Language")}}
- {{HTTPHeader("Vary")}}
- {{HTTPHeader("Content-Encoding")}}
- {{HTTPHeader("Content-Disposition")}}
- {{HTTPStatus("206", "206 Partial Content")}}
- {{HTTPHeader("X-Content-Type-Options")}}
