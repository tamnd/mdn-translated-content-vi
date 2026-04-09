---
title: in
slug: Web/SVG/Reference/Attribute/in
page-type: svg-attribute
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-filter-primitive-in
sidebar: svgref
---

Thuộc tính **`in`** xác định đầu vào cho primitive bộ lọc đã cho.

Giá trị có thể là một trong sáu keyword được định nghĩa bên dưới, hoặc một chuỗi khớp với giá trị thuộc tính {{SVGAttr("result")}} trước đó trong cùng phần tử {{SVGElement("filter")}}. Nếu không cung cấp giá trị và đây là filter primitive đầu tiên, thì filter primitive này sẽ dùng `SourceGraphic` làm đầu vào. Nếu không cung cấp giá trị và đây là một filter primitive tiếp theo, thì filter primitive này sẽ dùng kết quả của filter primitive trước đó làm đầu vào.

Nếu giá trị của {{SVGAttr("result")}} xuất hiện nhiều lần trong một phần tử {{SVGElement("filter")}} nhất định, thì tham chiếu tới kết quả đó sẽ dùng filter primitive trước gần nhất có giá trị thuộc tính {{SVGAttr("result")}} đã cho.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feDropShadow")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feMergeNode")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>SourceGraphic</code> | <code>SourceAlpha</code> |
        <code>BackgroundImage</code> | <code>BackgroundAlpha</code> |
        <code>FillPaint</code> | <code>StrokePaint</code> |
        <code>&#x3C;filter-primitive-reference></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        <code>SourceGraphic</code> cho filter primitive đầu tiên, nếu không thì
        kết quả của filter primitive trước đó
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `SourceGraphic`
  - : Keyword này đại diện cho các phần tử đồ họa là đầu vào gốc vào phần tử {{SVGElement("filter")}}.
- `SourceAlpha`
  - : Keyword này đại diện cho các phần tử đồ họa là đầu vào gốc vào phần tử `<filter>`. `SourceAlpha` có tất cả các quy tắc giống `SourceGraphic` ngoại trừ việc chỉ kênh alpha được dùng.
- `BackgroundImage`
  - : Keyword này đại diện cho một ảnh chụp của tài liệu SVG bên dưới vùng filter tại thời điểm phần tử `<filter>` được gọi.
- `BackgroundAlpha`
  - : Giống `BackgroundImage` nhưng chỉ kênh alpha được dùng.
- `FillPaint`
  - : Keyword này đại diện cho giá trị của thuộc tính {{SVGAttr("fill")}} trên phần tử đích của hiệu ứng filter. Trong nhiều trường hợp, `FillPaint` là opaque ở mọi nơi, nhưng điều đó có thể không đúng nếu một hình dạng được tô bằng gradient hoặc pattern vốn chứa các phần trong suốt hoặc bán trong suốt.
- `StrokePaint`
  - : Keyword này đại diện cho giá trị của thuộc tính {{SVGAttr("stroke")}} trên phần tử đích của hiệu ứng filter. Trong nhiều trường hợp, `StrokePaint` là opaque ở mọi nơi, nhưng điều đó có thể không đúng nếu một hình dạng được tô bằng gradient hoặc pattern vốn chứa các phần trong suốt hoặc bán trong suốt.
- `<filter-primitive-reference>`
  - : Giá trị này là tên được gán cho filter primitive dưới dạng {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa tạo ra từ việc xử lý filter primitive này có thể được tham chiếu bằng thuộc tính in trên một filter primitive tiếp theo trong cùng phần tử filter đó. Nếu không cung cấp giá trị, đầu ra sẽ chỉ có sẵn để tái sử dụng như đầu vào ngầm định cho filter primitive tiếp theo nếu filter primitive đó không cung cấp giá trị cho thuộc tính in của nó.

## Phương án thay thế cho BackgroundImage

`BackgroundImage` không được hỗ trợ làm nguồn filter trong các trình duyệt hiện đại (xem [bảng tương thích feComposite](/en-US/docs/Web/SVG/Reference/Element/feComposite#browser_compatibility)). Vì vậy, chúng ta cần nhập một trong các hình ảnh để hòa trộn ngay bên trong filter, bằng phần tử `<feImage>`.

> [!NOTE]
> Firefox [Bug 455986](https://bugzil.la/455986) khiến `feImage` không thể tải các hình ảnh một phần, bao gồm hình tròn, hình chữ nhật, đường dẫn hoặc các fragment khác được định nghĩa trong tài liệu. Để ví dụ này hoạt động trên nhiều trình duyệt hơn, một ảnh đầy đủ bên ngoài của logo sẽ được tải.

### HTML

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <filter id="backgroundMultiply">
      <!-- This will not work. -->
      <feBlend in="BackgroundImage" in2="SourceGraphic" mode="multiply" />
    </filter>
  </defs>
  <image
    href="mdn_logo_only_color.png"
    x="10%"
    y="10%"
    width="80%"
    height="80%" />
  <circle
    cx="50%"
    cy="40%"
    r="40%"
    fill="#cc0000"
    filter="url(#backgroundMultiply)" />
</svg>

<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <filter id="imageMultiply">
      <!-- This is a workaround. -->
      <feImage
        href="mdn_logo_only_color.png"
        x="10%"
        y="10%"
        width="80%"
        height="80%" />
      <feBlend in2="SourceGraphic" mode="multiply" />
    </filter>
  </defs>
  <circle
    cx="50%"
    cy="40%"
    r="40%"
    fill="#cc0000"
    filter="url(#imageMultiply)" />
</svg>
```

```css hidden
svg {
  width: 200px;
  height: 200px;
  display: inline;
}
```

### Kết quả

{{EmbedLiveSample("Workaround_for_BackgroundImage")}}

## Thông số kỹ thuật

{{Specifications}}
