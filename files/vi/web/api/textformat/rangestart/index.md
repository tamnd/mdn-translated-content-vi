---
title: "TextFormat: rangeStart property"
short-title: rangeStart
slug: Web/API/TextFormat/rangeStart
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.TextFormat.rangeStart
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính **`rangeStart`** của giao diện {{domxref("TextFormat")}} cho biết vị trí bắt đầu của phạm vi văn bản cần được định dạng với định dạng văn bản đã cho.

## Giá trị

Một {{jsxref("Number")}}.

## Ví dụ

### Đọc phạm vi văn bản cần được định dạng

Ví dụ sau cho thấy cách sử dụng thuộc tính `rangeStart` và `rangeEnd` của sự kiện `textformatupdate` để xác định phạm vi văn bản cần được định dạng. Lưu ý rằng callback của trình nghe sự kiện trong ví dụ này chỉ được gọi khi sử dụng cửa sổ IME để soạn thảo văn bản.

```html
<div id="editor"></div>
```

```css hidden
#editor {
  height: 200px;
  background: #eeeeee;
}
```

```js
const editorEl = document.getElementById("editor");
const editContext = new EditContext(editorEl);
editorEl.editContext = editContext;

editContext.addEventListener("textformatupdate", (e) => {
  const formats = e.getTextFormats();

  for (const format of formats) {
    console.log(
      `IME wants to apply formatting between ${format.rangeStart} and ${format.rangeEnd}.`,
    );
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextFormat")}} mà nó thuộc về.
