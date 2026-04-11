---
title: "SVGTransformList: numberOfItems property"
short-title: numberOfItems
slug: Web/API/SVGTransformList/numberOfItems
page-type: web-api-instance-property
browser-compat: api.SVGTransformList.numberOfItems
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`numberOfItems`** của giao diện {{domxref("SVGTransformList")}} đại diện cho số lượng phần tử trong danh sách.

## Giá trị

Một `integer`; số lượng đối tượng {{domxref("SVGTransform")}} trong danh sách là unsigned long.

## Ví dụ

### Truy cập thuộc tính `numberOfItems`

```html
<svg width="200" height="200" id="mySvg">
  <rect width="100" height="100" fill="blue" />
</svg>
```

```js
const svgElement = document.querySelector("svg");
const rectElement = svgElement.querySelector("rect");

// Access the transform list of the <rect> element
const transformList = rectElement.transform.baseVal;

// Apply a translate transformation to the <rect> element
const translateTransform = svgElement.createSVGTransform();
translateTransform.setTranslate(50, 50);
transformList.appendItem(translateTransform);

console.log(`Number of transformations: ${transformList.numberOfItems}`); // Output: 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
