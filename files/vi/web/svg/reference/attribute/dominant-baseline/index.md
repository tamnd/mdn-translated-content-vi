---
title: dominant-baseline
slug: Web/SVG/Reference/Attribute/dominant-baseline
page-type: svg-attribute
browser-compat: svg.global_attributes.dominant-baseline
sidebar: svgref
---

Thuộc tính **`dominant-baseline`** chỉ định đường cơ sở trội, là đường cơ sở được dùng để căn chỉnh văn bản và nội dung mức nội tuyến của hộp. Nó cũng chỉ ra đường cơ sở căn chỉnh mặc định của mọi hộp tham gia vào việc căn chỉnh theo đường cơ sở trong ngữ cảnh căn chỉnh của hộp.

Thuộc tính này được dùng để xác định hoặc xác định lại một scaled-baseline-table. Một scaled-baseline-table là một giá trị tổ hợp gồm ba thành phần:

1. một baseline-identifier cho dominant-baseline,
2. một baseline-table, và
3. một baseline-table font-size.

Một số giá trị của thuộc tính sẽ xác định lại cả ba giá trị. Một số khác chỉ thiết lập lại baseline-table font-size. Khi giá trị ban đầu, `auto`, tạo ra kết quả không mong muốn, thuộc tính này có thể được dùng để đặt rõ ràng scaled-baseline-table mong muốn.

Nếu không có baseline table trong phông chữ danh nghĩa, hoặc baseline table không có mục nhập cho baseline mong muốn, thì trình duyệt có thể dùng heuristic để xác định vị trí của baseline mong muốn.

