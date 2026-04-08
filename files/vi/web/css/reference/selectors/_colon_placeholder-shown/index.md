---
title: :placeholder-shown
slug: Web/CSS/Reference/Selectors/:placeholder-shown
page-type: css-pseudo-class
browser-compat: css.selectors.placeholder-shown
sidebar: cssref
---

Lớp giả **`:placeholder-shown`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)) đại diện cho bất kỳ phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}} nào hiện đang hiển thị [văn bản placeholder](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder).

{{InteractiveExample("CSS Demo: :placeholder-shown", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

input:placeholder-shown {
  background-color: ivory;
  border: 2px solid darkorange;
  border-radius: 5px;
}
```

```html interactive-example
<form>
  <label for="name">Full Name:</label>
  <input id="name" name="name" type="text" />

  <label for="email">Email Address:</label>
  <input id="email" name="email" type="email" placeholder="name@example.com" />

  <label for="age">Your age:</label>
  <input
    id="age"
    name="age"
    type="number"
    value="18"
    placeholder="You must be 18+" />
</form>
```

## Cú pháp

```css
:placeholder-shown {
  /* ... */
}
```

## Ví dụ

### Ví dụ cơ bản

Ví dụ này áp dụng kiểu font và viền đặc biệt khi placeholder đang được hiển thị.

#### HTML

```html
<input placeholder="Type something here!" />
```

#### CSS

```css
input {
  border: 1px solid black;
  padding: 3px;
}

input:placeholder-shown {
  border-color: teal;
  color: purple;
  font-style: italic;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 200, 80)}}

### Văn bản bị tràn

Khi các trường biểu mẫu quá nhỏ, văn bản placeholder có thể bị cắt theo cách không mong muốn. Bạn có thể sử dụng thuộc tính {{cssxref("text-overflow")}} để thay đổi cách hiển thị văn bản bị tràn.

#### HTML

```html
<input id="input1" placeholder="Name, Rank, and Serial Number" /> <br /><br />
<input id="input2" placeholder="Name, Rank, and Serial Number" />
```

#### CSS

```css
#input2:placeholder-shown {
  text-overflow: ellipsis;
}
```

#### Kết quả

{{EmbedLiveSample("Overflowing_text", 200, 80)}}

### Trường nhập liệu tùy chỉnh

Ví dụ sau làm nổi bật trường ID sinh viên với kiểu tùy chỉnh.

#### HTML

```html
<form id="test">
  <p>
    <label for="name">Enter Student Name:</label>
    <input id="name" placeholder="Student Name" />
  </p>
  <p>
    <label for="branch">Enter Student Branch:</label>
    <input id="branch" placeholder="Student Branch" />
  </p>
  <p>
    <label for="sid">Enter Student ID:</label>
    <input
      pattern="[0-9]{8}"
      title="8 digit ID"
      id="sid"
      class="student-id"
      placeholder="8 digit id" />
  </p>
  <input type="submit" />
</form>
```

#### CSS

```css
input {
  background-color: #e8e8e8;
  color: black;
}

input.student-id:placeholder-shown {
  background-color: yellow;
  color: red;
  font-style: italic;
}
```

#### Kết quả

{{EmbedLiveSample("Customized_input_field", 200, 180)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử giả {{CSSxRef("::placeholder")}} tạo kiểu cho chính placeholder đó.
- Các phần tử HTML liên quan: {{HTMLElement("input")}}, {{HTMLElement("textarea")}}
- [HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms)
