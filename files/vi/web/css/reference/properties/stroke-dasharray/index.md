---
title: stroke-dasharray
slug: Web/CSS/Reference/Properties/stroke-dasharray
page-type: css-property
browser-compat: css.properties.stroke-dasharray
sidebar: cssref
---

Thuộc tính **`stroke-dasharray`** của [CSS](/vi/docs/Web/CSS) xác định một mẫu dấu gạch và khoảng trống được dùng trong việc vẽ nét viền của hình dạng [SVG](/vi/docs/Web/SVG). Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stroke-dasharray")}} của phần tử.

Thuộc tính này áp dụng cho bất kỳ hình dạng SVG hoặc phần tử nội dung văn bản nào (xem {{SVGAttr("stroke-dasharray")}} để biết danh sách đầy đủ), nhưng là một thuộc tính kế thừa, nó có thể được áp dụng cho các phần tử như {{SVGElement("g")}} và vẫn có hiệu lực mong muốn trên nét viền của các phần tử con.

## Cú pháp

```css
/* Từ khóa */
stroke-dasharray: none;

/* Giá trị số, độ dài và phần trăm */
stroke-dasharray: 2px, 5px;
stroke-dasharray: 20%, 50%;
stroke-dasharray: 2, 5;

/* Hai quy tắc sau tương đương nhau */
stroke-dasharray: 2, 5, 3;
stroke-dasharray: 2, 5, 3, 2, 5, 3;

/* Giá trị toàn cục */
stroke-dasharray: inherit;
stroke-dasharray: initial;
stroke-dasharray: revert;
stroke-dasharray: revert-layer;
stroke-dasharray: unset;
```

### Giá trị

Giá trị là một danh sách các giá trị `<number>`, `<length>`, và/hoặc `<percentage>` được phân tách bằng dấu phẩy và/hoặc khoảng trắng, xác định độ dài xen kẽ của dấu gạch và khoảng trống, hoặc từ khóa `none`. Nếu một số lẻ giá trị được cung cấp, toàn bộ giá trị sẽ được lặp lại theo thứ tự để đặt một số chẵn giá trị.

- `none`
  - : Nét viền sẽ được vẽ mà không có dấu gạch nào. Đây là giá trị mặc định.

- {{cssxref("&lt;number&gt;")}}
  - : Một số đơn vị SVG, kích thước của chúng được xác định bởi không gian đơn vị hiện tại. Các giá trị âm không hợp lệ.

- {{cssxref("&lt;length&gt;")}}
  - : Đơn vị pixel được xử lý giống như đơn vị SVG (xem `<number>` ở trên) và các độ dài dựa trên phông chữ như `em` được tính toán theo giá trị SVG của phần tử cho kích thước văn bản; hiệu ứng của các đơn vị độ dài khác có thể phụ thuộc vào trình duyệt. Các giá trị âm không hợp lệ.

- {{cssxref("&lt;percentage&gt;")}}
  - : Phần trăm tham chiếu đến đường chéo chuẩn hóa của khung nhìn SVG hiện tại, được tính là <math><mfrac><msqrt><mrow><msup><mi>&lt;width&gt;</mi><mn>2</mn></msup><mo>+</mo><msup><mi>&lt;height&gt;</mi><mn>2</mn></msup></mrow></msqrt><msqrt><mn>2</mn></msqrt></mfrac></math>. Các giá trị âm không hợp lệ.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Mảng gạch cơ bản

Ví dụ này trình bày cách sử dụng cơ bản của thuộc tính `stroke-dasharray` bằng cách sử dụng các giá trị `<number>` được phân tách bằng khoảng trắng.

#### HTML

Đầu tiên, chúng ta thiết lập một hình chữ nhật SVG cơ bản. Hình chữ nhật này được áp dụng nét viền đỏ với độ rộng `2`.

```html
<svg viewBox="0 0 100 50" width="500" height="250">
  <rect
    x="10"
    y="10"
    width="80"
    height="30"
    fill="none"
    stroke="red"
    stroke-width="2" />
</svg>
```

#### CSS

Chúng ta xác định mẫu gạch cho nét viền: mười đơn vị gạch, tiếp theo là năm đơn vị khoảng trống. Điều này có nghĩa là khoảng trống giữa các dấu gạch sẽ bằng một nửa độ dài của các dấu gạch.

