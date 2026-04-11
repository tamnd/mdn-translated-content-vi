---
title: "SVGFECompositeElement: k2 property"
short-title: k2
slug: Web/API/SVGFECompositeElement/k2
page-type: web-api-instance-property
browser-compat: api.SVGFECompositeElement.k2
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`k2`** của giao diện {{domxref("SVGFECompositeElement")}} phản ánh thuộc tính {{SVGAttr("k2")}} của phần tử {{SVGElement("feComposite")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feComposite")}} được định nghĩa trong một bộ lọc, mỗi phần tử có thuộc tính `k2` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="filter1">
    <feImage
      href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      width="140"
      x="30"
      y="10" />
    <feComposite
      in2="SourceGraphic"
      operator="arithmetic"
      k1="0.1"
      k2="0.2"
      k3="0.3"
      k4="0.4" />
  </filter>
  <circle cx="100" cy="50" r="30" filter="url(#filter1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `k2`:

```js
const composites = document.querySelectorAll("feComposite");

console.log(composites[0].k2.baseVal); // output: 0.2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
