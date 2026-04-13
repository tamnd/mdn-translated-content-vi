---
title: "EditContext: text property"
short-title: text
slug: Web/API/EditContext/text
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.EditContext.text
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`text`** của giao diện {{domxref("EditContext")}} đại diện cho nội dung văn bản có thể chỉnh sửa của phần tử.

## Giá trị

Một chuỗi chứa nội dung văn bản có thể chỉnh sửa hiện tại của phần tử được gắn với đối tượng `EditContext`. Giá trị ban đầu của nó là chuỗi rỗng.

Chuỗi này có thể bằng hoặc không bằng giá trị của thuộc tính {{domxref("Node.textContent", "textContent")}} của phần tử DOM được liên kết với `EditContext`. Phần tử được liên kết có thể, ví dụ, là phần tử `<canvas>` không có thuộc tính `textContent`. Hoặc phần tử được liên kết có thể là phần tử `<div>` chứa văn bản khác với giá trị `EditContext.text`, dùng cho các cách hiển thị nâng cao hơn.

Thuộc tính `text` của đối tượng `EditContext` có thể được dùng như là mô hình cho vùng văn bản có thể chỉnh sửa. Các thuộc tính khác của đối tượng `EditContext`, chẳng hạn như `selectionStart` và `selectionEnd`, tham chiếu đến các độ lệch trong chuỗi `text`.

## Ví dụ

### Dùng `text` để hiển thị văn bản trong canvas có thể chỉnh sửa

Trong ví dụ sau, EditContext API được dùng để hiển thị văn bản mà người dùng nhập vào phần tử `<canvas>`.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");
const editContext = new EditContext();
canvas.editContext = editContext;

editContext.addEventListener("textupdate", (e) => {
  // Khi người dùng focus vào <canvas> và nhập văn bản,
  // sự kiện này được kích hoạt, và ta dùng nó để vẽ lại văn bản.
  console.log(
    `The user entered the text: ${e.text}. Re-rendering the full EditContext text`,
  );
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.fillText(editContext.text, 10, 10);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
