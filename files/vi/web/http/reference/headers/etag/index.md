---
title: ETag header
short-title: ETag
slug: Web/HTTP/Reference/Headers/ETag
page-type: http-header
browser-compat: http.headers.ETag
sidebar: http
---

Tiêu đề HTTP **`ETag`** (entity tag) {{Glossary("response header")}} là một định danh cho một phiên bản cụ thể của tài nguyên.
Nó cho phép [bộ nhớ đệm](/en-US/docs/Web/HTTP/Guides/Caching) hiệu quả hơn và tiết kiệm băng thông, vì máy chủ web không cần gửi lại phản hồi đầy đủ nếu nội dung không thay đổi.
Ngoài ra, ETag giúp ngăn chặn các cập nhật đồng thời của tài nguyên ghi đè lên nhau (["xung đột giữa chừng"](#avoiding_mid-air_collisions)).

Nếu tài nguyên tại URL nhất định thay đổi, một giá trị `ETag` mới _phải_ được tạo ra.
So sánh chúng có thể xác định liệu hai biểu diễn của tài nguyên có giống nhau không.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}, {{Glossary("Representation header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
ETag: W/"<etag_value>"
ETag: "<etag_value>"
```

## Chỉ thị

- `W/` {{optional_inline}}
  - : `W/` (phân biệt chữ hoa chữ thường) chỉ báo rằng một [trình xác thực yếu](/en-US/docs/Web/HTTP/Guides/Conditional_requests#weak_validation) được sử dụng.
    ETag yếu dễ tạo nhưng ít hữu ích hơn cho so sánh.
    Trình xác thực mạnh lý tưởng cho so sánh nhưng có thể rất khó tạo hiệu quả.
    Giá trị `ETag` yếu của hai biểu diễn của cùng tài nguyên có thể tương đương về mặt ngữ nghĩa, nhưng không giống hệt nhau từng byte.
    Điều này có nghĩa là ETag yếu ngăn caching khi [yêu cầu phạm vi byte](/en-US/docs/Web/HTTP/Reference/Headers/Accept-Ranges) được sử dụng, nhưng ETag mạnh có nghĩa là yêu cầu phạm vi vẫn có thể được lưu vào bộ nhớ đệm.
- `<etag_value>`
  - : Entity tag xác định duy nhất tài nguyên được yêu cầu. Nó là một chuỗi các ký tự {{Glossary("ASCII")}} được đặt giữa dấu ngoặc kép, như `"675af34563dc-tr34"`.
    Phương pháp tạo giá trị `ETag` không được chỉ định.
    Thông thường, giá trị ETag là băm của nội dung, băm của dấu thời gian sửa đổi cuối cùng, hoặc chỉ đơn giản là số phiên bản.
    Ví dụ: một công cụ wiki có thể sử dụng băm thập lục phân của nội dung bài viết tài liệu.

## Ví dụ

```http
ETag: "33a64df551425fcc55e4d42a148795d9f25f89d4"
ETag: W/"0815"
```

### Tránh xung đột giữa chừng

Với sự trợ giúp của `ETag` và tiêu đề {{HTTPHeader("If-Match")}}, bạn có thể phát hiện xung đột chỉnh sửa giữa chừng (mâu thuẫn).

Ví dụ: khi chỉnh sửa wiki, nội dung wiki hiện tại có thể được băm và đặt vào tiêu đề `ETag` trong phản hồi:

```http
ETag: "33a64df551425fcc55e4d42a148795d9f25f89d4"
```

Khi lưu các thay đổi vào trang wiki (đăng dữ liệu), yêu cầu {{HTTPMethod("POST")}} sẽ chứa tiêu đề {{HTTPHeader("If-Match")}} chứa các giá trị `ETag` để kiểm tra tính tươi mới.

```http
If-Match: "33a64df551425fcc55e4d42a148795d9f25f89d4"
```

Nếu các băm không khớp, điều đó có nghĩa là tài liệu đã được chỉnh sửa trong khoảng thời gian đó và lỗi {{HTTPStatus("412", "412 Precondition Failed")}} sẽ xảy ra.

### Cache tài nguyên không thay đổi

Một cách sử dụng điển hình khác của tiêu đề `ETag` là cache các tài nguyên không thay đổi.
Nếu người dùng truy cập một URL nhất định lại (đã có `ETag` được đặt), và nó _đã cũ_ (quá cũ để coi là có thể sử dụng), máy khách sẽ gửi giá trị `ETag` của mình trong trường tiêu đề {{HTTPHeader("If-None-Match")}}:

```http
If-None-Match: "33a64df551425fcc55e4d42a148795d9f25f89d4"
```

Máy chủ so sánh `ETag` của máy khách (được gửi với `If-None-Match`) với `ETag` cho phiên bản hiện tại của tài nguyên, và nếu cả hai giá trị khớp nhau (tức là tài nguyên không thay đổi), máy chủ gửi lại trạng thái {{HTTPStatus("304", "304 Not Modified")}}, không có thân, cho máy khách biết rằng phiên bản đã cache của phản hồi vẫn tốt để sử dụng (_tươi mới_).

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-None-Match")}}
- Mã trạng thái phản hồi {{HTTPStatus("304", "304 Not Modified")}}, {{HTTPStatus("412", "412 Precondition Failed")}}
- [W3C Note: Editing the Web – Detecting the Lost Update Problem Using Unreserved Checkout](https://www.w3.org/1999/04/Editing/)
