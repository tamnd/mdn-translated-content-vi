---
title: <clipPath>
slug: Web/SVG/Reference/Element/clipPath
page-type: svg-element
browser-compat: svg.elements.clipPath
sidebar: svgref
---

Phần tử **`<clipPath>`** của [SVG](/en-US/docs/Web/SVG) định nghĩa một clipping path, để dùng bởi thuộc tính {{SVGAttr("clip-path")}}.

Một clipping path giới hạn vùng mà paint có thể được áp dụng. Về mặt khái niệm, các phần của bản vẽ nằm ngoài vùng được bao quanh bởi clipping path sẽ không được vẽ.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("clipPathUnits")}}
  - : Xác định hệ tọa độ cho nội dung của phần tử `<clipPath>`.
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `userSpaceOnUse`; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGClipPathElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100">
  <clipPath id="myClip">
    <!--
      Mọi thứ nằm ngoài hình tròn sẽ bị
      cắt và do đó không nhìn thấy.
    -->
    <circle cx="40" cy="35" r="35" />
  </clipPath>

  <!-- Trái tim đen ban đầu, để tham chiếu -->
  <path
    id="heart"
    d="M10,30 A20,20,0,0,1,50,30 A20,20,0,0,1,90,30 Q90,60,50,90 Q10,60,10,30 Z" />

  <!--
    Chỉ phần của trái tim đỏ
    nằm trong hình tròn cắt mới hiển thị.
  -->
  <use clip-path="url(#myClip)" href="#heart" fill="red" />
</svg>
```

```css
/* Với một chút CSS cho các trình duyệt *
 * đã triển khai Geometry Property r. */

@keyframes openYourHeart {
  from {
    r: 0;
  }
  to {
    r: 60px;
  }
}

#myClip circle {
  animation: openYourHeart 15s infinite;
}
```

{{EmbedLiveSample('Example', 100, 100)}}

Một clipping path về mặt khái niệm tương đương với một viewport tùy chỉnh cho phần tử đang tham chiếu. Vì vậy, nó ảnh hưởng đến _việc hiển thị_ của một phần tử, nhưng không ảnh hưởng đến _hình học vốn có_ của phần tử đó. Hộp bao của một phần tử bị cắt (nghĩa là một phần tử tham chiếu đến phần tử `<clipPath>` thông qua thuộc tính {{SVGAttr("clip-path")}}, hoặc một phần tử con của phần tử tham chiếu) phải giữ nguyên như khi nó không bị cắt.

Theo mặc định, {{cssxref("pointer-events")}} không được phát trên các vùng bị cắt. Ví dụ, một hình tròn có bán kính `10` nhưng bị cắt bởi một hình tròn có bán kính `5` sẽ không nhận sự kiện "click" ở ngoài bán kính nhỏ hơn.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("mask")}}
- Thuộc tính CSS {{cssxref("clip-path")}}
- [Giới thiệu về CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
- Mô-đun [CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
