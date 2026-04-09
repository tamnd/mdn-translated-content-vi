---
title: baseFrequency
slug: Web/SVG/Reference/Attribute/baseFrequency
page-type: svg-attribute
browser-compat: svg.elements.feTurbulence.baseFrequency
sidebar: svgref
---

Thuộc tính **`baseFrequency`** đại diện cho tham số tần số cơ sở của hàm nhiễu cho primitive lọc {{SVGElement("feTurbulence")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feTurbulence")}}

## Ví dụ

### Ví dụ 1

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="noise1" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" />
  </filter>
  <filter id="noise2" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.05" />
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#noise1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#noise2)" />
</svg>
```

{{EmbedLiveSample("Example 1", "220", "220")}}

### Ví dụ 2

```html
<svg
  width="200"
  height="200"
  viewBox="0 0 220 220"
  xmlns="http://www.w3.org/2000/svg">
  <filter id="displacementFilter">
    <feTurbulence
      type="turbulence"
      baseFrequency="0.05"
      numOctaves="2"
      result="turbulence" />
    <feDisplacementMap
      in2="turbulence"
      in="SourceGraphic"
      scale="50"
      xChannelSelector="R"
      yChannelSelector="G" />
  </filter>

  <circle cx="100" cy="100" r="100" filter="url(#displacementFilter)" />
</svg>
```

{{EmbedLiveSample("Example 2", "220", "250")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
          >&#x3C;number-optional-number></a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number-optional-number>`
  - : Nếu cung cấp hai số, số thứ nhất đại diện cho tần số cơ sở theo hướng ngang và số thứ hai đại diện cho tần số cơ sở theo hướng dọc. Nếu chỉ cung cấp một số, giá trị đó sẽ được dùng cho cả trục x và y.

    Giá trị âm không được phép.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
