---
title: "SVGTextPathElement: href property"
short-title: href
slug: Web/API/SVGTextPathElement/href
page-type: web-api-instance-property
browser-compat: api.SVGTextPathElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGTextPathElement")}} phản ánh thuộc tính {{SVGAttr("href")}} (hoặc thuộc tính {{SVGAttr("xlink:href")}} đã lỗi thời) của phần tử {{SVGElement("textPath")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `href`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <path id="myPath" d="M10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80" />
  </defs>
  <text font-size="20" fill="blue">
    <textPath id="myTextPath" href="#myPath">
      This text follows a path!
    </textPath>
  </text>
</svg>
```

```js
const textPath = document.getElementById("myTextPath");

// Truy cập thuộc tính href
console.log(textPath.href.baseVal); // Output: "#myPath"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("href")}}
