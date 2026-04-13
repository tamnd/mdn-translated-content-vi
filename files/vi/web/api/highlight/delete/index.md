---
title: "Highlight: delete() method"
short-title: delete()
slug: Web/API/Highlight/delete
page-type: web-api-instance-method
browser-compat: api.Highlight.delete
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-set.prototype.delete
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`delete()`** của giao diện {{domxref("Highlight")}} xóa một đối tượng {{domxref("Range")}} được chỉ định khỏi một đối tượng `Highlight`.

`Highlight` là một đối tượng giống {{jsxref("Set")}}, vì vậy điều này tương tự như sử dụng {{jsxref("Set.delete()")}}.

## Cú pháp

```js-nolint
delete(range)
```

### Tham số

- `range`
  - : Đối tượng {{domxref("Range")}} cần xóa khỏi `Highlight`.

### Giá trị trả về

Trả về `true` nếu `range` đã có trong `Highlight`; ngược lại là `false`.

## Ví dụ

Đoạn mã dưới đây minh họa cách tạo một vùng làm nổi bật mới với hai phạm vi, rồi xóa một trong số chúng:

```js
const range1 = new Range();
const range2 = new Range();

const highlight = new Highlight(range1, range2);
console.log(highlight.size); // 2

highlight.delete(range1);
console.log(highlight.size); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
