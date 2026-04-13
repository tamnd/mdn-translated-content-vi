---
title: "HighlightRegistry: get() method"
short-title: get()
slug: Web/API/HighlightRegistry/get
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.get
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.get
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`get()`** của giao diện {{domxref("HighlightRegistry")}} trả về đối tượng {{domxref("Highlight")}} có tên chỉ định từ sổ đăng ký.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.get()")}}.

## Cú pháp

```js-nolint
get(name)
```

### Tham số

- `name`
  - : Tên của đối tượng `Highlight` cần lấy từ sổ đăng ký. Tên phải là một {{jsxref("String")}}.

### Giá trị trả về

Đối tượng `Highlight` liên kết với tên chỉ định, hoặc {{jsxref("undefined")}} nếu không tìm thấy tên đó trong `HighlightRegistry`.

## Ví dụ

Đoạn code sau minh họa cách tạo một `Highlight` mới, thêm vào sổ đăng ký, và lấy lại theo tên bằng phương thức `get()`:

```js
const fooHighlight = new Highlight();
CSS.highlights.set("foo", fooHighlight);

console.log(CSS.highlights.get("foo")); // Returns the fooHighlight object.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
