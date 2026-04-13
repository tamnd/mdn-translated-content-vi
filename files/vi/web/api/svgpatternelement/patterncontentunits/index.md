---
title: "SVGPatternElement: patternContentUnits property"
short-title: patternContentUnits
slug: Web/API/SVGPatternElement/patternContentUnits
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.patternContentUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`patternContentUnits`** của giao diện {{domxref("SVGPatternElement")}} phản ánh thuộc tính {{SVGAttr("patternContentUnits")}} của phần tử {{SVGElement("pattern")}} đã cho. Nó chỉ định hệ tọa độ cho nội dung mẫu và nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

Với SVG sau đây:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <pattern
      id="pattern1"
      width="10"
      height="10"
      patternContentUnits="userSpaceOnUse">
      <circle cx="5" cy="5" r="5" fill="blue" />
    </pattern>
    <pattern
      id="pattern2"
      width="10"
      height="10"
      patternContentUnits="objectBoundingBox">
      <circle cx="5" cy="5" r="5" fill="red" />
    </pattern>
  </defs>
  <rect x="0" y="0" width="100" height="100" fill="url(#pattern1)" />
  <rect x="100" y="0" width="100" height="100" fill="url(#pattern2)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `patternContentUnits`:

```js
const patterns = document.querySelectorAll("pattern");

console.log(patterns[0].patternContentUnits.baseVal); // output: 1 (SVGUnitTypes.USERSPACEONUSE)
console.log(patterns[1].patternContentUnits.baseVal); // output: 2 (SVGUnitTypes.OBJECTBOUNDINGBOX)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
- {{domxref("SVGUnitTypes")}}
