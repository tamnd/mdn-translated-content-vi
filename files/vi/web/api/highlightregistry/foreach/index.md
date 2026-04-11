---
title: "HighlightRegistry: forEach() method"
short-title: forEach()
slug: Web/API/HighlightRegistry/forEach
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.forEach
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.foreach
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`forEach()`** của giao diện {{domxref("HighlightRegistry")}} thực thi một hàm đã cho một lần cho mỗi đối tượng {{domxref("Highlight")}} trong sổ đăng ký, theo thứ tự chèn.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.forEach()")}}.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callback`
  - : Hàm thực thi cho mỗi đối tượng `Highlight`, nhận ba đối số:
    - `highlight`
      - : Highlight hiện tại.
    - `name`
      - : Tên của highlight.
    - `registry`
      - : Đối tượng sổ đăng ký mà `forEach()` được gọi trên đó.

- `thisArg`
  - : Giá trị dùng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn code dưới đây minh họa cách tạo một highlight mới với hai range, rồi ghi lại các range bằng phương thức `forEach()`:

```js
function logAllHighlights(highlight, name) {
  console.log(`Highlight ${name} exists in the registry`, highlight);
}

const customHighlight1 = new Highlight();
const customHighlight2 = new Highlight();
const customHighlight3 = new Highlight();

CSS.highlights.set("custom-highlight-1", customHighlight1);
CSS.highlights.set("custom-highlight-2", customHighlight2);
CSS.highlights.set("custom-highlight-3", customHighlight3);

CSS.highlights.forEach(logAllHighlights);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
