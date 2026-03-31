---
title: TRACE request method
short-title: TRACE
slug: Web/HTTP/Reference/Methods/TRACE
page-type: http-method
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#TRACE
sidebar: http
---

Phương thức HTTP **`TRACE`** thực hiện kiểm tra vòng lặp thông điệp dọc theo đường dẫn đến tài nguyên đích.

Người nhận cuối cùng của yêu cầu phải phản ánh lại thông điệp đã nhận (ngoại trừ các trường có thể bao gồm dữ liệu nhạy cảm) về cho client dưới dạng phần thân thông điệp của phản hồi {{HTTPStatus("200", "200 OK")}} với {{HTTPHeader("Content-Type")}} là `message/http`.
Người nhận cuối cùng là máy chủ gốc hoặc máy chủ đầu tiên nhận giá trị {{HTTPHeader("Max-Forwards")}} là `0` trong yêu cầu.

Client không được gửi {{Glossary("HTTP Content", "nội dung")}} trong yêu cầu, hoặc tạo các tiêu đề có thể bao gồm dữ liệu nhạy cảm như thông tin xác thực người dùng hoặc cookie.
Không phải tất cả các máy chủ đều triển khai phương thức `TRACE`, và một số chủ máy chủ đã từng không cho phép sử dụng phương thức `TRACE` do lo ngại bảo mật.
Trong những trường hợp đó, phản hồi lỗi client {{HTTPStatus("405", "405 Method Not Allowed")}} sẽ được gửi.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Safe/HTTP", "An toàn")}}</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Idempotent", "Bất biến")}}</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Cacheable", "Có thể lưu đệm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Cho phép trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms">HTML forms</a></th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
TRACE <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Yêu cầu TRACE thành công

Yêu cầu `TRACE` có thể được thực hiện bằng `curl`:

```bash
curl -v -X TRACE example.com
```

Lệnh này tạo ra yêu cầu HTTP sau:

```http
TRACE / HTTP/1.1
Host: example.com
User-Agent: curl/8.7.1
Accept: */*
```

Phản hồi {{HTTPStatus("200", "200 OK")}} với các tiêu đề yêu cầu được chứa trong phần thân phản hồi được gửi lại cho client:

```http
HTTP/1.1 200 OK
Content-Length: 123
Date: Wed, 04 Sep 2024 11:50:24 GMT
Server: Apache/2.4.59 (Unix)
Content-Type: message/http

TRACE / HTTP/1.1
Host: example.com
User-Agent: curl/8.7.1
Accept: */*
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

Trình duyệt không sử dụng phương thức `TRACE` cho các hành động do người dùng khởi tạo, vì vậy "khả năng tương thích với trình duyệt" không áp dụng ở đây.

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- [Cross-Site Tracing (XST)](https://owasp.org/www-community/attacks/Cross_Site_Tracing)
