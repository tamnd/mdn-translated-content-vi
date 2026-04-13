---
title: "ExtendableMessageEvent: ExtendableMessageEvent() constructor"
short-title: ExtendableMessageEvent()
slug: Web/API/ExtendableMessageEvent/ExtendableMessageEvent
page-type: web-api-constructor
browser-compat: api.ExtendableMessageEvent.ExtendableMessageEvent
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`ExtendableMessageEvent()`** tạo một đối tượng {{domxref("ExtendableMessageEvent")}} mới.

## Cú pháp

```js-nolint
new ExtendableMessageEvent(type)
new ExtendableMessageEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt đặt là `messageerror` hoặc `message`.
- `options` {{optional_inline}}
  - : Một đối tượng, ngoài các thuộc tính được xác định trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}, có thể có các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Dữ liệu của sự kiện, có thể là bất kỳ loại dữ liệu nào. Mặc định là `null`.
    - `origin` {{optional_inline}}
      - : Một chuỗi xác định nguồn gốc của đối tượng cài đặt môi trường service worker tương ứng. Mặc định là `""`.
    - `lastEventId` {{optional_inline}}
      - : Một chuỗi xác định ID sự kiện cuối cùng của nguồn sự kiện. Mặc định là `""`.
    - `source` {{optional_inline}}
      - : {{domxref("Client")}}, {{domxref("ServiceWorker")}} hoặc {{domxref("MessagePort")}} đã gửi thông báo. Mặc định là `null`.
    - `ports` {{optional_inline}}
      - : Một mảng chứa các đối tượng {{domxref("MessagePort")}} kết nối với kênh gửi thông báo. Mặc định là mảng rỗng.

### Giá trị trả về

Một đối tượng {{domxref("ExtendableMessageEvent")}} mới.

## Ví dụ

```js
const options = {
  data: "hello message",
  source: MessagePortReference,
  ports: MessagePortListReference,
};

const myEME = new ExtendableMessageEvent("message", init);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Channel Messaging](/en-US/docs/Web/API/Channel_Messaging_API)
