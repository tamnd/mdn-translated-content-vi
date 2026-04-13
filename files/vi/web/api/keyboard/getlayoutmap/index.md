---
title: "Keyboard: phương thức getLayoutMap()"
short-title: getLayoutMap()
slug: Web/API/Keyboard/getLayoutMap
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Keyboard.getLayoutMap
---

{{APIRef("Keyboard API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`getLayoutMap()`** của giao diện {{domxref("Keyboard")}} trả về một {{jsxref('Promise')}} phân giải với một phiên bản của {{domxref('KeyboardLayoutMap')}} là đối tượng dạng map với các hàm để lấy các chuỗi liên kết với các phím vật lý cụ thể.

## Cú pháp

```js-nolint
getLayoutMap()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} phân giải với một phiên bản của {{domxref('KeyboardLayoutMap')}}.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu cuộc gọi bị chặn bởi [chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Ví dụ

Ví dụ sau minh họa cách lấy chuỗi cụ thể theo vị trí hoặc bố cục liên kết với phím tương ứng với phím 'W' trên bàn phím QWERTY tiếng Anh.

```js
const keyboard = navigator.keyboard;
keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  const upKey = keyboardLayoutMap.get("KeyW");
  window.alert(`Press ${upKey} to move up.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl")}}
