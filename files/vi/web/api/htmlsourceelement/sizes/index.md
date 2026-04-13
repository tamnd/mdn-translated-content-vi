---
title: "HTMLSourceElement: thuộc tính sizes"
short-title: sizes
slug: Web/API/HTMLSourceElement/sizes
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.sizes
---

{{APIRef("HTML DOM")}}

Thuộc tính **`sizes`** của giao diện {{domxref("HTMLSourceElement")}} là một chuỗi đại diện cho danh sách một hoặc nhiều kích thước, đại diện cho các kích thước giữa các điểm ngắt, mà tài nguyên áp dụng.

Nó phản ánh thuộc tính `sizes` của phần tử {{HTMLElement("source")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<picture>
  <source
    id="el"
    srcset="medium-pic.jpg"
    type="image/jpeg"
    sizes="(50em <= width <= 60px) 50em,
           (30em <= width < 50em) 30em" />
</picture>
```

```js
const el = document.getElementById("el");
console.log(el.sizes); // Output: "(50em <= width <= 60px) 50em, (30em <= width < 50em) 30em"
el.sizes = "(50em <= width <= 60px) 100em, (30em <= width < 50em) 60em"; // Updates the sizes value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.sizes")}}
- {{domxref("HTMLSourceElement.media")}}
- {{domxref("HTMLSourceElement.type")}}
- {{domxref("HTMLSourceElement.src")}}
- {{domxref("HTMLSourceElement.srcset")}}
- {{htmlelement("source")}}
- {{htmlelement("picture")}}
- {{htmlelement("audio")}}
- {{htmlelement("video")}}
