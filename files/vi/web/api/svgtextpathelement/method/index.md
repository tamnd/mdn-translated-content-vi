---
title: "SVGTextPathElement: method property"
short-title: method
slug: Web/API/SVGTextPathElement/method
page-type: web-api-instance-property
browser-compat: api.SVGTextPathElement.method
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`method`** của giao diện {{domxref("SVGTextPathElement")}} phản ánh thuộc tính {{SVGAttr("method")}} của phần tử {{SVGElement("textPath")}} đã cho. Nó nhận một trong các [hằng số `TEXTPATH_METHODTYPE_*`](/en-US/docs/Web/API/SVGTextPathElement#static_properties) được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `method`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <path id="myPath" d="M10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80" />
  </defs>
  <text font-size="20" fill="blue">
    <textPath id="myTextPath" href="#myPath" method="align">
      This text follows a path!
    </textPath>
  </text>
</svg>
```

```js
const textPath = document.getElementById("myTextPath");

// Truy cập thuộc tính method
console.log(textPath.method.baseVal); // Output: 1 (TEXTPATH_METHODTYPE_ALIGN)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTextPathElement.spacing")}}
- [Các kiểu method của `SVGTextPathElement`](/en-US/docs/Web/API/SVGTextPathElement#static_properties)
