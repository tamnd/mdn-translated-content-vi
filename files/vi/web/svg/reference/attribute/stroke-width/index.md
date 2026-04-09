---
title: stroke-width
slug: Web/SVG/Reference/Attribute/stroke-width
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-width
sidebar: svgref
---

Thuộc tính **`stroke-width`** là một thuộc tính trình bày xác định độ rộng của stroke được áp dụng cho hình dạng. Nó áp dụng cho bất kỳ hình SVG hoặc phần tử nội dung văn bản nào, nhưng với vai trò là một thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn tạo hiệu ứng mong muốn lên stroke của các phần tử con.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-width` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-width")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('circle')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('line')}}
- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 30 10" xmlns="http://www.w3.org/2000/svg">
  <!-- Độ rộng stroke mặc định: 1 -->
  <circle cx="5" cy="5" r="3" stroke="green" />

  <!-- Độ rộng stroke dưới dạng số -->
  <circle cx="15" cy="5" r="3" stroke="green" stroke-width="3" />

  <!-- Độ rộng stroke dưới dạng phần trăm -->
  <circle cx="25" cy="5" r="3" stroke="green" stroke-width="2%" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 150)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        > |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>1px</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Một giá trị phần trăm luôn được tính như phần trăm của độ dài đường chéo đã chuẩn hóa của {{SVGAttr('viewBox')}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-width")}}
