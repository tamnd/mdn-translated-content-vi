---
title: :not()
slug: Web/CSS/Reference/Selectors/:not
page-type: css-pseudo-class
browser-compat: css.selectors.not
sidebar: cssref
---

Lớp giả **`:not()`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) đại diện cho các phần tử không khớp với danh sách bộ chọn. Vì nó ngăn các mục cụ thể được chọn, nên nó được gọi là _lớp giả phủ định_.

{{InteractiveExample("CSS Demo: :not", "tabbed-shorter")}}

```css interactive-example
p:not(.irrelevant) {
  font-weight: bold;
}

p > strong,
p > b.important {
  color: crimson;
}

p > :not(strong, b.important) {
  color: darkmagenta;
}
```

```html interactive-example
<p>
  <b>Mars</b> is one of the most Earth-like planets. <b>Mars</b> day is almost
  the same as an Earth day, only <strong>37 minutes</strong> longer.
</p>

<p class="irrelevant">
  <b class="important">NASA</b>'s Jet <del>Momentum</del> Propulsion Laboratory
  is designing mission concepts to survive the <b>Venus</b> extreme temperatures
  and atmospheric pressure.
</p>
```

Lớp giả `:not()` có một số [điều kỳ lạ, thủ thuật và kết quả bất ngờ](#mô-tả) mà bạn nên biết trước khi sử dụng.

## Cú pháp

```css-nolint
:not(<complex-selector-list>) {
  /* ... */
}
```

### Tham số

Lớp giả `:not()` yêu cầu một [danh sách bộ chọn](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#selector_list), một danh sách được phân tách bằng dấu phẩy gồm một hoặc nhiều bộ chọn, làm đối số. Danh sách không được chứa [phần tử giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements), nhưng mọi bộ chọn đơn giản, hợp chất và phức tạp khác đều được phép.

## Mô tả

Có một số hiệu ứng và kết quả bất thường khi sử dụng `:not()` mà bạn nên lưu ý:

- Các bộ chọn vô dụng có thể được viết bằng lớp giả này. Ví dụ, `:not(*)` khớp với bất kỳ phần tử nào không phải là phần tử, điều này rõ ràng là vô nghĩa, vì vậy quy tắc đi kèm sẽ không bao giờ được áp dụng.
- Lớp giả này có thể tăng [độ đặc hiệu](/vi/docs/Web/CSS/Guides/Cascade/Specificity) của một quy tắc. Ví dụ, `#foo:not(#bar)` sẽ khớp với cùng phần tử như `#foo` đơn giản hơn, nhưng có độ đặc hiệu cao hơn của hai bộ chọn `id`.
- Độ đặc hiệu của lớp giả `:not()` được thay thế bằng độ đặc hiệu của bộ chọn cụ thể nhất trong đối số danh sách bộ chọn được phân tách bằng dấu phẩy; cung cấp cùng độ đặc hiệu như khi được viết [`:not(:is(argument))`](/vi/docs/Web/CSS/Reference/Selectors/:is).
- `:not(.foo)` sẽ khớp với bất kỳ thứ gì không phải là `.foo`, _bao gồm {{HTMLElement("html")}} và {{HTMLElement("body")}}._
- Bộ chọn này sẽ khớp với mọi thứ "không phải là X". Điều này có thể gây ngạc nhiên khi được sử dụng với [bộ kết hợp hậu duệ](/vi/docs/Web/CSS/Reference/Selectors/Descendant_combinator), vì có nhiều đường dẫn để chọn một phần tử đích. Ví dụ, `body :not(table) a` vẫn sẽ áp dụng cho các liên kết bên trong {{HTMLElement("table")}}, vì {{HTMLElement("tr")}}, {{HTMLElement("tbody")}}, {{HTMLElement("th")}}, {{HTMLElement("td")}}, {{HTMLElement("caption")}}, v.v. đều có thể khớp với phần `:not(table)` của bộ chọn. Để tránh điều này, bạn có thể sử dụng `body a:not(table a)` thay thế, sẽ chỉ áp dụng cho các liên kết không phải là hậu duệ của một bảng.
- Bạn có thể phủ định nhiều bộ chọn cùng một lúc. Ví dụ: `:not(.foo, .bar)` tương đương với `:not(.foo):not(.bar)`.
- Nếu bất kỳ bộ chọn nào được truyền vào lớp giả `:not()` không hợp lệ hoặc không được trình duyệt hỗ trợ, toàn bộ quy tắc sẽ bị vô hiệu. Cách hiệu quả để khắc phục hành vi này là sử dụng lớp giả [`:is()`](/vi/docs/Web/CSS/Reference/Selectors/:is), chấp nhận danh sách bộ chọn tha thứ. Ví dụ `:not(.foo, :invalid-pseudo-class)` sẽ vô hiệu hóa toàn bộ quy tắc, nhưng `:not(:is(.foo, :invalid-pseudo-class))` sẽ khớp với bất kỳ (_bao gồm {{HTMLElement("html")}} và {{HTMLElement("body")}}_) phần tử nào không phải là `.foo`.

## Ví dụ

### Sử dụng :not() với các bộ chọn hợp lệ

Ví dụ này cho thấy một số cách sử dụng `:not()`.

#### HTML

```html
<p>I am a paragraph.</p>
<p class="fancy">I am so very fancy!</p>
<div>I am NOT a paragraph.</div>
<h2>
  <span class="foo">foo inside h2</span>
  <span class="bar">bar inside h2</span>
</h2>
```

#### CSS

```css
.fancy {
  text-shadow: 2px 2px 3px gold;
}

/* <p> elements that don't have a class `.fancy` */
p:not(.fancy) {
  color: green;
}

/* Elements that are not <p> elements */
body :not(p) {
  text-decoration: underline;
}

/* Elements that are not <div>s or `.fancy` */
body :not(div):not(.fancy) {
  font-weight: bold;
}

/* Elements that are not <div>s or `.fancy` */
body :not(div, .fancy) {
  text-decoration: overline underline;
}

/* Elements inside an <h2> that aren't a <span> with a class of `.foo` */
h2 :not(span.foo) {
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('Using_not_with_valid_selectors', '100%', 320)}}

### Sử dụng :not() với các bộ chọn không hợp lệ

Ví dụ này cho thấy cách sử dụng `:not()` với các bộ chọn không hợp lệ và cách ngăn chặn việc vô hiệu hóa.

#### HTML

```html
<p class="foo">I am a paragraph with .foo</p>
<p class="bar">I am a paragraph with .bar</p>
<div>I am a div without a class</div>
<div class="foo">I am a div with .foo</div>
<div class="bar">I am a div with .bar</div>
<div class="foo bar">I am a div with .foo and .bar</div>
```

#### CSS

```css
/* Invalid rule, does nothing */
p:not(.foo, :invalid-pseudo-class) {
  color: red;
  font-style: italic;
}

/* Select all <p> elements without the `foo` class */
p:not(:is(.foo, :invalid-pseudo-class)) {
  color: green;
  border-top: dotted thin currentColor;
}

/* Select all <div> elements without the `foo` or the `bar` class */
div:not(.foo, .bar) {
  color: red;
  font-style: italic;
}

/* Select all <div> elements without the `foo` or the `bar` class */
div:not(:is(.foo, .bar)) {
  border-bottom: dotted thin currentColor;
}
```

#### Kết quả

{{EmbedLiveSample('Using_not_with_invalid_selectors', '100%', 320)}}

Quy tắc `p:not(.foo, :invalid-pseudo-class)` không hợp lệ vì nó chứa một bộ chọn không hợp lệ. Lớp giả `:is()` chấp nhận danh sách bộ chọn tha thứ, vì vậy quy tắc `:is(.foo, :invalid-pseudo-class)` hợp lệ và tương đương với `:is(.foo)`. Do đó, quy tắc `p:not(:is(.foo, :invalid-pseudo-class))` hợp lệ và tương đương với `p:not(.foo)`.

Nếu `:invalid-pseudo-class` là một bộ chọn hợp lệ, hai quy tắc đầu tiên ở trên vẫn sẽ tương đương (hai quy tắc cuối cùng minh họa điều đó). Việc sử dụng `:is()` làm cho quy tắc mạnh mẽ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
- [Học: Lớp giả và phần tử giả](/vi/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
- Các lớp giả CSS hàm khác:
  - {{cssxref(":has()")}}
  - {{cssxref(":is()")}}
  - {{cssxref(":where()")}}

- [How :not() chains multiple selectors](/en-US/blog/css-not-pseudo-multiple-selectors/) on MDN blog (2023)
