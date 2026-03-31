---
title: HEAD request method
short-title: HEAD
slug: Web/HTTP/Reference/Methods/HEAD
page-type: http-method
browser-compat: http.methods.HEAD
sidebar: http
---

Phương thức HTTP **`HEAD`** yêu cầu siêu dữ liệu của một tài nguyên dưới dạng các [tiêu đề](/en-US/docs/Web/HTTP/Reference/Headers) mà máy chủ sẽ gửi nếu phương thức {{HTTPMethod("GET")}} được sử dụng thay thế.
Phương thức này có thể được dùng trong các trường hợp một URL có thể tạo ra tải xuống lớn; ví dụ, yêu cầu `HEAD` có thể đọc tiêu đề {{HTTPHeader("Content-Length")}} để kiểm tra kích thước tệp trước khi tải tệp xuống bằng `GET`.

Nếu phản hồi cho yêu cầu `HEAD` cho thấy một URL đã lưu trong bộ đệm hiện đã lỗi thời, bản sao được lưu trong bộ đệm sẽ bị vô hiệu hóa ngay cả khi không có yêu cầu `GET` nào được thực hiện.

> [!WARNING]
> Nếu phản hồi cho yêu cầu `HEAD` có phần thân, phần thân phản hồi phải bị bỏ qua.
> Bất kỳ {{glossary("Representation header", "tiêu đề biểu diễn")}} nào mô tả phần thân sai đó được coi là mô tả phần thân phản hồi mà yêu cầu `GET` sẽ nhận được.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Không</td>
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
      <td>Có</td>
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
HEAD <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Lấy siêu dữ liệu tài nguyên thành công

Lệnh `curl` sau tạo một yêu cầu `HEAD` cho `example.com`:

```bash
curl --head example.com
```

Đây tương đương với yêu cầu `GET`, ngoại trừ máy chủ không nên đưa vào phần thân thông điệp trong phản hồi.
Nó tạo ra một yêu cầu HTTP trông như thế này:

```http
HEAD / HTTP/1.1
Host: example.com
User-Agent: curl/8.6.0
Accept: */*
```

Máy chủ gửi lại phản hồi {{HTTPStatus("200", "200 OK")}} chỉ gồm các tiêu đề.
Phản hồi thực chất là siêu dữ liệu mô tả tài nguyên thay vì bản thân tài nguyên (một số tiêu đề [bộ đệm](/en-US/docs/Web/HTTP/Guides/Caching) được bỏ qua trong ví dụ này để ngắn gọn):

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Date: Wed, 04 Sep 2024 10:33:11 GMT
Content-Length: 1234567
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- Phương thức {{HTTPMethod("GET")}}