> [!NOTE]
> Là một thuộc tính trình bày, `dominant-baseline` cũng có một thuộc tính CSS tương ứng: {{cssxref("dominant-baseline")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}

text {
  font:
    bold 14px "Helvetica",
    "Verdana",
    "Arial",
    sans-serif;
}
```

```html
<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
  <path d="M20,20 L180,20 M20,50 L180,50 M20,80 L180,80" stroke="grey" />

  <text dominant-baseline="auto" x="30" y="20">Auto</text>
  <text dominant-baseline="middle" x="30" y="50">Middle</text>
  <text dominant-baseline="hanging" x="30" y="80">Hanging</text>
</svg>
```

{{EmbedLiveSample("Example", "200", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code>
        <a href="/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax#single_bar">|</a>
        <code>text-bottom</code> | <code>alphabetic</code> |
        <code>ideographic</code> | <code>middle</code> | <code>central</code> |
        <code>mathematical</code> | <code>hanging</code> | <code>text-top</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Nếu thuộc tính này xuất hiện trên phần tử {{SVGElement("text")}}, thì giá trị tính toán phụ thuộc vào giá trị của thuộc tính {{SVGAttr("writing-mode")}}.

    Nếu {{SVGAttr("writing-mode")}} là horizontal, thì giá trị của thành phần dominant-baseline là `alphabetic`. Ngược lại, nếu {{SVGAttr("writing-mode")}} là vertical, thì giá trị của thành phần dominant-baseline là `central`.

    Nếu thuộc tính này xuất hiện trên phần tử {{SVGElement("tspan")}} hoặc {{SVGElement("textPath")}}, thì các thành phần dominant-baseline và baseline-table vẫn giữ nguyên như của phần tử nội dung văn bản cha.

    Nếu giá trị {{SVGAttr("baseline-shift")}} được tính toán thực sự dịch chuyển baseline, thì thành phần baseline-table font-size được đặt thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử nơi thuộc tính `dominant-baseline` xuất hiện, ngược lại baseline-table font-size vẫn giữ nguyên như của phần tử đó.

    Nếu không có phần tử nội dung văn bản cha, giá trị scaled-baseline-table sẽ được xây dựng như trên đối với các phần tử {{SVGElement("text")}}.

- `use-script` {{deprecated_inline}}
  - : Các thành phần dominant-baseline và baseline-table được đặt bằng cách xác định script chiếm ưu thế của nội dung dữ liệu ký tự. {{SVGAttr("writing-mode")}}, dù là horizontal hay vertical, được dùng để chọn bộ baseline-table phù hợp và dominant baseline được dùng để chọn baseline-table tương ứng với baseline đó. Thành phần baseline-table font-size được đặt thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử nơi thuộc tính `dominant-baseline` xuất hiện.
- `no-change` {{deprecated_inline}}
  - : Các thành phần dominant-baseline, baseline-table, và baseline-table font-size vẫn giữ nguyên như của phần tử nội dung văn bản cha.
- `reset-size` {{deprecated_inline}}
  - : Các thành phần dominant-baseline và baseline-table vẫn giữ nguyên, nhưng baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này. Điều này sẽ co giãn lại baseline-table cho {{SVGAttr("font-size")}} hiện tại.
- `ideographic`
  - : Baseline-identifier cho dominant-baseline được đặt thành `ideographic`, baseline-table suy ra được xây dựng bằng cách dùng baseline-table `ideographic` trong phông chữ, và baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `alphabetic`
  - : Baseline-identifier cho dominant-baseline được đặt thành `alphabetic`, baseline-table suy ra được xây dựng bằng cách dùng baseline-table `alphabetic` trong phông chữ, và baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `hanging`
  - : Baseline-identifier cho dominant-baseline được đặt thành `hanging`, baseline-table suy ra được xây dựng bằng cách dùng baseline-table `hanging` trong phông chữ, và baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `mathematical`
  - : Baseline-identifier cho dominant-baseline được đặt thành `mathematical`, baseline-table suy ra được xây dựng bằng cách dùng baseline-table `mathematical` trong phông chữ, và baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `central`
  - : Baseline-identifier cho dominant-baseline được đặt thành `central`. Baseline-table suy ra được xây dựng từ các baseline đã định nghĩa trong một baseline-table trong phông chữ. Bảng baseline của phông chữ đó được chọn theo thứ tự ưu tiên sau: `ideographic`, `alphabetic`, `hanging`, `mathematical`. Baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `middle`
  - : Baseline-identifier cho dominant-baseline được đặt thành `middle`. Baseline-table suy ra được xây dựng từ các baseline đã định nghĩa trong một baseline-table trong phông chữ. Bảng baseline của phông chữ đó được chọn theo thứ tự ưu tiên sau: `alphabetic`, `ideographic`, `hanging`, `mathematical`. Baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `text-after-edge`
  - : Baseline-identifier cho dominant-baseline được đặt thành `text-after-edge`. Baseline-table suy ra được xây dựng từ các baseline đã định nghĩa trong một baseline-table trong phông chữ. Việc chọn baseline-table nào trong các baseline-table của phông chữ là tùy thuộc trình duyệt. Baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `text-before-edge`
  - : Baseline-identifier cho dominant-baseline được đặt thành `text-before-edge`. Baseline-table suy ra được xây dựng từ các baseline đã định nghĩa trong một baseline-table trong phông chữ. Việc chọn baseline-table nào trong các baseline-table của phông chữ là tùy thuộc trình duyệt. Baseline-table font-size được đổi thành giá trị của thuộc tính {{SVGAttr("font-size")}} trên phần tử này.
- `text-top`
  - : Giá trị này dùng đỉnh của hộp em làm baseline.

### SVG

```html
<svg
  width="400"
  height="300"
  viewBox="0 0 300 300"
  xmlns="http://www.w3.org/2000/svg">
  <!-- Materialization of anchors -->
  <path
    d="M60,20 L60,270
           M30,20 L400,20
           M30,70 L400,70
           M30,120 L400,120
           M30,170 L400,170
           M30,220 L400,220
           M30,270 L400,270"
    stroke="grey" />

  <!-- Anchors in action -->
  <text dominant-baseline="auto" x="70" y="20">auto</text>
  <text dominant-baseline="middle" x="70" y="70">middle</text>
  <text dominant-baseline="hanging" x="70" y="170">hanging</text>
  <text dominant-baseline="mathematical" x="70" y="220">mathematical</text>
  <text dominant-baseline="text-top" x="70" y="270">text-top</text>

  <!-- Materialization of anchors -->
  <circle cx="60" cy="20" r="3" fill="red" />
  <circle cx="60" cy="70" r="3" fill="red" />
  <circle cx="60" cy="120" r="3" fill="red" />
  <circle cx="60" cy="170" r="3" fill="red" />
  <circle cx="60" cy="220" r="3" fill="red" />
  <circle cx="60" cy="270" r="3" fill="red" />

  <style>
    <![CDATA[
      text {
        font: bold 30px Verdana, Helvetica, Arial, sans-serif;
      }
      ]]>
  </style>
</svg>
```

### Kết quả

{{EmbedLiveSample("Usage_notes", "300", "330")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref('dominant-baseline')}}
