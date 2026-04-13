---
title: "KeyboardLayoutMap: phương thức has()"
short-title: has()
slug: Web/API/KeyboardLayoutMap/has
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.has
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.has
---

{{APIRef("Keyboard API")}}{{SeeCompatTable}}

Phương thức **`has()`** của giao diện {{domxref('KeyboardLayoutMap')}} trả về giá trị boolean cho biết liệu đối tượng có phần tử với khóa đã chỉ định hay không.

Danh sách các phím hợp lệ có thể tìm thấy trong đặc tả [UI Events KeyboardEvent code Values](https://w3c.github.io/uievents-code/).

Phương thức này giống với {{jsxref("Map.prototype.has()")}}.

## Cú pháp

```js-nolint
has(key)
```

### Tham số

- `key`
  - : Khóa của phần tử cần tìm kiếm trong bản đồ.

### Giá trị trả về

Một {{jsxref('Boolean')}} cho biết liệu khóa đã chỉ định có được tìm thấy hay không.

## Ví dụ

Ví dụ sau kiểm tra xem chuỗi theo vị trí hoặc bố cục cụ thể liên kết với mã bàn phím tương ứng với phím 'W' trên bàn phím QWERTY tiếng Anh có tồn tại hay không.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  console.log(keyboardLayoutMap.has("KeyW"));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.has()")}}
