---
title: fill
slug: Web/SVG/Reference/Attribute/fill
page-type: svg-attribute
browser-compat:
  - svg.elements.animate.fill
  - svg.elements.animateMotion.fill
  - svg.elements.animateTransform.fill
  - svg.elements.circle.fill
  - svg.elements.ellipse.fill
  - svg.elements.path.fill
  - svg.elements.polygon.fill
  - svg.elements.polyline.fill
  - svg.elements.rect.fill
  - svg.elements.set.fill
  - svg.elements.text.fill
  - svg.elements.textPath.fill
  - svg.elements.tspan.fill
sidebar: svgref
---

Thuộc tính **`fill`** có hai nghĩa khác nhau. Với hình dạng và văn bản, đây là một thuộc tính trình bày định nghĩa màu (_hoặc bất kỳ paint server SVG nào như gradient hoặc pattern_) được dùng để tô phần tử; với hoạt ảnh, nó định nghĩa trạng thái cuối cùng của hoạt ảnh.

> [!NOTE]
> Khi được dùng như một thuộc tính trình bày, `fill` cũng có một thuộc tính CSS tương ứng: {{cssxref("fill")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Thuộc tính trình bày `fill` của SVG và thuộc tính CSS {{cssxref("fill")}} có thể được dùng với các phần tử SVG sau:

- {{SVGElement('circle')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}

Thuộc tính SVG `fill` có thể được dùng để định nghĩa trạng thái cuối cùng của hoạt ảnh với các phần tử SVG sau:

- {{SVGElement('animate')}}
- {{SVGElement('animateMotion')}}
- {{SVGElement('animateTransform')}}
- {{SVGElement('set')}}.

## Ví dụ

### Tô màu cơ bản, tô bằng gradient và hoạt ảnh

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Basic color fill -->
  <circle cx="50" cy="50" r="40" fill="pink" />

  <!-- Fill circle with a gradient -->
  <defs>
    <radialGradient id="myGradient">
      <stop offset="0%" stop-color="pink" />
      <stop offset="100%" stop-color="black" />
    </radialGradient>
  </defs>

  <circle cx="150" cy="50" r="40" fill="url(#myGradient)" />

  <!--
  Keeping the final state of an animated circle
  which is a circle with a radius of 40.
  -->
  <circle cx="250" cy="50" r="20">
    <animate
      attributeType="XML"
      attributeName="r"
      from="0"
      to="40"
      dur="5s"
      fill="freeze" />
  </circle>
</svg>
```

{{EmbedLiveSample("Basic color and gradient fills, and animation", '100%', 200)}}

### Ví dụ `context-fill`

Trong ví dụ này, chúng ta định nghĩa ba hình dạng bằng các phần tử {{SVGElement('path')}}, mỗi hình có giá trị [`stroke`](/en-US/docs/Web/SVG/Reference/Attribute/stroke) và `fill` khác nhau. Chúng ta cũng định nghĩa một phần tử {{SVGElement('circle')}} làm marker thông qua phần tử {{SVGElement('marker')}}. Mỗi hình dạng đều có marker được áp dụng thông qua thuộc tính CSS `marker`.

Phần tử {{SVGElement('circle')}} có `stroke="context-stroke"` và `fill="context-fill"` được đặt trên nó. Vì nó được đặt làm marker trong ngữ cảnh của các hình dạng, các thuộc tính này khiến nó kế thừa `fill` và `stroke` đã đặt trên phần tử {{SVGElement('path')}} trong từng trường hợp.

```html-nolint
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 90">
  <style>
    path {
      stroke-width: 2px;
      marker: url("#circle");
    }
  </style>
  <path d="M 10 44.64 L 30 10 L 70 10 L 90 44.64 L 70 79.28 L 30 79.28 Z"
        stroke="red" fill="orange" />
  <path d="M 100 44.64 L 80 10 L 120 10 L 140 44.64 L 120 79.28 L 80 79.28 Z"
        stroke="green" fill="lightgreen" />
  <path d="M 150 44.64 L 130 10 L 170 10 L 190 44.64 L 170 79.28 L 130 79.28 Z"
        stroke="blue" fill="lightblue" />
  <marker id="circle" markerWidth="12" markerHeight="12"
          refX="6" refY="6" markerUnits="userSpaceOnUse">
    <circle cx="6" cy="6" r="3" stroke-width="2"
            stroke="context-stroke" fill="context-fill"  />
  </marker>
</svg>
```

Kết quả như sau:

{{EmbedLiveSample("`context-stroke` example", '100%', 220)}}

> [!NOTE]
> Các phần tử cũng có thể dùng `context-stroke` và `context-fill` để kế thừa các giá trị `stroke` và `fill` khi chúng được tham chiếu bởi các phần tử {{SVGElement('use')}}.

## animate

Với {{SVGElement('animate')}}, `fill` định nghĩa trạng thái cuối cùng của hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>freeze</code> (<em>Giữ trạng thái của khung hoạt ảnh cuối cùng</em
        >) | <code>remove</code> (<em
          >Giữ trạng thái của khung hoạt ảnh đầu tiên</em
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## animateMotion

Với {{SVGElement('animateMotion')}}, `fill` định nghĩa trạng thái cuối cùng của hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>freeze</code> (<em>Giữ trạng thái của khung hoạt ảnh cuối cùng</em
        >) | <code>remove</code> (<em
          >Giữ trạng thái của khung hoạt ảnh đầu tiên</em
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## animateTransform

Với {{SVGElement('animateTransform')}}, `fill` định nghĩa trạng thái cuối cùng của hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>freeze</code> (<em>Giữ trạng thái của khung hoạt ảnh cuối cùng</em
        >) | <code>remove</code> (<em
          >Giữ trạng thái của khung hoạt ảnh đầu tiên</em
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## circle

Với {{SVGElement('circle')}}, `fill` là một thuộc tính trình bày định nghĩa màu của hình tròn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## ellipse

Với {{SVGElement('ellipse')}}, `fill` là một thuộc tính trình bày định nghĩa màu của hình ellipse.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## path

Với {{SVGElement('path')}}, `fill` là một thuộc tính trình bày định nghĩa màu của phần bên trong hình dạng. (_Phần bên trong được định nghĩa bởi thuộc tính {{SVGAttr('fill-rule')}} hoặc thuộc tính CSS {{cssxref("fill-rule")}}._)

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## polygon

Với {{SVGElement('polygon')}}, `fill` là một thuộc tính trình bày định nghĩa màu của phần bên trong hình dạng. (_Phần bên trong được định nghĩa bởi thuộc tính {{SVGAttr('fill-rule')}} hoặc thuộc tính CSS {{cssxref("fill-rule")}}._)

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## polyline

Với {{SVGElement('polyline')}}, `fill` là một thuộc tính trình bày định nghĩa màu của phần bên trong hình dạng. (_Phần bên trong được định nghĩa bởi thuộc tính {{SVGAttr('fill-rule')}} hoặc thuộc tính CSS {{cssxref("fill-rule")}}._)

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## rect

Với {{SVGElement('rect')}}, `fill` là một thuộc tính trình bày định nghĩa màu của hình chữ nhật.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## set

Với {{SVGElement('set')}}, `fill` định nghĩa trạng thái cuối cùng của hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>freeze</code> (<em>Giữ trạng thái của khung hoạt ảnh cuối cùng</em
        >) | <code>remove</code> (<em
          >Giữ trạng thái của khung hoạt ảnh đầu tiên</em
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## text

Với {{SVGElement('text')}}, `fill` là một thuộc tính trình bày định nghĩa màu của văn bản.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## textPath

Với {{SVGElement('textPath')}}, `fill` là một thuộc tính trình bày định nghĩa màu của văn bản.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## tspan

Với {{SVGElement('tspan')}}, `fill` là một thuộc tính trình bày định nghĩa màu của văn bản.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint">&#x3C;paint></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("fill")}}
