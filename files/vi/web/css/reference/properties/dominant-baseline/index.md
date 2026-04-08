---
title: dominant-baseline
slug: Web/CSS/Reference/Properties/dominant-baseline
page-type: css-property
browser-compat: css.properties.dominant-baseline
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`dominant-baseline`** chỉ định [đường cơ sở](/en-US/docs/Glossary/Baseline/Typography) cụ thể được dùng để căn chỉnh văn bản và nội dung cấp nội tuyến của hộp. Nó cũng cho biết đường cơ sở căn chỉnh mặc định của bất kỳ hộp nào tham gia căn chỉnh đường cơ sở trong ngữ cảnh căn chỉnh của hộp. Nếu có, nó ghi đè thuộc tính {{SVGAttr("dominant-baseline")}} của hình.

Các đường cơ sở được chọn từ bảng đường cơ sở phông chữ. Nếu không có bảng đường cơ sở trong phông chữ danh nghĩa, hoặc nếu bảng đường cơ sở thiếu mục nhập cho đường cơ sở mong muốn, thì trình duyệt có thể sử dụng heuristic để xác định vị trí của đường cơ sở mong muốn.

Thuộc tính `dominant-baseline` được dùng để xác định hoặc xác định lại _bảng-đường-cơ-sở-đã-chia-tỉ-lệ_. Bảng-đường-cơ-sở-đã-chia-tỉ-lệ là một giá trị hợp thành với ba thành phần:

1. một định danh đường cơ sở cho đường cơ sở chủ đạo,
2. một bảng đường cơ sở, và
3. kích thước phông chữ của bảng đường cơ sở.

Một số giá trị của `dominant-baseline` xác định lại cả ba giá trị. Các giá trị khác chỉ tái thiết lập kích thước phông chữ bảng đường cơ sở. Khi giá trị khởi tạo, `auto`, cho kết quả không mong muốn, thuộc tính này có thể được dùng để đặt rõ ràng bảng-đường-cơ-sở-đã-chia-tỉ-lệ mong muốn.

> [!NOTE]
> Thuộc tính `dominant-baseline` chỉ có tác dụng trên các phần tử SVG {{SVGElement("text")}}, {{SVGElement("textPath")}}, và {{SVGElement("tspan")}}.

## Cú pháp

```css
/* Giá trị khởi tạo */
dominant-baseline: auto;

/* Giá trị từ khóa */
dominant-baseline: alphabetic;
dominant-baseline: central;
dominant-baseline: hanging;
dominant-baseline: ideographic;
dominant-baseline: mathematical;
dominant-baseline: middle;
dominant-baseline: text-bottom;
dominant-baseline: text-top;

/* Giá trị toàn cục */
dominant-baseline: inherit;
dominant-baseline: initial;
dominant-baseline: revert;
dominant-baseline: revert-layer;
dominant-baseline: unset;
```

### Giá trị

- `auto`
  - : Nếu thuộc tính này được áp dụng cho phần tử {{SVGElement("text")}}, thì giá trị được tính toán phụ thuộc vào giá trị của thuộc tính {{SVGAttr("writing-mode")}}.

    Nếu {{SVGAttr("writing-mode")}} là ngang, thì giá trị của thành phần dominant-baseline là `alphabetic`. Nếu không, nếu {{SVGAttr("writing-mode")}} là dọc, thì giá trị của thành phần dominant-baseline là `central`.

    Nếu thuộc tính này được áp dụng cho phần tử {{SVGElement("tspan")}} hoặc {{SVGElement("textPath")}}, thì thành phần dominant-baseline và bảng đường cơ sở vẫn giống với phần tử nội dung văn bản cha.

    Nếu giá trị {{SVGAttr("baseline-shift")}} được tính toán thực sự dịch chuyển đường cơ sở, thì thành phần kích thước phông chữ bảng đường cơ sở được đặt về giá trị thuộc tính {{SVGAttr("font-size")}} trên phần tử mà thuộc tính `dominant-baseline` xuất hiện, nếu không thì kích thước phông chữ bảng đường cơ sở vẫn giữ nguyên như của phần tử đó.

    Nếu không có phần tử nội dung văn bản cha, giá trị bảng-đường-cơ-sở-đã-chia-tỉ-lệ được xây dựng như cho các phần tử {{SVGElement("text")}}.

