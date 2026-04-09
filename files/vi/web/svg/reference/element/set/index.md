---
title: <set>
slug: Web/SVG/Reference/Element/set
page-type: svg-element
browser-compat: svg.elements.set
sidebar: svgref
---

**`<set>`** [SVG](/en-US/docs/Web/SVG) cung cấp một cách đặt giá trị của một thuộc tính trong một khoảng thời gian xác định.

Nó hỗ trợ mọi kiểu thuộc tính, kể cả những kiểu không thể nội suy hợp lý, như các giá trị chuỗi và boolean. Với các thuộc tính có thể nội suy hợp lý, {{SVGElement('animate')}} thường được ưu tiên hơn.

> [!NOTE]
> Phần tử `<set>` không có tính cộng thêm. Các thuộc tính {{SVGAttr('additive')}} và {{SVGAttr('accumulate')}} không được phép và sẽ bị bỏ qua nếu được chỉ định.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("to")}}
  - : Thuộc tính này xác định giá trị sẽ được áp dụng cho thuộc tính đích trong suốt thời lượng của hoạt ảnh. Giá trị phải khớp với các yêu cầu của thuộc tính đích.
    _Kiểu giá trị_: [**\<anything>**](/en-US/docs/Web/SVG/Guides/Content_type#anything); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **không**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGSetElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <style>
    rect {
      cursor: pointer;
    }
    .round {
      rx: 5px;
      fill: green;
    }
  </style>

  <rect id="me" width="10" height="10">
    <set attributeName="class" to="round" begin="me.click" dur="2s" />
  </rect>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- thuộc tính {{SVGAttr("attributeName")}}
- [Thuộc tính thời gian hoạt ảnh](/en-US/docs/Web/SVG/Reference/Attribute#animation_timing_attributes), bao gồm {{SVGAttr("begin")}}, {{SVGAttr("dur")}}, {{SVGAttr("end")}}, {{SVGAttr("min")}}, {{SVGAttr("max")}}, {{SVGAttr("restart")}}, {{SVGAttr("repeatCount")}}, {{SVGAttr("repeatDur")}} và {{SVGAttr("fill")}}.
- {{SVGElement("animate")}}
