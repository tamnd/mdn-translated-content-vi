---
title: unescape()
slug: Web/JavaScript/Reference/Global_Objects/unescape
page-type: javascript-function
status:
  - deprecated
browser-compat: javascript.builtins.unescape
sidebar: jssidebar
---

{{Deprecated_Header}}

> [!NOTE]
> `unescape()` là hàm không chuẩn được triển khai bởi các trình duyệt và chỉ được chuẩn hóa để tương thích đa engine. Nó không bắt buộc phải được triển khai bởi tất cả các JavaScript engine và có thể không hoạt động ở mọi nơi. Hãy sử dụng {{jsxref("decodeURIComponent()")}} hoặc {{jsxref("decodeURI()")}} nếu có thể.

Hàm **`unescape()`** tính toán một chuỗi mới trong đó các chuỗi thoát thập lục phân được thay thế bằng các ký tự mà chúng biểu thị. Các chuỗi thoát có thể được tạo ra bởi một hàm như {{jsxref("escape()")}}.

## Cú pháp

```js-nolint
unescape(str)
```

### Tham số

- `str`
  - : Một chuỗi cần được giải mã.

### Giá trị trả về

Một chuỗi mới trong đó một số ký tự nhất định đã được giải thoát.

## Mô tả

`unescape()` là thuộc tính hàm của đối tượng toàn cục.

Hàm `unescape()` thay thế bất kỳ chuỗi thoát nào bằng ký tự mà nó biểu thị. Cụ thể, nó thay thế bất kỳ chuỗi thoát nào có dạng `%XX` hoặc `%uXXXX` (trong đó `X` biểu thị một chữ số thập lục phân) bằng ký tự có giá trị thập lục phân `XX`/`XXXX`. Nếu chuỗi thoát không phải là chuỗi thoát hợp lệ (ví dụ, nếu `%` theo sau là một hoặc không có chữ số hex), nó sẽ được giữ nguyên.

> [!NOTE]
> Hàm này chủ yếu được sử dụng cho {{Glossary("Percent-encoding", "mã hóa phần trăm")}} và một phần dựa trên định dạng thoát trong {{rfc(1738)}}. Hàm `unescape()` _không_ đánh giá [các chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) trong chuỗi ký tự. Bạn có thể thay `\xXX` bằng `%XX` và `\uXXXX` bằng `%uXXXX` để lấy một chuỗi có thể được xử lý bởi `unescape()`.

## Ví dụ

### Sử dụng unescape()

```js
unescape("abc123"); // "abc123"
unescape("%E4%F6%FC"); // "äöü"
unescape("%u0107"); // "ć"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `unescape` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("decodeURI")}}
- {{jsxref("decodeURIComponent")}}
- {{jsxref("escape")}}
