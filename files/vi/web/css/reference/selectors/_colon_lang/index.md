---
title: :lang()
slug: Web/CSS/Reference/Selectors/:lang
page-type: css-pseudo-class
browser-compat: css.selectors.lang
sidebar: cssref
---

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:lang()`** khớp với các phần tử dựa trên ngôn ngữ được xác định cho chúng.

{{InteractiveExample("CSS Demo: :lang()", "tabbed-shorter")}}

```css interactive-example
*:lang(en-US) {
  outline: 2px solid deeppink;
}
```

```html interactive-example
<p lang="en-US">
  Music during road trips and long commutes aren't a problem, but using
  headphones isn't the best thing to do while driving in your car.
</p>

<p lang="pl-PL">
  Gdy widzimy znak z narysowaną czaszką i napisem
  <strong lang="en-US">DANGER</strong> to lepiej nie wchodzić do środka.
</p>
```

> [!NOTE]
> Trong HTML, ngôn ngữ được xác định bởi tổ hợp thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang), phần tử {{HTMLElement("meta")}}, và có thể là thông tin từ giao thức (chẳng hạn các HTTP header). Với các loại tài liệu khác, có thể có những phương pháp tài liệu khác để xác định ngôn ngữ.

## Cú pháp

```plain
:lang(<language-code> [,<language-code> ]*) {
  /* ... */
}
```

### Tham số

- `<language-code>`
  - : Danh sách phân cách bằng dấu phẩy gồm một hoặc nhiều {{cssxref("&lt;string&gt;")}} nhắm đến các phần tử dựa trên các {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} được đặt trong thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của chúng.
    Khớp theo phạm vi ngôn ngữ không phân biệt chữ hoa/thường.

## Mô tả

Khi chọn ngôn ngữ, có khớp wildcard ngầm định, vì vậy `:lang(de-DE)` sẽ khớp với `de-DE`, `de-DE-1996`, `de-Latn-DE`, `de-Latf-DE` và `de-Latn-DE-1996`.
Khi dùng wildcard tường minh phải bao gồm khớp đầy đủ của một subtag ngôn ngữ, vì vậy `:lang("*-F*")` không hợp lệ nhưng `:lang("*-Fr")` thì hợp lệ.

## Ví dụ

### Khớp các phần tử con của một ngôn ngữ nhất định

Trong ví dụ này, lớp giả `:lang()` được dùng để khớp với phần tử cha của các phần tử trích dẫn ({{htmlElement("q")}}) dùng [bộ kết hợp con](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator). Lưu ý rằng đây không phải cách duy nhất để làm điều này, và phương pháp tốt nhất phụ thuộc vào loại tài liệu. Cũng lưu ý rằng các giá trị {{glossary("Unicode")}} được dùng để chỉ định một số ký tự trích dẫn đặc biệt.

#### HTML

```html
<div lang="en">
  <q>This English quote has a <q>nested</q> quote inside.</q>
</div>
<div lang="fr">
  <q>This French quote has a <q>nested</q> quote inside.</q>
</div>
<div lang="de">
  <q>This German quote has a <q>nested</q> quote inside.</q>
</div>
```

#### CSS

```css
:lang(en) > q {
  quotes: "\201C" "\201D" "\2018" "\2019";
}
:lang(fr) > q {
  quotes: "« " " »";
}
:lang(de) > q {
  quotes: "»" "«" "\2039" "\203A";
}
```

#### Kết quả

{{EmbedLiveSample('Matching_children_of_a_given_language', '', '80')}}

### Khớp nhiều ngôn ngữ

Ví dụ sau đây minh họa cách khớp nhiều ngôn ngữ bằng cách cung cấp danh sách mã ngôn ngữ phân cách bằng dấu phẩy.
Cũng có thể dùng wildcard để khớp các ngôn ngữ trong một phạm vi ngôn ngữ nhất định.

```css hidden
p {
  margin: 0;
}
```

#### CSS

```css
/* Matches nl and de */
:lang("nl", "de") {
  color: green;
}

/* Omitting quotes & case-insensitive matching */
:lang(EN, FR) {
  color: blue;
}

/* Wildcard matching a language range */
:lang("*-Latn") {
  color: red;
}
```

#### HTML

```html
<p lang="nl">Dit is een Nederlandse paragraaf.</p>
<p lang="de">Dies ist ein deutscher Satz.</p>
<p lang="en">This is an English sentence.</p>
<p lang="en-GB">Matching the language range of English.</p>
<p lang="fr">Ceci est un paragraphe français.</p>
<p lang="fr-Latn-FR">Ceci est un paragraphe français en latin.</p>
```

#### Kết quả

{{EmbedLiveSample('Matching_multiple_languages', '', '120')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lớp giả {{cssxref(":dir")}} khớp theo hướng văn bản
- Thuộc tính HTML [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)
- Thuộc tính HTML [`translate`](/en-US/docs/Web/HTML/Reference/Global_attributes/translate)
- {{glossary("BCP 47 language tag")}}
