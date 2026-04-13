---
title: "KeyboardLayoutMap: phương thức entries()"
short-title: entries()
slug: Web/API/KeyboardLayoutMap/entries
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.entries
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.entries
---

{{SeeCompatTable}}{{APIRef("Keyboard API")}}

Phương thức **`entries()`** của giao diện {{domxref("KeyboardLayoutMap")}} trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các cặp khóa/giá trị, theo cùng thứ tự do vòng lặp {{jsxref("Statements/for...in", "for...in")}} cung cấp (sự khác biệt là vòng lặp `for-in` cũng liệt kê các thuộc tính trong chuỗi prototype).

Phương thức này giống với {{jsxref("Map.prototype.entries()")}}.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

Ví dụ sau lặp qua mỗi chuỗi theo vị trí hoặc bố cục cụ thể và mã bàn phím liên kết của nó trên bàn phím QWERTY tiếng Anh.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  for (const [code, key] of keyboardLayoutMap.entries()) {
    console.log(`${code} keyboard code represents ${key} key`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.entries()")}}
