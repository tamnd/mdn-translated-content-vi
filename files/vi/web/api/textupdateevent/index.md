---
title: TextUpdateEvent
slug: Web/API/TextUpdateEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.TextUpdateEvent
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Giao diện **`TextUpdateEvent`** là một [DOM event](/en-US/docs/Web/API/Event) đại diện cho sự cập nhật văn bản hoặc vùng chọn trong vùng văn bản có thể chỉnh sửa được gắn với một phiên bản {{domxref("EditContext")}}.

Giao diện này kế thừa các thuộc tính từ {{domxref("Event")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("TextUpdateEvent.TextUpdateEvent", "TextUpdateEvent()")}} {{experimental_inline}}
  - : Tạo một đối tượng `TextUpdateEvent` mới.

## Thuộc tính phiên bản

- {{domxref('TextUpdateEvent.updateRangeStart')}} {{readonlyinline}} {{experimental_inline}}
  - : Trả về chỉ số của ký tự đầu tiên trong phạm vi văn bản đã được cập nhật.
- {{domxref('TextUpdateEvent.updateRangeEnd')}} {{readonlyinline}} {{experimental_inline}}
  - : Trả về chỉ số của ký tự cuối cùng trong phạm vi văn bản đã được cập nhật.
- {{domxref('TextUpdateEvent.text')}} {{readonlyinline}} {{experimental_inline}}
  - : Trả về văn bản đã được chèn vào phạm vi đã cập nhật.
- {{domxref('TextUpdateEvent.selectionStart')}} {{readonlyinline}} {{experimental_inline}}
  - : Trả về chỉ số của ký tự đầu tiên trong phạm vi vùng chọn mới, sau khi cập nhật.
- {{domxref('TextUpdateEvent.selectionEnd')}} {{readonlyinline}} {{experimental_inline}}
  - : Trả về chỉ số của ký tự cuối cùng trong phạm vi vùng chọn mới, sau khi cập nhật.

## Ví dụ

### Hiển thị văn bản đã cập nhật trong canvas có thể chỉnh sửa

Trong ví dụ sau, EditContext API được dùng để hiển thị văn bản có thể chỉnh sửa trong phần tử `<canvas>`, và sự kiện `textupdate` được dùng để hiển thị văn bản khi người dùng nhập liệu.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");
const editContext = new EditContext();
canvas.editContext = editContext;

function render() {
  // Clear the canvas.
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Render the text.
  ctx.fillText(editContext.text, 10, 10);
}

editContext.addEventListener("textupdate", (e) => {
  // Re-render the editor view when the user is entering text.
  render();

  console.log(
    `The user entered ${e.text}. Rendering the entire text: ${editContext.text}`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
