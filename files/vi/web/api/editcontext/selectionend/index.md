---
title: "EditContext: selectionEnd property"
short-title: selectionEnd
slug: Web/API/EditContext/selectionEnd
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.EditContext.selectionEnd
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`selectionEnd`** của {{domxref("EditContext")}} tham chiếu đến độ lệch, trong nội dung văn bản có thể chỉnh sửa, của điểm kết thúc vùng chọn hiện tại.

## Giá trị

Một {{jsxref("Number")}}

## Ví dụ

### Dùng `selectionEnd` để hiển thị vùng chọn người dùng trong canvas có thể chỉnh sửa

Ví dụ này cho thấy cách dùng thuộc tính `selectionStart` và `selectionEnd` để vẽ vùng chọn hiện tại trong phần tử `<canvas>` được liên kết với `EditContext`.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const ANCHOR_X = 10;
const ANCHOR_Y = 30;
const FONT_SIZE = 20;

const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");
ctx.font = `${FONT_SIZE}px Arial`;

const editContext = new EditContext({
  text: "Hello world!",
  selectionStart: 6,
  selectionEnd: 11,
});
canvas.editContext = editContext;

function render() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Hiển thị toàn bộ nội dung văn bản trước.
  ctx.fillStyle = "black";
  ctx.fillText(editContext.text, ANCHOR_X, ANCHOR_Y);

  // Lấy chiều rộng từ đầu văn bản đến điểm bắt đầu vùng chọn.
  const selectionStartX = ctx.measureText(
    editContext.text.substring(0, editContext.selectionStart),
  );

  // Lấy chiều rộng của vùng chọn.
  const selectionWidth = ctx.measureText(
    editContext.text.substring(
      editContext.selectionStart,
      editContext.selectionEnd,
    ),
  );

  // Vẽ hình chữ nhật lên trên văn bản để biểu thị vùng chọn.
  ctx.fillStyle = "blue";
  ctx.fillRect(
    selectionStartX.width + ANCHOR_X,
    ANCHOR_Y - FONT_SIZE,
    selectionWidth.width,
    FONT_SIZE,
  );

  // Vẽ lại văn bản được chọn màu trắng, lên trên hình chữ nhật.
  ctx.fillStyle = "white";
  ctx.fillText(
    editContext.text.substring(
      editContext.selectionStart,
      editContext.selectionEnd,
    ),
    selectionStartX.width + ANCHOR_X,
    ANCHOR_Y,
  );
}

render();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
