---
title: "KeyboardLayoutMap: phương thức values()"
short-title: values()
slug: Web/API/KeyboardLayoutMap/values
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.values
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.values
---

{{SeeCompatTable}}{{APIRef("Keyboard API")}}

Phương thức **`values()`** của giao diện {{domxref("KeyboardLayoutMap")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các giá trị cho mỗi chỉ mục trong đối tượng `KeyboardLayoutMap`.

Phương thức này giống với {{jsxref("Map.prototype.values()")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

Ví dụ sau lặp qua mỗi chuỗi theo vị trí hoặc bố cục cụ thể trên bàn phím QWERTY tiếng Anh.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  for (const key of keyboardLayoutMap.values()) {
    console.log(`${key} key`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.values()")}}
