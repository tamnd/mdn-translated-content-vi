---
title: "PushEvent: hàm khởi tạo PushEvent()"
short-title: PushEvent()
slug: Web/API/PushEvent/PushEvent
page-type: web-api-constructor
browser-compat: api.PushEvent.PushEvent
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`PushEvent()`** tạo một đối tượng {{domxref("PushEvent")}} mới. Lưu ý rằng hàm khởi tạo này chỉ được hiển thị trong ngữ cảnh service worker.

## Cú pháp

```js-nolint
new PushEvent(type)
new PushEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt đặt là `push` hoặc `pushsubscriptionchange`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}_, có thể có các thuộc tính sau:
    - `data`
      - : Dữ liệu bạn muốn `PushEvent` chứa, nếu có.
        Khi hàm khởi tạo được gọi, thuộc tính {{domxref("PushEvent.data")}} của đối tượng kết quả sẽ được đặt thành một đối tượng {{domxref("PushMessageData")}} mới chứa các byte này.

### Giá trị trả về

Một đối tượng {{domxref("PushEvent")}} mới.

## Ví dụ

```js
const dataInit = {
  data: "Some sample text",
};

const myPushEvent = new PushEvent("push", dataInit);

myPushEvent.data.text(); // sẽ trả về 'Some sample text'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Push API](/en-US/docs/Web/API/Push_API)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
