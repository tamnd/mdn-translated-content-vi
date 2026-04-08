---
title: font-synthesis
slug: Web/CSS/Reference/Properties/font-synthesis
page-type: css-shorthand-property
browser-compat: css.properties.font-synthesis
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`font-synthesis`** [CSS](/en-US/docs/Web/CSS) cho phép bạn chỉ định liệu trình duyệt có thể tổng hợp các kiểu chữ đậm, in nghiêng, chữ hoa nhỏ và/hoặc chỉ số dưới và trên khi chúng bị thiếu trong họ phông chữ được chỉ định hay không.

{{InteractiveExample("CSS Demo: font-synthesis")}}

```css interactive-example-choice
font-synthesis: weight style small-caps;
```

```css interactive-example-choice
font-synthesis: none;
```

```css interactive-example-choice
font-synthesis: weight;
```

```css interactive-example-choice
font-synthesis: style;
```

```css interactive-example-choice
font-synthesis: small-caps;
```

```css interactive-example-choice
font-synthesis: position;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <p class="english">
      This font does not include <span class="bold">bold</span>,
      <span class="italic">italic</span>,
      <span class="small-caps">small-caps</span>, and
      <span class="sub">subscript</span> or
      <span class="sup">superscript</span> variants.
    </p>
    <p class="chinese">
      中文排版通常不用<span class="bold">粗体</span>或<span class="italic"
        >斜体</span
      >，也不会使用<span class="small-caps">小型大写字母</span>和<span
        class="sub"
        >下标</span
      ><span class="sup">上标</span>变体。
    </p>
  </div>
</section>
```

```css interactive-example
@import "https://fonts.googleapis.com/css2?family=Oxygen&display=swap";
@import "https://fonts.googleapis.com/css2?family=Ma+Shan+Zheng&display=swap";

.english {
  font-size: 1.2em;
  font-family: "Oxygen", sans-serif;
}

.chinese {
  font-size: 1.2em;
  font-family: "Ma Shan Zheng", cursive;
}

.bold {
  font-weight: bold;
}

.italic {
  font-style: italic;
}

.small-caps {
  font-variant: small-caps;
}

.sub {
  font-variant: sub;
}

.sup {
  font-variant: super;
}
```

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- [font-synthesis-weight](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-weight)
- [font-synthesis-style](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-style)
- [font-synthesis-small-caps](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-small-caps)
- [font-synthesis-position](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-position)

## Cú pháp

```css
/* none hoặc một hoặc nhiều giá trị từ khóa khác */
font-synthesis: none;
font-synthesis: weight;
font-synthesis: style;
font-synthesis: position;
font-synthesis: small-caps style; /* các giá trị thuộc tính có thể theo bất kỳ thứ tự nào */
font-synthesis: style small-caps weight position; /* các giá trị thuộc tính có thể theo bất kỳ thứ tự nào */

/* Giá trị toàn cục */
font-synthesis: inherit;
font-synthesis: initial;
font-synthesis: revert;
font-synthesis: revert-layer;
font-synthesis: unset;
```

### Giá trị

- `none`
  - : Biểu thị rằng không có kiểu chữ đậm, in nghiêng, hoặc chữ hoa nhỏ nào có thể được trình duyệt tổng hợp.
- `weight`
  - : Biểu thị rằng kiểu chữ đậm còn thiếu có thể được trình duyệt tổng hợp nếu cần.
- `style`
  - : Biểu thị rằng kiểu chữ in nghiêng có thể được trình duyệt tổng hợp nếu cần.
- `small-caps`
  - : Biểu thị rằng kiểu chữ hoa nhỏ có thể được trình duyệt tổng hợp nếu cần.
- `position`
  - : Biểu thị rằng kiểu chữ chỉ số dưới và trên có thể được trình duyệt tổng hợp, nếu cần, khi sử dụng {{cssxref("font-variant-position")}}.

## Mô tả

Hầu hết các phông chữ phương Tây tiêu chuẩn đều bao gồm các biến thể in nghiêng và đậm, và một số phông chữ bao gồm các biến thể chữ hoa nhỏ và chỉ số dưới/trên. Tuy nhiên, nhiều phông chữ không có. Các phông chữ được sử dụng cho chữ Trung, Nhật, Hàn và các chữ viết ký tự học khác có xu hướng không bao gồm các biến thể này và việc tổng hợp chúng có thể làm giảm khả năng đọc hoặc thay đổi ý nghĩa của văn bản. Trong những trường hợp này, có thể nên tắt tổng hợp phông chữ mặc định của trình duyệt.

