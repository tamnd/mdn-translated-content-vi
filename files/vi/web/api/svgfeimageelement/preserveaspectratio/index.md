---
title: "SVGFEImageElement: preserveAspectRatio property"
short-title: preserveAspectRatio
slug: Web/API/SVGFEImageElement/preserveAspectRatio
page-type: web-api-instance-property
browser-compat: api.SVGFEImageElement.preserveAspectRatio
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`preserveAspectRatio`** của giao diện {{domxref("SVGFEImageElement")}} phản ánh thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử {{SVGElement("feImage")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedPreserveAspectRatio")}}.

## Ví dụ

### Truy cập thuộc tính `preserveAspectRatio`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <filter id="image-filter">
      <!-- feImage element with preserveAspectRatio attribute -->
      <feImage
        href="https://via.placeholder.com/150"
        x="0"
        y="0"
        width="150"
        height="150"
        preserveAspectRatio="xMidYMid meet" />
    </filter>
  </defs>

  <!-- Rectangle with the filter applied -->
  <rect
    x="50"
    y="50"
    width="200"
    height="100"
    fill="blue"
    filter="url(#image-filter)" />
</svg>
```

```js
// Select the feImage element
const feImageElement = document.querySelector("feImage");

// Access the preserveAspectRatio property
console.dir(feImageElement.preserveAspectRatio); // Output: SVGAnimatedPreserveAspectRatio object
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("preserveAspectRatio")}}
