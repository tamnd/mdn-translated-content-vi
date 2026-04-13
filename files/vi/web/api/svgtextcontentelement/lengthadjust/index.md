---
title: "SVGTextContentElement: lengthAdjust property"
short-title: lengthAdjust
slug: Web/API/SVGTextContentElement/lengthAdjust
page-type: web-api-instance-property
browser-compat: api.SVGTextContentElement.lengthAdjust
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`lengthAdjust`** của giao diện {{domxref("SVGTextContentElement")}} phản ánh thuộc tính {{SVGAttr("lengthAdjust")}} của phần tử đã cho. Nhận một trong các hằng số `LENGTHADJUST_*` được định nghĩa trên giao diện này.

## Giá trị

Một {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `lengthAdjust`

```html
<svg width="200" height="100">
  <text id="myText" x="10" y="50" textLength="100" lengthAdjust="spacing">
    Hello, SVG!
  </text>
</svg>
```

```js
const textElement = document.getElementById("myText");

// Access the `lengthAdjust` property
const lengthAdjust = textElement.lengthAdjust;

// Log the base value of the `lengthAdjust` attribute
console.log(lengthAdjust.baseVal); // Output: 1 (e.g. LENGTHADJUST_SPACING)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("lengthAdjust")}}
- {{domxref("SVGAnimatedEnumeration")}}
