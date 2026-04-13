---
title: "SVGPatternElement: patternUnits property"
short-title: patternUnits
slug: Web/API/SVGPatternElement/patternUnits
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.patternUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`patternUnits`** của giao diện {{domxref("SVGPatternElement")}} phản ánh thuộc tính {{SVGAttr("patternUnits")}} của phần tử {{SVGElement("pattern")}} đã cho. Nó chỉ định hệ tọa độ cho nội dung mẫu và nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

Với SVG sau đây:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <pattern id="pattern1" width="10" height="10" patternUnits="userSpaceOnUse">
      <circle cx="5" cy="5" r="5" fill="blue" />
    </pattern>
    <pattern
      id="pattern2"
      width="10"
      height="10"
      patternUnits="objectBoundingBox">
      <circle cx="5" cy="5" r="5" fill="red" />
    </pattern>
  </defs>
  <rect x="0" y="0" width="100" height="100" fill="url(#pattern1)" />
  <rect x="100" y="0" width="100" height="100" fill="url(#pattern2)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `patternUnits`:

```js
const patterns = document.querySelectorAll("pattern");

console.log(patterns[0].patternUnits.baseVal); // output: 1 (SVGUnitTypes.USERSPACEONUSE)
console.log(patterns[1].patternUnits.baseVal); // output: 2 (SVGUnitTypes.OBJECTBOUNDINGBOX)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
- {{domxref("SVGUnitTypes")}}
