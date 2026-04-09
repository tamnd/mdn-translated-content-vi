---
title: refY
slug: Web/SVG/Reference/Attribute/refY
page-type: svg-attribute
spec-urls:
  - https://svgwg.org/svg2-draft/painting.html#MarkerElementRefYAttribute
  - https://svgwg.org/svg2-draft/struct.html#SymbolElementRefYAttribute
sidebar: svgref
---

Thuộc tính **`refY`** xác định tọa độ y của điểm tham chiếu của một phần tử.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("marker")}}
- {{SVGElement("symbol")}}

## marker

Với {{SVGElement("marker")}}, `refY` xác định tọa độ y của điểm tham chiếu của marker, điểm này sẽ được đặt chính xác tại vị trí marker trên hình.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        {{cssxref("length-percentage")}} |
        {{cssxref("number")}} | <code>top</code> | <code>center</code> |
        <code>bottom</code>
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

    Giá trị phần trăm được hiểu là phần trăm của chiều cao {{SVGAttr("viewBox")}}.

- `<number>`
  - : Số được hiểu là nằm trong hệ tọa độ của nội dung marker, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.
- `top`
  - : Điểm tham chiếu của marker được đặt tại mép trên của hình.
- `center`
  - : Điểm tham chiếu của marker được đặt tại tâm dọc của hình.
- `bottom`
  - : Điểm tham chiếu của marker được đặt tại mép dưới của hình.

## symbol

Với {{SVGElement("symbol")}}, `refY` xác định tọa độ y của symbol, được xác định bởi tác động cộng dồn của thuộc tính {{SVGAttr("y")}} và mọi phép biến đổi trên phần tử {{SVGElement("symbol")}} cùng phần tử {{SVGElement("use")}} chứa nó.

Không giống các thuộc tính định vị khác, `refY` được hiểu là nằm trong hệ tọa độ của nội dung symbol, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}. Nếu thuộc tính không được chỉ định, sẽ không có điều chỉnh dọc nào được thực hiện và cạnh trên của vùng viewport hình chữ nhật của symbol (bất kể tọa độ `viewBox`) sẽ được đặt tại tọa độ y.

> [!NOTE]
> Để tương thích ngược, hành vi khi `refY` không được chỉ định trên phần tử `<symbol>` khác với khi nó được chỉ định với giá trị `0`, và do đó khác với hành vi khi một thuộc tính tương đương không được chỉ định trên phần tử {{SVGElement("marker")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        {{cssxref("length")}} | <code>top</code> | <code>center</code> |
        <code>bottom</code>
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

    Giá trị phần trăm được hiểu là phần trăm của chiều cao {{SVGAttr("viewBox")}}.

- `<number>`
  - : Số được hiểu là nằm trong hệ tọa độ của nội dung marker, sau khi áp dụng các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.
- `top`
  - : Điểm tham chiếu của marker được đặt tại mép trên của hình.
- `center`
  - : Điểm tham chiếu của marker được đặt tại tâm dọc của hình.
- `bottom`
  - : Điểm tham chiếu của marker được đặt tại mép dưới của hình.

## Specifications

{{Specifications}}

## See also

- {{SVGAttr("refX")}}
