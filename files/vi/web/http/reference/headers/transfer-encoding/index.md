---
title: Transfer-Encoding header
short-title: Transfer-Encoding
slug: Web/HTTP/Reference/Headers/Transfer-Encoding
page-type: http-header
browser-compat: http.headers.Transfer-Encoding
sidebar: http
---

Tiêu đề HTTP **`Transfer-Encoding`** {{glossary("request header", "request")}} và {{glossary("response header")}} chỉ định dạng mã hóa được sử dụng để truyền thông điệp giữa các nút trên mạng.

`Transfer-Encoding` là [tiêu đề hop-by-hop](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers), được áp dụng cho thông điệp giữa hai nút, không phải cho bản thân tài nguyên.
Mỗi đoạn của kết nối đa nút có thể sử dụng các giá trị `Transfer-Encoding` khác nhau.
Nếu bạn muốn nén dữ liệu trên toàn bộ kết nối, hãy sử dụng tiêu đề {{HTTPHeader("Content-Encoding")}} end-to-end.

Trong thực tế, tiêu đề này hiếm khi được sử dụng, và trong những trường hợp đó, hầu như luôn được sử dụng với `chunked`.

Điều đó được nói, đặc tả chỉ ra rằng khi có trong thông điệp, nó cho biết nén được sử dụng trên thông điệp trong hop đó, và/hoặc liệu thông điệp đã được phân khúc hay chưa.
Ví dụ, `Transfer-Encoding: gzip, chunked` cho biết nội dung đã được nén bằng mã hóa gzip và sau đó phân khúc bằng mã hóa chunked trong khi hình thành phần thân thông điệp.

Tiêu đề là tùy chọn trong phản hồi cho yêu cầu {{HTTPMethod("HEAD")}} vì các thông điệp này không có phần thân và do đó, không có mã hóa truyền tải.
Khi có, nó cho biết giá trị sẽ áp dụng cho phản hồi tương ứng với thông điệp {{HTTPMethod("GET")}}, nếu yêu cầu `GET` đó không bao gồm `Transfer-Encoding` ưa thích.

> [!WARNING]
> HTTP/2 không cho phép tất cả việc sử dụng tiêu đề `Transfer-Encoding`.
> HTTP/2 và sau đó cung cấp các cơ chế hiệu quả hơn cho luồng dữ liệu so với truyền tải phân khúc.
> Việc sử dụng tiêu đề trong HTTP/2 có thể dẫn đến `protocol error` cụ thể.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}}, {{Glossary("Response header")}}, {{Glossary("Content header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Transfer-Encoding: chunked
Transfer-Encoding: compress
Transfer-Encoding: deflate
Transfer-Encoding: gzip

// Several values can be listed, separated by a comma
Transfer-Encoding: gzip, chunked
```

## Chỉ thị

- `chunked`
  - : Dữ liệu được gửi theo một loạt các khối.
    Nội dung có thể được gửi trong các luồng kích thước không xác định để được truyền dưới dạng chuỗi các bộ đệm có giới hạn độ dài, vì vậy người gửi có thể giữ kết nối mở và cho người nhận biết khi nào nó đã nhận toàn bộ thông điệp.
    Tiêu đề {{HTTPHeader("Content-Length")}} phải bị bỏ qua, và ở đầu mỗi khối, chuỗi chữ số hex cho biết kích thước của dữ liệu khối tính bằng octet, theo sau là `\r\n` và sau đó là bản thân khối, theo sau là một `\r\n` khác.
    Khối kết thúc là khối có độ dài bằng không.
- `compress`
  - : Định dạng sử dụng thuật toán [Lempel-Ziv-Welch](https://en.wikipedia.org/wiki/LZW) (LZW).
    Tên giá trị được lấy từ chương trình UNIX _compress_, đã triển khai thuật toán này.
    Giống như chương trình compress, đã biến mất khỏi hầu hết các bản phân phối UNIX, mã hóa nội dung này hầu như không được sử dụng bởi trình duyệt nào ngày nay, một phần do vấn đề bằng sáng chế (hết hạn vào năm 2003).
- `deflate`
  - : Sử dụng cấu trúc [zlib](https://en.wikipedia.org/wiki/Zlib) (được định nghĩa trong [RFC 1950](https://datatracker.ietf.org/doc/html/rfc1950)), với thuật toán nén [_deflate_](https://en.wikipedia.org/wiki/DEFLATE) (được định nghĩa trong [RFC 1951](https://datatracker.ietf.org/doc/html/rfc1952)).
- `gzip`
  - : Định dạng sử dụng mã hóa [Lempel-Ziv](https://en.wikipedia.org/wiki/LZ77_and_LZ78#LZ77) (LZ77), với CRC 32-bit.
    Đây ban đầu là định dạng của chương trình UNIX _gzip_.
    Tiêu chuẩn HTTP/1.1 cũng khuyến nghị rằng các máy chủ hỗ trợ mã hóa nội dung này nên nhận ra `x-gzip` như một bí danh, cho mục đích tương thích.

## Ví dụ

### Phản hồi với mã hóa phân khúc

Mã hóa phân khúc hữu ích khi lượng dữ liệu lớn hơn được gửi đến máy khách và tổng kích thước phản hồi có thể không được biết cho đến khi yêu cầu được xử lý đầy đủ.
Ví dụ, khi tạo bảng HTML lớn từ truy vấn cơ sở dữ liệu hoặc khi truyền các hình ảnh lớn.
Phản hồi phân khúc trông như thế này:

```http
HTTP/1.1 200 OK
Content-Type: text/plain
Transfer-Encoding: chunked

7\r\n
Welcome\r\n
1c\r\n
to Mozilla Developer Network\r\n
0\r\n
\r\n
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Accept-Encoding")}}
- {{HTTPHeader("Content-Encoding")}}
- {{HTTPHeader("Content-Length")}}
- [Chunked transfer encoding](https://en.wikipedia.org/wiki/Chunked_transfer_encoding)
