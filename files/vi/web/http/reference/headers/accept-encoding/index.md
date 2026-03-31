---
title: Accept-Encoding header
short-title: Accept-Encoding
slug: Web/HTTP/Reference/Headers/Accept-Encoding
page-type: http-header
browser-compat: http.headers.Accept-Encoding
sidebar: http
---

Tiêu đề HTTP **`Accept-Encoding`** {{glossary("request header", "yêu cầu")}} và {{glossary("response header", "phản hồi")}} chỉ ra mã hóa nội dung (thường là thuật toán nén) mà người gửi có thể hiểu.
Trong các yêu cầu, máy chủ sử dụng [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) để chọn một trong các đề xuất mã hóa từ máy khách và thông báo cho máy khách về lựa chọn đó với tiêu đề phản hồi {{HTTPHeader("Content-Encoding")}}.
Trong các phản hồi, nó cung cấp thông tin về những mã hóa nội dung nào mà máy chủ có thể hiểu trong các thông điệp đến tài nguyên được yêu cầu, để mã hóa đó có thể được sử dụng trong các yêu cầu tiếp theo đến tài nguyên.
Ví dụ, `Accept-Encoding` được bao gồm trong phản hồi {{HTTPStatus("415", "415 Unsupported Media Type")}} nếu yêu cầu đến tài nguyên (ví dụ: {{HTTPMethod("PUT")}}) sử dụng mã hóa không được hỗ trợ.

Ngay cả khi cả máy khách và máy chủ đều hỗ trợ cùng các thuật toán nén, máy chủ có thể chọn không nén thân của phản hồi nếu giá trị `identity` cũng có thể chấp nhận được.
Điều này xảy ra trong hai trường hợp phổ biến:

1. Dữ liệu đã được nén, nghĩa là việc nén lần thứ hai sẽ không giảm kích thước dữ liệu được truyền, và thực sự có thể tăng kích thước nội dung trong một số trường hợp. Điều này đúng với các định dạng hình ảnh được nén trước (JPEG, chẳng hạn).
2. Máy chủ bị quá tải và không thể phân bổ tài nguyên tính toán để thực hiện nén. Ví dụ, Microsoft khuyến nghị không nén nếu máy chủ sử dụng hơn 80% sức mạnh tính toán của nó.

Miễn là các chỉ thị `identity;q=0` hoặc `*;q=0` không cấm rõ ràng giá trị `identity` có nghĩa là không mã hóa, máy chủ không bao giờ được trả về lỗi {{HTTPStatus("406", "406 Not Acceptable")}}.

> [!NOTE]
> IANA duy trì [danh sách các mã hóa nội dung chính thức](https://www.iana.org/assignments/http-parameters/http-parameters.xhtml#content-coding).
> Các mã hóa `bzip` và `bzip2` không phải tiêu chuẩn, nhưng có thể được sử dụng trong một số trường hợp, đặc biệt để hỗ trợ kế thừa.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}}, {{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Accept-Encoding: gzip
Accept-Encoding: compress
Accept-Encoding: deflate
Accept-Encoding: br
Accept-Encoding: zstd
Accept-Encoding: dcb
Accept-Encoding: dcz
Accept-Encoding: identity
Accept-Encoding: *

// Nhiều thuật toán, có trọng số với cú pháp giá trị chất lượng:
Accept-Encoding: deflate, gzip;q=1.0, *;q=0.5
```

## Chỉ thị

- `gzip`
  - : Định dạng nén sử dụng mã hóa [Lempel-Ziv](https://en.wikipedia.org/wiki/LZ77_and_LZ78#LZ77) (LZ77) với CRC 32-bit.
- `compress`
  - : Định dạng nén sử dụng thuật toán [Lempel-Ziv-Welch](https://en.wikipedia.org/wiki/LZW) (LZW).
- `deflate`
  - : Định dạng nén sử dụng cấu trúc [zlib](https://en.wikipedia.org/wiki/Zlib) với thuật toán nén [_deflate_](https://en.wikipedia.org/wiki/DEFLATE).
- `br`
  - : Định dạng nén sử dụng thuật toán [Brotli](https://en.wikipedia.org/wiki/Brotli).
- `zstd`
  - : Định dạng nén sử dụng thuật toán [Zstandard](https://en.wikipedia.org/wiki/Zstd).
- `dcb` {{experimental_inline}}
  - : Định dạng sử dụng thuật toán [Dictionary-Compressed Brotli](https://datatracker.ietf.org/doc/html/draft-ietf-httpbis-compression-dictionary#name-dictionary-compressed-brotl). Xem [Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport).
- `dcz` {{experimental_inline}}
  - : Định dạng sử dụng thuật toán [Dictionary-Compressed Zstandard](https://datatracker.ietf.org/doc/html/draft-ietf-httpbis-compression-dictionary#name-dictionary-compressed-zstan). Xem [Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport).
- `identity`
  - : Chỉ ra hàm đồng nhất (tức là không có sửa đổi hay nén). Giá trị này luôn được coi là có thể chấp nhận được, ngay cả khi bị bỏ qua.
- `*` (ký tự đại diện)
  - : Khớp với bất kỳ mã hóa nội dung nào chưa được liệt kê trong tiêu đề. Đây là giá trị mặc định nếu tiêu đề không có. Chỉ thị này không gợi ý rằng bất kỳ thuật toán nào được hỗ trợ nhưng chỉ ra rằng không có ưu tiên nào được thể hiện.
- `;q=` (qvalues weighting)
  - : Bất kỳ giá trị nào được đặt theo thứ tự ưu tiên được biểu thị bằng [giá trị chất lượng](/en-US/docs/Glossary/Quality_values) tương đối gọi là _trọng số_.

## Ví dụ

### Các giá trị Accept-Encoding mặc định

Điều hướng trình duyệt thông thường có giá trị tiêu đề yêu cầu `Accept-Encoding` sau:

```http
GET /en-US/ HTTP/2
Host: developer.mozilla.org
Accept-Encoding: gzip, deflate, br, zstd
```

### Các giá trị Accept-Encoding có trọng số

Tiêu đề sau hiển thị các tùy chọn `Accept-Encoding` sử dụng giá trị chất lượng giữa `0` (ưu tiên thấp nhất) và `1` (ưu tiên cao nhất).
Nén Brotli được đặt trọng số `1.0`, làm cho `br` là lựa chọn đầu tiên của máy khách, tiếp theo là `gzip` với ưu tiên `0.8`, rồi bất kỳ mã hóa nội dung nào khác ở mức `0.1`:

```http
Accept-Encoding: br;q=1.0, gzip;q=0.8, *;q=0.1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPStatus("415", "415 Unsupported Media Type")}}
- HTTP [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
- Tiêu đề với kết quả thương lượng nội dung: {{HTTPHeader("Content-Encoding")}}
- Các tiêu đề tương tự khác: {{HTTPHeader("TE")}}, {{HTTPHeader("Accept")}}, {{HTTPHeader("Accept-Language")}}
- {{Glossary("Brotli compression")}}
- {{Glossary("GZip compression")}}
- {{Glossary("Zstandard compression")}}
- [Hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
