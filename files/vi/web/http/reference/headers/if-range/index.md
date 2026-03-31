---
title: If-Range header
short-title: If-Range
slug: Web/HTTP/Reference/Headers/If-Range
page-type: http-header
browser-compat: http.headers.If-Range
sidebar: http
---

Tiêu đề HTTP **`If-Range`** {{Glossary("request header")}} tạo ra yêu cầu phạm vi [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).
Nếu điều kiện được đáp ứng, một [yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) được đưa ra, và máy chủ gửi lại phản hồi {{HTTPStatus("206", "206 Partial Content")}} với một phần (hoặc các phần) của tài nguyên trong thân.
Nếu điều kiện không được đáp ứng, toàn bộ tài nguyên được gửi lại với trạng thái {{HTTPStatus("200", "200 OK")}}.

Tiêu đề này có thể được sử dụng với trình xác thực {{HTTPHeader("Last-Modified")}} hoặc với {{HTTPHeader("ETag")}}, nhưng không phải cả hai.

Trường hợp sử dụng phổ biến nhất là tiếp tục tải xuống với đảm bảo rằng tài nguyên trên máy chủ không được sửa đổi kể từ khi phần cuối cùng được máy khách nhận.

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
If-Range: <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
If-Range: <etag>
```

## Chỉ thị

- `<etag>`
  - : Entity tag xác định duy nhất tài nguyên được yêu cầu. Nó là một chuỗi các ký tự ASCII được đặt giữa dấu ngoặc kép (Như `"675af34563dc-tr34"`). Entity tag yếu (một tag được đặt tiền tố bằng `W/`) không được sử dụng trong tiêu đề này.
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
If-Range: Wed, 21 Oct 2015 07:28:00 GMT

If-Range: "67ab43"
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Yêu cầu có điều kiện HTTP](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- {{HTTPHeader("ETag")}}
- {{HTTPHeader("Last-Modified")}}
- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-Modified-Since")}}, {{HTTPHeader("If-Unmodified-Since")}}, {{HTTPHeader("If-None-Match")}}
- Mã trạng thái phản hồi {{HTTPStatus("206", "206 Partial Content")}}, {{HTTPStatus("412", "412 Precondition Failed")}}, {{HTTPStatus("416", "416 Range Not Satisfiable")}}
