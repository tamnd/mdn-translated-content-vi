---
title: Use-As-Dictionary header
short-title: Use-As-Dictionary
slug: Web/HTTP/Reference/Headers/Use-As-Dictionary
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Use-As-Dictionary
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề phản hồi HTTP **`Use-As-Dictionary`** liệt kê các tiêu chí khớp mà từ điển {{glossary("Compression Dictionary Transport")}} có thể được sử dụng cho, cho các yêu cầu trong tương lai.

Xem [hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport) để biết thêm thông tin.

## Cú pháp

```http
Use-As-Dictionary: match="<url-pattern>"
Use-As-Dictionary: match-dest=("<destination1>" "<destination2>", …)
Use-As-Dictionary: id="<string-identifier>"
Use-As-Dictionary: type="raw"

// Multiple, in any order
Content-Encoding: match="<url-pattern>", match-dest=("<destination1>")
```

## Chỉ thị

- `match`
  - : Giá trị chuỗi chứa [URL Pattern](/en-US/docs/Web/API/URL_Pattern_API): chỉ các tài nguyên có URL khớp với mẫu này mới có thể sử dụng tài nguyên này làm từ điển. Các nhóm bắt biểu thức chính quy không được phép, vì vậy {{domxref("URLPattern.hasRegExpGroups")}} phải là `false`.
- `match-dest`
  - : Danh sách chuỗi phân cách bằng khoảng trắng, với mỗi chuỗi trong dấu ngoặc kép và toàn bộ giá trị được bao trong dấu ngoặc đơn, cung cấp danh sách [Fetch request destinations](/en-US/docs/Web/API/Request/destination) mà các yêu cầu phải khớp nếu họ sử dụng từ điển này.
- `id`
  - : Giá trị chuỗi chỉ định định danh máy chủ cho từ điển. Giá trị ID này sau đó sẽ được thêm vào tiêu đề yêu cầu {{HTTPHeader("Dictionary-ID")}} khi trình duyệt yêu cầu tài nguyên có thể sử dụng từ điển này.
- `type`
  - : Giá trị chuỗi mô tả định dạng tệp của từ điển được cung cấp. Hiện tại chỉ hỗ trợ `raw` (là mặc định) nên điều này phù hợp hơn cho khả năng tương thích trong tương lai.

## Ví dụ

### Tiền tố đường dẫn

```http
Use-As-Dictionary: match="/product/*"
```

Điều này nói rằng từ điển chỉ được sử dụng cho các URL bắt đầu bằng `/product/`.

### Thư mục có phiên bản

```http
Use-As-Dictionary: match="/app/*/main.js"
```

Điều này sử dụng ký tự đại diện để khớp với nhiều phiên bản của một tệp.

### Destinations

```http
Use-As-Dictionary: match="/product/*", match-dest=("document")
```

Điều này sử dụng `match-dest` để đảm bảo từ điển chỉ được sử dụng cho các yêu cầu `document` vì vậy các yêu cầu tài nguyên `<script src="/product/js/app.js">` ví dụ sẽ không khớp.

```http
Use-As-Dictionary: match="/product/*", match-dest=("document" "frame")
```

Điều này sẽ cho phép từ điển khớp với cả tài liệu cấp cao nhất và iframe.

### Id

```http
Use-As-Dictionary: match="/product/*", id="dictionary-12345"
```

Khi `Use-As-Dictionary` bao gồm chỉ thị `id`, như trong ví dụ này, giá trị `id` sẽ được bao gồm trong tiêu đề yêu cầu {{HTTPHeader("Dictionary-ID")}} cho các tài nguyên có thể sử dụng từ điển này. Yêu cầu tài nguyên cũng sẽ bao gồm hash SHA-256 của từ điển được bao quanh bởi dấu hai chấm trong tiêu đề {{HTTPHeader("Available-Dictionary")}}:

```http
Accept-Encoding: gzip, br, zstd, dcb, dcz
Available-Dictionary: :pZGm1Av0IEBKARczz7exkNYsZb8LzaMrV7J32a2fFG4=:
Dictionary-ID: "dictionary-12345"
```

Máy chủ vẫn phải kiểm tra hash từ tiêu đề `Available-Dictionary` — `Dictionary-ID` là thông tin bổ sung cho máy chủ để xác định từ điển nhưng không thay thế nhu cầu của tiêu đề `Available-Dictionary`.

### Type

```http
Use-As-Dictionary: match="/product/*", type="raw"
```

Hiện tại, chỉ `raw` được hỗ trợ (là mặc định) nên điều này phù hợp hơn cho khả năng tương thích trong tương lai.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn Compression Dictionary Transport](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
- {{HTTPHeader("Available-Dictionary")}}
- {{HTTPHeader("Dictionary-ID")}}
