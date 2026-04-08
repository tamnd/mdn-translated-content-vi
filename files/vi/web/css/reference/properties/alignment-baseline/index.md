---
title: alignment-baseline
slug: Web/CSS/Reference/Properties/alignment-baseline
page-type: css-property
browser-compat: css.properties.alignment-baseline
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`alignment-baseline`** xác định [đường cơ sở](/en-US/docs/Glossary/Baseline/Typography) cụ thể được dùng để căn chỉnh văn bản và nội dung cấp nội tuyến của hộp. **Căn chỉnh đường cơ sở** là mối quan hệ giữa các đường cơ sở của nhiều đối tượng căn chỉnh trong một ngữ cảnh căn chỉnh. Khi thực hiện căn chỉnh đường cơ sở, giá trị thuộc tính `alignment-baseline` xác định đường cơ sở nào của hộp được căn chỉnh với đường cơ sở tương ứng trong ngữ cảnh căn chỉnh của nó.

> [!NOTE]
> Thuộc tính `alignment-baseline` chỉ có hiệu lực trên các hộp cấp nội tuyến, flex item, grid item, ô bảng, và các phần tử SVG {{SVGElement("text")}}, {{SVGElement("textPath")}}, và {{SVGElement("tspan")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("alignment-baseline")}} của hình dạng.

Trong ngữ cảnh định dạng nội tuyến, các đoạn hộp cấp nội tuyến và glyph chia sẻ ngữ cảnh căn chỉnh được thiết lập bởi đoạn hộp nội tuyến cha của chúng dọc theo trục nội tuyến. Trong bố cục văn bản SVG, các giá trị này thay vào đó xác định đường cơ sở được căn chỉnh với vị trí văn bản hiện tại trong SVG.

## Cú pháp

```css
/* Giá trị ban đầu */
alignment-baseline: baseline;

/* Giá trị từ khóa */
alignment-baseline: alphabetic;
alignment-baseline: central;
alignment-baseline: ideographic;
alignment-baseline: mathematical;
alignment-baseline: middle;
alignment-baseline: text-bottom;
alignment-baseline: text-top;

/* Giá trị được ánh xạ */
alignment-baseline: text-before-edge; /* text-top */
alignment-baseline: text-after-edge; /* text-bottom */

/* Giá trị không dùng nữa  */
alignment-baseline: auto;
alignment-baseline: before-edge;
alignment-baseline: after-edge;
alignment-baseline: hanging;

/* Giá trị toàn cục */
alignment-baseline: inherit;
alignment-baseline: initial;
alignment-baseline: revert;
alignment-baseline: revert-layer;
alignment-baseline: unset;
```

### Giá trị

- `baseline`
  - : Sử dụng giá trị {{cssxref("dominant-baseline")}} của phần tử cha.

- `alphabetic`
  - : Được dùng khi viết chữ Latin, Cyrillic, Greek, và nhiều chữ viết khác; khớp đường cơ sở chữ cái của hộp với đường cơ sở của phần tử cha, tương ứng với phần dưới của hầu hết, nhưng không phải tất cả các ký tự.

- `central`
  - : Khớp đường cơ sở trung tâm của hộp với đường cơ sở trung tâm của phần tử cha, tương ứng với đường cơ sở trung tâm biểu ý, nằm giữa đường cơ sở ideographic-under và ideographic-over.

- `ideographic`
  - : Khớp đường cơ sở phía dưới mặt ký tự biểu ý của hộp với đường cơ sở của phần tử cha, với bảng đường cơ sở được tạo ra bằng cách sử dụng bảng đường cơ sở biểu ý trong font chữ.

- `mathematical`
  - : Khớp đường cơ sở toán học của hộp với đường cơ sở của phần tử cha, tương ứng với đường cơ sở trung tâm mà các ký tự toán học được thiết kế xung quanh.

- `middle`
  - : Căn chỉnh điểm giữa theo chiều dọc của hộp với đường cơ sở của hộp cha cộng với một nửa x-height của cha. Sử dụng đường cơ sở x-middle; ngoại trừ dưới [`text-orientation: upright;`](/en-US/docs/Web/CSS/Reference/Properties/text-orientation) (nơi các đường cơ sở chữ cái và x-height về cơ bản vô nghĩa), trong trường hợp đó nó sử dụng đường cơ sở `central` thay thế.

- `text-bottom`
  - : Khớp phần dưới của hộp với phần trên của vùng nội dung của cha, sử dụng cạnh line-under của hộp nội dung nội tuyến.

- `text-top`
  - : Khớp phần trên của hộp với phần trên của vùng nội dung của cha; cạnh line-over của hộp nội dung nội tuyến.

> [!NOTE]
> Trong SVG2, `auto`, `before-edge`, và `after-edge` đã không còn được dùng nữa và `text-before-edge` là bí danh cho `text-top`, còn `text-after-edge` là bí danh cho `text-bottom`. Các từ khóa này không nên được dùng như một phần của thuộc tính viết tắt {{cssxref("vertical-align")}}. Các trình duyệt hỗ trợ `auto` như từ đồng nghĩa với `baseline` và `hanging`, trong đó điểm căn chỉnh của đối tượng được căn chỉnh được căn chỉnh với đường cơ sở "hanging" của phần tử nội dung văn bản cha, nhưng cả hai đều không thuộc đặc tả.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

```html
<svg viewBox="0 0 450 160" width="700" height="200">
  <text x="50" y="20">alphabetic</text>
  <text x="50" y="60">central</text>
  <text x="50" y="100">hanging</text>
  <text x="50" y="140">ideographic</text>
  <text x="250" y="20">mathematical</text>
  <text x="250" y="60">middle</text>
  <text x="250" y="100">text-bottom</text>
  <text x="250" y="140">text-top</text>
  <path
    d="M   0,20 l 400,0
       m -400,40 l 400,0
       m -400,40 l 400,0
       m -400,40 l 400,0"
    stroke="grey" />
  <text x="0" y="20" fill="red">baseline</text>
  <text x="0" y="60" fill="red">baseline</text>
  <text x="0" y="100" fill="red">baseline</text>
  <text x="0" y="140" fill="red">baseline</text>
</svg>
```

```css
text {
  font-size: 20px;
  alignment-baseline: baseline;
}
text:nth-of-type(1) {
  alignment-baseline: alphabetic;
}
text:nth-of-type(2) {
  alignment-baseline: central;
}
text:nth-of-type(3) {
  alignment-baseline: hanging;
}
text:nth-of-type(4) {
  alignment-baseline: ideographic;
}
text:nth-of-type(5) {
  alignment-baseline: mathematical;
}
text:nth-of-type(6) {
  alignment-baseline: middle;
}
text:nth-of-type(7) {
  alignment-baseline: text-bottom;
}
text:nth-of-type(8) {
  alignment-baseline: text-top;
}
```

{{EmbedLiveSample("Example", "750", "220")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("dominant-baseline")}}
- Thuộc tính SVG {{SVGAttr("alignment-baseline")}}
- Module [Bố cục nội tuyến CSS](/en-US/docs/Web/CSS/Guides/Inline_layout)
- Module [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
