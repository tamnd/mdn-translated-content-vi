---
title: "urn: URLs"
short-title: "urn:"
slug: Web/URI/Reference/Schemes/urn
page-type: uri-scheme
spec-urls: https://datatracker.ietf.org/doc/html/rfc8141
sidebar: urlsidebar
---

Uniform Resource Name (URN) là một URI xác định một tài nguyên bằng tên trong một không gian tên cụ thể.
URN cung cấp các tên duy nhất trên toàn cầu cho tài nguyên, trái ngược với việc cung cấp thông tin về vị trí của chúng (URL).

## Cú pháp

```url
urn:<NID>:<NSS>
```

- `<NID>`
  - : NID (Namespace Identifier) là một định danh không phân biệt chữ hoa chữ thường cho namespace (ví dụ, `ISBN` và `isbn` là tương đương nhau).
    NID được duy trì bởi [các registry như IANA](https://www.iana.org/assignments/urn-namespaces/urn-namespaces.xhtml), và việc phân giải chúng phụ thuộc vào namespace cụ thể.
    Ví dụ, việc phân giải NID `ISBN` được xử lý bởi các hệ thống của [International ISBN Agency](https://www.isbn-international.org/).
- `<NSS>`
  - : NSS (Namespace Specific String) là một chuỗi duy nhất trong một URN namespace.
    Sự kết hợp giữa NID (duy nhất trên toàn bộ scheme "urn") và NSS đảm bảo URN kết quả là duy nhất trên toàn cầu.

## Ví dụ

### ISBN URN

ISBN này tương ứng với cuốn sách [Nineteen Eighty-Four của George Orwell](https://isbnsearch.org/isbn/9780141036144):

```url
urn:isbn:9780141036144
```

### IETF URN

URN này tương ứng với đặc tả IETF {{rfc("7230", "Hypertext Transfer Protocol (HTTP/1.1): Message Syntax and Routing")}}:

```url
urn:ietf:rfc:7230
```

## Đặc tả

{{specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
- [URL là gì?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)
- [Danh sách IANA các URI scheme](https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml)
