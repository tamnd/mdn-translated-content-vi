---
title: If-None-Match header
short-title: If-None-Match
slug: Web/HTTP/Reference/Headers/If-None-Match
page-type: http-header
browser-compat: http.headers.If-None-Match
sidebar: http
---

Tiêu đề HTTP **`If-None-Match`** {{Glossary("request header")}} tạo ra yêu cầu [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).
Máy chủ trả về tài nguyên được yêu cầu trong các phương thức {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}} với trạng thái {{HTTPStatus("200")}}, chỉ nếu nó không có {{HTTPHeader("ETag")}} khớp với các ETag trong tiêu đề `If-None-Match`.
Đối với các phương thức khác, yêu cầu sẽ được xử lý chỉ nếu {{HTTPHeader("ETag")}} của tài nguyên hiện có không khớp với bất kỳ giá trị nào được liệt kê.

Khi điều kiện thất bại cho các phương thức {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}}, máy chủ phải trả về {{HTTPStatus("304", "304 Not Modified")}} và bất kỳ trường tiêu đề nào sau đây lẽ ra đã được gửi trong phản hồi 200 cho cùng yêu cầu: `Cache-Control`, `Content-Location`, `Date`, `ETag`, `Expires` và `Vary`.
Đối với các phương thức áp dụng thay đổi phía máy chủ, {{HTTPStatus("412", "412 Precondition Failed")}} được sử dụng khi điều kiện thất bại.

So sánh với ETag đã lưu sử dụng _thuật toán so sánh yếu_, nghĩa là hai tệp được coi là giống hệt nhau nếu nội dung tương đương — chúng không cần giống hệt nhau từng byte.
Ví dụ: hai trang khác nhau ở ngày tạo của chúng trong phần chân trang vẫn được coi là giống hệt nhau.

Khi sử dụng kết hợp với {{HTTPHeader("If-Modified-Since")}}, `If-None-Match` có ưu tiên nếu máy chủ hỗ trợ nó.

Có hai trường hợp sử dụng phổ biến của `If-None-Match` trong yêu cầu:

- Đối với các phương thức {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}}, để cập nhật thực thể đã cache có ETag liên kết.
- Đối với các phương thức khác, và đặc biệt là {{HTTPMethod("PUT")}}, `If-None-Match` được sử dụng với giá trị `*` có thể được sử dụng để lưu tệp chỉ nếu nó chưa tồn tại, đảm bảo rằng việc tải lên sẽ không vô tình ghi đè lên tải lên khác và mất dữ liệu của `PUT` trước; vấn đề này là biến thể của [vấn đề mất cập nhật](https://www.w3.org/1999/04/Editing/#3.1).

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
If-None-Match: "<etag_value>"
If-None-Match: "<etag_value>", "<etag_value>", …
If-None-Match: *
```

## Chỉ thị

- `<etag_value>`
  - : Entity tag xác định duy nhất các tài nguyên được yêu cầu. Chúng là một chuỗi các ký tự {{Glossary("ASCII")}} được đặt giữa dấu ngoặc kép (Như `"675af34563dc-tr34"`) và có thể được đặt tiền tố bằng `W/` để chỉ báo rằng thuật toán so sánh yếu nên được sử dụng (điều này vô ích với `If-None-Match` vì nó chỉ sử dụng thuật toán đó).
- `*`
  - : Dấu hoa thị là giá trị đặc biệt đại diện cho bất kỳ tài nguyên nào. Chúng chỉ hữu ích khi tải lên tài nguyên, thường với {{HTTPMethod("PUT")}}, để kiểm tra xem có tài nguyên nào khác với identity này đã được tải lên trước đó chưa.

## Ví dụ

```http
If-None-Match: "bfc13a64729c4290ef5b2c2730249c88ca92d82d"

If-None-Match: W/"67ab43", "54ed21", "7892dd"

If-None-Match: *
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("ETag")}}
- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-Modified-Since")}}, {{HTTPHeader("If-Unmodified-Since")}}
- Mã trạng thái phản hồi {{HTTPStatus("304", "304 Not Modified")}}, {{HTTPStatus("412", "412 Precondition Failed")}}
