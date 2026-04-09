---
title: <polygon>
slug: Web/SVG/Reference/Element/polygon
page-type: svg-element
browser-compat: svg.elements.polygon
sidebar: svgref
---

Phần tử **`<polygon>`** của [SVG](/en-US/docs/Web/SVG) định nghĩa một hình khép kín gồm một tập hợp các đoạn thẳng được nối với nhau. Điểm cuối cùng được nối với điểm đầu tiên.

Với các hình mở, xem phần tử {{SVGElement("polyline")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr('points')}}
  - : Thuộc tính này định nghĩa danh sách các điểm (các cặp tọa độ tuyệt đối `x,y`) cần thiết để vẽ polygon.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number)+; _Giá trị mặc định_: `""`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("pathLength")}}
  - : Thuộc tính này cho phép chỉ định tổng chiều dài của path, tính theo đơn vị người dùng.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGPolygonElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Ví dụ về một polygon với fill mặc định -->
  <polygon points="0,100 50,25 50,75 100,0" />

  <!-- Ví dụ về cùng hình polygon nhưng có stroke và không fill -->
  <polygon points="100,100 150,25 150,75 200,0" fill="none" stroke="black" />
</svg>
```

{{EmbedLiveSample('Example', 100, 100)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính trình bày SVG](/en-US/docs/Web/SVG/Reference/Attribute#presentation_attributes) bao gồm {{SVGAttr("fill")}} và {{SVGAttr("stroke")}}

- **Các hình cơ bản SVG khác:**
  - {{ SVGElement('circle') }}
  - {{ SVGElement('ellipse') }}
  - {{ SVGElement('line') }}
  - {{ SVGElement('polyline') }}
  - {{ SVGElement('rect') }}
