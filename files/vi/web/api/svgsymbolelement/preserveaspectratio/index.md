---
title: "SVGSymbolElement: preserveAspectRatio property"
short-title: preserveAspectRatio
slug: Web/API/SVGSymbolElement/preserveAspectRatio
page-type: web-api-instance-property
browser-compat: api.SVGSymbolElement.preserveAspectRatio
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`preserveAspectRatio`** của giao diện {{domxref("SVGSymbolElement")}} phản ánh thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử {{SVGElement("symbol")}} tương ứng. Nó xác định cách nội dung của `symbol` nên được co giãn để phù hợp với không gian cho trước, đồng thời duy trì tỷ lệ khung hình.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedPreserveAspectRatio")}}.

## Ví dụ

Với SVG sau, chúng ta có thể sử dụng thuộc tính `preserveAspectRatio` để truy xuất hành vi co giãn cho phần tử `symbol`:

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <symbol
      id="exampleSymbol"
      viewBox="0 0 100 100"
      preserveAspectRatio="xMinYMin meet">
      <circle cx="50" cy="50" r="50" fill="blue" />
    </symbol>
  </defs>
  <use href="#exampleSymbol" x="50" y="50" width="100" height="100" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `preserveAspectRatio`:

```js
const symbolElement = document.getElementById("exampleSymbol");

// Truy cập thuộc tính preserveAspectRatio
const aspectRatio = symbolElement.preserveAspectRatio.baseVal;

console.log(aspectRatio.align); // Kết quả: 2 (xMinYMin)
console.log(aspectRatio.meetOrSlice); // Kết quả: 1 (meet)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("preserveAspectRatio")}}
