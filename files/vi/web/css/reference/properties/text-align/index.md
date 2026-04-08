---
title: text-align
slug: Web/CSS/Reference/Properties/text-align
page-type: css-property
browser-compat: css.properties.text-align
sidebar: cssref
---

Thuộc tính **`text-align`** của [CSS](/vi/docs/Web/CSS) đặt căn chỉnh ngang cho nội dung cấp nội tuyến bên trong phần tử khối hoặc hộp ô bảng. Điều này có nghĩa là nó hoạt động giống như {{cssxref("vertical-align")}} nhưng theo chiều ngang.

{{InteractiveExample("CSS Demo: text-align")}}

```css interactive-example-choice
text-align: start;
```

```css interactive-example-choice
text-align: end;
```

```css interactive-example-choice
text-align: center;
```

```css interactive-example-choice
text-align: justify;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
      cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
      est laborum.
    </p>
  </div>
</section>
```

```css interactive-example
section {
  font-size: 1.5em;
}

#default-example > div {
  width: 250px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
text-align: start;
text-align: end;
text-align: left;
text-align: right;
text-align: center;
text-align: justify;
text-align: match-parent;

/* Giá trị căn chỉnh khối (Cú pháp không chuẩn) */
text-align: -moz-center;
text-align: -webkit-center;

/* Giá trị toàn cục */
text-align: inherit;
text-align: initial;
text-align: revert;
text-align: revert-layer;
text-align: unset;
```

Thuộc tính `text-align` được chỉ định bằng một từ khóa duy nhất từ danh sách bên dưới.

### Giá trị

- `start`
  - : Tương tự như `left` nếu hướng là từ trái sang phải và `right` nếu hướng là từ phải sang trái.
- `end`
  - : Tương tự như `right` nếu hướng là từ trái sang phải và `left` nếu hướng là từ phải sang trái.
- `left`
  - : Nội dung nội tuyến được căn chỉnh về cạnh trái của hộp dòng.
- `right`
  - : Nội dung nội tuyến được căn chỉnh về cạnh phải của hộp dòng.
- `center`
  - : Nội dung nội tuyến được căn giữa trong hộp dòng.
- `justify`
  - : Nội dung nội tuyến được căn đều hai bên. Nội dung được trải rộng để căn chỉnh cạnh trái và phải của nó với cạnh trái và phải của hộp dòng, ngoại trừ dòng cuối cùng.
- `match-parent`
  - : Tương tự như `inherit`, nhưng các giá trị `start` và `end` được tính theo {{cssxref("direction")}} của phần tử cha và được thay thế bằng giá trị `left` hoặc `right` phù hợp.

## Khả năng tiếp cận

Khoảng cách không đều giữa các từ được tạo bởi văn bản căn đều hai bên có thể gây ra vấn đề cho những người có khó khăn về nhận thức như Dyslexia.

- [MDN Understanding WCAG, Guideline 1.4 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.8 | Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Căn chỉnh đầu

#### HTML

```html
<p class="example">
  Integer elementum massa at nulla placerat varius. Suspendisse in libero risus,
  in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque.
  Nullam est eros, suscipit sed dictum quis, accumsan a ligula.
</p>
```

#### CSS

```css
.example {
  text-align: start;
  border: solid;
}
```

#### Kết quả

{{EmbedLiveSample("Start_alignment","100%","100%")}}

### Văn bản căn giữa

#### HTML

```html
<p class="example">
  Integer elementum massa at nulla placerat varius. Suspendisse in libero risus,
  in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque.
  Nullam est eros, suscipit sed dictum quis, accumsan a ligula.
</p>
```

#### CSS

```css
.example {
  text-align: center;
  border: solid;
}
```

#### Kết quả

{{EmbedLiveSample("Centered_text", "100%", "100%")}}

### Ví dụ dùng "justify"

#### HTML

```html
<p class="example">
  Integer elementum massa at nulla placerat varius. Suspendisse in libero risus,
  in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque.
  Nullam est eros, suscipit sed dictum quis, accumsan a ligula.
</p>
```

#### CSS

```css
.example {
  text-align: justify;
  border: solid;
}
```

#### Kết quả

{{EmbedLiveSample('Example using "justify"',"100%","100%")}}

### Căn chỉnh bảng

Ví dụ này minh họa cách sử dụng `text-align` trên các phần tử {{htmlelement("table")}}:

- {{htmlelement("caption")}} được đặt căn phải.
- Hai phần tử {{htmlelement("th")}} đầu tiên kế thừa căn chỉnh trái từ `text-align: left` được đặt trên {{htmlelement("thead")}}, trong khi phần tử thứ ba được đặt căn phải.
- Bên trong phần tử {{htmlelement("tbody")}}, hàng đầu tiên được đặt căn phải, hàng thứ hai được đặt căn giữa, và hàng thứ ba sử dụng căn chỉnh mặc định (trái).
- Trong mỗi hàng, một số ô (c12, c31) được đặt để ghi đè căn chỉnh của hàng.

#### HTML

```html
<table>
  <caption>
    Example table
  </caption>
  <thead>
    <tr>
      <th>Col 1</th>
      <th>Col 2</th>
      <th class="right">Col 3</th>
    </tr>
  </thead>
  <tbody>
    <tr class="right">
      <td>11</td>
      <td class="center">12</td>
      <td>13</td>
    </tr>
    <tr class="center">
      <td>21</td>
      <td>22</td>
      <td>23</td>
    </tr>
    <tr id="r3">
      <td class="right">31</td>
      <td>32</td>
      <td>33</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  border-collapse: collapse;
  border: solid black 1px;
  width: 250px;
  height: 150px;
}

thead {
  text-align: left;
}

td,
th {
  border: solid 1px black;
}

.center {
  text-align: center;
}

.right,
caption {
  text-align: right;
}
```

#### Kết quả

{{EmbedLiveSample('Table alignment', "100%", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("margin","margin: auto")}}, {{Cssxref("margin-left","margin-left: auto")}}, {{Cssxref("vertical-align")}}
