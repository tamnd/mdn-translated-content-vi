---
title: "Highlight: has() method"
short-title: has()
slug: Web/API/Highlight/has
page-type: web-api-instance-method
browser-compat: api.Highlight.has
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.has
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`has()`** của giao diện {{domxref("Highlight")}} trả về một giá trị boolean cho biết liệu một đối tượng {{domxref("Range")}} có tồn tại trong đối tượng `Highlight` hay không.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.has()")}}.

## Cú pháp

```js-nolint
has(range)
```

### Tham số

- `range`
  - : Đối tượng `Range` cần kiểm tra sự tồn tại trong đối tượng `Highlight`.

### Giá trị trả về

Trả về `true` nếu phạm vi được chỉ định tồn tại trong đối tượng `Highlight`; ngược lại là `false`.

## Ví dụ

Đoạn mã dưới đây tạo hai phạm vi, và một đối tượng làm nổi bật chứa một trong số chúng. Sau đó mã sử dụng phương thức `has()` để kiểm tra xem mỗi phạm vi có tồn tại trong vùng làm nổi bật hay không:

```js
const range1 = new Range();
const range2 = new Range();
const myHighlight = new Highlight(range1);

myHighlight.has(range1); // true
myHighlight.has(range2); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