```css
rect {
  stroke-dasharray: 10 5;
}
```

#### Kết quả

{{EmbedLiveSample("Basic dash array", "500", "250")}}

Khi nét viền rẽ quanh một góc, mẫu được tiếp tục theo đó. Ở góc trên bên trái, nơi đầu và cuối của nét viền gặp nhau, dấu gạch mười đơn vị ở đầu xuất hiện kết hợp với phần của mẫu gạch thấy ở cuối đường dẫn, tạo ra thứ trông giống như một đường dài hơn mười đơn vị bẻ cong quanh góc.

### Lặp lại mảng gạch

Ví dụ này bao gồm một số lẻ các giá trị `<number>` được phân tách bằng dấu phẩy để minh họa cách giá trị được lặp lại nếu một số lẻ giá trị được cung cấp để đặt một số chẵn giá trị.

#### HTML

Trong trường hợp này, chúng ta xác định hai hình chữ nhật.

```html
<svg viewBox="0 0 100 100" width="500" height="500">
  <rect
    x="10"
    y="10"
    width="80"
    height="30"
    fill="none"
    stroke="red"
    stroke-width="2" />
  <rect
    x="10"
    y="60"
    width="80"
    height="30"
    fill="none"
    stroke="red"
    stroke-width="2" />
</svg>
```

#### CSS

Cho hình chữ nhật đầu tiên, chúng ta xác định dasharray là `5, 5, 1`, yêu cầu năm đơn vị gạch, năm đơn vị khoảng trống và một đơn vị gạch. Tuy nhiên, vì đây là số lẻ số, toàn bộ tập hợp số được lặp lại, do đó tạo ra một giá trị giống hệt với giá trị được áp dụng cho hình chữ nhật thứ hai.

```css
rect:nth-of-type(1) {
  stroke-dasharray: 5, 5, 1;
}
rect:nth-of-type(2) {
  stroke-dasharray: 5, 5, 1, 5, 5, 1;
}
```

#### Kết quả

{{EmbedLiveSample("Dash array repetition", "500", "500")}}

Lý do cần một số chẵn là để mỗi mảng gạch bắt đầu bằng một dấu gạch và kết thúc bằng một khoảng trống. Do đó, mẫu được xác định là gạch năm đơn vị, khoảng trống năm đơn vị, gạch một đơn vị, khoảng trống năm đơn vị, gạch năm đơn vị và khoảng trống một đơn vị. Trong nét viền kết quả, mỗi trường hợp một khoảng trống một đơn vị giữa hai dấu gạch năm đơn vị cho thấy nơi mảng gạch bắt đầu lại.

### Giá trị phần trăm và pixel

Ví dụ này trình bày cách sử dụng giá trị `<percentage>` và `<length>` trong giá trị thuộc tính `stroke-dasharray`.

#### HTML

Như trong ví dụ trước, chúng ta xác định hai hình chữ nhật.

```html
<svg viewBox="0 0 100 100" width="500" height="500">
  <rect
    x="10"
    y="10"
    width="80"
    height="30"
    fill="none"
    stroke="red"
    stroke-width="2" />
  <rect
    x="10"
    y="60"
    width="80"
    height="30"
    fill="none"
    stroke="red"
    stroke-width="2" />
</svg>
```

#### CSS

Lần này, thay vì các tập hợp số trần, chúng ta sử dụng đơn vị pixel và phần trăm.

```css
rect:nth-of-type(1) {
  stroke-dasharray: 5px, 5px, 1px;
}
rect:nth-of-type(2) {
  stroke-dasharray: 5%, 5%, 1%;
}
```

#### Kết quả

{{EmbedLiveSample("Percentage and pixel values", "500", "500")}}

Kết quả về cơ bản không phân biệt được với kết quả trong ví dụ trước.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linecap")}}
- {{cssxref("stroke-linejoin")}}
- {{cssxref("stroke-miterlimit")}}
- {{cssxref("stroke-opacity")}}
- {{cssxref("stroke-width")}}
- {{cssxref("stroke")}}
- Thuộc tính SVG {{SVGAttr("stroke-dasharray")}}
