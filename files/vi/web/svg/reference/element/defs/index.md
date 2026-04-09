---
title: <defs>
slug: Web/SVG/Reference/Element/defs
page-type: svg-element
browser-compat: svg.elements.defs
sidebar: svgref
---

Phần tử **`<defs>`** của [SVG](/en-US/docs/Web/SVG) được dùng để lưu trữ các đối tượng đồ họa sẽ được sử dụng sau này. Các đối tượng được tạo bên trong phần tử `<defs>` sẽ không được hiển thị trực tiếp. Để hiển thị chúng, bạn phải tham chiếu tới chúng (ví dụ bằng phần tử {{SVGElement("use")}}).

Các đối tượng đồ họa có thể được tham chiếu từ bất cứ đâu, tuy nhiên, việc định nghĩa các đối tượng này bên trong phần tử `<defs>` giúp tăng tính dễ hiểu của nội dung SVG và có lợi cho khả năng truy cập tổng thể của tài liệu.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

Phần tử này chỉ bao gồm các thuộc tính toàn cục.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGDefsElement")}}.

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
  <!-- Một số đối tượng đồ họa để dùng -->
  <defs>
    <circle id="myCircle" cx="0" cy="0" r="5" />

    <linearGradient id="myGradient" gradientTransform="rotate(90)">
      <stop offset="20%" stop-color="gold" />
      <stop offset="90%" stop-color="red" />
    </linearGradient>
  </defs>

  <!-- sử dụng các đối tượng đồ họa của tôi -->
  <use x="5" y="5" href="#myCircle" fill="url('#myGradient')" />
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
