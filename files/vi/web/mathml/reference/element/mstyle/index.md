---
title: <mstyle>
slug: Web/MathML/Reference/Element/mstyle
page-type: mathml-element
browser-compat: mathml.elements.mstyle
sidebar: mathmlref
---

**`<mstyle>`** [MathML](/en-US/docs/Web/MathML) element được dùng để thay đổi kiểu của các phần tử con.

> [!NOTE]
> Trong lịch sử, phần tử này chấp nhận gần như toàn bộ các thuộc tính MathML và được dùng để ghi đè các giá trị thuộc tính mặc định của các phần tử con. Sau đó, nó bị giới hạn chỉ còn một vài thuộc tính kiểu dáng liên quan được dùng trong các trang web hiện có. Ngày nay, các thuộc tính kiểu dáng này là [chung cho tất cả phần tử MathML](/en-US/docs/Web/MathML/Reference/Global_attributes), nên `<mstyle>` thực ra chỉ tương đương với một phần tử [`<mrow>`](/en-US/docs/Web/MathML/Reference/Element/mrow). Tuy nhiên, `<mstyle>` vẫn có thể hữu ích để tương thích với các triển khai MathML bên ngoài trình duyệt.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cũng như các thuộc tính lỗi thời sau:

- `background` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Hãy dùng thuộc tính CSS {{cssxref("background-color")}} thay thế.
- `color` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Hãy dùng thuộc tính CSS {{cssxref("color")}} thay thế.
- `fontsize` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Hãy dùng thuộc tính CSS {{cssxref("font-size")}} thay thế.
- `fontstyle` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Hãy dùng thuộc tính CSS {{cssxref("font-style")}} thay thế.
- `fontweight` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Hãy dùng thuộc tính CSS {{cssxref("font-weight")}} thay thế.

## Ví dụ

### Thuộc tính ánh xạ sang CSS

Ví dụ sau dùng các [thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) `displaystyle` và `mathcolor` để ghi đè tương ứng {{cssxref("math-style")}} và {{cssxref("color")}} của các phần tử con `<munder>` và `<munderover>`:

```html
<math display="block">
  <mstyle displaystyle="false" mathcolor="teal">
    <munder>
      <mo>∑</mo>
      <mi>I</mi>
    </munder>
    <munderover>
      <mo>∏</mo>
      <mrow>
        <mi>i</mi>
        <mo>=</mo>
        <mn>1</mn>
      </mrow>
      <mi>N</mi>
    </munderover>
  </mstyle>
</math>
```

{{EmbedLiveSample('Attributes mapped to CSS')}}

### Thuộc tính script kiểu cũ

Ví dụ sau cho thấy một công thức với {{cssxref("font-size")}} được đặt thành `128pt`. Nó chứa các số được đặt trong các chỉ số trên lồng nhau, cùng với một phần tử `<mstyle>` có các thuộc tính kiểu cũ `scriptsizemultiplier` và `scriptminsize`. `font-size` được nhân với `0.5` mỗi khi đi vào một chỉ số trên, miễn là điều đó không làm nó nhỏ hơn `16pt`.

```html
<math display="block">
  <mstyle scriptsizemultiplier="0.5" scriptminsize="16pt">
    <msup>
      <mn>2</mn>
      <msup>
        <mn>2</mn>
        <msup>
          <mn>2</mn>
          <msup>
            <mn>2</mn>
            <msup>
              <mn>2</mn>
              <msup>
                <mn>2</mn>
                <mn>2</mn>
              </msup>
            </msup>
          </msup>
        </msup>
      </msup>
    </msup>
  </mstyle>
</math>
```

```css
math {
  font-size: 128pt;
}
```

{{EmbedLiveSample('Legacy script attributes', 700, 400)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không có
    </td>
  </tr>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
