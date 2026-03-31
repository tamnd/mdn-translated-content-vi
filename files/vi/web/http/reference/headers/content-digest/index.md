---
title: Content-Digest header
short-title: Content-Digest
slug: Web/HTTP/Reference/Headers/Content-Digest
page-type: http-header
spec-urls: https://datatracker.ietf.org/doc/html/rfc9530#section-2
sidebar: http
---

Tiêu đề HTTP **`Content-Digest`** {{Glossary("request header", "yêu cầu")}} và {{Glossary("response header", "phản hồi")}} cung cấp {{Glossary("hash function", "thông báo xác thực")}} được tính toán bằng thuật toán hash được áp dụng cho nội dung thông điệp.
Người nhận có thể sử dụng `Content-Digest` để xác thực nội dung thông điệp HTTP cho mục đích toàn vẹn.

Trường {{HTTPHeader("Want-Content-Digest")}} cho phép người gửi yêu cầu `Content-Digest` cùng với các tùy chọn thuật toán hash của họ.
Thông báo xác thực nội dung sẽ khác nhau dựa trên {{HTTPHeader("Content-Encoding")}} và {{HTTPHeader("Content-Range")}}, nhưng không phải {{HTTPHeader("Transfer-Encoding")}}.

Trong một số trường hợp, {{HTTPHeader("Repr-Digest")}} có thể được sử dụng để xác thực tính toàn vẹn của các thông điệp một phần hoặc nhiều phần so với biểu diễn đầy đủ.
Ví dụ, trong [yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests), `Repr-Digest` sẽ luôn có cùng giá trị nếu chỉ có các phạm vi byte được yêu cầu khác nhau, trong khi thông báo xác thực nội dung sẽ khác nhau cho mỗi phần.
Vì lý do này, `Content-Digest` giống hệt với {{HTTPHeader("Repr-Digest")}} khi biểu diễn được gửi trong một thông điệp duy nhất.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}}, {{Glossary("Response header", "Tiêu đề phản hồi")}}, {{Glossary("Representation header", "Tiêu đề biểu diễn")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Digest: <digest-algorithm>=<digest-value>

// Nhiều thuật toán digest
Content-Digest: <digest-algorithm>=<digest-value>,<digest-algorithm>=<digest-value>, …
```

## Chỉ thị

- `<digest-algorithm>`
  - : Thuật toán được sử dụng để tạo thông báo xác thực của nội dung thông điệp. Chỉ có hai thuật toán thông báo xác thực được đăng ký được coi là an toàn: `sha-512` và `sha-256`. Các thuật toán thông báo xác thực được đăng ký không an toàn (kế thừa) là: `md5`, `sha` (SHA-1), `unixsum`, `unixcksum`, `adler` (ADLER32) và `crc32c`.
- `<digest-value>`
  - : Thông báo xác thực theo byte của nội dung thông điệp sử dụng `<digest-algorithm>`. Việc lựa chọn thuật toán thông báo xác thực cũng xác định mã hóa cần sử dụng: `sha-512` và `sha-256` sử dụng mã hóa {{Glossary("base64")}}, trong khi một số thuật toán thông báo xác thực kế thừa như `unixsum` sử dụng số nguyên thập phân.

## Mô tả

Tiêu đề `Digest` được định nghĩa trong các thông số kỹ thuật trước đây, nhưng nó đã gặp phải vấn đề vì phạm vi mà thông báo xác thực áp dụng không rõ ràng.
Cụ thể, rất khó để phân biệt liệu thông báo xác thực có áp dụng cho toàn bộ biểu diễn tài nguyên hay cho nội dung cụ thể của một thông điệp HTTP hay không.
Do đó, hai tiêu đề riêng biệt đã được chỉ định (`Content-Digest` và `Repr-Digest`) để truyền đạt các thông báo xác thực nội dung thông điệp HTTP và thông báo xác thực biểu diễn tài nguyên, tương ứng.

## Ví dụ

### Tác nhân người dùng yêu cầu Content-Digest SHA-256

Trong ví dụ sau, tác nhân người dùng yêu cầu thông báo xác thực của nội dung thông điệp với ưu tiên cho SHA-256, tiếp theo là SHA-1 ở mức độ ưu tiên thấp hơn:

```http
GET /items/123 HTTP/1.1
Host: example.com
Want-Content-Digest: sha-256=10, sha=3
```

Máy chủ phản hồi với `Content-Digest` của nội dung thông điệp sử dụng thuật toán SHA-256:

```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Digest: sha-256=:RK/0qy18MlBSVnWgjwz6lZEWjP/lF5HF9bvEF8FabDg=:

{"hello": "world"}
```

### Giá trị Content-Digest và Repr-Digest giống nhau

Tác nhân người dùng yêu cầu tài nguyên mà không có trường `Want-Content-Digest`:

```http
GET /items/123 HTTP/1.1
Host: example.com
```

Máy chủ được cấu hình để gửi các tiêu đề thông báo xác thực không được yêu cầu trong phản hồi.
Các trường `Repr-Digest` và `Content-Digest` có các giá trị khớp nhau vì chúng sử dụng cùng thuật toán, và trong trường hợp này toàn bộ tài nguyên được gửi trong một thông điệp:

```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 19
Content-Digest: sha-256=:RK/0qy18MlBSVnWgjwz6lZEWjP/lF5HF9bvEF8FabDg=:
Repr-Digest: sha-256=:RK/0qy18MlBSVnWgjwz6lZEWjP/lF5HF9bvEF8FabDg=:

{"hello": "world"}
```

### Giá trị Content-Digest và Repr-Digest khác nhau

Nếu yêu cầu tương tự được lặp lại như ví dụ trước, nhưng sử dụng phương thức {{HTTPMethod("HEAD")}} thay vì {{HTTPMethod("GET")}}, các trường `Repr-Digest` và `Content-Digest` sẽ khác nhau:

```http
GET /items/123 HTTP/1.1
Host: example.com
```

Giá trị `Repr-Digest` sẽ giống như trước, nhưng không có thân thông điệp, vì vậy máy chủ sẽ gửi `Content-Digest` khác:

```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Digest: sha-256=:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=:
Repr-Digest: sha-256=:RK/0qy18MlBSVnWgjwz6lZEWjP/lF5HF9bvEF8FabDg=:
```

### Tác nhân người dùng gửi Content-Digest trong yêu cầu

Trong ví dụ sau, tác nhân người dùng gửi thông báo xác thực của nội dung thông điệp sử dụng SHA-512.
Nó gửi cả `Content-Digest` và `Repr-Digest`, khác nhau vì `Content-Encoding`:

```http
POST /bank_transfer HTTP/1.1
Host: example.com
Content-Encoding: zstd
Content-Digest: sha-512=:ABC…=:
Repr-Digest: sha-512=:DEF…=:

{
 "recipient": "Alex",
 "amount": 900000000
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Tiêu đề này không có tích hợp trình duyệt được xác định bởi thông số kỹ thuật ("khả năng tương thích trình duyệt" không áp dụng).
Các nhà phát triển có thể đặt và lấy các tiêu đề HTTP bằng cách sử dụng `fetch()` để cung cấp hành vi triển khai cụ thể cho ứng dụng.

## Xem thêm

- Tiêu đề {{HTTPHeader("Want-Content-Digest")}} để yêu cầu thông báo xác thực nội dung
- Tiêu đề thông báo xác thực biểu diễn {{HTTPHeader("Repr-Digest")}}, {{HTTPHeader("Want-Repr-Digest")}}
- {{HTTPHeader("ETag")}}
- [Digital Signatures for APIs](https://developer.ebay.com/develop/guides/digital-signatures-for-apis) Hướng dẫn SDK sử dụng `Content-Digest` cho chữ ký số trong các lệnh gọi HTTP (developer.ebay.com)
