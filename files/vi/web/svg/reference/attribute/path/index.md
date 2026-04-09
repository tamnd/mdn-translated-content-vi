---
title: path
slug: Web/SVG/Reference/Attribute/path
page-type: svg-attribute
spec-urls:
  - https://svgwg.org/svg2-draft/text.html#TextPathElementPathAttribute
  - https://svgwg.org/specs/animations/#AnimateMotionElementPathAttribute
sidebar: svgref
---

Thuộc tính **`path`** có hai ý nghĩa khác nhau: nó либо xác định một text path mà các ký tự của văn bản được hiển thị theo đó, hoặc một motion path mà một phần tử được tham chiếu chuyển động theo đó sẽ được animate.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animateMotion")}}
- {{SVGElement("textPath")}}

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
  <path
    id="MyPath"
    fill="none"
    stroke="silver"
    d="M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,40 Q10,70 45,70 Q70,70 75,50" />

  <text>
    <textPath
      path="M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,40 Q10,70 45,70 Q70,70 75,50">
      Quick brown fox jumps over the lazy dog.
    </textPath>
  </text>
</svg>
```

{{EmbedLiveSample("Example", "420", "220")}}

## animateMotion

Đối với {{SVGElement("animateMotion")}}, `path` xác định motion path, được biểu diễn theo cùng định dạng và được diễn giải theo cùng cách như thuộc tính hình học {{SVGAttr("d")}} cho phần tử {{SVGElement("path")}}. Tác động của hoạt ảnh motion path là một phép tịnh tiến dọc theo trục x và y của hệ tọa độ người dùng hiện tại bởi các giá trị x và y được tính theo thời gian.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;path-data></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<path-data>`
  - : Giá trị này xác định motion path mà phần tử được tham chiếu sẽ được animate theo đó. Để biết thông tin chi tiết về các lệnh có thể dùng, xem [phần giải thích cho thuộc tính `d`](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).

## textPath

Đối với {{SVGElement("textPath")}}, `path` xác định đường dẫn mà các {{Glossary("glyph", "glyph")}} của phần tử {{SVGElement("text")}} sẽ được hiển thị theo đó. Một chuỗi rỗng cho biết không có dữ liệu đường dẫn cho phần tử. Điều này có nghĩa là văn bản bên trong phần tử `<textPath>` sẽ không được hiển thị và không đóng góp vào bounding box của phần tử `<text>`. Nếu thuộc tính không được chỉ định, đường dẫn được chỉ định trong {{SVGAttr("href")}} sẽ được dùng thay thế.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;path-data></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Đường dẫn được chỉ định trong {{SVGAttr("href")}}</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<path-data>`
  - : Giá trị này xác định text path mà các glyph của phần tử `<text>` được căn theo. Để biết thông tin chi tiết về các lệnh có thể dùng, xem [phần giải thích cho thuộc tính `d`](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).

## Thông số kỹ thuật

{{Specifications}}
