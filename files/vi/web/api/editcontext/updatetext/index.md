---
title: "EditContext: updateText() method"
short-title: updateText()
slug: Web/API/EditContext/updateText
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.updateText
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`updateText()`** của giao diện {{domxref("EditContext")}} cập nhật nội dung văn bản nội bộ của đối tượng `EditContext`.

Phương thức này không cần được dùng khi người dùng nhập văn bản vào phần tử được liên kết. Đối tượng `EditContext` sẽ tự động cập nhật nội dung văn bản nội bộ và kích hoạt các sự kiện {{domxref("EditContext.textupdate_event", "textupdate")}} khi cần.

Tuy nhiên, phương thức này có thể được dùng khi người dùng tương tác với nội dung văn bản theo cách khác, chẳng hạn như khi dán văn bản từ clipboard.

## Cú pháp

```js-nolint
updateText(rangeStart, rangeEnd, text)
```

### Tham số

- `rangeStart`
  - : Một số đại diện cho điểm bắt đầu của phạm vi văn bản cần thay thế.
- `rangeEnd`
  - : Một số đại diện cho điểm kết thúc của phạm vi văn bản cần thay thế.
- `text`
  - : Một chuỗi đại diện cho nội dung văn bản mới.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu phương thức được gọi với ít hơn ba tham số.

## Ví dụ

### Cập nhật trình soạn thảo khi người dùng dán văn bản

Ví dụ này cho thấy cách dùng phương thức `updateText` để cập nhật nội dung văn bản trong `EditContext` của phần tử `<canvas>` khi người dùng nhấn tổ hợp phím <kbd>Ctrl</kbd>/<kbd>Cmd</kbd> + <kbd>V</kbd> để dán văn bản.

Ví dụ cũng dùng phương thức {{domxref("Clipboard.readText()")}} để đọc văn bản từ clipboard.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");

const editContext = new EditContext();
canvas.editContext = editContext;

function render() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.fillText(editContext.text, 0, 40);
}

editContext.addEventListener("textupdate", (e) => {
  render();
});

canvas.addEventListener("keydown", async (e) => {
  if (e.key === "v" && (e.ctrlKey || e.metaKey)) {
    const pastedText = await navigator.clipboard.readText();
    console.log(
      `The user pasted the text: ${pastedText}. Updating the EditContext text.`,
    );

    editContext.updateText(
      editContext.selectionStart,
      editContext.selectionEnd,
      pastedText,
    );

    editContext.updateSelection(
      editContext.selectionStart + pastedText.length,
      editContext.selectionStart + pastedText.length,
    );

    render();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
