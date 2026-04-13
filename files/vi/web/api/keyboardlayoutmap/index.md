---
title: KeyboardLayoutMap
slug: Web/API/KeyboardLayoutMap
page-type: web-api-interface
status:
  - experimental
browser-compat: api.KeyboardLayoutMap
---

{{SeeCompatTable}}{{APIRef("Keyboard API")}}

Giao diện **`KeyboardLayoutMap`** của {{domxref("Keyboard API", "", "", "nocode")}} là một đối tượng chỉ đọc với các hàm để lấy chuỗi liên kết với các phím vật lý cụ thể.

Phiên bản `KeyboardLayoutMap` là một đối tượng [giống `Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) chỉ đọc, trong đó mỗi khóa là một chuỗi xác định phím vật lý duy nhất trên bàn phím (một "mã phím"), và giá trị tương ứng là giá trị thuộc tính phím liên kết (có thể bị ảnh hưởng bởi bố cục bàn phím, v.v.).

Danh sách các phím hợp lệ có thể tìm thấy trong đặc tả [UI Events KeyboardEvent code Values](https://w3c.github.io/uievents-code/).

## Thuộc tính phiên bản

- {{domxref('KeyboardLayoutMap.size')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về số phần tử trong đối tượng `KeyboardLayoutMap`.

## Phương thức phiên bản

- `KeyboardLayoutMap[Symbol.iterator]()` {{experimental_inline}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các cặp khóa/giá trị.
- {{domxref('KeyboardLayoutMap.entries()')}} {{experimental_inline}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các cặp khóa/giá trị.
- {{domxref('KeyboardLayoutMap.forEach()')}} {{experimental_inline}}
  - : Thực thi hàm được cung cấp một lần cho mỗi phần tử của `KeyboardLayoutMap`.
- {{domxref('KeyboardLayoutMap.get()')}} {{experimental_inline}}
  - : Trả về phần tử có khóa đã cho từ đối tượng `KeyboardLayoutMap`.
- {{domxref('KeyboardLayoutMap.has()')}} {{experimental_inline}}
  - : Trả về giá trị boolean cho biết liệu đối tượng `KeyboardLayoutMap` có phần tử với khóa đã chỉ định hay không.
- {{domxref('KeyboardLayoutMap.keys()')}} {{experimental_inline}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các khóa cho mỗi chỉ mục trong đối tượng `KeyboardLayoutMap`.
- {{domxref('KeyboardLayoutMap.values()')}} {{experimental_inline}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các giá trị cho mỗi chỉ mục trong đối tượng `KeyboardLayoutMap`.

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
