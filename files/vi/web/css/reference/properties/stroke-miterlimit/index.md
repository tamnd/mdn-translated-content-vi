---
title: stroke-miterlimit
slug: Web/CSS/Reference/Properties/stroke-miterlimit
page-type: css-property
browser-compat: css.properties.stroke-miterlimit
sidebar: cssref
---

Thuộc tính **`stroke-miterlimit`** của [CSS](/vi/docs/Web/CSS) xác định giới hạn cho tỷ lệ giữa độ dài góc nhọn và {{CSSxref("stroke-width") }} khi hình dạng được dùng ở các góc của đường dẫn tô nét của phần tử [SVG](/vi/docs/Web/SVG) là một mối nối góc nhọn. Nếu giới hạn được xác định bởi thuộc tính này bị vượt qua, mối nối sẽ được chuyển đổi từ `miter` sang `bevel`, khiến góc xuất hiện bị cắt bớt.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG tạo góc hoặc phần tử nội dung văn bản nào (xem {{SVGAttr("stroke-miterlimit")}} để biết danh sách đầy đủ), nhưng là một thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu lực mong muốn trên nét viền của các phần tử con. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-miterlimit")}} của phần tử.

## Mô tả

Khi hai đoạn thẳng gặp nhau ở một góc nhọn và mối nối `miter` đã được chỉ định cho {{ CSSxref("stroke-linejoin") }}, hoặc nếu chúng mặc định về giá trị đó, điều này có thể khiến góc nhọn kéo dài ra xa so với độ dày của đường viền của đường dẫn. Tỷ lệ `stroke-miterlimit` được dùng để xác định giới hạn, sau đó mối nối sẽ được chuyển đổi từ góc nhọn sang vát.

Tỷ lệ của độ dài góc nhọn (khoảng cách giữa đầu ngoài và góc trong của góc nhọn) với {{ CSSxref("stroke-width") }} có liên quan trực tiếp đến góc (theta) giữa các đoạn trong không gian người dùng theo công thức:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mstyle displaystyle="true"><mi>stroke-miterlimit</mi><mo>=</mo><mfrac><mrow><mi>miterLength</mi></mrow><mrow><mi>stroke-width</mi></mrow></mfrac><mo>=</mo><mfrac><mrow><mn>1</mn></mrow><mrow><mrow><mi>sin</mi><mrow><mo>(</mo><mfrac><mrow><mo>θ</mo></mrow><mrow><mn>2</mn></mrow></mfrac><mo>)</mo></mrow></mrow></mrow></mfrac></mstyle><annotation encoding="TeX">\text{stroke-miterlimit} = \frac{\text{miterLength}}{\text{stroke-width}} = \frac{1}{\sin\left(\frac{\theta}{2}\right)}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Ví dụ, giới hạn góc nhọn là `1.414` chuyển đổi góc nhọn thành góc vát khi giá trị theta nhỏ hơn 90 độ, giới hạn `4.0` chuyển đổi khi theta nhỏ hơn khoảng 29 độ, và giới hạn `10.0` chuyển đổi khi theta nhỏ hơn khoảng 11.5 độ.

## Cú pháp

```css
/* Giá trị số */
stroke-miterlimit: 1;
stroke-miterlimit: 3.1416;

/* Giá trị toàn cục */
stroke-miterlimit: inherit;
stroke-miterlimit: initial;
stroke-miterlimit: revert;
stroke-miterlimit: revert-layer;
stroke-miterlimit: unset;
```

### Giá trị

- {{cssxref("&lt;number&gt;")}}
  - : Bất kỳ số thực dương nào lớn hơn hoặc bằng `1`; các giá trị nhỏ hơn đó không hợp lệ. Giá trị ban đầu là `4`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Các giới hạn góc nhọn khác nhau

Ví dụ này minh họa hiệu ứng của các giá trị khác nhau cho thuộc tính `stroke-miterlimit`.

#### HTML

Chúng ta thiết lập năm đường dẫn nhiều đoạn, tất cả đều sử dụng nét viền đen với độ rộng một, và không có tô màu. Mỗi đường dẫn tạo ra một loạt các ký hiệu núi, từ trái (góc nông) đến phải (góc cực đoan).

```html
<svg viewBox="0 0 39 36" xmlns="http://www.w3.org/2000/svg">
  <g stroke="black" stroke-width="1" fill="none">
    <path
      d="M1,5 l7   ,-3 l7   ,3
         m2,0 l3.5 ,-3 l3.5 ,3
         m2,0 l2   ,-3 l2   ,3
         m2,0 l0.75,-3 l0.75,3
         m2,0 l0.5 ,-3 l0.5 ,3" />
    <path
      d="M1,12 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
    <path
      d="M1,19 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
    <path
      d="M1,26 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
    <path
      d="M1,33 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
  </g>
</svg>
```

#### CSS

Chúng ta áp dụng các giá trị ngày càng lớn hơn của `stroke-miterlimit` cho các đường dẫn, sao cho đối với đường dẫn đầu tiên, chỉ đường dẫn con đầu tiên (ngoài cùng bên trái) là góc nhọn; đối với đường dẫn thứ hai, hai đường dẫn con đầu tiên là góc nhọn; v.v. cho đến đường dẫn thứ năm, tất cả năm đường dẫn con đều là góc nhọn.

```css
path:nth-child(1) {
  stroke-miterlimit: 1.1;
}
path:nth-child(2) {
  stroke-miterlimit: 1.4;
}
path:nth-child(3) {
  stroke-miterlimit: 1.9;
}
path:nth-child(4) {
  stroke-miterlimit: 4.2;
}
path:nth-child(5) {
  stroke-miterlimit: 6.1;
}
```

{{EmbedLiveSample("Various miter limits", "400", "650")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("stroke-dasharray")}}
- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linecap")}}
- {{cssxref("stroke-linejoin")}}
- {{cssxref("stroke-opacity")}}
- {{cssxref("stroke-width")}}
- {{cssxref("stroke")}}
- Thuộc tính SVG {{SVGAttr("stroke-miterlimit")}}
