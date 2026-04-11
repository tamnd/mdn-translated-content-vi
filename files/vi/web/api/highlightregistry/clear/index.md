---
title: "HighlightRegistry: clear() method"
short-title: clear()
slug: Web/API/HighlightRegistry/clear
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.clear
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.clear
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`clear()`** của giao diện {{domxref("HighlightRegistry")}} xóa tất cả các đối tượng {{domxref("Highlight")}} đã đăng ký trong `HighlightRegistry`.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.clear()")}}.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn code dưới đây đăng ký hai đối tượng highlight trong sổ đăng ký rồi xóa toàn bộ sổ đăng ký:

```js
const customHighlight1 = new Highlight(range1, range2);
const customHighlight2 = new Highlight(range3, range4, range5);

CSS.highlights.set("custom-highlight-1", customHighlight1);
CSS.highlights.set("custom-highlight-2", customHighlight2);

console.log(CSS.highlights.size); // 2

CSS.highlights.clear();
console.log(CSS.highlights.size); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
