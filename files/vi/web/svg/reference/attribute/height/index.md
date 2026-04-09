---
title: height
slug: Web/SVG/Reference/Attribute/height
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-filter-height
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-filter-primitive-height
  - https://drafts.csswg.org/css-masking-1/#element-attrdef-mask-height
  - https://svgwg.org/svg2-draft/geometry.html#Sizing
  - https://svgwg.org/svg2-draft/pservers.html#PatternElementHeightAttribute
sidebar: svgref
---

Thuộc tính **`height`** xác định chiều dài theo phương dọc của một phần tử trong hệ tọa độ người dùng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('feBlend')}}
- {{SVGElement('feColorMatrix')}}
- {{SVGElement('feComponentTransfer')}}
- {{SVGElement('feComposite')}}
- {{SVGElement('feConvolveMatrix')}}
- {{SVGElement('feDiffuseLighting')}}
- {{SVGElement('feDisplacementMap')}}
- {{SVGElement('feDropShadow')}}
- {{SVGElement('feFlood')}}
- {{SVGElement('feGaussianBlur')}}
- {{SVGElement('feImage')}}
- {{SVGElement('feMerge')}}
- {{SVGElement('feMorphology')}}
- {{SVGElement('feOffset')}}
- {{SVGElement('feSpecularLighting')}}
- {{SVGElement('feTile')}}
- {{SVGElement('feTurbulence')}}
- {{SVGElement('filter')}}
- {{SVGElement('foreignObject')}}
- {{SVGElement('image')}}
- {{SVGElement('mask')}}
- {{SVGElement('pattern')}}
- {{SVGElement('rect')}}
- {{SVGElement('svg')}}
- {{SVGElement('use')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg">
  <!-- With a height of 0 or less, nothing will be rendered -->
  <rect y="0" x="0" width="90" height="0" />
  <rect y="0" x="100" width="90" height="60" />
  <rect y="0" x="200" width="90" height="100%" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## feBlend

Với {{SVGElement('feBlend')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feOffset

Với {{SVGElement('feOffset')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feSpecularLighting

Với {{SVGElement('feSpecularLighting')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feTile

Với {{SVGElement('feTile')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feTurbulence

Với {{SVGElement('feTurbulence')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## filter

Với {{SVGElement('filter')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của bộ lọc.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>120%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## foreignObject

Với {{SVGElement('foreignObject')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của tài liệu được tham chiếu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code> (được coi là <code>0</code>)</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bắt đầu từ SVG2, `height` là một _Geometry Property_ nghĩa là thuộc tính này cũng có thể được dùng như một thuộc tính CSS cho `<foreignObject>`.

## image

Với {{SVGElement('image')}}, `height` xác định chiều dài theo phương dọc cho hình ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code> (được coi là chiều cao nội tại của hình ảnh)</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bắt đầu từ SVG2, `height` là một _Geometry Property_ nghĩa là thuộc tính này cũng có thể được dùng như một thuộc tính CSS cho hình ảnh.

## mask

Với {{SVGElement('mask')}}, `height` xác định chiều dài theo phương dọc của vùng tác động của nó. Tác động chính xác của thuộc tính này bị ảnh hưởng bởi thuộc tính {{SVGAttr('maskUnits')}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>120%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## pattern

Với {{SVGElement('pattern')}}, `height` xác định chiều dài theo phương dọc của mẫu ô lặp. Tác động chính xác của thuộc tính này bị ảnh hưởng bởi các thuộc tính {{SVGAttr('patternUnits')}} và {{SVGAttr('patternTransform')}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## rect

Với {{SVGElement('rect')}}, `height` xác định chiều dài theo phương dọc cho hình chữ nhật.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code> (được coi là <code>0</code>)</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bắt đầu từ SVG2, `height` là một _Geometry Property_ nghĩa là thuộc tính này cũng có thể được dùng như thuộc tính CSS cho hình chữ nhật.

## svg

Với {{SVGElement('svg')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của viewport SVG.

> [!NOTE]
> Trong tài liệu HTML nếu cả thuộc tính {{SVGAttr('viewBox')}} và `height` đều bị bỏ qua, [phần tử svg sẽ được hiển thị với chiều cao `150px`](https://svgwg.org/specs/integration/#svg-css-sizing)

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code> (được coi là <code>100%</code>)</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bắt đầu từ SVG2, `height` là một _Geometry Property_ nghĩa là thuộc tính này cũng có thể được dùng như thuộc tính CSS cho `<svg>`.

## use

Với {{SVGElement('use')}}, `height` xác định chiều dài theo phương dọc cho phần tử được tham chiếu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code> (được coi là <code>0</code>)</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> `height` không có tác dụng trên các phần tử `use`, trừ khi phần tử được tham chiếu có một [viewBox](/en-US/docs/Web/SVG/Reference/Attribute/viewBox) - tức là nó chỉ có tác dụng khi `use` tham chiếu tới phần tử `svg` hoặc `symbol`.

> [!NOTE]
> Bắt đầu từ SVG2, `height` là một _Geometry Property_ nghĩa là thuộc tính này cũng có thể được dùng như thuộc tính CSS cho các phần tử được dùng.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính CSS {{cssxref("height")}}

## feColorMatrix

Với {{SVGElement('feColorMatrix')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feComponentTransfer

Với {{SVGElement('feComponentTransfer')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feComposite

Với {{SVGElement('feComposite')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feConvolveMatrix

Với {{SVGElement('feConvolveMatrix')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feDiffuseLighting

Với {{SVGElement('feDiffuseLighting')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feDisplacementMap

Với {{SVGElement('feDisplacementMap')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feDropShadow

Với {{SVGElement('feDropShadow')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feFlood

Với {{SVGElement('feFlood')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feGaussianBlur

Với {{SVGElement('feGaussianBlur')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feImage

Với {{SVGElement('feImage')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feMerge

Với {{SVGElement('feMerge')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feMorphology

Với {{SVGElement('feMorphology')}}, `height` xác định chiều dài theo phương dọc cho vùng kết xuất của primitive.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>
