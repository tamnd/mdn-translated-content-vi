---
title: If-Modified-Since header
short-title: If-Modified-Since
slug: Web/HTTP/Reference/Headers/If-Modified-Since
page-type: http-header
browser-compat: http.headers.If-Modified-Since
sidebar: http
---

Tiêu đề HTTP **`If-Modified-Since`** {{Glossary("request header")}} tạo ra yêu cầu [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).
Máy chủ gửi lại tài nguyên được yêu cầu, với trạng thái {{HTTPStatus("200")}}, chỉ nếu nó đã được sửa đổi sau ngày trong tiêu đề `If-Modified-Since`.
Nếu tài nguyên không được sửa đổi kể từ đó, phản hồi là {{HTTPStatus("304")}} không có thân, và tiêu đề phản hồi {{HTTPHeader("Last-Modified")}} của yêu cầu trước chứa ngày sửa đổi cuối cùng.

Khác với {{HTTPHeader("If-Unmodified-Since")}}, `If-Modified-Since` chỉ có thể được sử dụng với {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}}.
Khi sử dụng kết hợp với {{HTTPHeader("If-None-Match")}}, nó bị bỏ qua, trừ khi máy chủ không hỗ trợ `If-None-Match`.

Trường hợp sử dụng phổ biến nhất là cập nhật một thực thể đã cache không có {{HTTPHeader("ETag")}} liên kết.

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
If-Modified-Since: <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
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
If-Modified-Since: Wed, 21 Oct 2015 07:28:00 GMT
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("ETag")}}
- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-None-Match")}}, {{HTTPHeader("If-Unmodified-Since")}}
- Mã trạng thái phản hồi {{HTTPStatus("304", "304 Not Modified")}}, {{HTTPStatus("412", "412 Precondition Failed")}}
