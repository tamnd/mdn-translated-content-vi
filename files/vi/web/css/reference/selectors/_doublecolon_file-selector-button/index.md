---
title: ::file-selector-button
slug: Web/CSS/Reference/Selectors/::file-selector-button
page-type: css-pseudo-element
browser-compat: css.selectors.file-selector-button
sidebar: cssref
---

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::file-selector-button`** đại diện cho nút của {{HTMLElement("input") }} có [`type="file"`](/en-US/docs/Web/HTML/Reference/Elements/input/file).

{{InteractiveExample("CSS Demo: ::file-selector-button", "tabbed-shorter")}}

```css interactive-example
input {
  margin-top: 1rem;
}

input::file-selector-button {
  font-weight: bold;
  color: dodgerblue;
  padding: 0.5em;
  border: thin solid grey;
  border-radius: 3px;
}
```

```html interactive-example
<label for="avatar">Choose a profile picture:</label><br />

<input id="avatar" type="file" name="avatar" accept="image/png, image/jpeg" />
```

## Cú pháp

```css
::file-selector-button {
  /* ... */
}
```

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<form>
  <label for="fileUpload">Upload file</label>
  <input type="file" id="fileUpload" />
</form>
```

#### CSS

```css hidden
form {
  display: flex;
  gap: 1em;
  align-items: center;
}
```

```css
input[type="file"]::file-selector-button {
  border: 2px solid #6c5ce7;
  padding: 0.2em 0.4em;
  border-radius: 0.2em;
  background-color: #a29bfe;
  transition: 1s;
}

input[type="file"]::file-selector-button:hover {
  background-color: #81ecec;
  border: 2px solid #00cec9;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example", "100%", 150)}}

Lưu ý rằng `::file-selector-button` là một phần tử hoàn chỉnh, và do đó khớp với các quy tắc từ UA stylesheet. Đặc biệt, font và màu sắc sẽ không nhất thiết kế thừa từ phần tử `input`.

### Ví dụ dự phòng

#### HTML

```html
<form>
  <label for="fileUpload">Upload file</label>
  <input type="file" id="fileUpload" />
</form>
```

#### CSS

```css hidden
form {
  display: flex;
  gap: 1em;
  align-items: center;
}
```

```css
input[type="file"]::file-selector-button {
  border: 2px solid #6c5ce7;
  padding: 0.2em 0.4em;
  border-radius: 0.2em;
  background-color: #a29bfe;
  transition: 1s;
}

input[type="file"]::-ms-browse:hover {
  background-color: #81ecec;
  border: 2px solid #00cec9;
}

input[type="file"]::-webkit-file-upload-button:hover {
  background-color: #81ecec;
  border: 2px solid #00cec9;
}

input[type="file"]::file-selector-button:hover {
  background-color: #81ecec;
  border: 2px solid #00cec9;
}
```

#### Kết quả

{{EmbedLiveSample("Fallback_example", "100%", 150)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Phần mở rộng CSS WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions)
- [API File and Directory Entries](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file)
