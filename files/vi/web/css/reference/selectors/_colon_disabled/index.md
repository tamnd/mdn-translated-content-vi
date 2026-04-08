---
title: :disabled
slug: Web/CSS/Reference/Selectors/:disabled
page-type: css-pseudo-class
browser-compat: css.selectors.disabled
sidebar: cssref
---

**`:disabled`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử nào bị vô hiệu hóa. Một phần tử bị vô hiệu hóa nếu nó không thể được kích hoạt (chọn, nhấp vào, gõ vào, v.v.) hoặc nhận tiêu điểm. Phần tử cũng có trạng thái được bật, trong đó nó có thể được kích hoạt hoặc nhận tiêu điểm.

{{InteractiveExample("CSS Demo: :disabled", "tabbed-standard")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

*:disabled {
  background-color: dimgrey;
  color: linen;
  opacity: 1;
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
:disabled {
  /* ... */
}
```

## Ví dụ

Ví dụ này hiển thị một biểu mẫu vận chuyển cơ bản. Nó sử dụng sự kiện {{domxref("HTMLElement/change_event", "change")}} trong [JavaScript](/en-US/docs/Web/JavaScript) để cho phép người dùng bật/tắt các trường thanh toán.

### HTML

```html
<form action="#">
  <fieldset id="shipping">
    <legend>Shipping address</legend>
    <input type="text" placeholder="Name" />
    <input type="text" placeholder="Address" />
    <input type="text" placeholder="Zip Code" />
  </fieldset>
  <br />
  <fieldset id="billing">
    <legend>Billing address</legend>
    <label for="billing-checkbox">Same as shipping address:</label>
    <input type="checkbox" id="billing-checkbox" checked />
    <br />
    <input type="text" placeholder="Name" disabled />
    <input type="text" placeholder="Address" disabled />
    <input type="text" placeholder="Zip Code" disabled />
  </fieldset>
</form>
```

### CSS

```css
input[type="text"]:disabled {
  background: #cccccc;
}
```

### JavaScript

Bật/tắt các trường nhập liệu bị vô hiệu hóa khi hộp kiểm được nhấp

```js
const checkbox = document.querySelector("#billing-checkbox");
const billingItems = document.querySelectorAll('#billing input[type="text"]');

checkbox.addEventListener("change", () => {
  billingItems.forEach((item) => {
    item.disabled = !item.disabled;
  });
});
```

### Kết quả

Chọn/bỏ chọn hộp kiểm để thay đổi kiểu dáng của các trường thanh toán.

{{EmbedLiveSample('Examples', 300, 250)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":enabled")}}
