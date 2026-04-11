---
title: "HighlightRegistry: entries() method"
short-title: entries()
slug: Web/API/HighlightRegistry/entries
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.entries
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.entries
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`entries()`** của giao diện {{domxref("HighlightRegistry")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa các cặp `[name, highlight]` cho mỗi phần tử trong đối tượng `HighlightRegistry`, theo thứ tự chèn.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.entries()")}}.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng iterator mới chứa mảng `[name, highlight]` cho mỗi đối tượng `Highlight` trong `HighlightRegistry`, theo thứ tự chèn.

## Ví dụ

Đoạn code dưới đây tạo và đăng ký hai highlight mới, rồi ghi lại các highlight cùng tên của chúng bằng iterator trả về từ phương thức `entries()`:

```js
const myHighlight1 = new Highlight();
const myHighlight2 = new Highlight();

CSS.highlights.set("first-highlight", myHighlight1);
CSS.highlights.set("second-highlight", myHighlight2);

const iter = CSS.highlights.entries();

console.log(iter.next().value); // ['first-highlight', Highlight]
console.log(iter.next().value); // ['second-highlight', Highlight]
```

Ví dụ sau minh họa cách duyệt qua các highlight trong sổ đăng ký bằng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of):

```js
const myHighlight1 = new Highlight();
const myHighlight2 = new Highlight();

CSS.highlights.set("first-highlight", myHighlight1);
CSS.highlights.set("second-highlight", myHighlight2);

for (const [name, highlight] of CSS.highlights.entries()) {
  console.log(`Highlight ${name}`, highlight);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
