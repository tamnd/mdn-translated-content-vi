---
title: Available-Dictionary header
short-title: Available-Dictionary
slug: Web/HTTP/Reference/Headers/Available-Dictionary
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Available-Dictionary
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Available-Dictionary`** cho phép trình duyệt chỉ định từ điển phù hợp nhất mà nó có để cho phép máy chủ sử dụng {{glossary("Compression Dictionary Transport")}} cho một yêu cầu tài nguyên.

Máy khách có thể gửi tiêu đề `Available-Dictionary` khi hỗ trợ mã hóa `dcb` hoặc `dcz`. Tiêu đề là một {{glossary("Hash_function", "hash")}} SHA-256 được mã hóa base-64 được bao quanh bởi dấu hai chấm của nội dung từ điển.

Xem [hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport) để biết thêm thông tin.

## Cú pháp

```http
Available-Dictionary: :<base64-hash>:
```

## Chỉ thị

- `<base64-hash>`
  - : {{glossary("Hash_function", "hash")}} SHA-256 được mã hóa base-64 của nội dung từ điển.

## Ví dụ

```http
Accept-Encoding: gzip, br, zstd, dcb, dcz
Available-Dictionary: :pZGm1Av0IEBKARczz7exkNYsZb8LzaMrV7J32a2fFG4=:
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
- {{HTTPHeader("Use-As-Dictionary")}}
- {{HTTPHeader("Dictionary-ID")}}
