---
title: text-underline-position
slug: Web/CSS/Reference/Properties/text-underline-position
page-type: css-property
browser-compat: css.properties.text-underline-position
sidebar: cssref
---

Thuộc tính **`text-underline-position`** [CSS](/en-US/docs/Web/CSS) xác định vị trí của đường gạch chân được đặt bằng giá trị `underline` của thuộc tính {{cssxref("text-decoration")}}.

{{InteractiveExample("CSS Demo: text-underline-position")}}

```css interactive-example-choice
text-underline-position: auto;
```

```css interactive-example-choice
text-underline-position: under;
```

```html interactive-example
<section id="default-example">
  <p>
    <span class="transition-all" id="example-element"
      >C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub></span
    >
    is the chemical formula for caffeine.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}

#example-element {
  text-decoration-line: underline;
}
```

## Cú pháp

```css
/* Từ khóa đơn */
text-underline-position: auto;
text-underline-position: under;
text-underline-position: left;
text-underline-position: right;

/* Nhiều từ khóa */
text-underline-position: under left;
text-underline-position: right under;

/* Giá trị toàn cục */
text-underline-position: inherit;
text-underline-position: initial;
text-underline-position: revert;
text-underline-position: revert-layer;
text-underline-position: unset;
```

### Giá trị

- `auto`
  - : {{glossary("user agent")}} sử dụng thuật toán riêng của nó để đặt đường tại hoặc dưới {{glossary("/Baseline/Typography", "đường cơ sở chữ cái")}}.
- `from-font`
  - : Nếu tệp phông chữ bao gồm thông tin về vị trí ưu tiên, hãy sử dụng giá trị đó. Nếu tệp phông chữ không bao gồm thông tin này, hành xử như thể `auto` được đặt, với trình duyệt chọn vị trí thích hợp.
- `under`
  - : Buộc đường phải được đặt dưới đường cơ sở chữ cái, ở vị trí mà nó sẽ không cắt qua bất kỳ nét xuống nào. Điều này hữu ích để đảm bảo khả năng đọc cho các công thức hóa học và toán học, vốn sử dụng nhiều chỉ số dưới.
- `left`
  - : Trong các chế độ viết dọc, từ khóa này buộc đường phải được đặt ở _bên trái_ của văn bản. Trong các chế độ viết ngang, nó là từ đồng nghĩa của `auto`.
- `right`
  - : Trong các chế độ viết dọc, từ khóa này buộc đường phải được đặt ở _bên phải_ của văn bản. Trong các chế độ viết ngang, nó là từ đồng nghĩa của `auto`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Chúng ta tạo hai đoạn văn ví dụ:

```html
<p class="horizontal">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur ac
  turpis vel laoreet. Nullam volutpat pharetra lorem, sit amet feugiat tortor
  volutpat quis. Nam eget sodales quam. Aliquam accumsan tellus ac erat posuere.
</p>

<p class="vertical">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur ac
  turpis vel laoreet. Nullam volutpat pharetra lorem, sit amet feugiat tortor
  volutpat quis. Nam eget sodales quam. Aliquam accumsan tellus ac erat posuere.
</p>
```

CSS của chúng ta trông như sau:

```css
p {
  font-size: 1.5rem;
  text-transform: capitalize;
  text-decoration: underline;
  text-decoration-thickness: 2px;
}

.horizontal {
  text-underline-position: under;
}

.vertical {
  writing-mode: vertical-rl;
  text-underline-position: left;
}
```

Trong ví dụ này, chúng ta đặt cả hai đoạn văn có gạch chân dày. Trong văn bản ngang, chúng ta dùng `text-underline-position: under;` để đặt gạch chân bên dưới tất cả các nét xuống.

Trong văn bản có {{cssxref("writing-mode")}} dọc được đặt, chúng ta có thể dùng các giá trị `left` hoặc `right` để làm cho gạch chân xuất hiện ở bên trái hoặc bên phải của văn bản theo yêu cầu.

Ví dụ trực tiếp trông như thế này:

{{EmbedLiveSample('A_basic_example', '100%', 600)}}

### Đặt text-underline-position toàn cục

Vì thuộc tính `text-underline-position` được kế thừa và không được đặt lại bởi thuộc tính viết tắt {{cssxref("text-decoration")}}, có thể thích hợp để đặt giá trị của nó ở cấp độ toàn cục. Ví dụ, giá trị `under` có thể phù hợp cho một tài liệu có nhiều công thức hóa học và toán học, vốn sử dụng nhiều chỉ số dưới.

```css
:root {
  text-underline-position: under;
}
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("text-decoration")}} là viết tắt để đặt hầu hết các thuộc tính trang trí văn bản, bao gồm {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-color")}}, và {{cssxref("text-decoration-style")}}. Tuy nhiên, nó không đặt `text-underline-position`.
