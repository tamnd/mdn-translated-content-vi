---
title: filter
slug: Web/SVG/Reference/Attribute/filter
page-type: svg-attribute
browser-compat: svg.global_attributes.filter
sidebar: svgref
---

Thuộc tính **`filter`** chỉ định các hiệu ứng bộ lọc được định nghĩa bởi phần tử {{SVGElement("filter")}} sẽ được áp dụng cho phần tử của nó.

> [!NOTE]
> Là một thuộc tính trình bày, `filter` cũng có một thuộc tính CSS tương ứng: {{cssxref("filter")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Về mặt kỹ thuật, `filter` có thể được áp dụng cho bất kỳ phần tử nào, nhưng nó chỉ có tác dụng trên [các phần tử container](/en-US/docs/Web/SVG/Reference/Element#container_elements) không phải phần tử {{SVGElement("defs")}}, tất cả [các phần tử đồ họa](/en-US/docs/Web/SVG/Reference/Element#graphics_elements), và phần tử {{SVGElement("use")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <filter id="blur">
    <feGaussianBlur stdDeviation="2" />
  </filter>

  <rect x="10" y="10" width="80" height="80" filter="url(#blur)" />
</svg>
```

{{EmbedLiveSample("Example", "220", "220")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>none</code>
        <a
          href="/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax#single_bar"
          title="Single bar: exactly one of the entities must be present"
          >|</a
        >
        <code>&#x3C;filter-value-list></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, xem thuộc tính CSS {{cssxref("filter")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("filter")}}
- Thuộc tính CSS {{cssxref("filter")}}
