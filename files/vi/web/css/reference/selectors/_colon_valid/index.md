---
title: :valid
slug: Web/CSS/Reference/Selectors/:valid
page-type: css-pseudo-class
browser-compat: css.selectors.valid
sidebar: cssref
---

Lớp giả **`:valid`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử {{HTMLElement("input")}} hoặc phần tử {{HTMLElement("form")}} khác có nội dung [kiểm tra hợp lệ](/en-US/docs/Web/HTML/Guides/Constraint_validation) thành công. Điều này cho phép dễ dàng tạo kiểu cho các trường hợp lệ theo cách giúp người dùng xác nhận rằng dữ liệu của họ được định dạng đúng.

{{InteractiveExample("CSS Demo: :valid", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

input:valid {
  background-color: ivory;
  border: none;
  outline: 2px solid deepskyblue;
  border-radius: 5px;
  accent-color: gold;
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

Lớp giả này hữu ích để làm nổi bật các trường đúng cho người dùng.

## Cú pháp

```css
:valid {
  /* ... */
}
```

## Khả năng tiếp cận

Màu xanh lá thường được dùng để chỉ đầu vào hợp lệ. Những người mắc một số dạng mù màu sẽ không thể xác định trạng thái của đầu vào trừ khi có thêm chỉ báo không phụ thuộc vào màu sắc. Thông thường, văn bản mô tả và/hoặc biểu tượng được sử dụng cho mục đích này.

- [MDN Giải thích WCAG, Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-without-color.html)

## Ví dụ

### Chỉ báo trường biểu mẫu hợp lệ và không hợp lệ

Trong ví dụ này, chúng ta thêm các phần tử `<span>` để tạo nội dung chỉ báo dữ liệu hợp lệ hoặc không hợp lệ:

```html
<form>
  <fieldset>
    <legend>Feedback form</legend>
    <p>Required fields are labelled with "required".</p>
    <div>
      <label for="fname">First name: </label>
      <input id="fname" name="fname" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="lname">Last name: </label>
      <input id="lname" name="lname" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="email">
        Email address (include if you want a response):
      </label>
      <input id="email" name="email" type="email" />
      <span></span>
    </div>
    <div><button>Submit</button></div>
  </fieldset>
</form>
```

Để cung cấp các chỉ báo này, chúng ta sử dụng CSS sau:

```css hidden
body {
  font-family: sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  flex-flow: row wrap;
}

button,
label,
input {
  display: block;
  font-family: inherit;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

input:hover,
input:focus {
  background-color: #eeeeee;
}

input:required + span::after {
  font-size: 0.7rem;
  position: absolute;
  content: "required";
  color: white;
  background-color: black;
  padding: 5px 10px;
  top: -26px;
  left: -70px;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```css
input + span {
  position: relative;
}

input + span::before {
  position: absolute;
  right: -20px;
  top: 5px;
}

input:invalid {
  border: 2px solid red;
}

input:invalid + span::before {
  content: "✖";
  color: red;
}

input:valid + span::before {
  content: "✓";
  color: green;
}
```

Chúng ta đặt các `<span>` thành `position: relative` để có thể định vị nội dung được tạo ra so với chúng. Sau đó, chúng ta định vị tuyệt đối các nội dung khác nhau tùy thuộc vào việc dữ liệu biểu mẫu hợp lệ hay không hợp lệ — dấu tích xanh hoặc dấu X đỏ tương ứng. Để thêm tính cấp thiết cho dữ liệu không hợp lệ, chúng ta cũng tạo viền đỏ đậm cho các đầu vào khi không hợp lệ.

> [!NOTE]
> Chúng ta đã sử dụng `::before` để thêm các nhãn này vì đã sử dụng `::after` cho nhãn "required".

Bạn có thể thử bên dưới:

{{EmbedLiveSample("indicating_valid_and_invalid_form_fields", "", 430)}}

Lưu ý rằng các đầu vào văn bản bắt buộc không hợp lệ khi trống, nhưng hợp lệ khi có nội dung. Ngược lại, đầu vào email hợp lệ khi trống vì không bắt buộc, nhưng không hợp lệ khi chứa nội dung không phải địa chỉ email đúng định dạng.

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến kiểm tra hợp lệ khác: {{ cssxref(":required") }}, {{ cssxref(":optional") }}, {{ cssxref(":invalid") }}
- [Kiểm tra hợp lệ dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- Truy cập [trạng thái hợp lệ](/en-US/docs/Web/API/ValidityState) từ JavaScript
