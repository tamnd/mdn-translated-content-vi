---
title: media
slug: Web/SVG/Reference/Attribute/media
page-type: svg-attribute
browser-compat: svg.elements.style.media
sidebar: svgref
---

Thuộc tính **`media`** chỉ định một [media query](/en-US/docs/Web/CSS/Guides/Media_queries) phải khớp thì style sheet mới được áp dụng.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("style")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
  <style>
    rect {
      fill: black;
    }
  </style>
  <style media="(width >= 600px)">
    rect {
      fill: seagreen;
    }
  </style>

  <text y="15">Resize the window to see the effect</text>
  <rect y="20" width="200" height="200" />
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/CSS/Reference/At-rules/@media#syntax"
            >&#x3C;media-query-list></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>all</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<media-query-list>`
  - : Giá trị này chứa một media query cần phải khớp để style sheet được áp dụng.

    Nếu không được chỉ định, style sheet sẽ được áp dụng vô điều kiện.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
