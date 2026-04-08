---
title: :read-only
slug: Web/CSS/Reference/Selectors/:read-only
page-type: css-pseudo-class
browser-compat: css.selectors.read-only
sidebar: cssref
---

Lớp giả **`:read-only`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)) chọn các phần tử (chẳng hạn như một số loại {{htmlelement("input")}} và {{htmlelement("textarea")}}) không thể chỉnh sửa bởi người dùng. Các phần tử mà thuộc tính HTML [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly) không có hiệu lực (chẳng hạn như [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio), [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox), và tất cả các phần tử không phải biểu mẫu khác) cũng được chọn bởi lớp giả `:read-only`. Trên thực tế, `:read-only` khớp với bất kỳ thứ gì mà {{cssxref(":read-write")}} không khớp, khiến nó tương đương với `:not(:read-write)`.

{{InteractiveExample("CSS Demo: :read-only", "tabbed-shorter")}}

```css interactive-example
label,
input[type="submit"] {
  display: block;
  margin-top: 1em;
}

*:read-only {
  font-weight: bold;
  color: indigo;
}
```

```html interactive-example
<p>Please fill your details:</p>

<form>
  <label for="email">Email Address:</label>
  <input id="email" name="email" type="email" value="test@example.com" />

  <label for="note">Short note about yourself:</label>
  <textarea id="note" name="note">Don't be shy</textarea>

  <label for="pic">Your picture:</label>
  <input id="pic" name="pic" type="file" />

  <input type="submit" value="Submit form" />
</form>
```

## Cú pháp

```css
:read-only {
  /* ... */
}
```

## Ví dụ

### Xác nhận thông tin biểu mẫu bằng các điều khiển chỉ đọc hoặc đọc-ghi

Một cách sử dụng các điều khiển biểu mẫu chỉ đọc là cho phép người dùng kiểm tra và xác minh thông tin họ có thể đã nhập trong biểu mẫu trước đó (ví dụ: thông tin giao hàng), trong khi vẫn có thể gửi thông tin đó cùng với phần còn lại của biểu mẫu. Chúng ta thực hiện đúng điều này trong ví dụ dưới đây.

Lớp giả `:read-only` được sử dụng để xóa tất cả các kiểu làm cho các input trông như các trường có thể nhấp, làm chúng trông giống như các đoạn văn chỉ đọc hơn. Ngược lại, lớp giả `:read-write` được sử dụng để cung cấp kiểu đẹp hơn cho `<textarea>` có thể chỉnh sửa.

```html hidden
<form>
  <fieldset>
    <legend>Check shipping details</legend>
    <div>
      <label for="name">Name: </label>
      <input id="name" name="name" type="text" value="Mr Soft" readonly />
    </div>
    <div>
      <label for="address">Address: </label>
      <textarea id="address" name="address" readonly>
23 Elastic Way,
Viscous,
Bright Ridge,
CA
</textarea
      >
    </div>
    <div>
      <label for="postal-code">Zip/postal code: </label>
      <input
        id="postal-code"
        name="postal-code"
        type="text"
        value="94708"
        readonly />
    </div>
  </fieldset>

  <fieldset>
    <legend>Final instructions</legend>
    <div>
      <label for="sms-confirm">Send confirmation by SMS?</label>
      <input id="sms-confirm" name="sms-confirm" type="checkbox" />
    </div>
    <div>
      <label for="instructions">Any special instructions?</label>
      <textarea id="instructions" name="instructions"></textarea>
    </div>
  </fieldset>

  <div><button type="submit">Amend details and submit</button></div>
</form>
```

```css hidden
body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
  margin-bottom: 20px;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
}

button,
label,
input[type="text"],
textarea {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  padding: 5px;
  height: 30px;
}

input[type="text"],
textarea {
  width: 50%;
}

textarea {
  height: 110px;
  resize: none;
}

label {
  width: 40%;
}

input:hover,
input:focus,
textarea:hover,
textarea:focus {
  background-color: #eeeeee;
}

button {
  width: 60%;
  margin: 20px auto;
}
```

```css
input:read-only,
textarea:read-only {
  border: 0;
  box-shadow: none;
  background-color: #dddddd;
}

textarea:read-write {
  outline: 1px dashed red;
  outline-offset: 2px;
  border-radius: 5px;
}
```

{{EmbedLiveSample("Confirming form information using read-only or read-write controls", "100%", 620)}}

### Tạo kiểu cho các điều khiển không phải biểu mẫu chỉ đọc

Bộ chọn này không chỉ chọn các phần tử {{htmlElement("input")}}/{{htmlElement("textarea")}} mà nó sẽ chọn _bất kỳ_ phần tử nào không thể chỉnh sửa bởi người dùng.

```html
<p contenteditable>This paragraph is editable; it is read-write.</p>

<p>This paragraph is not editable; it is read-only.</p>
```

```css
p {
  font-size: 150%;
  padding: 5px;
  border-radius: 5px;
}

p:read-only {
  background-color: red;
  color: white;
}

p:read-write {
  background-color: lime;
}
```

{{EmbedLiveSample('Styling_read-only_non-form_controls', '100%', 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":read-write")}}
- HTML [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) attribute
