---
title: TE header
short-title: TE
slug: Web/HTTP/Reference/Headers/TE
page-type: http-header
browser-compat: http.headers.TE
sidebar: http
---

Tiêu đề HTTP **`TE`** {{Glossary("request header")}} chỉ định các mã hóa truyền tải mà tác nhân người dùng sẵn sàng chấp nhận.
Các mã hóa truyền tải dùng để nén thông điệp và phân khúc dữ liệu trong quá trình truyền.

Mã hóa truyền tải được áp dụng ở lớp giao thức, vì vậy ứng dụng tiêu thụ phản hồi nhận được phần thân như thể không có mã hóa nào được áp dụng.

> [!NOTE]
> Trong [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) và [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting), trường tiêu đề `TE` chỉ được chấp nhận nếu giá trị `trailers` được đặt.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
TE: compress
TE: deflate
TE: gzip
TE: trailers
```

Nhiều chỉ thị trong danh sách phân cách bằng dấu phẩy với {{glossary("quality values")}} làm trọng số:

```http
TE: trailers, deflate;q=0.5
```

## Chỉ thị

- `compress`
  - : Định dạng sử dụng thuật toán [Lempel-Ziv-Welch](https://en.wikipedia.org/wiki/LZW) (LZW) được chấp nhận làm tên mã hóa truyền tải.
- `deflate`
  - : Sử dụng cấu trúc [zlib](https://en.wikipedia.org/wiki/Zlib) được chấp nhận làm tên mã hóa truyền tải.
- `gzip`
  - : Định dạng sử dụng mã hóa [Lempel-Ziv](https://en.wikipedia.org/wiki/LZ77_and_LZ78#LZ77) (LZ77), với CRC 32-bit được chấp nhận làm tên mã hóa truyền tải.
- `trailers`
  - : Cho biết rằng máy khách sẽ không loại bỏ các trường trailer trong [mã hóa truyền tải phân khúc](/en-US/docs/Web/HTTP/Reference/Headers/Transfer-Encoding#chunked).
- `q`
  - : Khi nhiều mã hóa truyền tải được chấp nhận, tham số `q` ({{glossary("quality values")}}) sắp xếp mã hóa theo thứ tự ưu tiên.

Lưu ý rằng `chunked` luôn được hỗ trợ bởi người nhận HTTP/1.1, vì vậy bạn không cần chỉ định nó bằng tiêu đề `TE`.
Xem tiêu đề {{HTTPHeader("Transfer-Encoding")}} để biết thêm chi tiết.

## Ví dụ

### Sử dụng tiêu đề TE với quality values

Trong yêu cầu sau, máy khách cho biết sở thích phản hồi được mã hóa `gzip` với `deflate` là sở thích thứ hai sử dụng giá trị `q`:

```http
GET /resource HTTP/1.1
Host: example.com
TE: gzip; q=1.0, deflate; q=0.8
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Transfer-Encoding")}}
- {{HTTPHeader("Content-Encoding")}}
- {{HTTPHeader("Trailer")}}
- [Chunked transfer encoding](https://en.wikipedia.org/wiki/Chunked_transfer_encoding)
