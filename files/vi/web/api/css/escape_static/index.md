---
title: "CSS: phương thức tĩnh escape()"
short-title: escape()
slug: Web/API/CSS/escape_static
page-type: web-api-static-method
browser-compat: api.CSS.escape_static
---

{{APIRef("CSSOM")}}

Phương thức tĩnh **`CSS.escape()`** trả về một chuỗi chứa phiên bản đã được escape của chuỗi truyền vào qua tham số, chủ yếu để dùng như một phần của bộ chọn CSS.

## Cú pháp

```js-nolint
CSS.escape(str)
```

### Tham số

- `str`
  - : Chuỗi cần được escape.

### Giá trị trả về

Chuỗi đã được escape.

## Ví dụ

### Kết quả cơ bản

<!-- Note: the {} need to be triple-escaped, once for Yari -->

```js-nolint
CSS.escape(".foo#bar"); // "\\.foo\\#bar"
CSS.escape("()[]{}"); // "\\(\\)\\[\\]\\\{\\\}"
CSS.escape('--a'); // "--a"
CSS.escape(0); // "\\30 ", mã điểm Unicode của '0' là 30
CSS.escape('\0'); // "\ufffd", ký tự Unicode REPLACEMENT CHARACTER
```

### Sử dụng trong ngữ cảnh thực tế

Để escape một chuỗi nhằm dùng như một phần của bộ chọn, có thể dùng phương thức `escape()`:

```js
const element = document.querySelector(`#${CSS.escape(id)} > img`);
```

Phương thức `escape()` cũng có thể được dùng để escape chuỗi, dù nó sẽ escape cả những ký tự không thực sự bắt buộc phải escape:

```js
const element = document.querySelector(`a[href="#${CSS.escape(fragment)}"]`);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("CSS")}} nơi chứa phương thức tĩnh này.
- [Một polyfill cho CSS.escape](https://github.com/mathiasbynens/CSS.escape/blob/master/css.escape.js)
