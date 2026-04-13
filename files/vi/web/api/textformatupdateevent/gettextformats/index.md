---
title: "TextFormatUpdateEvent: getTextFormats() method"
short-title: getTextFormats()
slug: Web/API/TextFormatUpdateEvent/getTextFormats
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.TextFormatUpdateEvent.getTextFormats
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`getTextFormats()`** của giao diện {{domxref("TextFormatUpdateEvent")}} trả về một {{jsxref("Array")}} các đối tượng {{domxref("TextFormat")}} đại diện cho các định dạng mà cửa sổ {{glossary("Input Method Editor")}} (IME) muốn áp dụng cho văn bản đang được soạn thảo.

## Cú pháp

```js-nolint
getTextFormats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} chứa các đối tượng {{domxref("TextFormat")}}.

## Ví dụ

### Tạo kiểu văn bản được soạn thảo bởi IME

Trong ví dụ sau, sự kiện `textformatupdate` được sử dụng để cập nhật định dạng của văn bản trong vùng chỉnh sửa.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const TEXT_X = 10;
const TEXT_Y = 10;

const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");

const editContext = new EditContext();
canvas.editContext = editContext;

editContext.addEventListener("textformatupdate", (e) => {
  // Xóa canvas.
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Hiển thị văn bản.
  ctx.fillText(editContext.text, TEXT_X, TEXT_Y);
  console.log(`Rendering text: ${editContext.text}`);

  // Lấy các định dạng văn bản mà cửa sổ IME muốn áp dụng.
  const formats = e.getTextFormats();

  // Lặp qua các định dạng văn bản
  for (const format of formats) {
    const { rangeStart, rangeEnd, underlineStyle, underlineThickness } = format;

    console.log(
      `Applying underline ${underlineThickness} ${underlineStyle} between ${rangeStart} and ${rangeEnd}.`,
    );

    const underlineXStart = ctx.measureText(
      editContext.text.substring(0, rangeStart),
    ).width;
    const underlineXEnd = ctx.measureText(
      editContext.text.substring(0, rangeEnd),
    ).width;
    const underlineY = TEXT_Y + 3;

    ctx.beginPath();
    ctx.moveTo(TEXT_X + underlineXStart, underlineY);
    ctx.lineTo(TEXT_X + underlineXEnd, underlineY);
    ctx.stroke();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
