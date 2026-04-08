---
title: :out-of-range
slug: Web/CSS/Reference/Selectors/:out-of-range
page-type: css-pseudo-class
browser-compat: css.selectors.out-of-range
sidebar: cssref
---

**`:out-of-range`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho phần tử {{htmlelement("input")}} có giá trị hiện tại nằm ngoài giới hạn phạm vi được chỉ định bởi các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max).

{{InteractiveExample("CSS Demo: :out-of-range", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

input:out-of-range {
  background-color: orangered;
}
```

```html interactive-example
<form>
  <label for="amount">How many tickets? (You can buy 2-6 tickets)</label>
  <input id="amount" name="amount" type="number" min="2" max="6" value="4" />

  <label for="dep">Departure Date: (Whole year 2022 is acceptable)</label>
  <input
    id="dep"
    name="dep"
    type="date"
    min="2022-01-01"
    max="2022-12-31"
    value="2025-05-05" />

  <label for="ret">Return Date: (Whole year 2022 is acceptable)</label>
  <input id="ret" name="ret" type="date" min="2022-01-01" max="2022-12-31" />
</form>
```

Lớp giả này hữu ích để cung cấp cho người dùng dấu hiệu trực quan rằng giá trị hiện tại của trường nằm ngoài giới hạn cho phép.

> [!NOTE]
> Lớp giả này chỉ áp dụng cho các phần tử có (và có thể nhận) giới hạn phạm vi. Khi không có giới hạn như vậy, phần tử không thể ở trạng thái "in-range" hay "out-of-range".

## Cú pháp

```css
:out-of-range {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<form action="" id="form1">
  <p>Values between 1 and 10 are valid.</p>
  <ul>
    <li>
      <input
        id="value1"
        name="value1"
        type="number"
        placeholder="1 to 10"
        min="1"
        max="10"
        value="12" />
      <label for="value1">Your value is </label>
    </li>
  </ul>
</form>
```

### CSS

```css
li {
  list-style: none;
  margin-bottom: 1em;
}

input {
  border: 1px solid black;
}

input:in-range {
  background-color: rgb(0 255 0 / 25%);
}

input:out-of-range {
  background-color: rgb(255 0 0 / 25%);
  border: 2px solid red;
}

input:in-range + label::after {
  content: "okay.";
}

input:out-of-range + label::after {
  content: "out of range!";
}
```

### Kết quả

{{EmbedLiveSample('Examples', 600, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":in-range")}}
- [Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
