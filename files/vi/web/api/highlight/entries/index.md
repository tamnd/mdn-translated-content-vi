---
title: "Highlight: entries() method"
short-title: entries()
slug: Web/API/Highlight/entries
page-type: web-api-instance-method
browser-compat: api.Highlight.entries
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.entries
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`entries()`** của giao diện {{domxref("Highlight")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa một mảng `[range, range]` cho mỗi đối tượng {{domxref("Range")}} trong đối tượng `Highlight`, theo thứ tự chèn vào.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.entries()")}}.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng iterator mới chứa một mảng `[range, range]` cho mỗi đối tượng `Range` trong `Highlight` đã cho, theo thứ tự chèn vào.

## Ví dụ

Đoạn mã dưới đây minh họa cách tạo một vùng làm nổi bật mới với hai phạm vi, rồi ghi lại các phạm vi bằng cách sử dụng iterator được trả về bởi phương thức `entries()`:

```js
const text = new Text("Time is an illusion. Lunchtime doubly so.");

const range1 = document.createRange();
range1.setStart(text, 0);
range1.setEnd(text, 4);

const range2 = document.createRange();
range2.setStart(text, 21);
range2.setEnd(text, 30);

const myHighlight = new Highlight();
myHighlight.add(range1);
myHighlight.add(range2);

const iter = myHighlight.entries();

console.log(iter.next().value); // [Range, Range]
console.log(iter.next().value); // [Range, Range]
```

Ví dụ mã sau đây minh họa cách lặp qua các phạm vi trong một vùng làm nổi bật bằng cách sử dụng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of):

```js
const text = new Text("Time is an illusion. Lunchtime doubly so.");

const range1 = document.createRange();
range1.setStart(text, 0);
range1.setEnd(text, 4);

const range2 = document.createRange();
range2.setStart(text, 21);
range2.setEnd(text, 30);

const highlight = new Highlight();
highlight.add(range1);
highlight.add(range2);

for (const [range] of highlight.entries()) {
  console.log(range.toString());
  // Time
  // Lunchtime
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
