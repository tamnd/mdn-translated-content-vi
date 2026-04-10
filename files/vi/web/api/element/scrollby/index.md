---
title: "Element: scrollBy() method"
short-title: scrollBy()
slug: Web/API/Element/scrollBy
page-type: web-api-instance-method
browser-compat: api.Element.scrollBy
---

{{APIRef("CSSOM view API")}}

Thuộc tính **`scrollBy()`** method of the {{domxref("Element")}}
interface scrolls an element by the given amount.

## Cú pháp

```js-nolint
scrollBy(xCoord, yCoord)
scrollBy(options)
```

### Tham số

- `xCoord`
  - : The horizontal pixel value that you want to
    scroll by.
- `yCoord`
  - : The vertical pixel value that you want to scroll
    by.
- `options`
  - : Một đối tượng containing the following properties:
    - `top`
      - : Specifies the number of pixels along the Y axis to scroll the window or element.
    - `left`
      - : Specifies the number of pixels along the X axis to scroll the window or element.
    - `behavior`
      - : Specifies whether the scrolling should animate smoothly (`smooth`), happen instantly in a single jump (`instant`), or let the browser choose (`auto`, default).

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
// scroll an element
element.scrollBy(300, 300);
```

Sử dụng `options`:

```js
element.scrollBy({
  top: 100,
  left: 100,
  behavior: "smooth",
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
