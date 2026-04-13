---
title: "TextUpdateEvent: selectionEnd property"
short-title: selectionEnd
slug: Web/API/TextUpdateEvent/selectionEnd
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.TextUpdateEvent.selectionEnd
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`TextUpdateEvent.selectionEnd`** cho biết vị trí kết thúc của vùng chọn (hoặc con trỏ) trong nội dung văn bản của vùng có thể chỉnh sửa được gắn với đối tượng {{domxref("EditContext")}}.

## Giá trị

Một {{jsxref("Number")}}.

## Ví dụ

### Sử dụng `textupdate` để hiển thị văn bản đã chỉnh sửa và vùng chọn người dùng

Ví dụ này cho thấy cách sử dụng thuộc tính `selectionEnd` để hiển thị văn bản được chọn trong trình xử lý sự kiện {{domxref("EditContext/textupdate_event", "textupdate")}}.

```css
#editor {
  height: 200px;
  background: #eeeeee;
  color: black;
}

.selection {
  display: inline-block;
  vertical-align: bottom;
  background: blue;
  color: white;
  min-width: 2px;
  height: 3ex;
}
```

```html
<div id="editor"></div>
```

```js
const editorEl = document.getElementById("editor");
const editContext = new EditContext();
editorEl.editContext = editContext;

editContext.addEventListener("textupdate", (e) => {
  // Clear the current content.
  editorEl.textContent = "";

  const text = editContext.text;
  const { selectionStart, selectionEnd } = e;

  // Render the text before the selection.
  const textBefore = document.createElement("span");
  textBefore.textContent = text.substring(0, selectionStart);

  // Render the selected text, or caret.
  const textSelected = document.createElement("span");
  textSelected.classList.add("selection");
  textSelected.textContent = text.substring(selectionStart, selectionEnd);

  // Render the text after the selection.
  const textAfter = document.createElement("span");
  textAfter.textContent = text.substring(selectionEnd);

  editorEl.appendChild(textBefore);
  editorEl.appendChild(textSelected);
  editorEl.appendChild(textAfter);

  console.log(`Text before selection: ${textBefore.textContent}`);
  console.log(`Selected text: ${textSelected.textContent}`);
  console.log(`Text after selection: ${textAfter.textContent}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
