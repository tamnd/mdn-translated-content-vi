---
title: "Highlight: Highlight() constructor"
short-title: Highlight()
slug: Web/API/Highlight/Highlight
page-type: web-api-constructor
browser-compat: api.Highlight.Highlight
---

{{APIRef("CSS Custom Highlight API")}}

Hàm khởi tạo **`Highlight()`** trả về một đối tượng {{domxref("Highlight")}} mới được tạo, có thể chứa một tập hợp các đối tượng {{domxref("Range")}} để tạo kiểu bằng cách sử dụng {{domxref("css_custom_highlight_api", "CSS Custom Highlight API", "", "nocode")}}.

## Cú pháp

```js-nolint
new Highlight()
new Highlight(range)
new Highlight(range1, range2, /* …, */ rangeN)
```

### Tham số

- `range1`, …, `rangeN` {{optional_inline}}
  - : Một hoặc nhiều đối tượng {{domxref("Range")}} ban đầu để thêm vào vùng làm nổi bật mới.

### Giá trị trả về

Một đối tượng `Highlight` mới.

## Ví dụ

Mã ví dụ dưới đây minh họa cách tạo một đối tượng làm nổi bật trống, rồi thêm các phạm vi vào nó:

```js
const highlight = new Highlight();
highlight.add(range1);
highlight.add(range2);
```

Mã ví dụ dưới đây minh họa cách tạo một đối tượng làm nổi bật mới và thêm các phạm vi vào nó trong quá trình khởi tạo:

```js
const highlight = new Highlight(range1, range2);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API) module
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
