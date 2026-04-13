---
title: "SVGTransformList: removeItem() method"
short-title: removeItem()
slug: Web/API/SVGTransformList/removeItem
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.removeItem
---

{{APIRef("SVG")}}

Phương thức `removeItem()` của giao diện {{domxref("SVGTransformList")}} xóa một phần tử hiện có khỏi danh sách.

## Cú pháp

```js-nolint
removeItem(index)
```

### Tham số

- `index`
  - : Một `integer`; chỉ số của phần tử cần xóa là unsigned long.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}; phần tử đã bị xóa khỏi danh sách.

### Ngoại lệ

Phương thức này có thể ném ra {{domxref("DOMException")}} với một trong các kiểu sau:

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu số chỉ số lớn hơn hoặc bằng {{domxref("SVGTransformList.numberOfItems", "numberOfItems")}}.

## Ví dụ

### Xóa một biến đổi khỏi danh sách

```html
<svg width="200" height="200" id="mySvg">
  <rect
    width="100"
    height="100"
    fill="blue"
    transform="translate(50,50) rotate(45)" />
</svg>
```

```js
const svgElement = document.querySelector("svg");
const rectElement = svgElement.querySelector("rect");

// Access the transform list of the <rect> element
const transformList = rectElement.transform.baseVal;

const removedTransform = transformList.removeItem(0);
console.dir(removedTransform); // Output: SVGTransform { type: 2, matrix: SVGMatrix, angle: 0 }

// The updated list length
console.log(`Updated number of transformations: ${transformList.length}`); // Output: 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
- {{domxref("SVGTransformList.numberOfItems")}}
