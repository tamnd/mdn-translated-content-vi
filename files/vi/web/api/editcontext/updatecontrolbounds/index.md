---
title: "EditContext: updateControlBounds() method"
short-title: updateControlBounds()
slug: Web/API/EditContext/updateControlBounds
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.updateControlBounds
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`EditContext.updateControlBounds()`** của giao diện {{domxref("EditContext")}} được dùng để thông báo cho hệ điều hành về vị trí và kích thước của vùng văn bản có thể chỉnh sửa của đối tượng `EditContext`.

Gọi phương thức này để cho hệ điều hành biết kích thước bao quanh của vùng có thể chỉnh sửa hiện tại. Bạn nên gọi phương thức này khi khởi tạo EditContext, và bất cứ khi nào kích thước bao quanh của vùng có thể chỉnh sửa thay đổi, chẳng hạn khi trang web được thay đổi kích thước. Các kích thước này được dùng để định vị các giao diện người dùng liên quan đến chỉnh sửa của nền tảng, chẳng hạn như cửa sổ {{glossary("Input Method Editor")}} (IME).

## Cú pháp

```js-nolint
updateControlBounds(controlBounds)
```

### Tham số

- `controlBounds`
  - : Một đối tượng {{domxref("DOMRect")}} đại diện cho kích thước bao quanh điều khiển mới.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu phương thức được gọi không có tham số hoặc tham số được cung cấp không phải là đối tượng {{domxref("DOMRect")}}.

## Ví dụ

### Cập nhật kích thước điều khiển khi khởi tạo trình soạn thảo và khi thay đổi kích thước cửa sổ

Ví dụ này cho thấy cách dùng phương thức `updateControlBounds()` để thông báo cho nền tảng biết vị trí vùng có thể chỉnh sửa ở mọi thời điểm.

```css
#editor {
  border: 1px solid black;
  height: 50vw;
  width: 50vh;
}
```

```html
<div id="editor"></div>
```

```js
const editorEl = document.getElementById("editor");
const editContext = new EditContext();
editorEl.editContext = editContext;

function updateControlBounds() {
  const editorBounds = editorEl.getBoundingClientRect();
  editContext.updateControlBounds(editorBounds);
  console.log(
    `Updated control bounds to ${editorBounds.x}, ${editorBounds.y}, ${editorBounds.width}, ${editorBounds.height}`,
  );
}

// Cập nhật kích thước điều khiển ngay bây giờ.
updateControlBounds();
// Và khi trang được thay đổi kích thước.
window.addEventListener("resize", updateControlBounds);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
