---
title: "SVGTextPathElement: spacing property"
short-title: spacing
slug: Web/API/SVGTextPathElement/spacing
page-type: web-api-instance-property
browser-compat: api.SVGTextPathElement.spacing
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`spacing`** của giao diện {{domxref("SVGTextPathElement")}} phản ánh thuộc tính {{SVGAttr("spacing")}} của phần tử {{SVGElement("textPath")}} đã cho. Nó nhận một trong các [hằng số `TEXTPATH_SPACINGTYPE_*`](/en-US/docs/Web/API/SVGTextPathElement#static_properties) được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `spacing`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <path id="myPath" d="M10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80" />
  </defs>
  <text font-size="20" fill="blue">
    <textPath id="myTextPath" href="#myPath" spacing="auto">
      This text follows a path!
    </textPath>
  </text>
</svg>
```

```js
const textPath = document.getElementById("myTextPath");

// Truy cập thuộc tính spacing
console.log(textPath.spacing.baseVal); // Output: 1 (TEXTPATH_SPACINGTYPE_AUTO)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTextPathElement.method")}}
- [Các kiểu spacing của `SVGTextPathElement`](/en-US/docs/Web/API/SVGTextPathElement#static_properties)
