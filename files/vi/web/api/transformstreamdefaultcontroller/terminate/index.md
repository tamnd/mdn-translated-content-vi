---
title: "TransformStreamDefaultController: terminate() method"
short-title: terminate()
slug: Web/API/TransformStreamDefaultController/terminate
page-type: web-api-instance-method
browser-compat: api.TransformStreamDefaultController.terminate
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`terminate()`** của giao diện {{domxref("TransformStreamDefaultController")}} đóng phía có thể đọc và báo lỗi phía có thể ghi của luồng.

## Cú pháp

```js-nolint
terminate()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ dưới đây, phương thức `terminate()` được gọi trên {{domxref("TransformStreamDefaultController")}}.

```js
controller.terminate();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
