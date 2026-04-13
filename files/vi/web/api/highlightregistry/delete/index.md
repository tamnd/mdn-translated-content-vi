---
title: "HighlightRegistry: delete() method"
short-title: delete()
slug: Web/API/HighlightRegistry/delete
page-type: web-api-instance-method
browser-compat: api.HighlightRegistry.delete
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.delete
---

{{APIRef("CSS Custom Highlight API")}}

Phương thức **`delete()`** của giao diện {{domxref("HighlightRegistry")}} xóa đối tượng {{domxref("Highlight")}} có tên chỉ định khỏi `HighlightRegistry`.

`HighlightRegistry` là một đối tượng tương tự {{jsxref("Map")}}, vì vậy thao tác này tương tự như dùng {{jsxref("Map.delete()")}}.

## Cú pháp

```js-nolint
delete(customHighlightName)
```

### Tham số

- `customHighlightName`
  - : Tên, dưới dạng {{jsxref("String")}}, của đối tượng {{domxref("Highlight")}} cần xóa khỏi `HighlightRegistry`.

### Giá trị trả về

Trả về `true` nếu một đối tượng `Highlight` với tên đã cung cấp tồn tại trong `HighlightRegistry`; ngược lại trả về `false`.

## Ví dụ

Đoạn code sau đăng ký một highlight trong sổ đăng ký rồi xóa nó:

```js
const myHighlight = new Highlight(range1, range2);

CSS.highlights.set("my-highlight", myHighlight);

CSS.highlights.delete("foo"); // false
CSS.highlights.delete("my-highlight"); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
