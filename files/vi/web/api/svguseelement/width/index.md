---
title: "SVGUseElement: thuộc tính width"
short-title: width
slug: Web/API/SVGUseElement/width
page-type: web-api-instance-property
browser-compat: api.SVGUseElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGUseElement")}} mô tả chiều rộng của phần tử được tham chiếu dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị đã tính toán của thuộc tính {{SVGAttr("width")}} trên phần tử {{SVGElement("use")}}.

Giá trị thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là chiều rộng của phần tử được tham chiếu trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <circle id="circle1" cx="50" cy="50" r="40" fill="blue" />
    <circle id="circle2" cx="50" cy="50" r="40" fill="red" />
  </defs>
  <use x="50%" y="50%" href="#circle1" width="50" />
  <use x="25%" y="50%" href="#circle2" width="100" />
</svg>
```

Chúng ta có thể truy cập các giá trị đã tính toán của thuộc tính `width`:

```js
const uses = document.querySelectorAll("use");
const widthUse1 = uses[0].width;
const widthUse2 = uses[1].width;

console.log(widthUse1.baseVal.value); // output: 50
console.log(widthUse2.baseVal.value); // output: 100
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGUseElement.height")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
