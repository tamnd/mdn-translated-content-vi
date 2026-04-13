---
title: "SVGFECompositeElement: operator property"
short-title: operator
slug: Web/API/SVGFECompositeElement/operator
page-type: web-api-instance-property
browser-compat: api.SVGFECompositeElement.operator
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`operator`** của giao diện {{domxref("SVGFECompositeElement")}} phản ánh thuộc tính {{SVGAttr("operator")}} của phần tử {{SVGElement("feComposite")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

Sử dụng các toán tử `out`, `in` và `over` trong phần tử {{SVGElement("feComposite")}}.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="filter1">
    <feImage
      href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      width="200"
      x="-70"
      y="10" />
    <feComposite in2="SourceGraphic" operator="out" />
  </filter>
  <filter id="filter2">
    <feImage
      href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      width="120"
      x="30"
      y="10" />
    <feComposite in2="SourceGraphic" operator="in" />
    <feComposite in2="SourceGraphic" operator="over" />
  </filter>
  <filter id="filter3">
    <feImage
      href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      width="140"
      x="80"
      y="10" />
    <feComposite
      in2="SourceGraphic"
      operator="arithmetic"
      k1="0.1"
      k2="0.2"
      k3="0.3"
      k4="0.4" />
  </filter>
  <circle cx="30" cy="50" r="30" filter="url(#filter1)" />
  <circle cx="90" cy="50" r="30" filter="url(#filter2)" />
  <circle cx="150" cy="50" r="30" filter="url(#filter3)" />
</svg>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
