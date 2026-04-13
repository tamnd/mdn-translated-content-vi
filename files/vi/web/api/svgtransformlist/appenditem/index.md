---
title: "SVGTransformList: appendItem() method"
short-title: appendItem()
slug: Web/API/SVGTransformList/appendItem
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.appendItem
---

{{APIRef("SVG")}}

Phương thức `appendItem()` của giao diện {{domxref("SVGTransformList")}} chèn một phần tử mới vào cuối danh sách.

Phần tử được chèn là chính phần tử đó chứ không phải bản sao.

- Nếu `newItem` đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này.

## Cú pháp

```js-nolint
appendItem(newItem)
```

### Tham số

- `newItem`
  - : Một phần tử {{domxref("SVGTransform")}} được thêm vào cuối danh sách.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}; phần tử được thêm vào từ danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

## Ví dụ

### Thêm một biến đổi mới

```html
<svg width="200" height="200">
  <rect width="100" height="100" fill="red" />
</svg>
```

```js
const svgElement = document.querySelector("svg");
const rectElement = svgElement.querySelector("rect");

// Access the transform list of the <rect> element
const transformList = rectElement.transform.baseVal;

// Create a new translation transformation
const svgTransform = svgElement.createSVGTransform();
svgTransform.setTranslate(50, 50);

// Append the new transformation to the list
const appendedTransform = transformList.appendItem(svgTransform);

console.dir(appendedTransform); // Output: SVGTransform { type: 2, matrix: SVGMatrix, angle: 0 }
console.log(`Total number of transformations: ${transformList.numberOfItems}`); // Output: 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
- {{domxref("SVGTransformList.numberOfItems")}}