- `alphabetic`
  - : Định danh đường cơ sở cho dominant-baseline được đặt là `alphabetic`, bảng đường cơ sở dẫn xuất được xây dựng bằng bảng đường cơ sở `alphabetic` trong phông chữ, và kích thước phông chữ bảng đường cơ sở được thay đổi về giá trị của thuộc tính SVG {{SVGAttr('font-size')}} hoặc CSS {{cssxref('font-size')}} của phần tử, nếu có.
- `central`
  - : Định danh đường cơ sở cho dominant-baseline được đặt là `central`. Bảng đường cơ sở dẫn xuất được xây dựng từ các đường cơ sở được xác định trong bảng đường cơ sở của phông chữ. Bảng đường cơ sở phông chữ đó được chọn theo thứ tự ưu tiên sau: `ideographic`, `alphabetic`, `hanging`, `mathematical`. Kích thước phông chữ bảng đường cơ sở được thay đổi về giá trị của thuộc tính SVG {{SVGAttr('font-size')}} hoặc CSS {{cssxref('font-size')}} của phần tử, nếu có.
- `hanging`
  - : Định danh đường cơ sở cho dominant-baseline được đặt là `hanging`, bảng đường cơ sở dẫn xuất được xây dựng bằng bảng đường cơ sở `hanging` trong phông chữ, và kích thước phông chữ bảng đường cơ sở được thay đổi về giá trị của thuộc tính SVG {{SVGAttr('font-size')}} hoặc thuộc tính CSS {{cssxref('font-size')}} trên phần tử này.
- `ideographic`
  - : Định danh đường cơ sở cho dominant-baseline được đặt là `ideographic`, bảng đường cơ sở dẫn xuất được xây dựng bằng bảng đường cơ sở `ideographic` trong phông chữ, và kích thước phông chữ bảng đường cơ sở được thay đổi về giá trị của thuộc tính SVG {{SVGAttr('font-size')}} hoặc CSS {{cssxref('font-size')}} của phần tử, nếu có.
- `mathematical`
  - : Định danh đường cơ sở cho dominant-baseline được đặt là `mathematical`, bảng đường cơ sở dẫn xuất được xây dựng bằng bảng đường cơ sở `mathematical` trong phông chữ, và kích thước phông chữ bảng đường cơ sở được thay đổi về giá trị của thuộc tính SVG {{SVGAttr('font-size')}} hoặc CSS {{cssxref('font-size')}} của phần tử, nếu có.
- `middle`
  - : Định danh đường cơ sở cho dominant-baseline được đặt là `middle`. Bảng đường cơ sở dẫn xuất được xây dựng từ các đường cơ sở được xác định trong bảng đường cơ sở của phông chữ. Bảng đường cơ sở phông chữ đó được chọn theo thứ tự ưu tiên sau: `ideographic`, `alphabetic`, `hanging`, `mathematical`. Kích thước phông chữ bảng đường cơ sở được thay đổi về giá trị của thuộc tính SVG {{SVGAttr('font-size')}} hoặc CSS {{cssxref('font-size')}} của phần tử, nếu có.
- `text-bottom`
  - : Cạnh _line-under_ được dùng làm đường cơ sở, thường là cạnh dưới của hộp em của phông chữ.
- `text-top`
  - : Cạnh _line-over_ được dùng làm đường cơ sở, thường là cạnh trên của hộp em của phông chữ.

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
  <text x="0" y="20" fill="red">auto</text>
  <text x="0" y="60" fill="red">auto</text>
  <text x="0" y="100" fill="red">auto</text>
  <text x="0" y="140" fill="red">auto</text>
</svg>
```

```css
text {
  font-size: 20px;
}
text:nth-of-type(1) {
  dominant-baseline: alphabetic;
}
text:nth-of-type(2) {
  dominant-baseline: central;
}
text:nth-of-type(3) {
  dominant-baseline: hanging;
}
text:nth-of-type(4) {
  dominant-baseline: ideographic;
}
text:nth-of-type(5) {
  dominant-baseline: mathematical;
}
text:nth-of-type(6) {
  dominant-baseline: middle;
}
text:nth-of-type(7) {
  dominant-baseline: text-bottom;
}
text:nth-of-type(8) {
  dominant-baseline: text-top;
}
```

{{EmbedLiveSample("Example", "750", "220")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('alignment-baseline')}}
- {{cssxref('text-anchor')}}
- {{cssxref('vertical-align')}}
- Thuộc tính SVG {{SVGAttr('dominant-baseline')}}
