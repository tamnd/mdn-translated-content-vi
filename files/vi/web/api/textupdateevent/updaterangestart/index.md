---
title: "TextUpdateEvent: updateRangeStart property"
short-title: updateRangeStart
slug: Web/API/TextUpdateEvent/updateRangeStart
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.TextUpdateEvent.updateRangeStart
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`TextUpdateEvent.updateRangeStart`** cho biết vị trí bắt đầu của phạm vi văn bản đang được thay thế trong đối tượng {{domxref("EditContext")}}.

## Giá trị

Một {{jsxref("Number")}}.

## Ví dụ

### Sử dụng `textupdate` để hiển thị văn bản đã chèn và vị trí

```html
<div id="editor"></div>
```

```js
const editorEl = document.getElementById("editor");
const editContext = new EditContext();
editorEl.editContext = editContext;

editContext.addEventListener("textupdate", (e) => {
  console.log(
    `The user inserted the text "${e.text}" between index ${e.updateRangeStart} and index ${e.updateRangeEnd}.`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
