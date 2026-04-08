---
title: :default
slug: Web/CSS/Reference/Selectors/:default
page-type: css-pseudo-class
browser-compat: css.selectors.default
sidebar: cssref
---

**`:default`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) dùng để chọn các phần tử biểu mẫu là mặc định trong một nhóm các phần tử liên quan.

{{InteractiveExample("CSS Demo: :default", "tabbed-shorter")}}

```css interactive-example
label,
input[type="submit"] {
  display: block;
  margin-top: 1em;
}

input:default {
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

Bộ chọn này khớp với những gì được định nghĩa trong [HTML Standard §4.16.3 Pseudo-classes](https://html.spec.whatwg.org/multipage/semantics-other.html#selector-default) — nó có thể khớp với các phần tử {{htmlelement("button")}}, [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox), [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio), và {{htmlelement("option")}}:

- Phần tử option mặc định là phần tử đầu tiên có thuộc tính `selected`, hoặc là option được bật đầu tiên theo thứ tự DOM. Các thẻ {{htmlelement("select")}} có thuộc tính `multiple` có thể có nhiều hơn một option `selected`, và tất cả chúng đều sẽ khớp với `:default`.
- `<input type="checkbox">` và `<input type="radio">` khớp nếu chúng có thuộc tính `checked`.
- {{htmlelement("button")}} khớp nếu nó là [nút gửi mặc định](https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#implicit-submission) của một {{htmlelement("form")}}: tức là thẻ `<button>` đầu tiên theo thứ tự DOM thuộc về biểu mẫu đó. Điều này cũng áp dụng cho các loại {{htmlelement("input")}} dùng để gửi biểu mẫu, như `image` hoặc `submit`.

## Cú pháp

```css
:default {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<fieldset>
  <legend>Favorite season</legend>

  <input type="radio" name="season" id="spring" value="spring" />
  <label for="spring">Spring</label>

  <input type="radio" name="season" id="summer" value="summer" checked />
  <label for="summer">Summer</label>

  <input type="radio" name="season" id="fall" value="fall" />
  <label for="fall">Fall</label>

  <input type="radio" name="season" id="winter" value="winter" />
  <label for="winter">Winter</label>
</fieldset>
```

### CSS

```css
input:default {
  box-shadow: 0 0 2px 1px coral;
}

input:default + label {
  color: coral;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web forms — Working with user data](/en-US/docs/Learn_web_development/Extensions/Forms)
- [Styling web forms](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
- Các phần tử HTML liên quan: {{htmlelement("button")}}, [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox), [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio), và {{htmlelement("option")}}