Ví dụ, sử dụng lớp giả [:lang()](/en-US/docs/Web/CSS/Reference/Selectors/:lang), bạn có thể vô hiệu hóa trình duyệt tổng hợp ký tự đậm và xiên cho một ngôn ngữ, trong trường hợp này là tiếng Ả Rập:

```css
*:lang(ar) {
  font-synthesis: none;
}
```

Bảng dưới đây cho thấy cách một giá trị của thuộc tính viết tắt `font-synthesis` ánh xạ đến các thuộc tính dài riêng lẻ.

| Giá trị font-synthesis             | Giá trị [font-synthesis-weight](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-weight) | Giá trị [font-synthesis-style](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-style) | Giá trị [font-synthesis-small-caps](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-small-caps) | Giá trị [font-synthesis-position](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-position) |
| :--------------------------------- | :---------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------------- |
| `none`                             | `none`                                                                                          | `none`                                                                                        | `none`                                                                                                  | `none`                                                                                              |
| `weight`                           | `auto`                                                                                          | `none`                                                                                        | `none`                                                                                                  | `none`                                                                                              |
| `style`                            | `none`                                                                                          | `auto`                                                                                        | `none`                                                                                                  | `none`                                                                                              |
| `small-caps`                       | `none`                                                                                          | `none`                                                                                        | `auto`                                                                                                  | `none`                                                                                              |
| `position`                         | `none`                                                                                          | `none`                                                                                        | `none`                                                                                                  | `auto`                                                                                              |
| `weight style`                     | `auto`                                                                                          | `auto`                                                                                        | `none`                                                                                                  | `none`                                                                                              |
| `weight small-caps`                | `auto`                                                                                          | `none`                                                                                        | `auto`                                                                                                  | `none`                                                                                              |
| `weight position`                  | `auto`                                                                                          | `none`                                                                                        | `none`                                                                                                  | `auto`                                                                                              |
| `style small-caps`                 | `none`                                                                                          | `auto`                                                                                        | `auto`                                                                                                  | `none`                                                                                              |
| `style position`                   | `none`                                                                                          | `auto`                                                                                        | `none`                                                                                                  | `auto`                                                                                              |
| `weight style small-caps`          | `auto`                                                                                          | `auto`                                                                                        | `auto`                                                                                                  | `none`                                                                                              |
| `weight style position`            | `auto`                                                                                          | `auto`                                                                                        | `none`                                                                                                  | `auto`                                                                                              |
| `weight small-caps position`       | `auto`                                                                                          | `none`                                                                                        | `auto`                                                                                                  | `auto`                                                                                              |
| `style small-caps position`        | `none`                                                                                          | `auto`                                                                                        | `auto`                                                                                                  | `auto`                                                                                              |
| `weight style small-caps position` | `auto`                                                                                          | `auto`                                                                                        | `auto`                                                                                                  | `auto`                                                                                              |

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Vô hiệu hóa tổng hợp phông chữ

Ví dụ này cho thấy hành vi tổng hợp phông chữ mặc định của trình duyệt và so sánh với khi hành vi tổng hợp bị tắt. Lưu ý rằng ví dụ sử dụng hai phông chữ được nhập để minh họa hành vi này. Bạn có thể không thể sao chép việc tắt tổng hợp phông chữ trên các phông chữ có sẵn theo mặc định trên hệ điều hành của bạn.

#### HTML

```html
<pre> DEFAULT </pre>
<p class="english">
  This font supports <strong>bold</strong> and <em>italic</em>.
</p>
<p class="chinese">这个字体支持<strong>加粗</strong>和<em>斜体</em></p>
<br />

<pre> SYNTHESIS IS DISABLED </pre>
<p class="english no-syn">
  This font supports <strong>bold</strong> and <em>italic.</em>
</p>
<p class="chinese no-syn">这个字体支持<strong>加粗</strong>和<em>斜体</em></p>
<br />

<pre> SYNTHESIS IS ENABLED </pre>
<p class="english">
  This font supports <strong>bold</strong> and <em>italic</em>.
</p>
<p class="chinese syn">这个字体支持<strong>加粗</strong>和<em>斜体</em></p>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Montserrat&display=swap";
@import "https://fonts.googleapis.com/css2?family=Ma+Shan+Zheng&display=swap";

.english {
  font-family: "Montserrat", sans-serif;
}
.chinese {
  font-family: "Ma Shan Zheng", cursive;
}
.no-syn {
  font-synthesis: none;
}
.syn {
  font-synthesis: style weight;
}
```

#### Kết quả

{{EmbedLiveSample('Disabling font synthesis', '', '400')}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-style")}}
- {{cssxref("font-weight")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-position")}}
