---
title: :optional
slug: Web/CSS/Reference/Selectors/:optional
page-type: css-pseudo-class
browser-compat: css.selectors.optional
sidebar: cssref
---

**`:optional`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử {{HTMLElement("input")}}, {{HTMLElement("select")}} hay {{HTMLElement("textarea")}} nào không có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) được đặt trên nó.

{{InteractiveExample("CSS Demo: :optional", "tabbed-standard")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

.req {
  color: red;
}

*:optional {
  background-color: palegreen;
}
```

```html interactive-example
<form>
  <label for="name">Name: <span class="req">*</span></label>
  <input id="name" name="name" type="text" required />

  <label for="birth">Date of Birth:</label>
  <input id="birth" name="birth" type="date" />

  <label for="origin"
    >How did you find out about us? <span class="req">*</span></label
  >
  <select id="origin" name="origin" required>
    <option>Google</option>
    <option>Facebook</option>
    <option>Advertisement</option>
  </select>
  <p><span class="req">*</span> - Required field</p>
</form>
```

Lớp giả này hữu ích để tạo kiểu cho các trường không bắt buộc phải điền khi gửi biểu mẫu.

> [!NOTE]
> Lớp giả {{cssxref(":required")}} chọn các trường biểu mẫu _bắt buộc_.

## Cú pháp

```css
:optional {
  /* ... */
}
```

## Khả năng tiếp cận

Nếu một [biểu mẫu](/en-US/docs/Web/HTML/Reference/Elements/form) chứa các {{htmlelement("input")}} tùy chọn, các trường bắt buộc phải được chỉ ra bằng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required). Điều này đảm bảo rằng những người sử dụng công nghệ hỗ trợ như trình đọc màn hình có thể hiểu được các trường nào cần nội dung hợp lệ để gửi biểu mẫu thành công.

Các trường bắt buộc cũng nên được chỉ ra bằng hình thức trực quan, sử dụng cách thể hiện không chỉ dựa vào màu sắc để truyền đạt ý nghĩa. Thông thường, văn bản mô tả và/hoặc biểu tượng được sử dụng.

- [MDN Understanding WCAG, Guideline 3.3 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.3_%e2%80%94_input_assistance_help_users_avoid_and_correct_mistakes)
- [Understanding Success Criterion 3.3.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-cues.html)

## Ví dụ

### Trường tùy chọn có đường viền màu tím

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

input:optional {
  border-color: rebeccapurple;
  border-width: 3px;
}
```

#### Kết quả

{{EmbedLiveSample('Examples', 600, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến xác thực khác: {{ cssxref(":required") }}, {{ cssxref(":invalid") }}, {{ cssxref(":valid") }}
- [Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
