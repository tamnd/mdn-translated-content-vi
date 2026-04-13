---
title: "SVGTransformList: getItem() method"
short-title: getItem()
slug: Web/API/SVGTransformList/getItem
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.getItem
---

{{APIRef("SVG")}}

Phương thức `getItem()` của giao diện {{domxref("SVGTransformList")}} trả về phần tử được chỉ định từ danh sách.

Phần tử trả về là chính phần tử đó chứ không phải bản sao. Bất kỳ thay đổi nào được thực hiện với phần tử sẽ được phản ánh ngay lập tức trong danh sách.

Phần tử đầu tiên có chỉ số `0`.

## Cú pháp

```js-nolint
getItem(index)
```

### Tham số

- `index`
  - : Một `integer`; chỉ số của phần tử được chỉ định là unsigned long.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}; phần tử được chỉ định từ danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

## Ví dụ

### Truy cập một phần tử từ danh sách biến đổi

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

// Get the first item from the transform list
const firstTransform = transformList.getItem(0);

// Log the transformation type
console.log(`Transformation Type: ${firstTransform.type}`); // Output: 2 (for SVG_TRANSFORM_TRANSLATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
