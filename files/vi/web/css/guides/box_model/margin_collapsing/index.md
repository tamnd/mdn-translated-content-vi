---
title: Mastering margin collapsing
short-title: Margin collapsing
slug: Web/CSS/Guides/Box_model/Margin_collapsing
page-type: guide
sidebar: cssref
---

Margin [trên](/en-US/docs/Web/CSS/Reference/Properties/margin-top) và [dưới](/en-US/docs/Web/CSS/Reference/Properties/margin-bottom) của các block đôi khi được kết hợp (gộp lại) thành một margin duy nhất có kích thước bằng margin lớn nhất trong số các margin riêng lẻ (hoặc chỉ một trong số chúng nếu chúng bằng nhau), hành vi này được gọi là **margin collapsing**. Lưu ý rằng margin của các phần tử [floating](/en-US/docs/Web/CSS/Reference/Properties/float) và [absolutely positioned](/en-US/docs/Web/CSS/Reference/Properties/position#types_of_positioning) không bao giờ collapse.

Margin collapsing xảy ra trong ba trường hợp cơ bản:

- Các phần tử anh em liền kề
  - : Margin của các phần tử anh em liền kề được gộp lại (trừ khi phần tử anh em phía sau cần được [cleared](/en-US/docs/Web/CSS/Reference/Properties/clear) qua các float).
- Không có nội dung ngăn cách giữa phần tử cha và con cháu
  - : Margin dọc giữa block cha và con cháu của nó có thể collapse. Điều này xảy ra khi không có nội dung ngăn cách giữa chúng. Cụ thể, điều này xảy ra trong hai trường hợp chính:
    - {{cssxref("margin-top")}} của phần tử cha collapse với {{cssxref("margin-top")}} của phần tử con đầu tiên trong luồng, trừ khi phần tử cha có {{cssxref("border-top")}}, {{cssxref("padding-top")}}, chứa nội dung inline (như văn bản), hoặc có _[clearance](/en-US/docs/Web/CSS/Reference/Properties/clear)_ được áp dụng.
    - {{cssxref("margin-bottom")}} của phần tử cha collapse với {{cssxref("margin-bottom")}} của phần tử con cuối cùng trong luồng, trừ khi phần tử cha có {{cssxref("height")}} hoặc {{cssxref("min-height")}} được xác định, có {{cssxref("border-bottom")}}, hoặc {{cssxref("padding-bottom")}}.

    Trong cả hai trường hợp, việc tạo một [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới trên phần tử cha cũng sẽ ngăn margin của nó collapse với các phần tử con.

- Block rỗng
  - : Nếu không có border, padding, nội dung inline, {{cssxref("height")}}, hoặc {{cssxref("min-height")}} để ngăn cách {{cssxref("margin-top")}} với {{cssxref("margin-bottom")}} của một block, thì margin trên và dưới của nó sẽ collapse.

Một số điểm cần lưu ý:

- Margin collapsing phức tạp hơn (của nhiều hơn hai margin) xảy ra khi các trường hợp trên được kết hợp.
- Các quy tắc này áp dụng ngay cả với margin bằng không, vì vậy margin của phần tử con cháu kết thúc ở bên ngoài phần tử cha của nó (theo các quy tắc trên) bất kể margin của phần tử cha có bằng không hay không.
- Khi margin âm liên quan, kích thước của margin đã collapse là tổng của margin dương lớn nhất và margin âm nhỏ nhất (âm nhất).
- Khi tất cả margin đều âm, kích thước của margin đã collapse là margin nhỏ nhất (âm nhất). Điều này áp dụng cho cả phần tử liền kề và phần tử lồng nhau.
- Margin collapsing chỉ liên quan đến chiều dọc.
- Margin không collapse trong container có `display` được đặt thành `flex` hoặc `grid`.

## Ví dụ

### HTML

```html
<p>The bottom margin of this paragraph is collapsed …</p>
<p>
  … with the top margin of this paragraph, yielding a margin of
  <code>1.2rem</code> in between.
</p>

<div>
  This parent element contains two paragraphs!
  <p>
    This paragraph has a <code>.4rem</code> margin between it and the text
    above.
  </p>
  <p>
    My bottom margin collapses with my parent, yielding a bottom margin of
    <code>2rem</code>.
  </p>
</div>

<p>I am <code>2rem</code> below the element above.</p>
```

### CSS

```css
div {
  margin: 2rem 0;
  background: lavender;
}

p {
  margin: 0.4rem 0 1.2rem 0;
  background: yellow;
}
```

### Kết quả

{{EmbedLiveSample('Examples', 'auto', 350)}}

## Xem thêm

- Module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)
- [Giới thiệu về CSS box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Các khái niệm chính trong CSS:
  - [Cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
  - [At-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
  - [Chú thích](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
  - [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
  - [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
  - [Các chế độ layout](/en-US/docs/Glossary/Layout_mode)
  - [Mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
  - Giá trị:
    - [Giá trị khởi tạo](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
    - [Giá trị đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
    - [Giá trị đã dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)
    - [Giá trị thực tế](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
  - [Cú pháp định nghĩa giá trị](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
  - [Shorthand properties](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
  - {{glossary("Replaced elements")}}
