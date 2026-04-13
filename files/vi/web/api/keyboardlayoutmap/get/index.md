---
title: "KeyboardLayoutMap: phương thức get()"
short-title: get()
slug: Web/API/KeyboardLayoutMap/get
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.get
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.get
---

{{APIRef("Keyboard API")}}{{SeeCompatTable}}

Phương thức **`get()`** của giao diện {{domxref('KeyboardLayoutMap')}} trả về phần tử có khóa đã cho.

Danh sách các phím hợp lệ có thể tìm thấy trong đặc tả [UI Events KeyboardEvent code Values](https://w3c.github.io/uievents-code/).

Phương thức này giống với {{jsxref("Map.prototype.get()")}}.

## Cú pháp

```js-nolint
get(key)
```

### Tham số

- `key`
  - : Khóa của mục cần trả về từ bản đồ.

### Giá trị trả về

Giá trị của khóa được chỉ định.

## Ví dụ

Ví dụ sau minh họa cách lấy chuỗi theo vị trí hoặc bố cục cụ thể liên kết với mã bàn phím tương ứng với phím 'W' trên bàn phím QWERTY tiếng Anh.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  const upKey = keyboardLayoutMap.get("KeyW");
  window.alert(`Press ${upKey} to move up.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.get()")}}
