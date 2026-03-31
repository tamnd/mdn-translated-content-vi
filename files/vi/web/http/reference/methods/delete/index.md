---
title: DELETE request method
short-title: DELETE
slug: Web/HTTP/Reference/Methods/DELETE
page-type: http-method
spec-urls: https://www.rfc-editor.org/rfc/rfc9110.html#name-delete
sidebar: http
---

Phương thức HTTP **`DELETE`** yêu cầu máy chủ xóa một tài nguyên được chỉ định.

Các yêu cầu sử dụng `DELETE` chỉ nên được dùng để xóa dữ liệu và không nên chứa phần thân.

> [!NOTE]
> Ngữ nghĩa của việc gửi phần thân thông điệp trong các yêu cầu `DELETE` là không được xác định.
> Một số máy chủ có thể từ chối yêu cầu với phản hồi [lỗi client 4XX](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Có thể có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Safe/HTTP", "An toàn")}}</th>
      <td>Không</td>
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
      <th scope="row">
        Cho phép trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms">HTML forms</a>
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
DELETE <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Xóa tài nguyên thành công

Yêu cầu sau đây yêu cầu máy chủ xóa tài nguyên `file.html`:

```http
DELETE /file.html HTTP/1.1
Host: example.com
```

Nếu yêu cầu thành công, có một số [mã trạng thái phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) có thể xảy ra.
Phản hồi {{HTTPStatus("204", "204 No Content")}} có nghĩa là yêu cầu thành công và không cần gửi thêm thông tin về client:

```http
HTTP/1.1 204 No Content
Date: Wed, 04 Sep 2024 10:16:04 GMT
```

Phản hồi {{HTTPStatus("200", "200 OK")}} có nghĩa là yêu cầu thành công và phần thân phản hồi bao gồm biểu diễn mô tả kết quả:

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Date: Fri, 21 Jun 2024 14:18:33 GMT
Content-Length: 1234

<html lang="en-US">
  <body>
    <h1>File "file.html" deleted.</h1>
  </body>
</html>
```

Phản hồi {{HTTPStatus("202", "202 Accepted")}} có nghĩa là yêu cầu đã được chấp nhận và có khả năng sẽ thành công, nhưng tài nguyên chưa bị máy chủ xóa.

```http
HTTP/1.1 202 Accepted
Date: Wed, 26 Jun 2024 12:00:00 GMT
Content-Type: text/html; charset=UTF-8
Content-Length: 1234

<html lang="en-US">
  <body>
    <h1>Deletion of "file.html" accepted.</h1>
    <p>See <a href="http://example.com/tasks/123/status">the status monitor</a> for details.</p>
  </body>
</html>
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

Trình duyệt không sử dụng phương thức `DELETE` cho các hành động do người dùng khởi tạo, vì vậy "khả năng tương thích với trình duyệt" không áp dụng ở đây.
Nhà phát triển có thể thiết lập phương thức yêu cầu này bằng [`fetch()`](/en-US/docs/Web/API/Window/fetch).

## Xem thêm

- Mã trạng thái HTTP: {{HTTPStatus("200")}}, {{HTTPStatus("202")}}, {{HTTPStatus("204")}}
- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
