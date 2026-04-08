---
title: :invalid
slug: Web/CSS/Reference/Selectors/:invalid
page-type: css-pseudo-class
browser-compat: css.selectors.invalid
sidebar: cssref
---

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:invalid`** đại diện cho bất kỳ phần tử {{HTMLElement("form")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("input")}} hay phần tử {{HTMLElement("form")}} khác mà nội dung không qua được bước [kiểm tra hợp lệ](/en-US/docs/Web/HTML/Guides/Constraint_validation).

{{InteractiveExample("CSS Demo: :invalid", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

input:invalid {
  background-color: ivory;
  border: none;
  outline: 2px solid red;
  border-radius: 5px;
}
```

```html interactive-example
<form>
  <label for="email">Email Address:</label>
  <input id="email" name="email" type="email" value="na@me@example.com" />

  <label for="secret">Secret Code: (lower case letters)</label>
  <input id="secret" name="secret" type="text" value="test" pattern="[a-z]+" />

  <label for="age">Your age: (18+)</label>
  <input id="age" name="age" type="number" value="5" min="18" />

  <label
    ><input name="tos" type="checkbox" required checked /> - Do you agree to
    ToS?</label
  >
</form>
```

Lớp giả này hữu ích để làm nổi bật lỗi trường dữ liệu cho người dùng.

## Cú pháp

```css
:invalid {
  /* ... */
}
```

## Khả năng tiếp cận

Màu đỏ thường được dùng để chỉ ra đầu vào không hợp lệ. Những người mắc một số dạng mù màu sẽ không thể xác định trạng thái của trường nhập nếu không có thêm chỉ báo không phụ thuộc vào màu sắc. Thông thường, văn bản mô tả và/hoặc biểu tượng được dùng kèm theo.

- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-without-color.html)

## Ví dụ

### Tô màu phần tử để hiển thị trạng thái hợp lệ

#### HTML

```html
<form>
  <div class="field">
    <label for="url_input">Enter a URL:</label>
    <input type="url" id="url_input" />
  </div>

  <div class="field">
    <label for="email_input">Enter an email address:</label>
    <input type="email" id="email_input" required />
  </div>
</form>
```

#### CSS

```css
label {
  display: block;
  margin: 1px;
  padding: 1px;
}

.field {
  margin: 1px;
  padding: 1px;
}

input:invalid {
  background-color: #ffdddd;
}

form:invalid {
  border: 5px solid #ffdddd;
}

input:valid {
  background-color: #ddffdd;
}

form:valid {
  border: 5px solid #ddffdd;
}

input:required {
  border-color: maroon;
  border-width: 3px;
}

input:required:invalid {
  border-color: #c00000;
}
```

#### Kết quả

{{EmbedLiveSample('Coloring elements to show validation', 600, 200)}}

### Hiển thị biểu mẫu theo từng giai đoạn

Trong ví dụ này, chúng ta dùng `:invalid` kết hợp với `~`, [bộ kết hợp anh em tiếp theo](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator), để biểu mẫu hiển thị theo từng giai đoạn, ban đầu chỉ hiển thị mục đầu tiên cần điền, và khi người dùng hoàn thành từng mục thì biểu mẫu hiển thị mục tiếp theo. Khi toàn bộ biểu mẫu hoàn chỉnh, người dùng có thể gửi đi.

#### HTML

```html
<form>
  <fieldset>
    <legend>Personal Information</legend>
    <label for="form-name">Name</label><br />
    <input type="text" name="name" id="form-name" required />
  </fieldset>

  <fieldset>
    <legend>Contact Information</legend>
    <label for="form-email">Email Address</label><br />
    <input type="email" name="email" id="form-email" required />
  </fieldset>

  <fieldset>
    <legend>Message</legend>
    <label for="form-message">Message</label><br />
    <textarea name="message" id="form-message" required></textarea>
  </fieldset>

  <button type="submit" name="send">Submit</button>
</form>
```

#### CSS

```css
/* Hide the fieldset after an invalid fieldset */
fieldset:invalid ~ fieldset {
  display: none;
}

/* Dim and disable the button while the form is invalid */
form:invalid button {
  opacity: 0.3;
  pointer-events: none;
}

input,
textarea {
  box-sizing: border-box;
  width: 100%;
  font-family: monospace;
  padding: 0.25em 0.5em;
}

button {
  width: 100%;
  border: thin solid darkgrey;
  font-size: 1.25em;
  background-color: darkgrey;
  color: white;
}
```

#### Kết quả

{{EmbedLiveSample('Showing sections in stages', 600, 300)}}

## Ghi chú

### Nút radio

Nếu bất kỳ nút radio nào trong một nhóm có thuộc tính `required`, lớp giả `:invalid` sẽ được áp dụng cho tất cả các nút trong nhóm nếu không có nút nào được chọn. (Các nút radio trong nhóm chia sẻ cùng giá trị thuộc tính `name`.)

### Mặc định của Gecko

Theo mặc định, Gecko không áp dụng kiểu nào cho lớp giả `:invalid`. Tuy nhiên, nó áp dụng một kiểu (ánh sáng đỏ dùng thuộc tính {{Cssxref("box-shadow")}}) cho lớp giả {{cssxref(":user-invalid")}}, áp dụng trong một tập hợp con các trường hợp của `:invalid`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến kiểm tra hợp lệ: {{ cssxref(":required") }}, {{ cssxref(":optional") }}, {{ cssxref(":valid") }}
- Các lớp giả liên quan của Mozilla: {{cssxref(":user-invalid")}}, {{cssxref(":-moz-submit-invalid")}}
- [Kiểm tra hợp lệ dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- Truy cập [trạng thái hợp lệ](/en-US/docs/Web/API/ValidityState) từ JavaScript
