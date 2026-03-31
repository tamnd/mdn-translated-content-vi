---
title: Date header
short-title: Date
slug: Web/HTTP/Reference/Headers/Date
page-type: http-header
browser-compat: http.headers.Date
sidebar: http
---

Tiêu đề HTTP **`Date`** {{Glossary("request header", "yêu cầu")}} và {{Glossary("response header")}} chứa ngày và giờ tạo ra thông điệp.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Date: <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
```

## Chỉ thị

- `<day-name>`
  - : Một trong `Mon`, `Tue`, `Wed`, `Thu`, `Fri`, `Sat`, hoặc `Sun` (phân biệt chữ hoa/thường).
- `<day>`
  - : Số ngày 2 chữ số, ví dụ: "04" hoặc "23".
- `<month>`
  - : Một trong `Jan`, `Feb`, `Mar`, `Apr`, `May`, `Jun`, `Jul`, `Aug`, `Sep`, `Oct`, `Nov`, `Dec` (phân biệt chữ hoa/thường).
- `<year>`
  - : Số năm 4 chữ số, ví dụ: "1990" hoặc "2016".
- `<hour>`
  - : Số giờ 2 chữ số, ví dụ: "09" hoặc "23".
- `<minute>`
  - : Số phút 2 chữ số, ví dụ: "04" hoặc "59".
- `<second>`
  - : Số giây 2 chữ số, ví dụ: "04" hoặc "59".
- GMT
  - : Giờ chuẩn Greenwich. Ngày HTTP luôn được biểu thị theo GMT, không bao giờ theo giờ địa phương.

## Ví dụ

### Phản hồi với tiêu đề Date

Thông điệp HTTP sau là trạng thái `200` thành công, với tiêu đề `Date` hiển thị thời gian tạo ra thông điệp.
Các tiêu đề khác bị bỏ qua để ngắn gọn:

```http
HTTP/1.1 200
Content-Type: text/html
Date: Tue, 29 Oct 2024 16:56:32 GMT

<html lang="en-US" …
```

### Cố gắng đặt giá trị trường trong JavaScript

Tiêu đề `Date` là {{Glossary("Forbidden request header")}}, vì vậy code này không thể đặt trường `Date` của thông điệp:

```js example-bad
fetch("https://httpbin.org/get", {
  headers: {
    Date: new Date().toUTCString(),
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Age")}}
