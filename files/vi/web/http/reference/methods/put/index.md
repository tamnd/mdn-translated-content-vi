---
title: PUT request method
short-title: PUT
slug: Web/HTTP/Reference/Methods/PUT
page-type: http-method
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#PUT
sidebar: http
---

Phương thức HTTP **`PUT`** tạo một tài nguyên mới hoặc thay thế biểu diễn của tài nguyên đích bằng {{Glossary("HTTP Content", "nội dung")}} yêu cầu.

Sự khác biệt giữa `PUT` và {{HTTPMethod("POST")}} là `PUT` có tính {{Glossary("idempotent", "bất biến")}}: gọi một lần không khác gì gọi nhiều lần liên tiếp (không có _tác dụng phụ_).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Có</td>
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
PUT <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Tạo tài nguyên thành công

Yêu cầu `PUT` sau đây yêu cầu tạo một tài nguyên tại `example.com/new.html` với nội dung `<p>New File</p>`:

```http
PUT /new.html HTTP/1.1
Host: example.com
Content-type: text/html
Content-length: 16

<p>New File</p>
```

Nếu tài nguyên đích **chưa** có biểu diễn hiện tại và yêu cầu `PUT` tạo thành công một biểu diễn, thì máy chủ gốc phải gửi phản hồi {{HTTPStatus("201", "201 Created")}}:

```http
HTTP/1.1 201 Created
Content-Location: /new.html
```

Nếu tài nguyên đích **đã** có biểu diễn hiện tại và biểu diễn đó được sửa đổi thành công theo trạng thái trong yêu cầu, máy chủ gốc phải gửi {{HTTPStatus("200", "200 OK")}} hoặc {{HTTPStatus("204", "204 No Content")}} để cho biết hoàn thành yêu cầu thành công:

```http
HTTP/1.1 204 No Content
Content-Location: /existing.html
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

Trình duyệt không sử dụng phương thức `PUT` cho các hành động do người dùng khởi tạo, vì vậy "khả năng tương thích với trình duyệt" không áp dụng ở đây.
Nhà phát triển có thể thiết lập phương thức yêu cầu này bằng [`fetch()`](/en-US/docs/Web/API/Window/fetch).

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- Mã trạng thái phản hồi {{HTTPStatus("201", "201 Created")}}, {{HTTPStatus("204", "204 No Content")}}
