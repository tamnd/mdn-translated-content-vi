---
title: "HighlightRegistry: set() method"
short-title: set()
slug: Web/API/HighlightRegistry/set
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.set
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.set
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`set()`** của giao diện {{domxref("HighlightRegistry")}} thêm hoặc cập nhật một đối tượng {{domxref("Highlight")}} trong sổ đăng ký với tên chỉ định.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.set()")}}.

## Cú pháp

```js-nolint
set(name, highlight)
```

### Tham số

- `name`
  - : Tên của đối tượng `Highlight` cần thêm hoặc cập nhật. Tên phải là một {{jsxref("String")}}.
- `highlight`
  - : Đối tượng `Highlight` cần thêm hoặc cập nhật. Đây phải là một thực thể của giao diện {{domxref("Highlight")}}.

### Giá trị trả về

Đối tượng `HighlightRegistry`.

## Ví dụ

### Sử dụng set()

```js
const fooHighlight = new Highlight();
CSS.highlights.set("foo", fooHighlight);
```

### Sử dụng set() với method chaining

Vì phương thức `set()` trả về lại sổ đăng ký, bạn có thể gọi chuỗi phương thức như sau:

```js
const fooHighlight = new Highlight();
const barHighlight = new Highlight();
const bazHighlight = new Highlight();

CSS.highlights
  .set("foo", fooHighlight)
  .set("bar", barHighlight)
  .set("baz", bazHighlight);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API) module
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
