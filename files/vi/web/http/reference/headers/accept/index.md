---
title: Accept header
short-title: Accept
slug: Web/HTTP/Reference/Headers/Accept
page-type: http-header
browser-compat: http.headers.Accept
sidebar: http
---

Tiêu đề HTTP **`Accept`** {{Glossary("request header", "yêu cầu")}} và {{Glossary("response header", "phản hồi")}} chỉ ra những kiểu nội dung nào, được biểu thị dưới dạng [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types), mà người gửi có thể hiểu.
Trong các yêu cầu, máy chủ sử dụng [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) để chọn một trong các đề xuất và thông báo cho máy khách về lựa chọn với tiêu đề phản hồi {{HTTPHeader("Content-Type")}}.
Trong các phản hồi, nó cung cấp thông tin về những kiểu nội dung nào mà máy chủ có thể hiểu trong các thông điệp đến tài nguyên được yêu cầu, để kiểu nội dung đó có thể được sử dụng trong các yêu cầu tiếp theo đến tài nguyên.

Các trình duyệt đặt các giá trị bắt buộc cho tiêu đề này dựa trên ngữ cảnh của yêu cầu.
Ví dụ, trình duyệt sử dụng các giá trị khác nhau trong yêu cầu khi tải biểu định kiểu CSS, hình ảnh, video, hoặc script.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}},
      {{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
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

\* Giá trị không được chứa [các byte tiêu đề yêu cầu không an toàn CORS](https://fetch.spec.whatwg.org/#cors-unsafe-request-header-byte), bao gồm `"():<>?@[\]{},`, Delete `0x7F`, và các ký tự điều khiển `0x00` đến `0x19`, ngoại trừ Tab `0x09`.

## Cú pháp

```http
Accept: <media-type>/<MIME_subtype>
Accept: <media-type>/*
Accept: */*

// Nhiều kiểu, có trọng số với cú pháp giá trị chất lượng
Accept: text/html, application/xhtml+xml, application/xml;q=0.9, image/webp, */*;q=0.8
```

## Chỉ thị

- `<media-type>/<subtype>`
  - : Một [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) đơn, chính xác, như `text/html`.
- `<media-type>/*`
  - : Một kiểu phương tiện không có kiểu con. Ví dụ, `image/*` tương ứng với `image/png`, `image/svg`, `image/gif`, và các kiểu hình ảnh khác.
- `*/*`
  - : Bất kỳ kiểu phương tiện nào.
- `;q=` (q-factor weighting)
  - : Một giá trị theo thứ tự ưu tiên được biểu thị bằng {{Glossary("quality values", "giá trị chất lượng")}} tương đối gọi là _trọng số_.

## Ví dụ

### Sử dụng các tiêu đề yêu cầu Accept mặc định

Các yêu cầu HTTP được thực hiện bằng các công cụ dòng lệnh như [curl](https://curl.se/) và [wget](https://www.gnu.org/software/wget/) sử dụng `*/*` làm giá trị `Accept` mặc định:

```http
GET / HTTP/1.1
Host: example.com
User-Agent: curl/8.7.1
Accept: */*
```

Điều hướng trình duyệt thông thường có giá trị tiêu đề yêu cầu `Accept` sau:

```http
GET /en-US/ HTTP/2
Host: developer.mozilla.org
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
…
```

Sau khi nhận tài liệu, các giá trị `Accept` mặc định trong các yêu cầu hình ảnh trên trang `developer.mozilla.org` trông như sau:

```http
Accept: image/avif,image/webp,image/png,image/svg+xml,image/*;q=0.8,*/*;q=0.5
```

### Cấu hình tiêu đề yêu cầu Accept cho phản hồi JSON

Các hệ thống liên quan đến tương tác API thường yêu cầu phản hồi `application/json`.
Đây là ví dụ về yêu cầu {{HTTPMethod("GET")}} mà máy khách yêu cầu cụ thể một phản hồi JSON:

```http
GET /users/123 HTTP/1.1
Host: example.com
Authorization: Bearer abcd123
Accept: application/json
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- HTTP [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
- [Danh sách các giá trị Accept mặc định](/en-US/docs/Web/HTTP/Guides/Content_negotiation/List_of_default_Accept_values)
- [Hạn chế tiêu đề yêu cầu được CORS chấp nhận](/en-US/docs/Glossary/CORS-safelisted_request_header#additional_restrictions)
- Tiêu đề với kết quả thương lượng nội dung: {{HTTPHeader("Content-Type")}}
- Các tiêu đề tương tự khác: {{HTTPHeader("TE")}}, {{HTTPHeader("Accept-Encoding")}}, {{HTTPHeader("Accept-Language")}}
