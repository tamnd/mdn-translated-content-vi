---
title: :focus-within
slug: Web/CSS/Reference/Selectors/:focus-within
page-type: css-pseudo-class
browser-compat: css.selectors.focus-within
sidebar: cssref
---

**`:focus-within`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS), khớp với một phần tử nếu chính phần tử đó hoặc bất kỳ phần tử con nào của nó đang được focus. Nói cách khác, nó đại diện cho một phần tử khớp với lớp giả {{CSSxRef(":focus")}} hoặc có phần tử con khớp với `:focus`. (Điều này bao gồm các phần tử con trong [shadow tree](/en-US/docs/Web/API/Web_components/Using_shadow_DOM).)

{{InteractiveExample("CSS Demo: :focus-within", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

label:focus-within {
  font-weight: bold;
}
```

```html interactive-example
<form>
  <p>Which flavor would you like to order?</p>
  <label>Full Name: <input name="firstName" type="text" /></label>
  <label
    >Flavor:
    <select name="flavor">
      <option>Cherry</option>
      <option>Green Tea</option>
      <option>Moose Tracks</option>
      <option>Mint Chip</option>
    </select>
  </label>
</form>
```

Bộ chọn này rất hữu ích, ví dụ điển hình là để làm nổi bật toàn bộ vùng chứa {{HTMLElement("form")}} khi người dùng focus vào một trong các trường {{HTMLElement("input")}} của nó.

## Cú pháp

```css
:focus-within {
  /* ... */
}
```

## Ví dụ

Trong ví dụ này, biểu mẫu sẽ nhận kiểu màu sắc đặc biệt khi một trong các ô nhập văn bản nhận focus.

### HTML

```html
<p>Try typing into this form.</p>

<form>
  <label for="given_name">Given Name:</label>
  <input id="given_name" type="text" />
  <br />
  <label for="family_name">Family Name:</label>
  <input id="family_name" type="text" />
</form>
```

### CSS

```css
form {
  border: 1px solid;
  color: gray;
  padding: 4px;
}

form:focus-within {
  background: #ffff88;
  color: black;
}

input {
  margin: 4px;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 500, 150)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":focus")}}
- {{CSSxRef(":focus-visible")}}
- [Grab your user's attention with the focus-within selector](https://dev.to/vtrpldn/grab-your-user-s-attention-with-the-focus-within-css-selector-4d4)
