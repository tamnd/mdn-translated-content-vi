---
title: "SVGMPathElement: thuộc tính href"
short-title: href
slug: Web/API/SVGMPathElement/href
page-type: web-api-instance-property
browser-compat: api.SVGMPathElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGMPathElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("mpath")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `href`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <path
    id="motionPath"
    d="M10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80"
    fill="transparent"
    stroke="black" />

  <circle id="circle" cx="0" cy="0" r="5" fill="blue">
    <animateMotion dur="4s" repeatCount="indefinite">
      <mpath href="#motionPath"></mpath>
    </animateMotion>
  </circle>
</svg>
```

```js
const mpathElement = document.querySelector("mpath");

// Access the href property
console.log(mpathElement.href.baseVal); // Output: "#motionPath"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
