---
title: "MediaKeyStatusMap: phương thức forEach()"
short-title: forEach()
slug: Web/API/MediaKeyStatusMap/forEach
page-type: web-api-instance-method
browser-compat: api.MediaKeyStatusMap.forEach
---

{{APIRef("Encrypted Media Extensions")}}

Phương thức **`forEach()`** của giao diện {{domxref("MediaKeyStatusMap")}} gọi callback một lần cho mỗi cặp khóa-giá trị trong bản đồ trạng thái, theo thứ tự chèn. Nếu có đối số, nó sẽ được truyền cho callback.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử, nhận ba đối số:
    - `currentValue`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index` {{optional_inline}}
      - : Chỉ mục của phần tử hiện tại đang được xử lý trong mảng.
    - `array` {{optional_inline}}
      - : Mảng mà `forEach()` đang được áp dụng.

- `thisArg` {{optional_inline}}
  - : Giá trị được sử dụng làm `this` khi thực thi `callback`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
