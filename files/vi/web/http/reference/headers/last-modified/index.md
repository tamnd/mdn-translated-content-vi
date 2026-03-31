---
title: Last-Modified header
short-title: Last-Modified
slug: Web/HTTP/Reference/Headers/Last-Modified
page-type: http-header
browser-compat: http.headers.Last-Modified
sidebar: http
---

Tiêu đề HTTP **`Last-Modified`** {{glossary("response header")}} chứa ngày và giờ mà máy chủ gốc tin rằng tài nguyên đã được sửa đổi lần cuối.
Nó được sử dụng như một trình xác thực trong [yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests) ({{HTTPHeader("If-Modified-Since")}} hoặc {{HTTPHeader("If-Unmodified-Since")}}) để xác định liệu tài nguyên được yêu cầu có giống với tài nguyên đã được máy khách lưu trữ hay không.
Nó kém chính xác hơn {{HTTPHeader("ETag")}} để xác định nội dung tệp, nhưng có thể được sử dụng như cơ chế dự phòng nếu ETags không khả dụng.

`Last-Modified` cũng được sử dụng bởi [các trình thu thập](/en-US/docs/Glossary/Crawler) để điều chỉnh tần suất thu thập, bởi trình duyệt trong [caching heuristic](/en-US/docs/Web/HTTP/Guides/Caching#heuristic_caching), và bởi các hệ thống quản lý nội dung (CMS) để hiển thị thời gian nội dung được sửa đổi lần cuối.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{glossary("Response header")}}, {{Glossary("Representation header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
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
Last-Modified: <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
```

## Chỉ thị

- `<day-name>`
  - : Một trong "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", hoặc "Sun" (phân biệt chữ hoa chữ thường).
- `<day>`
  - : Số ngày 2 chữ số, ví dụ: "04" hoặc "23".
- `<month>`
  - : Một trong "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" (phân biệt chữ hoa chữ thường).
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
Last-Modified: Wed, 21 Oct 2015 07:28:00 GMT
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Etag")}}
- Hướng dẫn [Yêu cầu có điều kiện HTTP](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-Modified-Since")}}, {{HTTPHeader("If-Unmodified-Since")}}, {{HTTPHeader("If-None-Match")}}
- Mã trạng thái phản hồi {{HTTPStatus("304", "304 Not Modified")}}, {{HTTPStatus("412", "412 Precondition Failed")}}
