---
title: decodeURI()
slug: Web/JavaScript/Reference/Global_Objects/decodeURI
page-type: javascript-function
browser-compat: javascript.builtins.decodeURI
sidebar: jssidebar
---

Hàm **`decodeURI()`** giải mã một Uniform Resource Identifier (URI) đã được tạo trước đó bởi {{jsxref("encodeURI()")}} hoặc một hàm tương tự.

{{InteractiveExample("JavaScript Demo: decodeURI()")}}

```js interactive-example
const uri = "https://mozilla.org/?x=шеллы";
const encoded = encodeURI(uri);
console.log(encoded);
// Expected output: "https://mozilla.org/?x=%D1%88%D0%B5%D0%BB%D0%BB%D1%8B"

try {
  console.log(decodeURI(encoded));
  // Expected output: "https://mozilla.org/?x=шеллы"
} catch (e) {
  // Catches a malformed URI
  console.error(e);
}
```

## Cú pháp

```js-nolint
decodeURI(encodedURI)
```

### Tham số

- `encodedURI`
  - : Một Uniform Resource Identifier hoàn chỉnh đã được mã hóa.

### Giá trị trả về

Một chuỗi mới biểu thị phiên bản không được mã hóa của Uniform Resource Identifier (URI) đã được mã hóa.

### Ngoại lệ

- {{jsxref("URIError")}}
  - : Được ném ra nếu `encodedURI` chứa ký tự `%` không được theo sau bởi hai chữ số thập lục phân, hoặc nếu chuỗi thoát không mã hóa một ký tự UTF-8 hợp lệ.

## Mô tả

`decodeURI()` là thuộc tính hàm của đối tượng toàn cục.

Hàm `decodeURI()` giải mã URI bằng cách xử lý mỗi chuỗi thoát có dạng `%XX` như một đơn vị mã UTF-8 (một byte). Trong UTF-8, số bit 1 đứng đầu trong byte đầu tiên, có thể là 0 (cho ký tự {{Glossary("ASCII")}} 1 byte), 2, 3 hoặc 4, chỉ ra số byte trong ký tự đó. Vì vậy, bằng cách đọc chuỗi thoát đầu tiên, `decodeURI()` có thể xác định có bao nhiêu chuỗi thoát tiếp theo cần tiêu thụ. Nếu `decodeURI()` không tìm thấy số chuỗi dự kiến, hoặc nếu các chuỗi thoát không mã hóa một ký tự UTF-8 hợp lệ, {{jsxref("URIError")}} sẽ được ném ra.

`decodeURI()` giải mã tất cả các chuỗi thoát, nhưng nếu chuỗi thoát mã hóa một trong các ký tự sau, chuỗi thoát đó được giữ nguyên trong chuỗi đầu ra (vì chúng là một phần của cú pháp URI):

```plain
; / ? : @ & = + $ , #
```

## Ví dụ

### Giải mã URL tiếng Cyrillic

```js
decodeURI(
  "https://developer.mozilla.org/ru/docs/JavaScript_%D1%88%D0%B5%D0%BB%D0%BB%D1%8B",
);
// "https://developer.mozilla.org/ru/docs/JavaScript_шеллы"
```

### decodeURI() và decodeURIComponent()

`decodeURI()` giả định rằng đầu vào là một URI đầy đủ, vì vậy nó không giải mã các ký tự là một phần của cú pháp URI.

```js
decodeURI(
  "https://developer.mozilla.org/docs/JavaScript%3A%20a_scripting_language",
);
// "https://developer.mozilla.org/docs/JavaScript%3A a_scripting_language"

decodeURIComponent(
  "https://developer.mozilla.org/docs/JavaScript%3A%20a_scripting_language",
);
// "https://developer.mozilla.org/docs/JavaScript: a_scripting_language"
```

### Bắt lỗi

```js
try {
  const a = decodeURI("%E0%A4%A");
} catch (e) {
  console.error(e);
}

// URIError: malformed URI sequence
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("decodeURIComponent()")}}
- {{jsxref("encodeURI()")}}
- {{jsxref("encodeURIComponent()")}}
