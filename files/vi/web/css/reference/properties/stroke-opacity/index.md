---
title: stroke-opacity
slug: Web/CSS/Reference/Properties/stroke-opacity
page-type: css-property
browser-compat: css.properties.stroke-opacity
sidebar: cssref
---

Thuộc tính **`stroke-opacity`** của [CSS](/vi/docs/Web/CSS) xác định độ mờ của nét viền hình dạng [SVG](/vi/docs/Web/SVG). Hiệu ứng giống hệt với {{CSSxref('opacity')}}, ngoại trừ nó chỉ được áp dụng cho nét viền, không phải toàn bộ phần tử. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-opacity")}} của phần tử.

Thuộc tính này áp dụng cho các hình dạng SVG và phần tử nội dung văn bản (xem {{SVGAttr("stroke-opacity")}} để biết danh sách đầy đủ), nhưng là một thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu lực mong muốn trên nét viền của các phần tử con.

Lưu ý rằng nét viền của hình dạng che một phần tô màu của hình dạng đó, vì vậy nét viền có độ mờ nhỏ hơn `1` sẽ hiển thị tô màu được pha trộn với nét viền tại nơi chúng chồng lên nhau. Để tránh hiệu ứng này, có thể áp dụng độ mờ toàn cục bằng thuộc tính {{cssxref('opacity')}} hoặc đặt nét viền phía sau tô màu với thuộc tính {{cssxref('paint-order')}}.

## Cú pháp

```css
/* Giá trị số và phần trăm */
stroke-opacity: 1;
stroke-opacity: 0.3;
stroke-opacity: 50%;

/* Giá trị toàn cục */
stroke-opacity: inherit;
stroke-opacity: initial;
stroke-opacity: revert;
stroke-opacity: revert-layer;
stroke-opacity: unset;
```

### Giá trị

- {{cssxref("&lt;number&gt;")}}
  - : Bất kỳ số thực nào từ 0 đến 1, bao gồm cả hai đầu. Giá trị `0` làm cho nét viền hoàn toàn trong suốt, và giá trị `1` làm cho nó hoàn toàn mờ đục. Các giá trị ngoài phạm vi 0 – 1 được cắt về đầu gần nhất của phạm vi đó; do đó, các giá trị âm được cắt về `0`.

- {{cssxref("&lt;percentage&gt;")}}
  - : Tương tự như `<number>` (xem ở trên), ngoại trừ phạm vi cho phép là 0% đến 100% và việc cắt được thực hiện theo phạm vi đó.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Các mức độ mờ nét viền khác nhau

Ví dụ này minh họa cách sử dụng cơ bản của thuộc tính `stroke-opacity` và cách, do nét viền của hình dạng che một phần tô màu của nó, nét viền có độ mờ nhỏ hơn `1` sẽ pha trộn với tô màu tại nơi chúng chồng lên nhau.

#### HTML

Đầu tiên, chúng ta thiết lập năm đường dẫn nhiều đoạn, tất cả đều sử dụng nét viền đen với độ rộng một, và tô màu `dodgerblue` cho các đường dẫn con. Mỗi đường dẫn tạo ra một loạt các ký hiệu núi, từ trái (góc nông) đến phải (góc cực đoan).

```html
<svg viewBox="0 0 39 36" xmlns="http://www.w3.org/2000/svg">
  <g stroke="black" stroke-width="1" fill="dodgerblue">
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

Với các đường dẫn này, chúng ta áp dụng giá trị độ mờ nét viền ngày càng cao hơn. Đối với bốn đường dẫn đầu tiên, tô màu có thể được nhìn thấy qua nửa trong của đường dẫn nét viền, mặc dù có thể khó phân biệt đối với đường dẫn thứ tư. Đối với đường dẫn thứ năm và cuối cùng, nét viền hoàn toàn mờ đục nên không thể nhìn thấy tô màu qua nét viền.

```css
g path:nth-child(1) {
  stroke-opacity: 0.2;
} /* equiv. 20% */
g path:nth-child(2) {
  stroke-opacity: 0.4;
} /* equiv. 40% */
g path:nth-child(3) {
  stroke-opacity: 0.6;
} /* equiv. 60% */
g path:nth-child(4) {
  stroke-opacity: 0.8;
} /* equiv. 80% */
g path:nth-child(5) {
  stroke-opacity: 1;
} /* equiv. 100% */
```

#### Kết quả

{{EmbedLiveSample("Various stroke opacities", "400", "650")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('opacity')}}
- {{cssxref('fill-opacity')}}
- {{cssxref('paint-order')}}
- {{cssxref('stroke')}}
- {{cssxref("stroke-dasharray")}}
- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linecap")}}
- {{cssxref("stroke-linejoin")}}
- {{cssxref("stroke-miterlimit")}}
- {{cssxref("stroke-width")}}
- Thuộc tính SVG {{SVGAttr("stroke-opacity")}}
