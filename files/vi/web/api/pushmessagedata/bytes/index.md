---
title: "PushMessageData: phương thức bytes()"
short-title: bytes()
slug: Web/API/PushMessageData/bytes
page-type: web-api-instance-method
browser-compat: api.PushMessageData.bytes
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Phương thức **`bytes()`** của giao diện {{domxref("PushMessageData")}} trích xuất dữ liệu push message dưới dạng đối tượng {{jsxref("Uint8Array")}}.

## Cú pháp

```js-nolint
bytes()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Uint8Array")}}.

### Ngoại lệ

Giá trị trả về {{jsxref("Uint8Array")}} được hỗ trợ bởi một {{jsxref("ArrayBuffer")}} chứa các byte.
Mọi ngoại lệ được ném ra trong quá trình tạo bộ đệm hỗ trợ này sẽ được ném lại.

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

```js
self.addEventListener("push", (event) => {
  const buffer = event.data.bytes();

  // làm gì đó với mảng typed của bạn
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
