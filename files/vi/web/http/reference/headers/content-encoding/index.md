---
title: Content-Encoding header
short-title: Content-Encoding
slug: Web/HTTP/Reference/Headers/Content-Encoding
page-type: http-header
browser-compat: http.headers.Content-Encoding
sidebar: http
---

Tiêu đề HTTP **`Content-Encoding`** {{Glossary("representation header", "biểu diễn")}} liệt kê các mã hóa và thứ tự mà chúng được áp dụng cho tài nguyên.
Điều này cho phép người nhận biết cách giải mã dữ liệu để lấy được định dạng nội dung gốc được mô tả trong tiêu đề {{HTTPHeader("Content-Type")}}.
Mã hóa nội dung chủ yếu được sử dụng để nén nội dung mà không làm mất thông tin về kiểu phương tiện gốc.

Các máy chủ nên nén dữ liệu nhiều nhất có thể, và nên sử dụng mã hóa nội dung khi thích hợp.
Nén các kiểu phương tiện đã được nén, như .zip hoặc .jpeg, thường không phù hợp vì nó có thể tăng kích thước tệp.
Nếu phương tiện gốc đã được mã hóa (ví dụ: dưới dạng tệp .zip), thông tin này không được bao gồm trong tiêu đề `Content-Encoding`.

Khi tiêu đề `Content-Encoding` có mặt, các siêu dữ liệu khác (ví dụ: {{HTTPHeader("Content-Length")}}) đề cập đến dạng mã hóa của dữ liệu, không phải tài nguyên gốc, trừ khi được nêu rõ ràng.
Mã hóa nội dung khác với {{HTTPHeader("Transfer-Encoding")}} ở chỗ `Transfer-Encoding` xử lý cách các thông điệp HTTP được truyền qua mạng trên [cơ sở từng chặng](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Representation header", "Tiêu đề biểu diễn")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Encoding: gzip
Content-Encoding: compress
Content-Encoding: deflate
Content-Encoding: br
Content-Encoding: zstd
Content-Encoding: dcb
Content-Encoding: dcz

// Nhiều, theo thứ tự mà chúng được áp dụng
Content-Encoding: deflate, gzip
```

## Chỉ thị

- `gzip`
  - : Định dạng sử dụng mã hóa [Lempel-Ziv](https://en.wikipedia.org/wiki/LZ77_and_LZ78#LZ77) (LZ77), với CRC 32-bit. Đây là định dạng gốc của chương trình UNIX _gzip_. Tiêu chuẩn HTTP/1.1 cũng khuyến nghị rằng các máy chủ hỗ trợ mã hóa nội dung này nên nhận ra `x-gzip` như một bí danh, cho mục đích tương thích.
- `compress`
  - : Định dạng sử dụng thuật toán [Lempel-Ziv-Welch](https://en.wikipedia.org/wiki/LZW) (LZW). Tên giá trị được lấy từ chương trình UNIX _compress_, đã triển khai thuật toán này. Giống như chương trình compress đã biến mất khỏi hầu hết các bản phân phối UNIX, mã hóa nội dung này không được nhiều trình duyệt sử dụng ngày nay, một phần vì vấn đề bằng sáng chế (hết hạn vào năm 2003).
- `deflate`
  - : Sử dụng cấu trúc [zlib](https://en.wikipedia.org/wiki/Zlib) (được định nghĩa trong {{rfc(1950)}}) với thuật toán nén [deflate](https://en.wikipedia.org/wiki/Deflate) (được định nghĩa trong {{rfc(1951)}}).
- `br`
  - : Định dạng sử dụng cấu trúc thuật toán {{glossary("Brotli compression","Brotli")}} (được định nghĩa trong {{rfc(7932)}}).
- `zstd`
  - : Định dạng sử dụng cấu trúc thuật toán {{glossary("Zstandard compression","Zstandard")}} (được định nghĩa trong {{rfc(8878)}}).
- `dcb` {{experimental_inline}}
  - : Định dạng sử dụng [thuật toán Dictionary-Compressed Brotli](https://datatracker.ietf.org/doc/html/draft-ietf-httpbis-compression-dictionary#name-dictionary-compressed-brotl). Xem [Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport).
- `dcz` {{experimental_inline}}
  - : Định dạng sử dụng [thuật toán Dictionary-Compressed Zstandard](https://datatracker.ietf.org/doc/html/draft-ietf-httpbis-compression-dictionary#name-dictionary-compressed-zstan). Xem [Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport).

## Ví dụ

### Nén với gzip

Ở phía máy khách, bạn có thể quảng cáo danh sách các scheme nén sẽ được gửi cùng với yêu cầu HTTP. Tiêu đề {{HTTPHeader("Accept-Encoding")}} được sử dụng cho thương lượng mã hóa nội dung.

```http
Accept-Encoding: gzip, deflate
```

Máy chủ phản hồi với scheme được sử dụng, được chỉ ra bởi tiêu đề phản hồi `Content-Encoding`.

```http
Content-Encoding: gzip
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Accept-Encoding")}}
- {{HTTPHeader("Transfer-Encoding")}}
- {{Glossary("Brotli compression")}}
- {{Glossary("GZip compression")}}
- {{Glossary("Zstandard compression")}}
- [Hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
