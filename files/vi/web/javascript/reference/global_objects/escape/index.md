---
title: escape()
slug: Web/JavaScript/Reference/Global_Objects/escape
page-type: javascript-function
status:
  - deprecated
browser-compat: javascript.builtins.escape
sidebar: jssidebar
---

{{Deprecated_Header}}

> [!NOTE]
> `escape()` là một hàm không chuẩn được triển khai bởi các trình duyệt và chỉ được chuẩn hóa vì lý do tương thích giữa các engine. Nó không bắt buộc phải được triển khai bởi tất cả các JavaScript engine và có thể không hoạt động ở mọi nơi. Hãy sử dụng {{jsxref("encodeURIComponent()")}} hoặc {{jsxref("encodeURI()")}} nếu có thể.

Hàm **`escape()`** tính toán một chuỗi mới trong đó một số ký tự nhất định đã được thay thế bằng các chuỗi escape thập lục phân.

## Cú pháp

```js-nolint
escape(str)
```

### Tham số

- `str`
  - : Chuỗi cần được mã hóa.

### Giá trị trả về

Một chuỗi mới trong đó một số ký tự nhất định đã được escape.

## Mô tả

`escape()` là một thuộc tính hàm của đối tượng toàn cục.

Hàm `escape()` thay thế tất cả các ký tự bằng các chuỗi escape, ngoại trừ các ký tự chữ cái {{Glossary("ASCII")}} (A–Z, a–z, 0–9, \_) và `@\*_+-./`. Các ký tự được escape bằng các đơn vị mã UTF-16. Nếu giá trị đơn vị mã nhỏ hơn 256, nó được biểu diễn bằng một số thập lục phân hai chữ số theo định dạng `%XX`, được đệm bằng 0 ở phía trái nếu cần. Nếu không, nó được biểu diễn bằng một số thập lục phân bốn chữ số theo định dạng `%uXXXX`, được đệm bằng 0 ở phía trái nếu cần.

> [!NOTE]
> Hàm này được sử dụng chủ yếu cho {{Glossary("Percent-encoding", "percent-encoding")}} và một phần dựa trên định dạng escape trong {{rfc(1738)}}. Định dạng escape _không_ phải là [chuỗi escape](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) trong các chuỗi ký tự. Bạn có thể thay thế `%XX` bằng `\xXX` và `%uXXXX` bằng `\uXXXX` để nhận một chuỗi chứa các chuỗi escape chuỗi ký tự thực sự.

## Ví dụ

### Sử dụng escape()

```js
escape("abc123"); // "abc123"
escape("äöü"); // "%E4%F6%FC"
escape("ć"); // "%u0107"

// special characters
escape("@*_+-./"); // "@*_+-./"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `escape` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("encodeURI")}}
- {{jsxref("encodeURIComponent")}}
- {{jsxref("unescape")}}
