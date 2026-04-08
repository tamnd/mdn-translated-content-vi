---
title: columns
slug: Web/CSS/Reference/Properties/columns
page-type: css-shorthand-property
browser-compat: css.properties.columns
sidebar: cssref
---

Thuộc tính viết tắt CSS **`columns`** đặt số cột tối đa khi hiển thị nội dung của phần tử, cùng với chiều rộng tối thiểu và chiều cao tối đa của các cột trong phần tử đó.

{{InteractiveExample("CSS Demo: columns")}}

```css interactive-example-choice
columns: 2;
```

```css interactive-example-choice
columns: 6rem auto;
```

```css interactive-example-choice
columns: 12em;
```

```css interactive-example-choice
columns: 3;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
#example-element {
  min-width: 21rem;
  text-align: left;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("column-count")}}
- {{cssxref("column-width")}}
- {{cssxref("column-height")}}

## Cú pháp

```css
/* Chiều rộng cột */
columns: 18em;

/* Số cột */
columns: auto;
columns: 2;

/* Chiều rộng và số cột */
columns: 2 auto;
columns: auto 12em;
columns: auto auto;

/* Chiều rộng và/hoặc số cột, và chiều cao cột */
columns: 18em / 10em;
columns: 2 / 90vh;
columns: 2 auto / 300px;

/* Giá trị toàn cục */
columns: inherit;
columns: initial;
columns: revert;
columns: revert-layer;
columns: unset;
```

Giá trị của thuộc tính `columns` có thể được chỉ định dưới dạng giá trị [`<column-count>`](/en-US/docs/Web/CSS/Reference/Properties/column-count) và/hoặc [`<column-width>`](/en-US/docs/Web/CSS/Reference/Properties/column-width), theo bất kỳ thứ tự nào, tùy chọn theo sau là giá trị [`<column-height>`](/en-US/docs/Web/CSS/Reference/Properties/column-height) đứng sau dấu gạch chéo (`/`).

### Giá trị

- `<'column-width'>`
  - : Chiều rộng cột lý tưởng, được định nghĩa là {{cssxref("&lt;length&gt;")}} hoặc từ khóa `auto`. Chiều rộng thực tế có thể rộng hơn hoặc hẹp hơn để phù hợp với không gian có sẵn. Xem {{cssxref("column-width")}}.
- `<'column-count'>`
  - : Số cột lý tưởng để phân bố nội dung của phần tử, được định nghĩa là {{cssxref("&lt;integer&gt;")}} hoặc từ khóa `auto`. Nếu được chỉ định là `<integer>`, nó xác định số cột tối đa cho phép. Xem {{cssxref("column-count")}}.
- `<'column-height'>`
  - : Chiều cao của các cột, được định nghĩa là {{cssxref("&lt;length&gt;")}} hoặc từ khóa `auto`. Xem {{cssxref("column-height")}}.

> [!NOTE]
> Đặt giá trị `<column-height>` sẽ đặt lại thuộc tính {{cssxref("column-wrap")}} về giá trị ban đầu của nó là `auto`. Khi `<column-height>` được đặt thành `<length>`, giá trị `auto` của {{cssxref("column-wrap")}} được hiểu là `wrap`. Khi `<column-height>` được đặt thành `auto`, nó được hiểu là `nowrap`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt ba cột bằng nhau

Ví dụ này cho thấy cách chia vùng chứa văn bản thành ba cột bằng nhau.

#### HTML

Chúng ta dùng một phần tử {{htmlelement("p")}} cơ bản chứa nội dung văn bản.

```html live-sample___three_equal_columns
<p class="content-box">
  This is a bunch of text split into three columns using the CSS
  <code>columns</code>
  property. The text is equally distributed over the columns.
</p>
```

#### CSS

Chúng ta đặt giá trị thuộc tính `columns` cho đoạn văn bao gồm giá trị `<column-count>` là `3` và giá trị `<column-width>` là `auto`.

```css hidden live-sample___three_equal_columns
body {
  width: 60%;
  margin: 0 auto;
}
```

```css live-sample___three_equal_columns
.content-box {
  columns: 3 auto;
}
```

#### Kết quả

{{EmbedLiveSample('three_equal_columns', 'auto', 120)}}

Lưu ý cách văn bản được chia thành ba cột.

### Tạo các cột có chiều cao cố định xuống dòng

Ví dụ này minh họa việc bao gồm giá trị `<column-height>` với thuộc tính viết tắt `columns` để chia vùng chứa văn bản thành các cột có chiều cao cố định và tự động xuống hàng mới khi chạm đến cạnh ngang của vùng chứa.

#### HTML

Chúng ta dùng một phần tử {{htmlelement("p")}} cơ bản với một số văn bản.

```html live-sample___fixed-height
<p class="content-box">
  This is a bunch of text split into three columns using the CSS
  <code>columns</code> property. This includes a <code>column-count</code> value
  of <code>3</code>, a <code>column-width</code> value of <code>auto</code>, and
  a <code>column-height</code> value of <code>5em</code>. The
  <code>column-wrap</code> value is set to its initial value, <code>auto</code>;
  when a <code>column-height</code> value is included,
  <code>column-wrap: auto</code> resolves to <code>wrap</code>, which allows the
  columns to wrap onto multiple rows. The text is equally distributed over the
  columns, and placed into multiple rows.
</p>
```

#### CSS

Chúng ta đặt giá trị thuộc tính `columns` cho đoạn văn bao gồm giá trị `<column-count>` là `3`, giá trị `<column-width>` là `auto`, và giá trị `<column-height>` là `5em`. Vì `<column-height>` được đặt thành `<length>`, giá trị {{cssxref("column-wrap")}} của đoạn văn được tính toán thành `wrap`, cho phép các cột xuống nhiều hàng.

```css live-sample___fixed-height
.content-box {
  columns: 3 auto / 5em;
}
```

```css hidden live-sample___fixed-height
body {
  width: 60%;
  margin: 0 auto;
}
```

```css hidden live-sample___fixed-height
@supports not (columns: 3 auto / 5em) {
  body::before {
    content: "Your browser does not support the 'column-height' property.";
    background-color: wheat;
    position: fixed;
    inset: 40% 0;
    height: fit-content;
    text-align: center;
    padding: 1rem 0;
  }
}
```

#### Kết quả

{{EmbedLiveSample('fixed-height', 'auto', 320)}}

Lưu ý cách văn bản được chia thành ba cột. Mỗi cột cao `5em`. Sau mỗi ba cột, các cột xuống hàng mới theo chiều dọc (block direction).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("widows")}}
- {{cssxref("orphans")}}
- [Phương tiện phân trang](/en-US/docs/Web/CSS/Guides/Paged_media)
- [Học: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
