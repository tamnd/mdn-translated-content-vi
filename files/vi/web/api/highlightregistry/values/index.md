---
title: "HighlightRegistry: values() method"
short-title: values()
slug: Web/API/HighlightRegistry/values
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.values
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.values
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`values()`** của giao diện {{domxref("HighlightRegistry")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới trả về các giá trị của mỗi đối tượng `Highlight` trong `HighlightRegistry` theo thứ tự chèn.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.values()")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng iterator mới chứa mỗi đối tượng `Highlight` trong sổ đăng ký, theo thứ tự chèn.

## Ví dụ

Đoạn code sau minh họa cách tạo và đăng ký ba đối tượng `Highlight`, và dùng iterator trả về từ phương thức `values()` để ghi lại các highlight:

```js
const fooHighlight = new Highlight();
const barHighlight = new Highlight();
const bazHighlight = new Highlight();

CSS.highlights.set("foo", fooHighlight);
CSS.highlights.set("bar", barHighlight);
CSS.highlights.set("baz", bazHighlight);

const iter = CSS.highlights.values();

console.log(iter.next().value); // Highlight
console.log(iter.next().value); // Highlight
console.log(iter.next().value); // Highlight
```

Ví dụ sau minh họa cách duyệt qua các highlight trong sổ đăng ký bằng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of):

```js
const fooHighlight = new Highlight();
const barHighlight = new Highlight();
const bazHighlight = new Highlight();

CSS.highlights.set("foo", fooHighlight);
CSS.highlights.set("bar", barHighlight);
CSS.highlights.set("baz", bazHighlight);

for (const highlight of CSS.highlights.values()) {
  console.log(highlight); // Highlight
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
