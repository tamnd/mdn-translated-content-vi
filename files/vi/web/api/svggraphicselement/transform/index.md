---
title: "SVGGraphicsElement: transform property"
short-title: transform
slug: Web/API/SVGGraphicsElement/transform
page-type: web-api-instance-property
browser-compat: api.SVGGraphicsElement.transform
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`transform`** của giao diện {{domxref("SVGGraphicsElement")}} phản ánh giá trị tính toán của thuộc tính transform và thuộc tính {{SVGAttr("transform")}} tương ứng của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedTransformList")}}.

## Ví dụ

### Truy cập thuộc tính `transform`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <!-- Hình chữ nhật với phép biến đổi được áp dụng -->
  <rect
    id="rect1"
    x="50"
    y="50"
    width="100"
    height="100"
    fill="blue"
    transform="translate(20, 30) rotate(45)" />
</svg>
```

```js
// Truy cập phần tử SVG
const rect = document.getElementById("rect1");

// Lấy danh sách biến đổi
const transformList = rect.transform.baseVal;

// Duyệt và ghi nhật ký mỗi phép biến đổi
for (let i = 0; i < transformList.numberOfItems; i++) {
  const transform = transformList.getItem(i);
  console.log(`Type: ${transform.type}, Matrix: ${transform.matrix}`);
}
// Ví dụ output:
// Type: 2 (SVG_TRANSFORM_TRANSLATE), Matrix: SVGMatrix { ... }
// Type: 4 (SVG_TRANSFORM_ROTATE), Matrix: SVGMatrix { ... }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
