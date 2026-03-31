---
title: decodeURIComponent()
slug: Web/JavaScript/Reference/Global_Objects/decodeURIComponent
page-type: javascript-function
browser-compat: javascript.builtins.decodeURIComponent
sidebar: jssidebar
---

Hàm **`decodeURIComponent()`** giải mã một thành phần Uniform Resource Identifier (URI) đã được tạo trước đó bởi {{jsxref("encodeURIComponent()")}} hoặc một hàm tương tự.

{{InteractiveExample("JavaScript Demo: decodeURIComponent()")}}

```js interactive-example
function containsEncodedComponents(x) {
  // ie ?,=,&,/ etc
  return decodeURI(x) !== decodeURIComponent(x);
}

console.log(containsEncodedComponents("%3Fx%3Dtest")); // ?x=test
// Expected output: true

console.log(containsEncodedComponents("%D1%88%D0%B5%D0%BB%D0%BB%D1%8B")); // шеллы
// Expected output: false
```

## Cú pháp

```js-nolint
decodeURIComponent(encodedURI)
```

### Tham số

- `encodedURI`
  - : Một thành phần đã được mã hóa của Uniform Resource Identifier.

### Giá trị trả về

Một chuỗi mới biểu thị phiên bản đã giải mã của thành phần Uniform Resource Identifier (URI) đã được mã hóa.

### Ngoại lệ

- {{jsxref("URIError")}}
  - : Được ném ra nếu `encodedURI` chứa ký tự `%` không được theo sau bởi hai chữ số thập lục phân, hoặc nếu chuỗi thoát không mã hóa một ký tự UTF-8 hợp lệ.

## Mô tả

`decodeURIComponent()` là thuộc tính hàm của đối tượng toàn cục.

`decodeURIComponent()` sử dụng cùng thuật toán giải mã như được mô tả trong {{jsxref("decodeURI()")}}. Nó giải mã _tất cả_ các chuỗi thoát, bao gồm cả những chuỗi không được tạo bởi {{jsxref("encodeURIComponent")}}, như `-.!~*'()`.

## Ví dụ

### Giải mã thành phần URL tiếng Cyrillic

```js
decodeURIComponent("JavaScript_%D1%88%D0%B5%D0%BB%D0%BB%D1%8B");
// "JavaScript_шеллы"
```

### Bắt lỗi

```js
try {
  const a = decodeURIComponent("%E0%A4%A");
} catch (e) {
  console.error(e);
}

// URIError: malformed URI sequence
```

### Giải mã tham số truy vấn từ URL

`decodeURIComponent()` không thể được dùng trực tiếp để phân tích tham số truy vấn từ URL. Nó cần một chút chuẩn bị.

```js
function decodeQueryParam(p) {
  return decodeURIComponent(p.replace(/\+/g, " "));
}

decodeQueryParam("search+query%20%28correct%29");
// 'search query (correct)'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("decodeURI")}}
- {{jsxref("encodeURI")}}
- {{jsxref("encodeURIComponent")}}
