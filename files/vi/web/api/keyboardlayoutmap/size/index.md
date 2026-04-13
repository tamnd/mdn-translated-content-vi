---
title: "KeyboardLayoutMap: thuộc tính size"
short-title: size
slug: Web/API/KeyboardLayoutMap/size
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.size
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-get-map.prototype.size
---

{{SeeCompatTable}}{{APIRef("Keyboard API")}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("KeyboardLayoutMap")}} trả về số phần tử trong bản đồ.

Thuộc tính này giống với {{jsxref("Map.prototype.size")}}.

## Giá trị

Một số.

## Ví dụ

Ví dụ sau lấy số lượng chuỗi theo vị trí hoặc bố cục cụ thể và mã bàn phím liên kết của nó trên bàn phím QWERTY tiếng Anh.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  console.log(keyboardLayoutMap.size);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.size")}}
