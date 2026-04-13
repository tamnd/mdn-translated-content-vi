---
title: "Highlight: clear() method"
short-title: clear()
slug: Web/API/Highlight/clear
page-type: web-api-instance-method
browser-compat: api.Highlight.clear
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.clear
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`clear()`** của giao diện {{domxref("Highlight")}} xóa tất cả các đối tượng {{domxref("Range")}} khỏi một đối tượng `Highlight`.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.clear()")}}.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã dưới đây minh họa cách tạo một vùng làm nổi bật mới với hai phạm vi, rồi xóa nó:

```js
const highlight = new Highlight(range1, range2);
console.log(highlight.size); // 2

highlight.clear();
console.log(highlight.size); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
