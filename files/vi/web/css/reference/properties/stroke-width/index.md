---
title: stroke-width
slug: Web/CSS/Reference/Properties/stroke-width
page-type: css-property
browser-compat: css.properties.stroke-width
sidebar: cssref
---

Thuộc tính **`stroke-width`** của [CSS](/vi/docs/Web/CSS) xác định độ rộng của nét viền được áp dụng cho hình dạng [SVG](/vi/docs/Web/SVG). Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-width")}} của phần tử.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG hoặc phần tử nội dung văn bản nào (xem {{SVGAttr("stroke-width")}} để biết danh sách đầy đủ), nhưng là một thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu lực mong muốn trên nét viền của các phần tử con. Nếu giá trị ước lượng bằng không, nét viền sẽ không được vẽ.

## Cú pháp

```css
/* Giá trị độ dài và phần trăm */
stroke-width: 0%;
stroke-width: 1.414px;

/* Giá trị toàn cục */
stroke-width: inherit;
stroke-width: initial;
stroke-width: revert;
stroke-width: revert-layer;
stroke-width: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Đơn vị pixel được xử lý giống như đơn vị SVG (xem `<number>` ở trên) và các độ dài dựa trên phông chữ như `em` được tính toán theo giá trị SVG của phần tử cho kích thước văn bản; hiệu ứng của các đơn vị độ dài khác có thể phụ thuộc vào trình duyệt.

- {{cssxref("&lt;percentage&gt;")}}
  - : Phần trăm tham chiếu đến đường chéo chuẩn hóa của khung nhìn SVG hiện tại, được tính là <math><mfrac><msqrt><mrow><msup><mi>&lt;width&gt;</mi><mn>2</mn></msup><mo>+</mo><msup><mi>&lt;height&gt;</mi><mn>2</mn></msup></mrow></msqrt><msqrt><mn>2</mn></msqrt></mfrac></math>.

- {{cssxref("&lt;number&gt;")}} {{non-standard_inline}}
  - : Một số đơn vị SVG, kích thước của chúng được xác định bởi không gian đơn vị hiện tại.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Các độ rộng nét viền khác nhau

Ví dụ này minh họa các cú pháp giá trị khác nhau cho thuộc tính `stroke-width`.

#### HTML

Đầu tiên, chúng ta thiết lập năm đường dẫn nhiều đoạn, tất cả đều sử dụng nét viền đen với độ rộng một, và không có tô màu. Mỗi đường dẫn tạo ra một loạt các ký hiệu núi, từ trái (góc nông) đến phải (góc cực đoan).

```html
<svg viewBox="0 0 39 30" xmlns="http://www.w3.org/2000/svg">
  <g stroke="black" stroke-width="1" fill="none">
    <path
      d="M1,5 l7   ,-3 l7   ,3
         m2,0 l3.5 ,-3 l3.5 ,3
         m2,0 l2   ,-3 l2   ,3
         m2,0 l0.75,-3 l0.75,3
         m2,0 l0.5 ,-3 l0.5 ,3" />
    <path
      d="M1,8 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
    <path
      d="M1,14 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
    <path
      d="M1,18 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
    <path
      d="M1,26 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
  </g>
</svg>
```

#### CSS

Đối với bốn đường dẫn đầu tiên, chúng ta áp dụng các giá trị độ rộng nét viền theo từng cặp để cho thấy cách các giá trị số thuần túy và giá trị pixel có chức năng tương đương. Đối với hai đường dẫn đầu tiên, các giá trị là `.25` và `.25px`. Đối với hai đường dẫn tiếp theo, các giá trị là `1` và `1px`.

Đối với đường dẫn thứ năm và cuối cùng, giá trị `5%` được áp dụng, do đó đặt độ rộng nét viền bằng năm phần trăm của đường chéo khung nhìn SVG.

```css
path:nth-child(1) {
  stroke-width: 0.25;
}
path:nth-child(2) {
  stroke-width: 0.25px;
}
path:nth-child(3) {
  stroke-width: 1;
}
path:nth-child(4) {
  stroke-width: 1px;
}
path:nth-child(5) {
  stroke-width: 5%;
}
```

#### Kết quả

{{EmbedLiveSample("Various stroke widths", "400", "540")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxref("stroke")}}
- {{cssxref("stroke-dasharray")}}
- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linecap")}}
- {{cssxref("stroke-linejoin")}}
- {{cssxref("stroke-miterlimit")}}
- {{cssxref("stroke-opacity")}}
- {{CSSxref("fill")}}
- Thuộc tính SVG {{SVGAttr("stroke-width")}}
