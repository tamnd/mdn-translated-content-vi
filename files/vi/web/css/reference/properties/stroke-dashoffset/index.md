---
title: stroke-dashoffset
slug: Web/CSS/Reference/Properties/stroke-dashoffset
page-type: css-property
browser-compat: css.properties.stroke-dashoffset
sidebar: cssref
---

Thuộc tính **`stroke-dashoffset`** của [CSS](/vi/docs/Web/CSS) xác định độ lệch cho điểm bắt đầu của quá trình kết xuất [mảng gạch](/vi/docs/Web/CSS/Reference/Properties/stroke-dasharray) liên quan đến phần tử [SVG](/vi/docs/Web/SVG). Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-dashoffset")}} của phần tử.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG hoặc phần tử nội dung văn bản nào (xem {{SVGAttr("stroke-dashoffset")}} để biết danh sách đầy đủ), nhưng là một thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu lực mong muốn trên nét viền của các phần tử con.

## Cú pháp

```css
/* Từ khóa */
stroke-dashoffset: none;

/* Giá trị độ dài và phần trăm */
stroke-dashoffset: 2;
stroke-dashoffset: 2px;
stroke-dashoffset: 2%;

/* Giá trị toàn cục */
stroke-dashoffset: inherit;
stroke-dashoffset: initial;
stroke-dashoffset: revert;
stroke-dashoffset: revert-layer;
stroke-dashoffset: unset;
```

### Giá trị

- {{cssxref("&lt;number&gt;")}} {{non-standard_Inline}}
  - : Một số đơn vị SVG, kích thước của chúng được xác định bởi không gian đơn vị hiện tại. Giá trị được cho, nếu khác `0`, sẽ di chuyển điểm bắt đầu từ đầu mảng gạch đến một điểm khác trong đó. Do đó, các giá trị dương sẽ xuất hiện để dịch chuyển mẫu gạch-khoảng trống _về phía sau_, và các giá trị âm sẽ xuất hiện để dịch chuyển mẫu _về phía trước_.

- {{cssxref("&lt;length&gt;")}}
  - : Đơn vị pixel được xử lý giống như đơn vị SVG (xem `<number>` ở trên) và các độ dài dựa trên phông chữ như `em` được tính toán theo giá trị SVG của phần tử cho kích thước văn bản; hiệu ứng của các đơn vị độ dài khác có thể phụ thuộc vào trình duyệt. Hiệu ứng dịch chuyển cho bất kỳ giá trị nào cũng giống như đối với giá trị `<number>` (xem ở trên).

- {{cssxref("&lt;percentage&gt;")}}
  - : Phần trăm tham chiếu đến đường chéo chuẩn hóa của khung nhìn SVG hiện tại, được tính là <math><mfrac><msqrt><mrow><msup><mi>&lt;width&gt;</mi><mn>2</mn></msup><mo>+</mo><msup><mi>&lt;height&gt;</mi><mn>2</mn></msup></mrow></msqrt><msqrt><mn>2</mn></msqrt></mfrac></math>, _không_ tham chiếu đến tổng độ dài của đường dẫn nét viền. Các giá trị âm không hợp lệ.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Dịch chuyển dấu gạch

Để hiển thị cách các dấu gạch có thể được dịch chuyển, đầu tiên chúng ta thiết lập năm đường dẫn giống hệt nhau, tất cả đều được cung cấp mảng gạch là gạch 20 đơn vị tiếp theo là khoảng trống 3 đơn vị thông qua thuộc tính SVG {{SVGAttr('stroke-dasharray')}}. (Điều này cũng có thể được thực hiện với thuộc tính CSS {{CSSxref('stroke-dasharray')}}.) Các đường dẫn sau đó được cung cấp các độ lệch gạch riêng lẻ thông qua CSS.

```html
<svg viewBox="0 0 100 50" width="500" height="250">
  <rect x="10" y="5" width="80" height="30" fill="#eeeeee" />
  <g stroke="dodgerblue" stroke-width="2" stroke-dasharray="20,3">
    <path d="M 10,10 h 80" />
    <path d="M 10,15 h 80" />
    <path d="M 10,20 h 80" />
    <path d="M 10,25 h 80" />
    <path d="M 10,30 h 80" />
  </g>
</svg>
```

```css
path:nth-of-type(1) {
  stroke-dashoffset: 0;
}
path:nth-of-type(2) {
  stroke-dashoffset: -5;
}
path:nth-of-type(3) {
  stroke-dashoffset: 5;
}
path:nth-of-type(4) {
  stroke-dashoffset: 5px;
}
path:nth-of-type(5) {
  stroke-dashoffset: 5%;
}
```

Theo thứ tự:

1. Đường dẫn đầu tiên trong số năm đường dẫn được cho độ lệch bằng không, đây là hành vi mặc định.
2. Đường dẫn thứ hai được cho độ lệch `-5`, dịch chuyển điểm bắt đầu của mảng đến năm đơn vị trước điểm không. Hiệu ứng hình ảnh là mẫu gạch bị đẩy về phía trước năm đơn vị; do đó, ở đầu đường dẫn, chúng ta thấy hai đơn vị cuối của một dấu gạch rồi đến một khoảng trống ba đơn vị.
3. Đường dẫn thứ ba có độ lệch `5`, có nghĩa là điểm bắt đầu của các dấu gạch là năm đơn vị vào trong mẫu gạch. Hiệu ứng hình ảnh là đẩy mẫu gạch về phía sau năm đơn vị; do đó, ở đầu đường dẫn, chúng ta thấy mười lăm đơn vị cuối của một dấu gạch tiếp theo là một khoảng trống ba đơn vị.
4. Đường dẫn thứ tư có độ lệch `5px`, có hiệu ứng tương tự như giá trị `5` (xem ở trên).
5. Đường dẫn thứ năm và cuối cùng có độ lệch `5%`, rất giống với hai ví dụ trước, nhưng không hoàn toàn giống. Phần trăm được tính theo số đo đường chéo của khung nhìn SVG, vì vậy có thể thay đổi tùy thuộc vào kích thước và tỷ lệ khung nhìn đó.

{{EmbedLiveSample("Dash offsetting", "500", "250")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("stroke-dashoffset")}}
- Thuộc tính CSS {{CSSxref("stroke-dasharray")}}
- Thuộc tính CSS {{CSSxref("stroke")}}
