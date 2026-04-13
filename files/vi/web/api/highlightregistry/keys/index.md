---
title: "HighlightRegistry: keys() method"
short-title: keys()
slug: Web/API/HighlightRegistry/keys
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.keys
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.keys
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`keys()`** của giao diện {{domxref("HighlightRegistry")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa các khóa của mỗi đối tượng `Highlight` trong `HighlightRegistry` theo thứ tự chèn.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.keys()")}}.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng iterator mới chứa tên của mỗi đối tượng `Highlight` trong sổ đăng ký, theo thứ tự chèn.

## Ví dụ

Đoạn code sau minh họa cách tạo và đăng ký ba đối tượng `Highlight`, và dùng iterator trả về từ phương thức `keys()` để ghi lại tên của chúng:

```js
const fooHighlight = new Highlight();
const barHighlight = new Highlight();
const bazHighlight = new Highlight();

CSS.highlights.set("foo", fooHighlight);
CSS.highlights.set("bar", barHighlight);
CSS.highlights.set("baz", bazHighlight);

const iter = CSS.highlights.keys();

console.log(iter.next().value); // "foo"
console.log(iter.next().value); // "bar"
console.log(iter.next().value); // "baz"
```

Ví dụ sau minh họa cách duyệt qua các highlight trong sổ đăng ký bằng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of):

```js
const fooHighlight = new Highlight();
const barHighlight = new Highlight();
const bazHighlight = new Highlight();

CSS.highlights.set("foo", fooHighlight);
CSS.highlights.set("bar", barHighlight);
CSS.highlights.set("baz", bazHighlight);

for (const name of CSS.highlights.keys()) {
  console.log(name);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
