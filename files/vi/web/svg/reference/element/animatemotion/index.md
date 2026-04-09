---
title: <animateMotion>
slug: Web/SVG/Reference/Element/animateMotion
page-type: svg-element
browser-compat: svg.elements.animateMotion
sidebar: svgref
---

Phần tử **`<animateMotion>`** của [SVG](/en-US/docs/Web/SVG) cung cấp một cách để định nghĩa cách một phần tử di chuyển dọc theo một motion path.

> [!NOTE]
> Để tái sử dụng một đường dẫn hiện có, cần dùng phần tử {{SVGElement("mpath")}} bên trong phần tử `<animateMotion>` thay vì thuộc tính {{SVGAttr("path")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("keyPoints")}}
  - : Thuộc tính này cho biết, trong phạm vi \[0,1], đối tượng đi xa đến đâu dọc theo đường dẫn cho từng giá trị liên quan của {{SVGAttr("keyTimes")}}.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number)\*; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("path")}}
  - : Thuộc tính này định nghĩa đường dẫn của chuyển động, dùng cùng cú pháp với thuộc tính {{SVGAttr('d')}}.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("rotate")}}
  - : Thuộc tính này định nghĩa một phép xoay được áp dụng cho phần tử đang được hoạt ảnh hóa dọc theo một đường dẫn, thường để nó hướng theo chiều của hoạt ảnh.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number) | `auto` | `auto-reverse`; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **không**

> [!NOTE]
> Đối với `<animateMotion>`, giá trị mặc định của thuộc tính {{SVGAttr("calcMode")}} là `paced`.

### Thuộc tính hoạt ảnh

- [Thuộc tính thời gian hoạt ảnh](/en-US/docs/Web/SVG/Reference/Attribute#animation_timing_attributes)
  - : {{SVGAttr("begin")}}, {{SVGAttr("dur")}}, {{SVGAttr("end")}}, {{SVGAttr("min")}}, {{SVGAttr("max")}}, {{SVGAttr("restart")}}, {{SVGAttr("repeatCount")}}, {{SVGAttr("repeatDur")}}, {{SVGAttr("fill")}}
- [Thuộc tính giá trị hoạt ảnh](/en-US/docs/Web/SVG/Reference/Attribute#animation_value_attributes)
  - : {{SVGAttr("calcMode")}}, {{SVGAttr("values")}}, {{SVGAttr("keyTimes")}}, {{SVGAttr("keySplines")}}, {{SVGAttr("from")}}, {{SVGAttr("to")}}, {{SVGAttr("by")}}
- [Các thuộc tính hoạt ảnh khác](/en-US/docs/Web/SVG/Reference/Attribute#animation_attributes)
  - : Đáng chú ý nhất: {{SVGAttr("attributeName")}}, {{SVGAttr("additive")}}, {{SVGAttr("accumulate")}}
- [Thuộc tính sự kiện hoạt ảnh](/en-US/docs/Web/SVG/Reference/Attribute#event_attributes)
  - : Đáng chú ý nhất: `onbegin`, `onend`, `onrepeat`

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGAnimateMotionElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
  margin: 0;
  padding: 0;
  display: block;
}
```

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <path
    fill="none"
    stroke="lightgrey"
    d="M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z" />

  <circle r="5" fill="red">
    <animateMotion
      dur="10s"
      repeatCount="indefinite"
      path="M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z" />
  </circle>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("mpath")}}
