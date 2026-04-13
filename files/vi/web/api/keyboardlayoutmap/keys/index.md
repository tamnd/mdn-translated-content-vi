---
title: "KeyboardLayoutMap: phương thức keys()"
short-title: keys()
slug: Web/API/KeyboardLayoutMap/keys
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.keys
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.keys
---

{{SeeCompatTable}}{{APIRef("Keyboard API")}}

Phương thức **`keys()`** của giao diện {{domxref("KeyboardLayoutMap")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các khóa cho mỗi chỉ mục trong đối tượng `KeyboardLayoutMap`.

Phương thức này giống với {{jsxref("Map.prototype.keys()")}}.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

Ví dụ sau lặp qua mỗi mã bàn phím trên bàn phím QWERTY tiếng Anh.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  for (const code of keyboardLayoutMap.keys()) {
    console.log(`${code} keyboard code`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.keys()")}}
