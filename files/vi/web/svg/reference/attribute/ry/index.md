---
title: ry
slug: Web/SVG/Reference/Attribute/ry
page-type: svg-attribute
spec-urls: https://svgwg.org/svg2-draft/geometry.html#RY
sidebar: svgref
---

Thuộc tính **`ry`** xác định bán kính trên trục y.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("ellipse")}}
- {{SVGElement("rect")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 300 200" xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="50" cy="50" ry="0" rx="25" />
  <ellipse cx="150" cy="50" ry="25" rx="25" />
  <ellipse cx="250" cy="50" ry="50" rx="25" />

  <rect x="20" y="120" width="60" height="60" ry="0" rx="15" />
  <rect x="120" y="120" width="60" height="60" ry="15" rx="15" />
  <rect x="220" y="120" width="60" height="60" ry="150" rx="15" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## ellipse

Với {{SVGElement('ellipse')}}, `ry` xác định bán kính theo trục y của hình. Với giá trị nhỏ hơn hoặc bằng 0, ellipse sẽ không được vẽ.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
        | <code>auto</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bán kính theo trục y của `<ellipse>` cũng có thể được xác định bằng thuộc tính hình học {{cssxref("ry")}}. Nếu được đặt trong CSS, giá trị thuộc tính `ry` sẽ ghi đè giá trị thuộc tính `ry`.

## rect

Với {{SVGElement('rect')}}, `ry` xác định bán kính theo trục y của ellipse được dùng để bo tròn các góc của hình chữ nhật.

Cách giá trị của thuộc tính `ry` được diễn giải phụ thuộc vào cả thuộc tính {{SVGAttr("rx")}} và chiều rộng của hình chữ nhật:

- Nếu có giá trị được chỉ định đúng cho `ry` nhưng không cho {{SVGAttr("rx")}} (hoặc ngược lại), thì trình duyệt sẽ coi giá trị bị thiếu bằng với giá trị đã được xác định.
- Nếu cả `ry` lẫn {{SVGAttr("rx")}} đều không có giá trị được chỉ định đúng, thì trình duyệt sẽ vẽ một hình chữ nhật có các góc vuông.
- Nếu `ry` lớn hơn một nửa chiều rộng của hình chữ nhật, thì trình duyệt sẽ coi giá trị của `ry` bằng một nửa chiều rộng của hình chữ nhật.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
        | <code>auto</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Độ cong dọc ở các góc của `<rect>` cũng có thể được xác định bằng thuộc tính hình học {{cssxref("ry")}}. Nếu được đặt trong CSS, giá trị thuộc tính `ry` sẽ ghi đè giá trị thuộc tính `ry`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính CSS {{cssxref("ry")}}
