---
title: "SVGTransformList: consolidate() method"
short-title: consolidate()
slug: Web/API/SVGTransformList/consolidate
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.consolidate
---

{{APIRef("SVG")}}

Phương thức `consolidate()` của giao diện {{domxref("SVGTransformList")}} hợp nhất danh sách các đối tượng {{domxref("SVGTransform")}} riêng biệt bằng cách nhân các ma trận biến đổi tương đương lại với nhau, kết quả là một danh sách gồm một đối tượng `SVGTransform` duy nhất kiểu `SVG_TRANSFORM_MATRIX`.

Thao tác hợp nhất tạo ra một đối tượng `SVGTransform` mới là phần tử đầu tiên và duy nhất trong danh sách.

Phần tử trả về là chính phần tử đó chứ không phải bản sao. Bất kỳ thay đổi nào được thực hiện với phần tử sẽ được phản ánh ngay lập tức trong danh sách.

## Cú pháp

```js-nolint
consolidate()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}} trực tiếp; biến đổi đã được hợp nhất.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

## Ví dụ

### Hợp nhất các biến đổi

```html
<svg width="200" height="200">
  <rect
    width="100"
    height="100"
    fill="red"
    transform="translate(50,50) rotate(45)" />
</svg>
```

```js
const svgElement = document.querySelector("svg");
const rectElement = svgElement.querySelector("rect");

// Access the transform list of the <rect> element
const transformList = rectElement.transform.baseVal;

// Consolidate the transformations
const consolidatedTransform = transformList.consolidate();

console.dir(consolidatedTransform); // Output: SVGTransform { type: 1, matrix: SVGMatrix, angle: 0 }
console.log(transformList.numberOfItems); // Output: 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
