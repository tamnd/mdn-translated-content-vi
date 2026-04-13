---
title: "VirtualKeyboard: show() method"
short-title: show()
slug: Web/API/VirtualKeyboard/show
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.VirtualKeyboard.show
---

{{APIRef("VirtualKeyboard API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`show()`** của giao diện {{domxref("VirtualKeyboard")}} hiển thị bàn phím ảo trên màn hình theo chương trình. Điều này hữu ích khi trang cần thực hiện logic bàn phím ảo của riêng mình, đặc biệt khi sử dụng thuộc tính `virtualkeyboardpolicy` trên các phần tử `contenteditable` như được giải thích trong [Control the virtual keyboard on `contenteditable` elements](/en-US/docs/Web/API/VirtualKeyboard_API#control_the_virtual_keyboard_on_contenteditable_elements).

Phương thức này chỉ hoạt động nếu phần tử đang được focus là điều khiển form, chẳng hạn như phần tử {{htmlelement("input")}} hoặc {{htmlelement("textarea")}}, hoặc nếu phần tử được focus là [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable), và thuộc tính [`virtualKeyboardPolicy`](/en-US/docs/Web/HTML/Reference/Global_attributes/virtualkeyboardpolicy) của phần tử đang được focus được đặt thành `manual` và [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode) không được đặt thành `none`.

Phương thức `show()` luôn trả về `undefined` và kích hoạt sự kiện {{domxref("VirtualKeyboard.geometrychange_event", "geometrychange")}}.

## Cú pháp

```js-nolint
show()
```

### Tham số

Không có.

### Giá trị trả về

Undefined.

## Ví dụ

Đoạn code dưới đây cho thấy cách sử dụng thuộc tính `virtualkeyboardpolicy` để ngăn trình duyệt hiển thị bàn phím ảo khi nhấp hoặc chạm. Code cũng sử dụng các phương thức `navigator.virtualKeyboard.show()` và `navigator.virtualKeyboard.hide()` để hiển thị và ẩn bàn phím ảo khi một nút được nhấp:

```html
<div contenteditable virtualkeyboardpolicy="manual" id="editor"></div>
<button id="edit-button">Edit</button>
```

```js
if ("virtualKeyboard" in navigator) {
  const editor = document.getElementById("editor");
  const editButton = document.getElementById("edit-button");
  let isEditing = false;

  editButton.addEventListener("click", () => {
    if (isEditing) {
      navigator.virtualKeyboard.hide();
      editButton.textContent = "Edit";
    } else {
      editor.focus();
      navigator.virtualKeyboard.show();
      editButton.textContent = "Save changes";
    }

    isEditing = !isEditing;
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VirtualKeyboard_API", "The VirtualKeyboard API", "", "nocode")}}
- [Full control with the VirtualKeyboard API](https://developer.chrome.com/docs/web-platform/virtual-keyboard/)
