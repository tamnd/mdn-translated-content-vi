---
title: "SVGPatternElement: patternTransform property"
short-title: patternTransform
slug: Web/API/SVGPatternElement/patternTransform
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.patternTransform
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`patternTransform`** của giao diện {{domxref("SVGPatternElement")}} phản ánh thuộc tính {{SVGAttr("patternTransform")}} của phần tử {{SVGElement("pattern")}} đã cho. Thuộc tính này giữ phép biến đổi được áp dụng cho chính mẫu, cho phép các phép tính như `translate`, `rotate`, `scale` và `skew`.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedTransformList")}}.

## Ví dụ

Trong ví dụ này, mẫu được xoay 20 độ, nghiêng theo trục X 30 độ và thu phóng theo hệ số 1 theo chiều ngang và 0,5 theo chiều dọc:

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Apply a transform on the tile -->
  <pattern
    id="p1"
    width=".25"
    height=".25"
    patternTransform="rotate(20)
                      skewX(30)
                      scale(1 0.5)">
    <circle cx="10" cy="10" r="10" />
  </pattern>

  <!-- Apply the transformed pattern tile -->
  <rect x="10" y="10" width="80" height="80" fill="url(#p1)" />
</svg>
```

{{EmbedLiveSample("Examples", '100%', 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration")}}
- {{domxref("SVGUnitTypes")}}
