---
title: "TransformStreamDefaultController: error() method"
short-title: error()
slug: Web/API/TransformStreamDefaultController/error
page-type: web-api-instance-method
browser-compat: api.TransformStreamDefaultController.error
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`error()`** của giao diện {{domxref("TransformStreamDefaultController")}} báo lỗi cả hai phía của luồng. Bất kỳ tương tác tiếp theo nào với nó sẽ thất bại với thông báo lỗi đã cho, và bất kỳ chunk nào trong hàng đợi sẽ bị loại bỏ.

## Cú pháp

```js-nolint
error(reason)
```

### Tham số

- `reason`
  - : Chuỗi chứa thông báo lỗi để trả về trên bất kỳ tương tác tiếp theo nào với luồng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ này, phương thức `error()` được sử dụng khi một chunk không thể được transform.

```js
const transformContent = {
  start() {
    /* … */
  },
  async transform(chunk, controller) {
    try {
      chunk = await applyMyTransformation(chunk);
    } catch (err) {
      controller.error(`Unable to transform chunk: ${err}`);
    }
    // …
  },
  // …
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
