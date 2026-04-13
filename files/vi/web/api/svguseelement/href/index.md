---
title: "SVGUseElement: thuộc tính href"
short-title: href
slug: Web/API/SVGUseElement/href
page-type: web-api-instance-property
browser-compat: api.SVGUseElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGUseElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <circle id="circle1" cx="50" cy="50" r="40" fill="blue" />
    <circle id="circle2" cx="50" cy="50" r="40" fill="red" />
  </defs>
  <use href="#circle1" x="50" y="50" />
  <use href="#circle2" x="100" y="50" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `href` của các phần tử {{SVGElement("use")}}:

```js
const uses = document.querySelectorAll("use");
console.log(uses[0].href.baseVal); // output: "#circle1"
console.log(uses[1].href.baseVal); // output: "#circle2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
