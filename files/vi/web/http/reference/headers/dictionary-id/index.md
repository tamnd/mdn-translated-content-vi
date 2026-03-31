---
title: Dictionary-ID header
short-title: Dictionary-ID
slug: Web/HTTP/Reference/Headers/Dictionary-ID
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Dictionary-ID
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Dictionary-ID`** tham chiếu đến một từ điển có thể được sử dụng trong {{glossary("Compression Dictionary Transport")}} để nén phản hồi của máy chủ.

Máy chủ có thể chỉ ra rằng một tài nguyên có thể được sử dụng làm từ điển bằng cách gửi tiêu đề {{httpheader("Use-As-Dictionary")}} với phản hồi. Máy chủ có thể bao gồm chỉ thị `id` trong tiêu đề `Use-As-Dictionary`, do đó gán giá trị ID cho từ điển. Nếu máy chủ làm điều này, khi trình duyệt yêu cầu một tài nguyên có thể được nén bằng từ điển, yêu cầu tài nguyên phải bao gồm tiêu đề `Dictionary-ID`, và giá trị của nó phải khớp với ID được cung cấp trong `Use-As-Dictionary`.

Điều này cho phép máy chủ xác định và tìm một từ điển được tham chiếu bởi một khóa tùy ý, thay vì phải sử dụng {{glossary("hash function","dictionary hash")}} làm khóa (nếu sử dụng cách tiếp cận đó, máy chủ sẽ phải hash mọi phản hồi bao gồm tiêu đề `Use-As-Dictionary` chỉ trong trường hợp tài nguyên có thể cuối cùng được sử dụng làm từ điển).

Lưu ý rằng trong khi máy chủ có thể xác định và định vị từ điển từ `Dictionary-ID` của nó, nó vẫn phải kiểm tra hash từ tiêu đề `Available-Dictionary` để xác nhận rằng đó là kết quả khớp đúng.

Xem [hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport) để biết thêm thông tin.

## Cú pháp

```http
Dictionary-ID: "<string-identifier>"
```

## Chỉ thị

- `<string-identifier>`
  - : Chuỗi đại diện cho ID do máy chủ gán cho từ điển.

## Ví dụ

Ví dụ, giả sử máy chủ đã gửi tiêu đề `Use-As-Dictionary` chứa chỉ thị `id="dictionary-12345"`:

```http
Use-As-Dictionary: match="/js/app.*.js", id="dictionary-12345"
```

Khi máy khách yêu cầu một tài nguyên khớp, nó sẽ bao gồm giá trị `id` này trong tiêu đề `Dictionary-ID`:

```http
Accept-Encoding: gzip, br, zstd, dcb, dcz
Available-Dictionary: :pZGm1Av0IEBKARczz7exkNYsZb8LzaMrV7J32a2fFG4=:
Dictionary-ID: "dictionary-12345"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
- {{HTTPHeader("Available-Dictionary")}}
- {{HTTPHeader("Use-As-Dictionary")}}
