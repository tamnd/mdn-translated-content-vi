---
title: xlink:href
slug: Web/SVG/Reference/Attribute/xlink:href
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.elements.a.xlink_href
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`xlink:href`** xác định một tham chiếu tới tài nguyên dưới dạng một tham chiếu [IRI](/en-US/docs/Web/SVG/Guides/Content_type#iri). Ý nghĩa chính xác của liên kết đó phụ thuộc vào ngữ cảnh của từng phần tử đang dùng nó.

> [!NOTE]
> SVG 2 đã loại bỏ nhu cầu về không gian tên `xlink`, vì vậy thay vì `xlink:href` bạn nên dùng {{SVGAttr("href")}}. Nếu bạn cần hỗ trợ các phiên bản trình duyệt cũ hơn, thuộc tính `xlink:href` đã lỗi thời có thể được dùng làm phương án dự phòng cùng với thuộc tính `href`, ví dụ: `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("feImage")}}
- {{SVGElement("filter")}}
- {{SVGElement("image")}}
- {{SVGElement("linearGradient")}}
- {{SVGElement("mpath")}}
- {{SVGElement("pattern")}}
- {{SVGElement("radialGradient")}}
- {{SVGElement("script")}}
- {{SVGElement("set")}}
- {{SVGElement("textPath")}}
- {{SVGElement("use")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 160 40" xmlns="http://www.w3.org/2000/svg">
  <a xlink:href="https://developer.mozilla.org/">
    <text x="10" y="25">MDN Web Docs</text>
  </a>
</svg>
```

{{EmbedLiveSample("Example", "320", "100")}}

## a

Với {{SVGElement("a")}}, `xlink:href` xác định vị trí của đối tượng được tham chiếu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## animate, animateMotion, animateTransform, set

Với {{SVGElement("animate")}}, {{SVGElement("animateMotion")}}, {{SVGElement("animateTransform")}} và {{SVGElement("set")}}, `xlink:href` xác định tham chiếu tới phần tử là đích của hoạt ảnh này và do đó sẽ được sửa đổi theo thời gian.

Phần tử đích phải là một phần của mảnh tài liệu SVG hiện tại.

Giá trị phải trỏ tới đúng một phần tử đích có thể làm đích cho kiểu hoạt ảnh đã cho.

Nếu thuộc tính `xlink:href` không được cung cấp, phần tử đích sẽ là phần tử cha trực tiếp của phần tử hoạt ảnh hiện tại.

Tham khảo mô tả của từng phần tử hoạt ảnh để biết các hạn chế về kiểu phần tử nào có thể là đích của từng loại hoạt ảnh cụ thể.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## feImage

Với {{SVGElement("feImage")}}, `xlink:href` xác định tham chiếu tới nguồn ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## filter

Với {{SVGElement("filter")}}, `xlink:href` xác định tham chiếu tới một phần tử `<filter>` khác trong mảnh tài liệu SVG hiện tại. Bất kỳ thuộc tính nào được định nghĩa trên phần tử `<filter>` được tham chiếu mà không được định nghĩa trên phần tử này sẽ được kế thừa bởi phần tử này. Nếu phần tử này không có các nút bộ lọc được định nghĩa, và phần tử được tham chiếu có các nút bộ lọc được định nghĩa (có thể do thuộc tính `xlink:href` riêng của nó), thì phần tử này sẽ kế thừa các nút bộ lọc được định nghĩa từ phần tử `<filter>` được tham chiếu. Việc kế thừa có thể gián tiếp qua nhiều cấp; vì vậy, nếu phần tử `<filter>` được tham chiếu kế thừa thuộc tính hoặc đặc tả nút bộ lọc do thuộc tính `xlink:href` riêng của nó, thì phần tử hiện tại có thể kế thừa những thuộc tính hoặc đặc tả nút bộ lọc đó.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## image

Với {{SVGElement("image")}}, `xlink:href` xác định vị trí của ảnh được tham chiếu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## linearGradient

Với {{SVGElement("linearGradient")}}, `xlink:href` xác định tham chiếu tới một phần tử `<linearGradient>` khác hoặc phần tử {{SVGElement("radialGradient")}} trong mảnh tài liệu SVG hiện tại. Bất kỳ thuộc tính `<linearGradient>` nào được định nghĩa trên phần tử được tham chiếu mà không được định nghĩa trên phần tử này sẽ được kế thừa bởi phần tử này. Nếu phần tử này không có các điểm dừng gradient được định nghĩa, và phần tử được tham chiếu có (có thể do thuộc tính `xlink:href` riêng của nó), thì phần tử này sẽ kế thừa các điểm dừng gradient từ phần tử được tham chiếu. Việc kế thừa có thể gián tiếp qua nhiều cấp; vì vậy, nếu phần tử được tham chiếu kế thừa thuộc tính hoặc các điểm dừng gradient do thuộc tính `xlink:href` riêng của nó, thì phần tử hiện tại có thể kế thừa những thuộc tính hoặc các điểm dừng gradient đó.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## mpath

Với {{SVGElement("mpath")}}, `xlink:href` xác định tham chiếu tới phần tử {{SVGElement("path")}} định nghĩa đường đi chuyển động.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## pattern

Với {{SVGElement("pattern")}}, `xlink:href` xác định tham chiếu tới một phần tử `<pattern>` khác trong mảnh tài liệu SVG hiện tại. Bất kỳ thuộc tính nào được định nghĩa trên phần tử `<pattern>` được tham chiếu mà không được định nghĩa trên phần tử này sẽ được kế thừa bởi phần tử này. Nếu phần tử này không có nội dung mẫu được định nghĩa, và phần tử được tham chiếu có nội dung (có thể do thuộc tính `xlink:href` riêng của nó), thì phần tử này sẽ kế thừa nội dung mẫu từ phần tử được tham chiếu. Việc kế thừa có thể gián tiếp qua nhiều cấp; vì vậy, nếu phần tử được tham chiếu kế thừa thuộc tính hoặc nội dung mẫu do thuộc tính `xlink:href` riêng của nó, thì phần tử hiện tại có thể kế thừa những thuộc tính hoặc nội dung mẫu đó.

## radialGradient

Với {{SVGElement("radialGradient")}}, `xlink:href` xác định tham chiếu tới một phần tử `<radialGradient>` khác hoặc phần tử {{SVGElement("linearGradient")}} trong mảnh tài liệu SVG hiện tại. Bất kỳ thuộc tính `<radialGradient>` nào được định nghĩa trên phần tử được tham chiếu mà không được định nghĩa trên phần tử này sẽ được kế thừa bởi phần tử này. Nếu phần tử này không có các điểm dừng gradient được định nghĩa, và phần tử được tham chiếu có (có thể do thuộc tính `xlink:href` riêng của nó), thì phần tử này sẽ kế thừa các điểm dừng gradient từ phần tử được tham chiếu. Việc kế thừa có thể gián tiếp qua nhiều cấp; vì vậy, nếu phần tử được tham chiếu kế thừa thuộc tính hoặc các điểm dừng gradient do thuộc tính `xlink:href` riêng của nó, thì phần tử hiện tại có thể kế thừa những thuộc tính hoặc các điểm dừng gradient đó.

## script

Với {{SVGElement("script")}}, `xlink:href` xác định đường dẫn của script bên ngoài được nhúng vào tài liệu SVG.

## textPath

Với {{SVGElement("textPath")}}, `xlink:href` xác định tham chiếu tới phần tử {{SVGElement("path")}} mà văn bản sẽ đi theo.

## use

Với {{SVGElement("use")}}, `xlink:href` xác định tham chiếu tới phần tử sẽ được sao chép vào vị trí mà phần tử `<use>` xuất hiện.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
