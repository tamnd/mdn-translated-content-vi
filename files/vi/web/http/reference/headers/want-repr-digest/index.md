---
title: Want-Repr-Digest header
short-title: Want-Repr-Digest
slug: Web/HTTP/Reference/Headers/Want-Repr-Digest
page-type: http-header
spec-urls: https://datatracker.ietf.org/doc/html/rfc9530#section-4
sidebar: http
---

Tiêu đề HTTP **`Want-Repr-Digest`** {{glossary("request header", "request")}} và {{glossary("response header")}} cho biết sở thích để người nhận gửi tiêu đề toàn vẹn {{HTTPHeader("Repr-Digest")}} trong các thông điệp liên quan đến URI yêu cầu và siêu dữ liệu biểu diễn.

Tiêu đề bao gồm các tùy chọn thuật toán băm mà người nhận có thể sử dụng trong các thông điệp tiếp theo.
Các tùy chọn chỉ phục vụ như gợi ý, và người nhận có thể bỏ qua các lựa chọn thuật toán, hoặc hoàn toàn bỏ qua các tiêu đề toàn vẹn.

Một số triển khai có thể gửi các tiêu đề `Repr-Digest` không được yêu cầu mà không cần yêu cầu tiêu đề `Want-Repr-Digest` trong thông điệp trước.

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
Want-Repr-Digest: <algorithm>=<preference>
Want-Repr-Digest: <algorithm>=<preference>, …, <algorithmN>=<preferenceN>
```

## Chỉ thị

- `<algorithm>`
  - : Thuật toán được yêu cầu để tạo digest của biểu diễn.
    Chỉ hai thuật toán digest đã đăng ký được coi là an toàn: `sha-512` và `sha-256`.
    Các thuật toán digest đã đăng ký không an toàn (cũ) là: `md5`, `sha` (SHA-1), `unixsum`, `unixcksum`, `adler` (ADLER32) và `crc32c`.
- `<preference>`
  - : Số nguyên từ 0 đến 9 trong đó `0` có nghĩa là "không thể chấp nhận", và các giá trị `1` đến `9` truyền đạt sở thích tăng dần, tương đối, có trọng số.
    Trái với các bản thảo đặc tả trước đó, trọng số _không_ được khai báo qua cú pháp `q` [quality values](/en-US/docs/Glossary/Quality_values).

## Ví dụ

```http
Want-Repr-Digest: sha-512=8, sha-256=6, adler=0, sha=1
Want-Repr-Digest: sha-512=10, sha-256=1, md5=0
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

Tiêu đề này không có tích hợp trình duyệt được xác định theo đặc tả ("tương thích trình duyệt" không áp dụng).
Nhà phát triển có thể đặt và lấy các tiêu đề HTTP bằng `fetch()` để cung cấp hành vi triển khai dành riêng cho ứng dụng.

## Xem thêm

- {{HTTPHeader("Content-Digest")}}, {{HTTPHeader("Repr-Digest")}}, {{HTTPHeader("Want-Content-Digest")}} tiêu đề digest
- [Digital Signatures for APIs](https://developer.ebay.com/develop/guides/digital-signatures-for-apis) hướng dẫn SDK sử dụng `Content-Digest` cho chữ ký số trong các cuộc gọi HTTP (developer.ebay.com)
