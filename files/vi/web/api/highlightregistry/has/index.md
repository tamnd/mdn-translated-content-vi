---
title: "HighlightRegistry: has() method"
short-title: has()
slug: Web/API/HighlightRegistry/has
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.has
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.has
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`has()`** của giao diện {{domxref("HighlightRegistry")}} trả về giá trị boolean cho biết liệu một đối tượng {{domxref("Highlight")}} có tên chỉ định có tồn tại trong sổ đăng ký hay không.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.has()")}}.

## Cú pháp

```js-nolint
has(name)
```

### Tham số

- `name`
  - : Tên của đối tượng `Highlight` cần kiểm tra trong sổ đăng ký.

### Giá trị trả về

Trả về `true` nếu một highlight với tên chỉ định tồn tại trong sổ đăng ký; ngược lại trả về `false`.

## Ví dụ

```js
const fooHighlight = new Highlight();
CSS.highlights.set("foo", fooHighlight);

myHighlight.has("foo"); // true
myHighlight.has("bar"); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
