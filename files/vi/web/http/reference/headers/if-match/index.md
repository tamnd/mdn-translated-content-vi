---
title: If-Match header
short-title: If-Match
slug: Web/HTTP/Reference/Headers/If-Match
page-type: http-header
browser-compat: http.headers.If-Match
sidebar: http
---

Tiêu đề HTTP **`If-Match`** {{Glossary("request header")}} làm cho yêu cầu trở thành [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).
Máy chủ sẽ trả về tài nguyên cho các phương thức {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}}, hoặc tải lên tài nguyên cho {{HTTPMethod("PUT")}} và các phương thức không an toàn khác, chỉ nếu tài nguyên khớp với một trong các giá trị {{HTTPHeader("ETag")}} trong tiêu đề yêu cầu `If-Match`.
Nếu điều kiện không khớp, phản hồi {{HTTPStatus("412", "412 Precondition Failed")}} sẽ được trả về thay thế.

So sánh với {{HTTPHeader("ETag")}} đã lưu sử dụng _thuật toán so sánh mạnh_, nghĩa là hai tệp được coi là giống hệt nhau từng byte.
Nếu `ETag` được liệt kê có tiền tố `W/` chỉ báo entity tag yếu, thuật toán so sánh này sẽ không bao giờ khớp nó.

Có hai trường hợp sử dụng phổ biến:

- Đối với các phương thức {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}}, được sử dụng kết hợp với tiêu đề {{HTTPHeader("Range")}}, nó có thể đảm bảo rằng các phạm vi mới được yêu cầu đến từ cùng tài nguyên như cái trước đó.
- Đối với các phương thức khác, và đặc biệt là {{HTTPMethod("PUT")}}, `If-Match` có thể được sử dụng để ngăn chặn [vấn đề mất cập nhật](https://www.w3.org/1999/04/Editing/#3.1).
  Nó có thể kiểm tra xem việc sửa đổi tài nguyên mà người dùng muốn tải lên sẽ không ghi đè lên thay đổi khác đã được thực hiện kể từ khi tài nguyên ban đầu được tải về.

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
If-Match: <etag_value>
If-Match: <etag_value>, <etag_value>, …
```

## Chỉ thị

- `<etag_value>`
  - : Entity tag xác định duy nhất các tài nguyên được yêu cầu.
    Chúng là một chuỗi các ký tự {{Glossary("ASCII")}} được đặt giữa dấu ngoặc kép (như `"675af34563dc-tr34"`).
    Chúng có thể được đặt tiền tố bằng `W/` để chỉ báo rằng chúng "yếu", tức là biểu diễn tài nguyên về mặt ngữ nghĩa nhưng không phải từng byte.
    Tuy nhiên, trong tiêu đề `If-Match`, entity tag yếu sẽ không bao giờ khớp.
- `*`
  - : Dấu hoa thị là giá trị đặc biệt đại diện cho bất kỳ tài nguyên nào.
    Lưu ý rằng điều này phải khớp là `false` nếu máy chủ gốc không có biểu diễn hiện tại cho tài nguyên đích.

## Ví dụ

```http
If-Match: "bfc13a64729c4290ef5b2c2730249c88ca92d82d"

If-Match: "67ab43", "54ed21", "7892dd"

If-Match: *
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("ETag")}}
- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-None-Match")}}, {{HTTPHeader("If-Modified-Since")}}, {{HTTPHeader("If-Unmodified-Since")}}
- {{HTTPStatus("412", "412 Precondition Failed")}}
