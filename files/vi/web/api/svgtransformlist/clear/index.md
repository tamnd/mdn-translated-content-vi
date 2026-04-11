---
title: "SVGTransformList: clear() method"
short-title: clear()
slug: Web/API/SVGTransformList/clear
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.clear
---

{{APIRef("SVG")}}

Phương thức `clear()` của giao diện {{domxref("SVGTransformList")}} xóa tất cả các phần tử hiện tại khỏi danh sách, kết quả là một danh sách rỗng.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

## Ví dụ

### Xóa tất cả biến đổi khỏi phần tử SVG

```html
<svg width="200" height="200" id="mySvg">
  <rect width="100" height="100" fill="blue" transform="translate(50,50)" />
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

// Number of transformations before clearing
console.log(
  `Number of transformations before clearing: ${transformList.length}`,
); // Output: 1

// Clear all transformations from the list
transformList.clear();

// Number of transformations after clearing
console.log(
  `Number of transformations after clearing: ${transformList.length}`,
); // Output: 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
