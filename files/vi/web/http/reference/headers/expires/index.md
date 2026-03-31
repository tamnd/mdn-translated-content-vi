---
title: Expires header
short-title: Expires
slug: Web/HTTP/Reference/Headers/Expires
page-type: http-header
browser-compat: http.headers.Expires
sidebar: http
---

Tiêu đề HTTP **`Expires`** {{Glossary("response header")}} chứa ngày/giờ sau khi phản hồi được coi là hết hạn trong bối cảnh [HTTP caching](/en-US/docs/Web/HTTP/Guides/Caching).

Giá trị `0` được sử dụng để biểu diễn một ngày trong quá khứ, chỉ báo rằng tài nguyên đã hết hạn.

> [!NOTE]
> Nếu có tiêu đề {{HTTPHeader("Cache-Control")}} với chỉ thị `max-age` hoặc `s-maxage` trong phản hồi, tiêu đề `Expires` sẽ bị bỏ qua.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Expires: <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
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
Expires: Wed, 21 Oct 2015 07:28:00 GMT
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [HTTP caching](/en-US/docs/Web/HTTP/Guides/Caching)
- {{HTTPHeader("Cache-Control")}}
- {{HTTPHeader("Age")}}
