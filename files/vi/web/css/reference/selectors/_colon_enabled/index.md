---
title: :enabled
slug: Web/CSS/Reference/Selectors/:enabled
page-type: css-pseudo-class
browser-compat: css.selectors.enabled
sidebar: cssref
---

**`:enabled`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử nào được bật. Một phần tử được bật nếu nó có thể được kích hoạt (chọn, nhấp vào, gõ vào, v.v.) hoặc nhận tiêu điểm. Phần tử cũng có trạng thái bị vô hiệu hóa, trong đó nó không thể được kích hoạt hoặc nhận tiêu điểm.

{{InteractiveExample("CSS Demo: :enabled", "tabbed-standard")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

*:enabled {
  background-color: gold;
}
```

```html interactive-example
<form>
  <label for="name">Name:</label>
  <input id="name" name="name" type="text" />

  <label for="emp">Employed:</label>
  <select id="emp" name="emp" disabled>
    <option>No</option>
    <option>Yes</option>
  </select>

  <label for="empDate">Employment Date:</label>
  <input id="empDate" name="empDate" type="date" disabled />

  <label for="resume">Resume:</label>
  <input id="resume" name="resume" type="file" />
</form>
```

## Cú pháp

```css
:enabled {
  /* ... */
}
```

## Ví dụ

Ví dụ sau làm cho màu của văn bản và các thẻ {{htmlElement("input")}} kiểu button có màu xanh lá khi được bật, và màu xám khi bị vô hiệu hóa. Điều này giúp người dùng hiểu được những phần tử nào có thể tương tác.

### HTML

```html
<form action="url_of_form">
  <label for="FirstField">First field (enabled):</label>
  <input type="text" id="FirstField" value="Lorem" /><br />

  <label for="SecondField">Second field (disabled):</label>
  <input type="text" id="SecondField" value="Ipsum" disabled /><br />

  <input type="button" value="Submit" />
</form>
```

### CSS

```css
input:enabled {
  color: #22bb22;
}

input:disabled {
  color: #aaaaaa;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 550, 95)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":disabled")}}
