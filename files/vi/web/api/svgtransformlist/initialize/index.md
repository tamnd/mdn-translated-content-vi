---
title: "SVGTransformList: initialize() method"
short-title: initialize()
slug: Web/API/SVGTransformList/initialize
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.initialize
---

{{APIRef("SVG")}}

Phương thức `initialize()` của giao diện {{domxref("SVGTransformList")}} xóa tất cả các phần tử hiện tại khỏi danh sách và khởi tạo lại danh sách để giữ phần tử duy nhất được chỉ định bởi tham số.

Nếu phần tử được chèn đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó chứ không phải bản sao.

## Cú pháp

```js-nolint
initialize(newItem)
```

### Tham số

- `newItem`
  - : Một phần tử {{domxref("SVGTransform")}} được chèn vào danh sách.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}; phần tử được chèn vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

## Ví dụ

### Khởi tạo lại danh sách biến đổi với một biến đổi mới

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

// Apply an initial translate transformation to the <rect> element
const translateTransform = svgElement.createSVGTransform();
translateTransform.setTranslate(50, 50);
transformList.appendItem(translateTransform);

// Number of transformations before initialization
console.log(
  `Number of transformations before initialization: ${transformList.length}`,
); // Output: 1

// Create a new scale transformation
const scaleTransform = svgElement.createSVGTransform();
scaleTransform.setScale(2, 2);

// Initialize the list with the new scale transform
transformList.initialize(scaleTransform);

// Number of transformations after initialization
console.log(
  `Number of transformations after initialization: ${transformList.length}`,
); // Output: 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
