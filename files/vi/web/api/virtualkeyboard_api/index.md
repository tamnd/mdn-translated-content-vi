---
title: VirtualKeyboard API
slug: Web/API/VirtualKeyboard_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.VirtualKeyboard
---

{{SeeCompatTable}}{{DefaultAPISidebar("VirtualKeyboard API")}}{{securecontext_header}}

VirtualKeyboard API cung cấp cho nhà phát triển khả năng kiểm soát bố cục ứng dụng của họ khi bàn phím ảo trên màn hình xuất hiện và biến mất trên các thiết bị như máy tính bảng, điện thoại di động, hoặc các thiết bị khác không có bàn phím cứng.

Trình duyệt web thường tự xử lý bàn phím ảo, bằng cách điều chỉnh chiều cao viewport và cuộn đến các trường nhập khi được focus.

VirtualKeyboard API có thể được dùng để không tuân theo cách trình duyệt tự động xử lý bàn phím ảo, và thay vào đó kiểm soát hoàn toàn. Với VirtualKeyboard API, bàn phím vẫn xuất hiện và biến mất khi cần thiết khi các điều khiển biểu mẫu được focus, nhưng viewport không thay đổi, và bạn có thể dùng JavaScript và CSS để điều chỉnh bố cục.

## Khái niệm

VirtualKeyboard API bao gồm ba phần:

- Giao diện {{domxref("VirtualKeyboard")}}, được truy cập thông qua {{domxref('navigator.virtualKeyboard')}}, được dùng để không tuân theo hành vi bàn phím ảo tự động, hiển thị hoặc ẩn bàn phím ảo theo chương trình, cũng như lấy vị trí và kích thước hiện tại của bàn phím ảo.
- Các biến môi trường CSS `keyboard-inset-*` cung cấp thông tin về vị trí và kích thước của bàn phím ảo.
- Thuộc tính [`virtualkeyboardpolicy`](/en-US/docs/Web/HTML/Reference/Global_attributes/virtualkeyboardpolicy) chỉ định liệu bàn phím ảo có xuất hiện trên các phần tử `contenteditable` hay không.

### Không tuân theo hành vi bàn phím ảo tự động

Để không tuân theo hành vi bàn phím ảo tự động của trình duyệt, dùng `navigator.virtualKeyboard.overlaysContent = true`. Trình duyệt sẽ không còn tự động thay đổi kích thước viewport để dành chỗ cho bàn phím ảo, thay vào đó nó sẽ phủ lên nội dung của bạn.

### Phát hiện hình học bàn phím ảo bằng JavaScript

Sau khi bạn không tuân theo hành vi mặc định của trình duyệt, bạn có thể lấy hình học hiện tại của bàn phím ảo bằng `navigator.virtualKeyboard.boundingRect`, và điều chỉnh bố cục phù hợp bằng CSS và JavaScript. Ngoài ra, bạn có thể lắng nghe các thay đổi hình học, chẳng hạn khi bàn phím được hiển thị hoặc ẩn, bằng sự kiện `geometrychange`.

```js
if ("virtualKeyboard" in navigator) {
  navigator.virtualKeyboard.overlaysContent = true;

  navigator.virtualKeyboard.addEventListener("geometrychange", (event) => {
    const { x, y, width, height } = event.target.boundingRect;
  });
}
```

### Phát hiện hình học bàn phím ảo bằng biến môi trường CSS

VirtualKeyboard API cũng hiển thị các [biến môi trường CSS](/en-US/docs/Web/CSS/Reference/Values/env) sau: `keyboard-inset-top`, `keyboard-inset-right`, `keyboard-inset-bottom`, `keyboard-inset-left`, `keyboard-inset-width`, và `keyboard-inset-height`.

```html
<ul id="messages"></ul>
<input type="text" />
```

```css
body {
  display: grid;
  margin: 0;
  height: 100vh;
  grid-template:
    "messages" 1fr
    "input" auto
    "keyboard" env(keyboard-inset-height, 0px);
}
```

```js
if ("virtualKeyboard" in navigator) {
  navigator.virtualKeyboard.overlaysContent = true;
}
```

### Kiểm soát bàn phím ảo trên các phần tử `contenteditable`

Đặt thuộc tính [`virtualkeyboardpolicy`](/en-US/docs/Web/HTML/Reference/Global_attributes/virtualkeyboardpolicy) thành `manual` để ngăn xử lý mặc định của bàn phím ảo trong trình duyệt, và thay vào đó tự xử lý nó bằng các phương thức `show()` và `hide()` của giao diện {{domxref("VirtualKeyboard")}}.

```html
<div contenteditable virtualkeyboardpolicy="manual" id="editor"></div>
```

```js
if ("virtualKeyboard" in navigator) {
  navigator.virtualKeyboard.overlaysContent = true;

  const editor = document.getElementById("editor");
  editor.addEventListener("dblclick", () => {
    navigator.virtualKeyboard.show();
  });
}
```

## Giao diện

- {{domxref('VirtualKeyboard')}} {{experimental_inline}}
  - : Cung cấp các hàm lấy bản đồ bố cục bàn phím và bật/tắt việc nắm bắt lần nhấn phím từ bàn phím vật lý.

## Mở rộng cho các giao diện khác

- {{domxref("Navigator.virtualKeyboard")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về tham chiếu đến VirtualKeyboard API để kiểm soát bàn phím ảo trên màn hình.
- {{domxref("HTMLElement.virtualkeyboardpolicy")}} {{experimental_inline}}
  - : Một chuỗi chỉ định liệu có dùng chính sách mặc định của trình duyệt để hiển thị bàn phím ảo khi phần tử được focus, hay tự xử lý việc hiển thị bàn phím ảo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Full control with the VirtualKeyboard API](https://developer.chrome.com/docs/web-platform/virtual-keyboard/)
