---
title: :checked
slug: Web/CSS/Reference/Selectors/:checked
page-type: css-pseudo-class
browser-compat: css.selectors.checked
sidebar: cssref
---

Bộ chọn **`:checked`** [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) đại diện cho bất kỳ **radio** ([`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)), **checkbox** ([`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)), hoặc **option** ({{HTMLElement("option")}} trong phần tử {{HTMLElement("select")}}) nào đang được chọn hoặc bật sang trạng thái `on`.

{{InteractiveExample("CSS Demo: :checked", "tabbed-shorter")}}

```css interactive-example
label,
input[type="submit"] {
  display: block;
  margin-top: 1em;
}

input:checked {
  border: none;
  outline: 2px solid deeppink;
}
```

```html interactive-example
<form>
  <p>How did you find out about us?</p>
  <label
    ><input name="origin" type="radio" value="google" checked /> Google</label
  >
  <label><input name="origin" type="radio" value="facebook" /> Facebook</label>
  <p>Please agree to our terms:</p>

  <label
    ><input name="newsletter" type="checkbox" checked /> I want to subscribe to
    a personalized newsletter.</label
  >

  <label
    ><input name="privacy" type="checkbox" /> I have read and I agree to the
    Privacy Policy.</label
  >

  <input type="submit" value="Submit form" />
</form>
```

Người dùng có thể kích hoạt trạng thái này bằng cách chọn/đánh dấu một phần tử, hoặc hủy kích hoạt bằng cách bỏ chọn/bỏ đánh dấu phần tử đó.

> [!NOTE]
> Vì các trình duyệt thường coi `<option>` là {{ glossary("replaced elements","phần tử thay thế")}}, mức độ mà chúng có thể được tạo kiểu bằng lớp giả `:checked` khác nhau giữa các trình duyệt. Chức năng [Customizable select element](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) có thể được sử dụng để cho phép tùy chỉnh đầy đủ các phần tử `<option>` giống như bất kỳ phần tử DOM thông thường nào, trong các trình duyệt hỗ trợ.

## Cú pháp

```css
:checked {
  /* ... */
}
```

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<div>
  <input type="radio" name="my-input" id="yes" value="yes" />
  <label for="yes">Yes</label>

  <input type="radio" name="my-input" id="no" value="no" />
  <label for="no">No</label>
</div>

<div>
  <input type="checkbox" name="my-checkbox" id="opt-in" />
  <label for="opt-in">Check me!</label>
</div>

<select name="my-select" id="fruit">
  <option value="opt1">Apples</option>
  <option value="opt2">Grapes</option>
  <option value="opt3">Pears</option>
</select>
```

#### CSS

```css
div,
select {
  margin: 8px;
}

/* Labels for checked inputs */
input:checked + label {
  color: red;
}

/* Radio element, when checked */
input[type="radio"]:checked {
  box-shadow: 0 0 0 3px orange;
}

/* Checkbox element, when checked */
input[type="checkbox"]:checked {
  box-shadow: 0 0 0 3px hotpink;
}

/* Option elements, when selected */
option:checked {
  box-shadow: 0 0 0 3px lime;
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

### Bật/tắt các phần tử bằng checkbox ẩn

Ví dụ này sử dụng lớp giả `:checked` để cho phép người dùng bật/tắt nội dung dựa trên trạng thái của checkbox, tất cả mà không cần dùng [JavaScript](/vi/docs/Web/JavaScript).

#### HTML

```html
<input type="checkbox" id="expand-toggle" />

<table>
  <thead>
    <tr>
      <th>Column #1</th>
      <th>Column #2</th>
      <th>Column #3</th>
    </tr>
  </thead>
  <tbody>
    <tr class="expandable">
      <td>[more text]</td>
      <td>[more text]</td>
      <td>[more text]</td>
    </tr>
    <tr>
      <td>[cell text]</td>
      <td>[cell text]</td>
      <td>[cell text]</td>
    </tr>
    <tr>
      <td>[cell text]</td>
      <td>[cell text]</td>
      <td>[cell text]</td>
    </tr>
    <tr class="expandable">
      <td>[more text]</td>
      <td>[more text]</td>
      <td>[more text]</td>
    </tr>
    <tr class="expandable">
      <td>[more text]</td>
      <td>[more text]</td>
      <td>[more text]</td>
    </tr>
  </tbody>
</table>

<label for="expand-toggle" id="expand-btn">Toggle hidden rows</label>
```

#### CSS

```css
/* Hide the toggle checkbox */
#expand-toggle {
  display: none;
}

/* Hide expandable content by default */
.expandable {
  visibility: collapse;
  background: #dddddd;
}

/* Style the button */
#expand-btn {
  display: inline-block;
  margin-top: 12px;
  padding: 5px 11px;
  background-color: #ffff77;
  border: 1px solid;
  border-radius: 3px;
}

/* Show hidden content when the checkbox is checked */
#expand-toggle:checked ~ * .expandable {
  visibility: visible;
}

/* Style the button when the checkbox is checked */
#expand-toggle:checked ~ #expand-btn {
  background-color: #cccccc;
}
```

#### Kết quả

{{EmbedLiveSample("Toggling_elements_with_a_hidden_checkbox", "auto", 220)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web forms — làm việc với dữ liệu người dùng](/en-US/docs/Learn_web_development/Extensions/Forms)
- [Tạo kiểu cho web forms](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
- Các phần tử HTML liên quan: [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox), [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio), {{HTMLElement("select")}}, và {{HTMLElement("option")}}
- {{glossary("Replaced elements","Phần tử thay thế")}}
