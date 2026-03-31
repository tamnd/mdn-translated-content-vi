---
title: "URIError: malformed URI sequence"
slug: Web/JavaScript/Reference/Errors/Malformed_URI
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "malformed URI sequence" xảy ra khi quá trình mã hóa hoặc giải mã URI không thành công.

## Thông báo

```plain
URIError: URI malformed (V8-based)
URIError: malformed URI sequence (Firefox)
URIError: String contained an illegal UTF-16 sequence. (Safari)
```

## Loại lỗi

{{jsxref("URIError")}}

## Nguyên nhân?

Quá trình mã hóa hoặc giải mã URI không thành công. Đối số được truyền cho hàm {{jsxref("decodeURI")}}, {{jsxref("encodeURI")}}, {{jsxref("encodeURIComponent")}}, hoặc {{jsxref("decodeURIComponent")}} không hợp lệ, khiến hàm không thể mã hóa hoặc giải mã đúng cách.

## Ví dụ

### Mã hóa

Mã hóa thay thế mỗi ký tự nhất định bằng một, hai, ba hoặc bốn chuỗi thoát đại diện cho mã hóa UTF-8 của ký tự đó. Một {{jsxref("URIError")}} sẽ được ném ra nếu có cố gắng mã hóa một surrogate không thuộc cặp high-low, ví dụ:

```js example-bad
encodeURI("\uD800");
// "URIError: malformed URI sequence"

encodeURI("\uDFFF");
// "URIError: malformed URI sequence"
```

Một cặp high-low là hợp lệ. Ví dụ:

```js example-good
encodeURI("\uD800\uDFFF");
// "%F0%90%8F%BF"
```

### Giải mã

Giải mã thay thế mỗi chuỗi thoát trong thành phần URI được mã hóa bằng ký tự mà nó đại diện. Nếu không có ký tự như vậy, sẽ có lỗi được ném ra:

```js example-bad
decodeURIComponent("%E0%A4%A");
// "URIError: malformed URI sequence"
```

Với đầu vào đúng, đây thường sẽ trông như thế này:

```js example-good
decodeURIComponent("JavaScript_%D1%88%D0%B5%D0%BB%D0%BB%D1%8B");
// "JavaScript_шеллы"
```

## Xem thêm

- {{jsxref("URIError")}}
- {{jsxref("decodeURI")}}
- {{jsxref("encodeURI")}}
- {{jsxref("encodeURIComponent")}}
- {{jsxref("decodeURIComponent")}}
