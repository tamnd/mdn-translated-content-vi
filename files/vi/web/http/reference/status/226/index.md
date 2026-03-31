---
title: 226 IM Used
slug: Web/HTTP/Reference/Status/226
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc3229.html#section-10.4.1
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`226 IM Used`** cho biết rằng máy chủ đang trả về một {{Glossary("delta")}} để phản hồi yêu cầu {{HTTPMethod("GET")}}.
Nó được dùng trong ngữ cảnh _mã hóa delta HTTP_.

IM là viết tắt của _instance manipulation_ (thao túng thực thể), đề cập đến thuật toán tạo ra một _delta_.
Trong mã hóa delta, client gửi yêu cầu {{HTTPMethod("GET")}} với hai tiêu đề: `A-IM:`, chỉ ra ưu tiên cho thuật toán tính toán sai khác, và {{HTTPHeader("If-None-Match")}}, chỉ định phiên bản của tài nguyên mà nó có.
Máy chủ phản hồi với các delta tương đối với tài liệu cơ sở đã cho, thay vì toàn bộ tài liệu.
Phản hồi này sử dụng mã trạng thái `226`, tiêu đề `IM:` mô tả thuật toán tính toán sai khác được dùng, và có thể bao gồm tiêu đề `Delta-Base:` với {{HTTPHeader("ETag")}} khớp với tài liệu cơ sở liên kết với delta.

> [!WARNING]
> Hỗ trợ kém cho mã hóa delta HTTP có nghĩa là có ít triển khai.
> Thay vào đó, hầu hết các hệ thống chỉ dựa vào [các phương pháp nén](/en-US/docs/Web/HTTP/Guides/Compression) để giảm băng thông, mặc dù có thể kết hợp nén và mã hóa delta.
>
> Ngay cả khi client và máy chủ hỗ trợ mã hóa delta, các proxy hoặc bộ đệm có thể không hỗ trợ, và sự phức tạp của việc thêm mã hóa delta HTTP vào hệ thống có thể lớn hơn lợi ích.

## Trạng thái

```http
226 IM Used
```

## Ví dụ

### Nhận `208` với thuật toán delta `vcdiff`

Trong yêu cầu `GET` sau đây, client yêu cầu một tài nguyên và có phiên bản được lưu đệm với ETag `abcd123`.
Tiêu đề `A-IM:` cho biết ưu tiên cho thuật toán delta `vcdiff` và `diffe`:

```http
GET /resource.txt HTTP/1.1
Host: example.com
A-IM: vcdiff, diffe
If-None-Match: "abcd123"
```

Giả sử máy chủ hỗ trợ mã hóa delta, nó phản hồi với diff kể từ phiên bản có ETag `abcd123`.
Tiêu đề `IM` cho biết thuật toán `vcdiff` được dùng, và tiêu đề `Delta-Base:` cho biết diff dựa trên tài nguyên với ETag `abcd123`.

```http
HTTP/1.1 226 IM Used
ETag: "5678a23"
IM: vcdiff
Content-Type: text/plain
Content-Length: 123
Delta-Base: abcd123

...
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPStatus("200")}}
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Syndication feed deltas help reduce subscription bandwidth costs](https://www.ctrl.blog/entry/feed-delta-updates.html) (2017)
