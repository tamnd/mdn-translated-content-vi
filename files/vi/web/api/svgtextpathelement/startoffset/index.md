---
title: "SVGTextPathElement: startOffset property"
short-title: startOffset
slug: Web/API/SVGTextPathElement/startOffset
page-type: web-api-instance-property
browser-compat: api.SVGTextPathElement.startOffset
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`startOffset`** của giao diện {{domxref("SVGTextPathElement")}} phản ánh thành phần X của thuộc tính {{SVGAttr("startOffset")}} của phần tử {{SVGElement("textPath")}} đã cho, định nghĩa một offset từ đầu đường dẫn cho vị trí văn bản hiện tại ban đầu dọc theo đường dẫn sau khi chuyển đổi đường dẫn sang hệ tọa độ của phần tử `<textPath>`.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedLength")}}.

## Ví dụ

### Truy cập thuộc tính `startOffset`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <path id="myPath" d="M10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80" />
  </defs>
  <text font-size="20" fill="blue">
    <textPath id="myTextPath" href="#myPath" startOffset="25%">
      This text follows a path!
    </textPath>
  </text>
</svg>
```

```js
const textPath = document.getElementById("myTextPath");

// Truy cập thuộc tính startOffset
console.log(textPath.startOffset.baseVal.valueAsString); // Output: "25%"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("startOffset")}}
