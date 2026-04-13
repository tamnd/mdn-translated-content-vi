---
title: "SVGTransformList: replaceItem() method"
short-title: replaceItem()
slug: Web/API/SVGTransformList/replaceItem
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.replaceItem
---

{{APIRef("SVG")}}

Phương thức `replaceItem()` của giao diện {{domxref("SVGTransformList")}} thay thế một phần tử hiện có trong danh sách bằng một phần tử mới.

Phần tử được chèn là chính phần tử đó chứ không phải bản sao.

- Nếu `newItem` đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này.

- Nếu phần tử đã có trong danh sách này, lưu ý rằng `index` của phần tử cần thay thế là trước khi xóa phần tử.

## Cú pháp

```js-nolint
replaceItem(newItem, index)
```

### Tham số

- `newItem`
  - : Một phần tử {{domxref("SVGTransform")}} được chèn vào danh sách.
- `index`
  - : Một `integer`; chỉ số tại đó phần tử mới cần thay thế phần tử hiện có, là unsigned long.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}; phần tử được chèn vào từ danh sách.

### Ngoại lệ

Phương thức này có thể ném ra {{domxref("DOMException")}} với một trong các kiểu sau:

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu số chỉ số lớn hơn hoặc bằng {{domxref("SVGTransformList.numberOfItems", "numberOfItems")}}.

## Ví dụ

### Thay thế một biến đổi trong danh sách

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

// Create a new rotation transformation
const rotateTransform = svgElement.createSVGTransform();
rotateTransform.setRotate(45, 50, 50);

transformList.replaceItem(rotateTransform, 0);

// Log the details of the new transformation
console.log(`New Transformation Type: ${transformList.getItem(0).type}`); // Output: 4 (e.g. SVG_TRANSFORM_ROTATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
- {{domxref("SVGTransformList.numberOfItems")}}
