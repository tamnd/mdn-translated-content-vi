---
title: Content-Location header
short-title: Content-Location
slug: Web/HTTP/Reference/Headers/Content-Location
page-type: http-header
browser-compat: http.headers.Content-Location
sidebar: http
---

Tiêu đề HTTP **`Content-Location`** {{Glossary("representation header", "biểu diễn")}} chỉ ra vị trí thay thế cho dữ liệu được trả về.
Mục đích chính của nó là chỉ ra URL của tài nguyên được truyền như kết quả của [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation).

Tiêu đề `Content-Location` khác với tiêu đề {{HTTPHeader("Location")}}.
`Content-Location` chỉ ra URL trực tiếp để truy cập tài nguyên khi [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) đã xảy ra, cho phép máy khách bỏ qua thương lượng nội dung trong tương lai cho tài nguyên này.
Mặt khác, `Location` chỉ ra mục tiêu của chuyển hướng `3XX` hoặc URL của tài nguyên mới được tạo trong phản hồi {{HTTPStatus("201", "201 Created")}}.

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
  </tbody>
</table>

## Cú pháp

```http
Content-Location: <url>
```

## Chỉ thị

- `<url>`
  - : Một URL có thể là [tuyệt đối](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL#absolute_urls_vs._relative_urls) hoặc [tương đối](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL#absolute_urls_vs._relative_urls) so với URL yêu cầu.

## Ví dụ

### Yêu cầu dữ liệu từ máy chủ ở các định dạng khác nhau

Giả sử API của một trang web có thể trả về dữ liệu ở định dạng {{glossary("JSON")}}, {{glossary("XML")}}, hoặc [CSV](https://en.wikipedia.org/wiki/Comma-separated_values). Nếu URL cho một tài liệu cụ thể là tại `https://example.com/documents/foo`, trang web có thể trả về các URL `Content-Location` khác nhau tùy thuộc vào tiêu đề {{HTTPHeader("Accept")}} của yêu cầu:

| Tiêu đề yêu cầu                       | Tiêu đề phản hồi                        |
| ------------------------------------- | --------------------------------------- |
| `Accept: application/json, text/json` | `Content-Location: /documents/foo.json` |
| `Accept: application/xml, text/xml`   | `Content-Location: /documents/foo.xml`  |
| `Accept: text/plain, text/*`          | `Content-Location: /documents/foo.txt`  |

Sau đó, máy khách có thể nhớ rằng phiên bản JSON có sẵn tại URL cụ thể đó, bỏ qua thương lượng nội dung lần tiếp theo khi yêu cầu tài liệu đó.

### Chỉ ra URL kết quả của giao dịch

Giả sử bạn có một [`<form>`](/en-US/docs/Web/HTML/Reference/Elements/form) để gửi tiền cho người dùng khác của trang web.

```html
<form action="/send-payment" method="post">
  <p>
    <label>
      Bạn muốn gửi tiền cho ai?
      <input type="text" name="recipient" />
    </label>
  </p>

  <p>
    <label>
      Bao nhiêu?
      <input type="number" name="amount" />
    </label>
  </p>

  <button type="submit">Gửi tiền</button>
</form>
```

Khi biểu mẫu được gửi, trang web tạo biên lai cho giao dịch. Máy chủ có thể sử dụng `Content-Location` để chỉ ra URL của biên lai đó cho việc truy cập trong tương lai.

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
Content-Location: /my-receipts/38

<!doctype html>
(Lots of HTML…)

<p>You sent $38.00 to ExampleUser.</p>

(Lots more HTML…)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Location")}}
