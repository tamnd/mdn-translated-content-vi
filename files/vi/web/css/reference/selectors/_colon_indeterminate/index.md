---
title: :indeterminate
slug: Web/CSS/Reference/Selectors/:indeterminate
page-type: css-pseudo-class
browser-compat: css.selectors.indeterminate
sidebar: cssref
---

**`:indeterminate`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử form nào có trạng thái không xác định, chẳng hạn như các checkbox đã được đặt thành trạng thái [`indeterminate`](/en-US/docs/Web/API/HTMLInputElement/indeterminate) bằng JavaScript, các radio button là thành viên của một nhóm mà tất cả radio button đều chưa được chọn, và các phần tử {{HTMLElement("progress")}} không có thuộc tính `value`.

```css
/* Selects any <input> whose state is indeterminate */
input:indeterminate {
  background: lime;
}
```

Các phần tử được nhắm mục tiêu bởi bộ chọn này là:

- Các phần tử [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) với thuộc tính [`indeterminate`](/en-US/docs/Web/API/HTMLInputElement/indeterminate) được đặt thành `true`.
- Các phần tử [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio) có cùng giá trị `name` và không có phần tử nào được `checked`.
- Các phần tử {{HTMLElement("progress")}} không có `value`, đặt chúng vào trạng thái không xác định.

## Cú pháp

```css
:indeterminate {
  /* ... */
}
```

## Ví dụ

### Checkbox và radio button

Ví dụ này áp dụng kiểu đặc biệt cho các nhãn liên kết với các trường form không xác định.

#### HTML

```html
<fieldset>
  <legend>Checkbox</legend>
  <div>
    <input type="checkbox" id="checkbox" />
    <label for="checkbox">This checkbox label starts out lime.</label>
  </div>
</fieldset>

<fieldset>
  <legend>Radio</legend>
  <div>
    <input type="radio" id="radio1" name="radioButton" value="val1" />
    <label for="radio1">First radio label starts out lime.</label>
  </div>
  <div>
    <input type="radio" id="radio2" name="radioButton" value="val2" />
    <label for="radio2">Second radio label also starts out lime.</label>
  </div>
</fieldset>
```

#### CSS

```css
input:indeterminate + label {
  background: lime;
}
```

```css hidden
fieldset {
  padding: 1em 0.75em;
}

fieldset:first-of-type {
  margin-bottom: 1.5rem;
}

fieldset:not(:first-of-type) > div:not(:last-child) {
  margin-bottom: 0.5rem;
}
```

#### JavaScript

```js
const inputs = document.getElementsByTagName("input");

for (const input of inputs) {
  input.indeterminate = true;
}
```

#### Kết quả

{{EmbedLiveSample('Checkbox_radio_button', 'auto', 230)}}

### Thanh tiến trình

#### HTML

```html
<progress></progress>
```

#### CSS

```css
progress {
  margin: 4px;
}

progress:indeterminate {
  width: 80vw;
  height: 20px;
}
```

#### Kết quả

{{EmbedLiveSample('Progress_bar', 'auto', 30)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web forms — Working with user data](/en-US/docs/Learn_web_development/Extensions/Forms)
- [Styling web forms](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
- Thuộc tính [`indeterminate`](/en-US/docs/Web/API/HTMLInputElement/indeterminate) của phần tử [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)
- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} triển khai nó.
- Bộ chọn CSS {{cssxref(":checked")}} cho phép bạn tạo kiểu cho checkbox dựa trên việc chúng có được chọn hay không
