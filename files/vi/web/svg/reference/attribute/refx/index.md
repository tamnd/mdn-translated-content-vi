---
title: refX
slug: Web/SVG/Reference/Attribute/refX
page-type: svg-attribute
spec-urls:
  - https://svgwg.org/svg2-draft/painting.html#MarkerElementRefXAttribute
  - https://svgwg.org/svg2-draft/struct.html#SymbolElementRefXAttribute
sidebar: svgref
---

Thuộc tính **`refX`** xác định tọa độ x của điểm tham chiếu của một phần tử.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("marker")}}
- {{SVGElement("symbol")}}

## marker

Với {{SVGElement("marker")}}, `refX` xác định tọa độ x của điểm tham chiếu của marker, điểm này sẽ được đặt chính xác tại vị trí marker trên hình.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        {{cssxref("length-percentage")}} |
        {{cssxref("number")}} | <code>left</code> | <code>center</code> |
        <code>right</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `<length-percentage>`
  - : Độ dài được hiểu là nằm trong hệ tọa độ của nội dung marker, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.

    Giá trị phần trăm được hiểu là phần trăm của chiều rộng {{SVGAttr("viewBox")}}.

- `<number>`
  - : Số được hiểu là nằm trong hệ tọa độ của nội dung marker, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.
- `left`
  - : Điểm tham chiếu của marker được đặt tại mép trái của hình.
- `center`
  - : Điểm tham chiếu của marker được đặt tại tâm ngang của hình.
- `right`
  - : Điểm tham chiếu của marker được đặt tại mép phải của hình.

## symbol

Với {{SVGElement("symbol")}}, `refX` xác định tọa độ x của symbol, được xác định bởi tác động cộng dồn của thuộc tính {{SVGAttr("x")}} và mọi phép biến đổi trên phần tử {{SVGElement("symbol")}} cùng phần tử {{SVGElement("use")}} chứa nó.

Không giống các thuộc tính định vị khác, `refX` được hiểu là nằm trong hệ tọa độ của nội dung symbol, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}. Nếu thuộc tính không được chỉ định, sẽ không có điều chỉnh ngang nào được thực hiện và cạnh trái của vùng viewport hình chữ nhật của symbol (bất kể tọa độ `viewBox`) sẽ được đặt tại tọa độ x.

> [!NOTE]
> Để tương thích ngược, hành vi khi `refX` không được chỉ định trên phần tử `<symbol>` khác với khi nó được chỉ định với giá trị `0`, và do đó khác với hành vi khi một thuộc tính tương đương không được chỉ định trên phần tử {{SVGElement("marker")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        {{cssxref("length")}} | <code>left</code> | <code>center</code> |
        <code>right</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td>None</td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `<length-percentage>`
  - : Độ dài được hiểu là nằm trong hệ tọa độ của nội dung marker, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.

    Giá trị phần trăm được hiểu là phần trăm của chiều rộng {{SVGAttr("viewBox")}}.

- `<number>`
  - : Số được hiểu là nằm trong hệ tọa độ của nội dung marker, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.
- `left`
  - : Điểm tham chiếu của marker được đặt tại mép trái của hình.
- `center`
  - : Điểm tham chiếu của marker được đặt tại tâm ngang của hình.
- `right`
  - : Điểm tham chiếu của marker được đặt tại mép phải của hình.

## Specifications

{{Specifications}}

## See also

- {{SVGAttr("refY")}}
