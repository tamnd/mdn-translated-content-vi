---
title: "Highlight: add() method"
short-title: add()
slug: Web/API/Highlight/add
page-type: web-api-instance-method
browser-compat: api.Highlight.add
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.add
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`add()`** của giao diện {{domxref("Highlight")}} thêm một đối tượng {{domxref("Range")}} mới vào một vùng làm nổi bật, để tạo kiểu bằng cách sử dụng {{domxref("css_custom_highlight_api", "CSS Custom Highlight API", "", "nocode")}}.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.add()")}}.

## Cú pháp

```js-nolint
add(range)
```

### Tham số

- `range`
  - : Một đối tượng {{domxref("Range")}} để thêm vào `Highlight`.

### Giá trị trả về

Đối tượng `Highlight`, với phạm vi được thêm vào.

## Ví dụ

Đoạn mã dưới đây minh họa cách thêm hai phạm vi vào một đối tượng làm nổi bật mới:

```js
const highlight = new Highlight();

const range1 = new Range();
const range2 = new Range();

highlight.add(range1).add(range2);

console.log(highlight.size); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
