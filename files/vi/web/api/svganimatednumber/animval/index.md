---
title: "SVGAnimatedNumber: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedNumber/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedNumber.animVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animVal`** của giao diện {{domxref("SVGAnimatedNumber")}} đại diện cho giá trị hoạt hình của thuộc tính số của phần tử SVG.

Một số thuộc tính SVG có thể hoạt hình chấp nhận một số đơn, chẳng hạn như thuộc tính {{SVGAttr("radius")}} của phần tử {{SVGElement("circle")}} hoặc {{SVGElement("ellipse")}}, các thuộc tính {{SVGAttr("width")}} và {{SVGAttr("height")}} của phần tử {{SVGElement("rect")}}, và nhiều thuộc tính khác. Thuộc tính `animVal` cung cấp quyền truy cập vào giá trị hoạt hình hiện tại của thuộc tính số có thể hoạt hình trong quá trình hoạt hình.

## Giá trị

Một `number`; giá trị hiện tại của thuộc tính hoạt hình dưới dạng số thực dấu phẩy động.

## Ví dụ

Ví dụ này bao gồm một phần tử {{SVGElement("path")}} với một phần tử {{SVGElement("animate")}} lồng nhau hoạt hình giá trị của thuộc tính {{SVGAttr("pathLength")}} của đường dẫn:

```html
<path d="M 0,40 h100" pathLength="90" id="path">
  <animate
    attributeName="pathLength"
    values="50; 90; 50;"
    dur="10s"
    repeatCount="indefinite" />
</path>
```

```js
const path = document.querySelector("path");

console.log(path.pathLength.animVal); // đầu ra: 50
console.log(path.pathLength.baseVal); // đầu ra: 90
```

Chúng ta sử dụng thuộc tính `animVal` để truy cập giá trị hiện tại của `pathLength` đang hoạt hình, trong khi {{domxref("SVGAnimatedNumber.baseVal")}} phản ánh giá trị cơ sở (không hoạt hình) của {{domxref("SVGGeometryElement.pathLength", "pathLength")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedInteger")}}
- {{domxref("SVGElement")}}
