---
title: "Keyboard: phương thức lock()"
short-title: lock()
slug: Web/API/Keyboard/lock
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Keyboard.lock
---

{{APIRef("Keyboard API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`lock()`** của giao diện {{domxref("Keyboard")}} trả về một {{jsxref('Promise')}} phân giải sau khi bật tính năng chụp các lần nhấn phím cho bất kỳ hoặc tất cả các phím trên bàn phím vật lý. Phương thức này chỉ có thể chụp các phím được cấp quyền truy cập bởi hệ điều hành bên dưới.

Nếu `lock()` được gọi nhiều lần thì chỉ có các key code được chỉ định trong cuộc gọi gần nhất sẽ bị khóa.
Bất kỳ phím nào bị khóa bởi cuộc gọi trước đó đến `lock()` đều được mở khóa.

## Cú pháp

```js-nolint
lock()
lock(keyCodes)
```

### Tham số

- `keyCodes` {{optional_inline}}
  - : Một {{jsxref('Array')}} gồm một hoặc nhiều key code để khóa. Nếu không có keycodes nào được cung cấp, tất cả các phím sẽ bị khóa. Danh sách các giá trị code hợp lệ có trong thông số kỹ thuật [UI Events KeyboardEvent code Values](https://w3c.github.io/uievents-code/#key-alphanumeric-writing-system).

### Giá trị trả về

Một {{jsxref('Promise')}} phân giải với {{jsxref('undefined')}} khi khóa thành công.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu một cuộc gọi mới đến `lock()` được thực hiện trước khi cuộc gọi hiện tại hoàn thành.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu bất kỳ phím nào trong `keyCodes` không phải là [giá trị thuộc tính key code](https://w3c.github.io/uievents-code/#key-code-attribute-value) hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `lock()` không được gọi trong một ngữ cảnh duyệt cấp đầu đang hoạt động.

## Bảo mật

[Kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation) là cần thiết. Người dùng phải tương tác với trang hoặc phần tử UI để tính năng này hoạt động.

## Ví dụ

### Chụp tất cả các phím

Ví dụ sau chụp tất cả các lần nhấn phím.

```js
navigator.keyboard.lock();
```

### Chụp các phím cụ thể

Ví dụ sau chụp các phím <kbd>W</kbd>, <kbd>A</kbd>, <kbd>S</kbd> và <kbd>D</kbd>. Nó chụp các phím này bất kể modifier nào được sử dụng với lần nhấn phím. Giả sử bố cục QWERTY Mỹ tiêu chuẩn, đăng ký `"KeyW"` đảm bảo rằng <kbd>W</kbd>, <kbd>Shift</kbd>+<kbd>W</kbd>, <kbd>Control</kbd>+<kbd>W</kbd>, <kbd>Control</kbd>+<kbd>Shift</kbd>+<kbd>W</kbd> và tất cả các tổ hợp modifier phím khác với <kbd>W</kbd> được gửi đến ứng dụng.
Tương tự áp dụng cho `"KeyA"`, `"KeyS"` và `"KeyD"`.

```js
navigator.keyboard.lock(["KeyW", "KeyA", "KeyS", "KeyD"]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
