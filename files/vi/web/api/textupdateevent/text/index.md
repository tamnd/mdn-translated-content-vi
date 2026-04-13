---
title: "TextUpdateEvent: text property"
short-title: text
slug: Web/API/TextUpdateEvent/text
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.TextUpdateEvent.text
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`TextUpdateEvent.text`** chứa văn bản đã được chèn vào trong phạm vi đã cập nhật của sự kiện `textupdate` của {{domxref("EditContext")}}.

## Giá trị

Một {{jsxref("String")}} chứa văn bản thay thế văn bản nằm giữa các chỉ số {{domxref("TextUpdateEvent/updateRangeStart", "updateRangeStart")}} và {{domxref("TextUpdateEvent/updateRangeEnd", "updateRangeEnd")}}.

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
    `The user inserted the text "${e.text}" at index ${e.updateRangeStart}.`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
