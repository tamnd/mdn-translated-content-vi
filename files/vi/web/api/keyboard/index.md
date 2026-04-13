---
title: Keyboard
slug: Web/API/Keyboard
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Keyboard
---

{{SeeCompatTable}}{{APIRef("Keyboard API")}}{{securecontext_header}}

Giao diện **`Keyboard`** của {{domxref("Keyboard API", "", "", "nocode")}} cung cấp các hàm để truy xuất bản đồ bố cục bàn phím và bật/tắt chụp các lần nhấn phím từ bàn phím vật lý.

Danh sách các giá trị code hợp lệ được tìm thấy trong thông số kỹ thuật [UI Events KeyboardEvent code Values](https://w3c.github.io/uievents-code/).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("EventTarget")}}._

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref('Keyboard.getLayoutMap()')}} {{experimental_inline}}
  - : Trả về một {{jsxref('Promise')}} phân giải với một phiên bản của {{domxref('KeyboardLayoutMap')}}, là một đối tượng dạng bản đồ với các hàm để truy xuất các chuỗi liên quan đến các phím vật lý cụ thể.
- {{domxref('Keyboard.lock()')}} {{experimental_inline}}
  - : Trả về một {{jsxref('Promise')}} phân giải sau khi bật tính năng chụp các lần nhấn phím cho bất kỳ hoặc tất cả các phím trên bàn phím vật lý.
- {{domxref('Keyboard.unlock()')}} {{experimental_inline}}
  - : Mở khóa tất cả các phím đã bị chụp bởi phương thức `lock()` và trả về đồng bộ.

## Ví dụ

### Ánh xạ bàn phím

Ví dụ sau minh họa cách lấy chuỗi theo vị trí hoặc bố cục cụ thể liên quan đến phím tương ứng với phím 'W' trên bàn phím QWERTY tiếng Anh.

```js
if (navigator.keyboard) {
  const keyboard = navigator.keyboard;
  keyboard.getLayoutMap().then((keyboardLayoutMap) => {
    const upKey = keyboardLayoutMap.get("KeyW");
    window.alert(`Press ${upKey} to move up.`);
  });
} else {
  // Do something else.
}
```

### Khóa bàn phím

Ví dụ sau chụp các phím <kbd>W</kbd>, <kbd>A</kbd>, <kbd>S</kbd> và <kbd>D</kbd>, gọi `lock()` với danh sách chứa giá trị thuộc tính code của mỗi phím:

```js
navigator.keyboard.lock(["KeyW", "KeyA", "KeyS", "KeyD"]);
```

Thao tác này chụp các phím này bất kể phím bổ trợ nào được sử dụng cùng. Giả sử bố cục QWERTY Hoa Kỳ tiêu chuẩn, đăng ký `KeyW` đảm bảo rằng <kbd>W</kbd>, <kbd>Shift+W</kbd>, <kbd>Control+W</kbd>, <kbd>Control+Shift+W</kbd> và tất cả các tổ hợp phím bổ trợ khác với <kbd>W</kbd> đều được gửi đến ứng dụng. Tương tự cho `KeyA`, `KeyS` và `KeyD`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
