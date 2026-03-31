---
title: GET request method
short-title: GET
slug: Web/HTTP/Reference/Methods/GET
page-type: http-method
browser-compat: http.methods.GET
sidebar: http
---

Phương thức HTTP **`GET`** yêu cầu một biểu diễn của tài nguyên được chỉ định.
Các yêu cầu sử dụng `GET` chỉ nên được dùng để lấy dữ liệu và không nên chứa phần thân.

> [!NOTE]
> Ngữ nghĩa của việc gửi phần thân thông điệp trong các yêu cầu `GET` là không được xác định.
> Một số máy chủ có thể từ chối yêu cầu với phản hồi [lỗi client 4XX](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses).

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
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Cho phép trong HTML forms</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
GET <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Lấy tài nguyên thành công

Yêu cầu `GET` sau đây yêu cầu tài nguyên tại `example.com/contact`:

```http
GET /contact HTTP/1.1
Host: example.com
User-Agent: curl/8.6.0
Accept: */*
```

Máy chủ trả về tài nguyên với mã trạng thái {{HTTPStatus("200", "200 OK")}}, cho biết thành công:

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Date: Fri, 21 Jun 2024 14:18:33 GMT
Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT
Content-Length: 1234

<!doctype html>
<!-- HTML content follows -->
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- Tiêu đề {{HTTPHeader("Range")}}
- Phương thức {{HTTPMethod("POST")}}
