---
title: "EditContext: updateSelection() method"
short-title: updateSelection()
slug: Web/API/EditContext/updateSelection
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.updateSelection
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`updateSelection()`** của giao diện {{domxref("EditContext")}} cập nhật trạng thái nội bộ của vùng chọn trong ngữ cảnh văn bản có thể chỉnh sửa. Phương thức này được dùng để cập nhật trạng thái vùng chọn khi người dùng tương tác với việc hiển thị văn bản trong phần tử được liên kết với `EditContext`, chẳng hạn như bằng cách nhấn hoặc kéo chuột, hoặc sử dụng bàn phím.

## Cú pháp

```js-nolint
updateSelection(start, end)
```

### Tham số

- `start`
  - : Một số đại diện cho điểm bắt đầu vùng chọn mới.
- `end`
  - : Một số đại diện cho điểm kết thúc vùng chọn mới. Nếu giá trị `start` và `end` bằng nhau, vùng chọn tương đương với con trỏ.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu phương thức được gọi với ít hơn hai tham số, hoặc nếu một trong hai tham số không phải là số không âm.

## Ví dụ

### Cập nhật vùng chọn khi người dùng tương tác với văn bản

Ví dụ này cho thấy cách dùng phương thức `updateSelection` để cập nhật vùng chọn trong `EditContext` của phần tử `canvas` khi sử dụng phím mũi tên để di chuyển con trỏ hoặc chọn văn bản trong vùng có thể chỉnh sửa.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const editContext = new EditContext();
canvas.editContext = editContext;

canvas.addEventListener("keydown", (e) => {
  if (e.key === "ArrowLeft") {
    const newPosition = Math.max(editContext.selectionStart - 1, 0);

    if (e.shiftKey) {
      editContext.updateSelection(newPosition, editContext.selectionEnd);
    } else {
      editContext.updateSelection(newPosition, newPosition);
    }
  } else if (e.key === "ArrowRight") {
    const newPosition = Math.min(
      editContext.selectionEnd + 1,
      editContext.text.length,
    );

    if (e.shiftKey) {
      editContext.updateSelection(editContext.selectionStart, newPosition);
    } else {
      editContext.updateSelection(newPosition, newPosition);
    }
  }

  console.log(
    `The new EditContext selection is ${editContext.selectionStart}, ${editContext.selectionEnd}`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
