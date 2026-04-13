---
title: "SVGAnimatedNumber: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedNumber/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedNumber.baseVal
---

{{APIRef("SVG")}}

Thuộc tính **`baseVal`** của giao diện {{domxref("SVGAnimatedNumber")}} đại diện cho giá trị cơ sở (không hoạt hình) của một thuộc tính số có thể hoạt hình.

Một số thuộc tính SVG có thể hoạt hình chấp nhận một giá trị số đơn, chẳng hạn như thuộc tính {{SVGAttr("radius")}} của phần tử {{SVGElement("circle")}} hoặc {{SVGElement("ellipse")}}, các thuộc tính {{SVGAttr("width")}} và {{SVGAttr("height")}} của phần tử {{SVGElement("rect")}}, và nhiều thuộc tính khác. Thuộc tính `baseVal` phản ánh và cập nhật giá trị cơ sở, hoặc không hoạt hình, của thuộc tính số.

## Giá trị

Một `number`; giá trị cơ sở của thuộc tính dưới dạng số thực dấu phẩy động.

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

console.log(path.pathLength.baseVal); // đầu ra: 90
path.pathLength.baseVal = 50; // cập nhật giá trị
console.log(path.pathLength.baseVal); // đầu ra: 90
```

`baseVal` phản chiếu giá trị của thuộc tính `pathLength`. Chúng ta cũng sử dụng thuộc tính `baseVal` để truy cập giá trị cơ sở (không hoạt hình) của `pathLength` đang hoạt hình.

Để truy cập giá trị hiện tại của {{domxref("SVGGeometryElement.pathLength", "pathLength")}} khi nó hoạt hình, hãy sử dụng thuộc tính {{domxref("SVGAnimatedNumber.animVal")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedInteger")}}
- {{domxref("SVGElement")}}
