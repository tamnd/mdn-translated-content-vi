---
title: "Highlight: forEach() method"
short-title: forEach()
slug: Web/API/Highlight/forEach
page-type: web-api-instance-method
browser-compat: api.Highlight.forEach
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.foreach
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`forEach()`** của giao diện {{domxref("Highlight")}} thực thi một hàm được cung cấp một lần cho mỗi đối tượng {{domxref("Range")}} trong đối tượng `Highlight`, theo thứ tự chèn vào.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.forEach()")}}.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callback`
  - : Hàm thực thi cho mỗi đối tượng `Range`, nhận ba đối số:
    - `range`, `key`
      - : Đối tượng `Range` hiện tại đang được xử lý trong `Highlight`. Vì không có khóa trong `Highlight`, `range` được truyền cho cả hai đối số.
    - `highlight`
      - : Đối tượng `Highlight` mà `forEach()` được gọi trên.

- `thisArg`
  - : Giá trị để sử dụng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã dưới đây minh họa cách tạo một vùng làm nổi bật mới với hai phạm vi, rồi ghi lại các phạm vi bằng cách sử dụng phương thức `forEach()`:

```js
function logRanges(range, key, highlight) {
  console.log(`Highlight object ${highlight} contains range ${range}`);
}

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

myHighlight.forEach(logRanges);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
