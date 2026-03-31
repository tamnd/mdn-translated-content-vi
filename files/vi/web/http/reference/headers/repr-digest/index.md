---
title: Repr-Digest header
short-title: Repr-Digest
slug: Web/HTTP/Reference/Headers/Repr-Digest
page-type: http-header
spec-urls: https://datatracker.ietf.org/doc/html/rfc9530
sidebar: http
---

Tiêu đề HTTP **`Repr-Digest`** {{Glossary("Request header", "yêu cầu")}} và {{Glossary("Response header", "phản hồi")}} cung cấp {{Glossary("hash function", "digest")}} của biểu diễn được chọn của tài nguyên đích.
Nó có thể được sử dụng để xác thực tính toàn vẹn của toàn bộ biểu diễn được chọn sau khi đã được nhận và tái tạo.

_Biểu diễn được chọn_ là định dạng cụ thể của tài nguyên được chọn thông qua [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation).
Chi tiết về biểu diễn có thể được xác định từ {{Glossary("Representation header", "tiêu đề biểu diễn")}}, chẳng hạn như {{HTTPHeader("Content-Language")}}, {{HTTPHeader("Content-Type")}} và {{HTTPHeader("Content-Encoding")}}.

Digest biểu diễn áp dụng cho toàn bộ biểu diễn thay vì mã hóa hoặc phân đoạn của các thông điệp được sử dụng để gửi nó.
{{HTTPHeader("Content-Digest")}} áp dụng cho nội dung của thông điệp cụ thể và sẽ có các giá trị khác nhau dựa trên {{HTTPHeader("Content-Encoding")}} và {{HTTPHeader("Content-Range")}} của mỗi thông điệp.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Representation header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Repr-Digest: <digest-algorithm>=<digest-value>

// Multiple digest algorithms
Repr-Digest: <digest-algorithm>=<digest-value>,…,<digest-algorithmN>=<digest-valueN>
```

## Chỉ thị

- `<digest-algorithm>`
  - : Thuật toán được sử dụng để tạo digest của biểu diễn.
    Chỉ có hai thuật toán digest đã đăng ký được coi là an toàn: `sha-512` và `sha-256`.
    Các thuật toán digest đã đăng ký không an toàn (cũ) là: `md5`, `sha` (SHA-1), `unixsum`, `unixcksum`, `adler` (ADLER32) và `crc32c`.
- `<digest-value>`
  - : Digest tính bằng byte của biểu diễn sử dụng `<digest-algorithm>`.
    Lựa chọn thuật toán digest cũng xác định mã hóa sử dụng: `sha-512` và `sha-256` sử dụng mã hóa {{Glossary("base64")}}, trong khi một số thuật toán digest cũ như `unixsum` sử dụng số nguyên thập phân.
    Trái với các bản nháp trước của thông số kỹ thuật, các byte digest được mã hóa base64 tiêu chuẩn được bao quanh bởi dấu hai chấm (`:`, ASCII 0x3A) như một phần của [cú pháp từ điển](https://www.rfc-editor.org/rfc/rfc8941#name-byte-sequences).

Việc sử dụng các thuật toán digest không an toàn không được khuyến khích vì các va chạm có thể được ép buộc một cách thực tế, làm cho tính hữu dụng của digest yếu đi.
Trừ khi làm việc với các hệ thống cũ (điều này ít có khả năng vì hầu hết sẽ mong đợi tiêu đề `Digest` đã lỗi thời và không hiểu thông số kỹ thuật này), hãy xem xét bỏ qua `Repr-Digest` thay vì bao gồm một với thuật toán digest không an toàn.

## Mô tả

Tiêu đề `Digest` được xác định trong các thông số kỹ thuật trước đó, nhưng nó tỏ ra có vấn đề vì phạm vi của digest áp dụng cho không rõ ràng.
Cụ thể, rất khó phân biệt liệu digest có áp dụng cho toàn bộ biểu diễn tài nguyên hay cho nội dung cụ thể của thông điệp HTTP.
Do đó, hai tiêu đề riêng biệt được chỉ định (`Content-Digest` và `Repr-Digest`) để truyền đạt các digest nội dung thông điệp HTTP và các digest biểu diễn tài nguyên tương ứng.

## Ví dụ

### Tác nhân người dùng gửi Repr-Digest trong yêu cầu

Trong ví dụ sau, tác nhân người dùng gửi digest của nội dung thông điệp bằng SHA-512.
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

Máy chủ có thể tính toán digest của nội dung nó đã nhận và so sánh kết quả với tiêu đề `Content-Digest` hoặc `Repr-Digest` để xác thực tính toàn vẹn thông điệp.
Trong các yêu cầu như ví dụ trên, `Repr-Digest` hữu ích hơn cho máy chủ vì nó được tính toán trên biểu diễn đã giải mã và sẽ nhất quán hơn trong các tình huống khác nhau.

### Phản hồi HTTP nơi `Repr-Digest` và `Content-Digest` trùng khớp

Máy chủ HTTP có thể gửi toàn bộ biểu diễn không được mã hóa trong một thông điệp.
Trong trường hợp này, `Repr-Digest` và `Content-Digest` có giá trị bằng nhau cho cùng các thuật toán digest:

```http
…
Repr-Digest: sha-256=:AEGPTgUMw5e96wxZuDtpfm23RBU3nFwtgY5fw4NYORo=:
Content-Digest: sha-256=:AEGPTgUMw5e96wxZuDtpfm23RBU3nFwtgY5fw4NYORo=:
…
Content-Type: text/yaml
Content-Encoding: br
Content-Length: 38054
Content-Range: 0-38053/38054
…

[message body]
```

### Phản hồi HTTP nơi `Repr-Digest` và `Content-Digest` phân kỳ

Máy chủ có thể nén nội dung để gửi.
Trong trường hợp này {{HTTPHeader("Content-Digest")}} sẽ phụ thuộc vào {{HTTPHeader("Content-Encoding")}}, và do đó sẽ có giá trị khác với tiêu đề `Repr-Digest` trong phản hồi:

```http
…
Repr-Digest: sha-256=:AEGPTgUMw5e96wxZuDtpfm23RBU3nFwtgY5fw4NYORo=:, sha-512=:U59TCCaZPA9Qio3CzHJVAgDnIAut53t5Sgkj2Gv4BvDd0b+OX9QpIdgWkzdXLmBsmvBrf3t5PBt+UrVK6k5dkw==:
Content-Digest: sha-256=:293wcr5IoFAsDCzdoDXR1Qppgf2yxOPO1bvQ3nZQtuI=:, unixsum=54809
…
Content-Type: text/html; charset=utf-8
Content-Encoding: br
…

[message body]
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

Tiêu đề này không có tích hợp trình duyệt được xác định trong thông số kỹ thuật ("khả năng tương thích trình duyệt" không áp dụng).
Các nhà phát triển có thể đặt và lấy các tiêu đề HTTP bằng `fetch()` để cung cấp hành vi triển khai dành riêng cho ứng dụng.

## Xem thêm

- {{HTTPHeader("Content-Digest")}}, {{HTTPHeader("Want-Content-Digest")}}, {{HTTPHeader("Want-Repr-Digest")}}
- {{HTTPHeader("ETag")}}
- {{HTTPHeader("Content-Encoding")}}
- [Digital Signatures for APIs](https://developer.ebay.com/develop/guides/digital-signatures-for-apis) hướng dẫn SDK sử dụng `Content-Digest` cho chữ ký số trong các lời gọi HTTP (developer.ebay.com)
