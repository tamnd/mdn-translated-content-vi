---
title: :required
slug: Web/CSS/Reference/Selectors/:required
page-type: css-pseudo-class
browser-compat: css.selectors.required
sidebar: cssref
---

Lớp giả **`:required`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)) đại diện cho bất kỳ phần tử {{HTMLElement("input")}}, {{HTMLElement("select")}}, hoặc {{HTMLElement("textarea")}} nào có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) được đặt trên đó.

{{InteractiveExample("CSS Demo: :required", "tabbed-standard")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

.req {
  color: red;
}

*:required {
  background-color: gold;
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

Lớp giả này hữu ích để làm nổi bật các trường phải có dữ liệu hợp lệ trước khi biểu mẫu có thể được gửi.

> [!NOTE]
> Lớp giả {{cssxref(":optional")}} chọn các trường biểu mẫu _tùy chọn_.

## Cú pháp

```css
:required {
  /* ... */
}
```

## Khả năng truy cập

Các phần tử {{htmlelement("input")}} bắt buộc nên có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) áp dụng cho chúng. Điều này sẽ đảm bảo rằng những người điều hướng với sự hỗ trợ của công nghệ hỗ trợ tiếp cận như trình đọc màn hình sẽ có thể hiểu các input nào cần nội dung hợp lệ để đảm bảo gửi thành công.

Nếu biểu mẫu cũng chứa các input [tùy chọn](/en-US/docs/Web/CSS/Reference/Selectors/:optional), các input bắt buộc nên được chỉ ra về mặt hình ảnh bằng cách xử lý không chỉ dựa vào màu sắc để truyền đạt ý nghĩa. Thông thường, văn bản mô tả và/hoặc biểu tượng được sử dụng.

- [MDN Understanding WCAG, Guideline 3.3 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.3_%e2%80%94_input_assistance_help_users_avoid_and_correct_mistakes)
- [Understanding Success Criterion 3.3.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-cues.html)

## Ví dụ

### Trường bắt buộc có viền đỏ

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

input:required {
  border-color: maroon;
  border-width: 3px;
}

input:required:invalid {
  border-color: #c00000;
}
```

#### Kết quả

{{EmbedLiveSample('Examples', 600, 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến xác thực khác: {{ cssxref(":optional") }}, {{ cssxref(":invalid") }}, {{ cssxref(":valid") }}
- [Form data validation](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
