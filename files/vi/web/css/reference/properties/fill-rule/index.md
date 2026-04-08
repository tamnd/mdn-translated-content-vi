---
title: fill-rule
slug: Web/CSS/Reference/Properties/fill-rule
page-type: css-property
browser-compat: css.properties.fill-rule
sidebar: cssref
---

Thuộc tính **`fill-rule`** trong [CSS](/vi/docs/Web/CSS) xác định quy tắc được sử dụng để xác định phần nào của canvas hình dạng SVG được bao gồm bên trong hình dạng để tô màu. Nếu có, nó ghi đè thuộc tính {{SVGAttr("fill-rule")}} của phần tử.

`fill-rule` làm rõ những vùng nào của hình dạng nên được coi là "bên trong" hình dạng. Nó cung cấp hai giá trị bạn có thể đặt để nói cho trình duyệt biết cách xác định bên trong của hình dạng. Đối với các hình dạng không có đường dẫn giao nhau, như hình tròn, ranh giới của những gì nằm bên trong hình dạng cần tô màu là rõ ràng theo trực giác. Với các hình dạng phức tạp bao gồm các đường dẫn giao nhau (chẳng hạn như sơ đồ Venn) hoặc các đường dẫn bao quanh các đường dẫn khác (chẳng hạn như hình bánh rán), việc giải thích phần nào của hình dạng là "bên trong" và nên được tô màu bởi thuộc tính {{cssxref("fill")}} có thể không rõ ràng.

> [!NOTE]
> Thuộc tính `fill-rule` chỉ áp dụng cho các phần tử {{SVGElement("path")}}, {{SVGElement("polygon")}}, {{SVGElement("polyline")}}, {{SVGElement("text")}}, {{SVGElement("textPath")}}, và {{SVGElement("tspan")}} được lồng trong một {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hoặc pseudo-element khác.

## Cú pháp

```css
/* từ khóa */
fill-rule: evenodd;
fill-rule: nonzero;

/* Giá trị toàn cục */
fill-rule: inherit;
fill-rule: initial;
fill-rule: revert;
fill-rule: revert-layer;
fill-rule: unset;
```

### Giá trị

- `nonzero`
  - : Đối với mỗi điểm trong hình dạng, một tia được vẽ theo hướng ngẫu nhiên ra ngoài cạnh ngoài của hình dạng. Mỗi tia được kiểm tra để xác định các vị trí mà tia cắt qua hình dạng. Bắt đầu với số đếm bằng không, cộng thêm một mỗi khi một đoạn đường dẫn cắt tia từ trái sang phải và trừ đi một mỗi khi một đoạn đường dẫn cắt tia từ phải sang trái. Sau khi đếm các giao điểm, nếu kết quả bằng không thì điểm đó nằm ngoài đường dẫn. Ngược lại, nó nằm bên trong.

- `evenodd`
  - : Đối với mỗi điểm trong hộp quy tắc fill, một tia được vẽ theo hướng ngẫu nhiên. Số lượng đoạn đường dẫn từ hình dạng đã cho mà tia cắt qua được đếm. Nếu số này là lẻ, điểm nằm bên trong; nếu chẵn, điểm nằm ngoài. Zero được coi là chẵn.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định quy tắc fill cho các phần tử SVG

Ví dụ này minh họa cách khai báo `fill-rule`, hiệu ứng của thuộc tính, và cách thuộc tính CSS `fill-rule` có quyền ưu tiên hơn thuộc tính `fill-rule`.

#### HTML

Chúng ta xác định một SVG với hai hình dạng phức tạp được định nghĩa bằng các phần tử SVG {{SVGElement("polygon")}} và {{SVGElement("path")}}. Hình đa giác có thuộc tính SVG `fill-rule` được đặt thành `evenodd` và đường dẫn hình ngôi sao được đặt thành `nonzero`, là giá trị mặc định. Để làm cho các đường thấy được, chúng ta đặt đường viền thành `red` bằng thuộc tính SVG {{SVGAttr("stroke")}}.

```html hidden
<p>Original SVG</p>
```

```html
<svg viewBox="0 0 220 120" xmlns="http://www.w3.org/2000/svg">
  <polygon
    points="180,10 150,100 220,40 140,40 210,100"
    stroke="red"
    fill-rule="evenodd" />
  <path
    d="M 10,5 l 90,0 -80,80 0,-60 80,80 -90,0 z"
    stroke="red"
    fill-rule="nonzero" />
</svg>
```

```html hidden
<p><code>fill-rule: nonzero;</code></p>
<svg viewBox="0 0 220 120" xmlns="http://www.w3.org/2000/svg">
  <polygon
    points="180,10 150,100 220,40 140,40 210,100"
    stroke="red"
    fill-rule="evenodd" />
  <path
    d="M 10,5 l 90,0 -80,80 0,-60 80,80 -90,0 z"
    stroke="red"
    fill-rule="nonzero" />
</svg>
<p><code>fill-rule: evenodd;</code></p>
<svg viewBox="0 0 220 120" xmlns="http://www.w3.org/2000/svg">
  <polygon
    points="180,10 150,100 220,40 140,40 210,100"
    stroke="red"
    fill-rule="evenodd" />
  <path
    d="M 10,5 l 90,0 -80,80 0,-60 80,80 -90,0 z"
    stroke="red"
    fill-rule="nonzero" />
</svg>
```

SVG trên được lặp lại ba lần; chúng tôi chỉ hiển thị một bản sao để ngắn gọn.

#### CSS

Các hình dạng lồng trong SVG đầu tiên không có CSS nào được áp dụng. Chúng ta đặt các hình dạng bên trong SVG thứ hai để sử dụng giá trị `nonzero`. SVG thứ ba có tất cả các hình dạng lồng của nó được đặt thành `evenodd`.

```css hidden
svg {
  border: 1px solid;
  height: calc(33vh - 2.5em);
  margin-bottom: 10px;
}
p {
  margin: 0;
}
```

```css
svg:nth-of-type(2) > * {
  fill-rule: nonzero;
}
svg:nth-of-type(3) > * {
  fill-rule: evenodd;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the fill rules for SVG elements", "300", "540")}}

Với giá trị `nonzero` cho `fill-rule`, "bên trong" của hình dạng là toàn bộ hình dạng. Giá trị `evenodd` xác định một số khoảng trống là trống. Hình ảnh đầu tiên hiển thị `fill-rule` được bao gồm dưới dạng thuộc tính. Khai báo `fill-rule` trong CSS ghi đè các giá trị thuộc tính trong hình ảnh thứ hai và thứ ba.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("fill-rule")}}
- Thuộc tính trình bày: `fill-rule`, {{cssxref("clip-rule")}}, {{cssxref("color-interpolation-filters")}}, {{cssxref("fill-opacity")}}, {{cssxref("fill")}}, {{cssxref("marker-end")}}, {{cssxref("marker-mid")}}, {{cssxref("marker-start")}}, {{cssxref("shape-rendering")}}, {{cssxref("stop-color")}}, {{cssxref("stop-opacity")}}, {{cssxref("stroke")}}, {{cssxref("stroke-dasharray")}}, {{cssxref("stroke-dashoffset")}}, {{cssxref("stroke-linecap")}}, {{cssxref("stroke-linejoin")}}, {{cssxref("stroke-miterlimit")}}, {{cssxref("stroke-opacity")}}, {{cssxref("stroke-width")}}, {{cssxref("text-anchor")}}, và {{cssxref("vector-effect")}}
- {{cssxref("opacity")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
