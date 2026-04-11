---
title: "SVGFECompositeElement: in2 property"
short-title: in2
slug: Web/API/SVGFECompositeElement/in2
page-type: web-api-instance-property
browser-compat: api.SVGFECompositeElement.in2
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in2`** của giao diện {{domxref("SVGFECompositeElement")}} phản ánh thuộc tính {{SVGAttr("in2")}} của phần tử {{SVGElement("feComposite")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feComposite")}} được định nghĩa trong một bộ lọc, mỗi phần tử có thuộc tính `in2` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="filter1">
    <feImage
      href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      width="200" />
    <feComposite in2="SourceAlpha" operator="over" />
    <feComposite in2="SourceAlpha" operator="in" />
  </filter>
  <circle cx="50" cy="50" r="30" filter="url(#filter1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in2`:

```js
const composites = document.querySelectorAll("feComposite");

console.log(composites[0].in2.baseVal); // output: "SourceAlpha"
console.log(composites[1].in2.baseVal); // output: "SourceAlpha"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
