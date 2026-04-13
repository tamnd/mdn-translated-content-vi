---
title: "SVGSymbolElement: viewBox property"
short-title: viewBox
slug: Web/API/SVGSymbolElement/viewBox
page-type: web-api-instance-property
browser-compat: api.SVGSymbolElement.viewBox
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`viewBox`** của giao diện {{domxref("SVGSymbolElement")}} phản ánh thuộc tính {{SVGAttr("viewBox")}} của phần tử {{SVGElement("symbol")}} tương ứng.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedRect")}}.

## Ví dụ

### Truy cập thuộc tính `viewBox`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <symbol id="exampleSymbol" viewBox="0 0 100 100">
      <circle cx="50" cy="50" r="50" fill="blue" />
    </symbol>
  </defs>
  <use href="#exampleSymbol" x="50" y="50" width="100" height="100" />
</svg>
```

```js
const symbolElement = document.getElementById("exampleSymbol");

// Truy cập thuộc tính viewBox
const viewBox = symbolElement.viewBox.baseVal;

console.log(viewBox.x); // Kết quả: 0
console.log(viewBox.y); // Kết quả: 0
console.log(viewBox.width); // Kết quả: 100
console.log(viewBox.height); // Kết quả: 100
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("viewBox")}}
