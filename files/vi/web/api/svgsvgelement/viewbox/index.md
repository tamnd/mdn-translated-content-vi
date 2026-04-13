---
title: "SVGSVGElement: thuộc tính viewBox"
short-title: viewBox
slug: Web/API/SVGSVGElement/viewBox
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.viewBox
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`viewBox`** của giao diện {{domxref("SVGSVGElement")}} phản ánh thuộc tính {{SVGAttr("viewBox")}} của phần tử {{SVGElement("svg")}} dưới dạng {{domxref("SVGAnimatedRect")}}.

Thuộc tính này mô tả thuộc tính `viewBox` của phần tử `<svg>`, dùng để xác định tọa độ x, tọa độ y, chiều rộng và chiều cao của phần tử `<svg>`. Các thuộc tính {{domxref("SVGAnimatedRect.baseVal")}} và {{domxref("SVGAnimatedRect.animVal")}} đều là các đối tượng {{domxref("SVGRect")}}, hoặc `null` nếu `viewBox` không được xác định. Các thành phần của các đối tượng này có thể khác với các thuộc tính {{domxref("SVGSVGElement.x")}}, {{domxref("SVGSVGElement.y")}}, {{domxref("SVGSVGElement.width")}} và {{domxref("SVGSVGElement.height")}}, vì các thuộc tính {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}} và {{SVGAttr("height")}} có độ ưu tiên cao hơn thuộc tính `viewBox`.

Đối với các phần tử SVG không lồng nhau, các giá trị của thuộc tính CSS {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("width")}} và {{cssxref("height")}} có độ ưu tiên cao hơn bất kỳ thuộc tính phần tử nào, vì vậy các giá trị được xác định bởi `viewBox` có thể không được phản ánh trong giao diện của phần tử.

## Giá trị

Một {{domxref("SVGAnimatedRect")}}.

## Ví dụ

Cho thẻ mở SVG sau:

```html
<svg viewBox="-12 -18 200 300" x="5" y="5" height="400" width="600"></svg>
```

Chúng ta có thể lấy các giá trị `viewBox`, nhưng chúng khác với các thuộc tính {{domxref("SVGSVGElement.x", "x")}}, {{domxref("SVGSVGElement.y", "y")}}, {{domxref("SVGSVGElement.width", "width")}} và {{domxref("SVGSVGElement.height", "height")}}:

```js
const svg = document.querySelector("svg");
const vBox = svg.viewBox;

// Thuộc tính viewBox của SVGSVGElement
console.dir(vBox); // SVGAnimatedRect { baseVal: SVGRect, animVal: SVGRect }
console.log(vBox.baseVal.x); // -12
console.log(vBox.baseVal.y); // -18
console.log(vBox.baseVal.width); // 200
console.log(vBox.baseVal.height); // 300

// Các thuộc tính SVGSVGElement khác
console.log(svg.x); // 5
console.log(svg.y); // 5
console.log(svg.width); // 400
console.log(svg.height); // 600
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedRect.baseVal")}}
- {{domxref("SVGAnimatedRect.animVal")}}
- {{SVGAttr("preserveAspectRatio")}}
