---
title: PromiseRejectionEvent
slug: Web/API/PromiseRejectionEvent
page-type: web-api-interface
browser-compat: api.PromiseRejectionEvent
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Giao diện **`PromiseRejectionEvent`** đại diện cho các sự kiện được gửi đến ngữ cảnh script toàn cục khi các {{jsxref("Promise")}} JavaScript bị từ chối. Các sự kiện này đặc biệt hữu ích cho mục đích phân tích và gỡ lỗi.

Để biết thêm chi tiết, xem [Sự kiện từ chối Promise](/en-US/docs/Web/JavaScript/Guide/Using_promises#promise_rejection_events).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PromiseRejectionEvent.PromiseRejectionEvent", "PromiseRejectionEvent()")}}
  - : Tạo một sự kiện `PromiseRejectionEvent`, cho loại sự kiện ([`unhandledrejection`](/en-US/docs/Web/API/Window/unhandledrejection_event) hoặc [`rejectionhandled`](/en-US/docs/Web/API/Window/rejectionhandled_event)) và các chi tiết khác.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ lớp cha {{domxref("Event")}}_.

- {{domxref("PromiseRejectionEvent.promise")}} {{ReadOnlyInline}}
  - : {{jsxref("Promise")}} JavaScript đã bị từ chối.
- {{domxref("PromiseRejectionEvent.reason")}} {{ReadOnlyInline}}
  - : Giá trị hoặc {{jsxref("Object")}} cho biết lý do tại sao promise bị từ chối, được truyền vào {{jsxref("Promise.reject()")}}.

## Phương thức phiên bản

_Giao diện này không có phương thức riêng; kế thừa các phương thức từ lớp cha {{domxref("Event")}}_.

## Sự kiện

- {{domxref("Window/rejectionhandled_event", "rejectionhandled")}}
  - : Kích hoạt khi một {{jsxref("Promise")}} JavaScript bị từ chối, và sau khi việc từ chối được xử lý bởi code xử lý từ chối của promise.
- {{domxref("Window/unhandledrejection_event", "unhandledrejection")}}
  - : Kích hoạt khi một {{jsxref("Promise")}} JavaScript bị từ chối nhưng không có trình xử lý từ chối để xử lý việc từ chối.

## Ví dụ

Ví dụ đơn giản này bắt các từ chối promise chưa được xử lý và ghi log chúng cho mục đích gỡ lỗi.

```js
window.onunhandledrejection = (e) => {
  console.log(e.reason);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng promises](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- {{jsxref("Promise")}}
- {{domxref("Window/rejectionhandled_event", "rejectionhandled")}}
- {{domxref("Window/unhandledrejection_event", "unhandledrejection")}}
