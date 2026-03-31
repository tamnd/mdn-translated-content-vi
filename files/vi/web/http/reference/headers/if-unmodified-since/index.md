---
title: If-Unmodified-Since header
short-title: If-Unmodified-Since
slug: Web/HTTP/Reference/Headers/If-Unmodified-Since
page-type: http-header
browser-compat: http.headers.If-Unmodified-Since
sidebar: http
---

Tiêu đề HTTP **`If-Unmodified-Since`** {{Glossary("request header")}} tạo yêu cầu tài nguyên [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).
Máy chủ sẽ gửi tài nguyên được yêu cầu (hoặc chấp nhận nó trong trường hợp {{HTTPMethod("POST")}} hoặc phương thức không {{Glossary("Safe/HTTP", "an toàn")}} khác) chỉ nếu tài nguyên trên máy chủ không được sửa đổi sau ngày trong tiêu đề yêu cầu.
Nếu tài nguyên đã được sửa đổi sau ngày được chỉ định, phản hồi sẽ là lỗi {{HTTPStatus("412", "412 Precondition Failed")}}.

Tiêu đề `If-Unmodified-Since` thường được sử dụng trong các tình huống sau:

- Kết hợp với các phương thức không {{Glossary("Safe/HTTP", "an toàn")}} như {{HTTPMethod("POST")}}, tiêu đề này có thể được sử dụng để triển khai [kiểm soát đồng thời lạc quan](https://en.wikipedia.org/wiki/Optimistic_concurrency_control), như một số wiki thực hiện: các sửa đổi bị từ chối nếu tài liệu đã lưu trữ đã được sửa đổi kể từ khi bản gốc được lấy về, tránh xung đột.
- Kết hợp với yêu cầu phạm vi sử dụng tiêu đề {{HTTPHeader("Range")}}, tiêu đề này có thể được sử dụng để đảm bảo rằng đoạn mới được yêu cầu đến từ tài liệu không thay đổi.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
If-Unmodified-Since: <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
```

## Chỉ thị

- `<day-name>`
  - : Một trong `Mon`, `Tue`, `Wed`, `Thu`, `Fri`, `Sat`, hoặc `Sun` (phân biệt chữ hoa chữ thường).
- `<day>`
  - : Số ngày 2 chữ số, ví dụ: "04" hoặc "23".
- `<month>`
  - : Một trong `Jan`, `Feb`, `Mar`, `Apr`, `May`, `Jun`, `Jul`, `Aug`, `Sep`, `Oct`, `Nov`, `Dec` (phân biệt chữ hoa chữ thường).
- `<year>`
  - : Số năm 4 chữ số, ví dụ: "1990" hoặc "2016".
- `<hour>`
  - : Số giờ 2 chữ số, ví dụ: "09" hoặc "23".
- `<minute>`
  - : Số phút 2 chữ số, ví dụ: "04" hoặc "59".
- `<second>`
  - : Số giây 2 chữ số, ví dụ: "04" hoặc "59".
- GMT
  - : Giờ Greenwich Mean Time. Ngày HTTP luôn được biểu diễn theo GMT, không bao giờ theo giờ địa phương.

## Ví dụ

```http
If-Unmodified-Since: Wed, 21 Oct 2015 07:28:00 GMT
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Yêu cầu có điều kiện HTTP](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- {{HTTPHeader("Last-Modified")}}
- Tiêu đề yêu cầu phạm vi {{HTTPHeader("If-Range")}}, {{HTTPHeader("Range")}}
- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-Modified-Since")}}, {{HTTPHeader("If-None-Match")}}
- Mã trạng thái phản hồi {{HTTPStatus("304", "304 Not Modified")}}, {{HTTPStatus("412", "412 Precondition Failed")}}
