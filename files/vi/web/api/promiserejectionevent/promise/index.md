---
title: "PromiseRejectionEvent: promise property"
short-title: promise
slug: Web/API/PromiseRejectionEvent/promise
page-type: web-api-instance-property
browser-compat: api.PromiseRejectionEvent.promise
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`promise`** của giao diện {{domxref("PromiseRejectionEvent")}} cho biết {{jsxref("Promise")}} JavaScript đã bị từ chối. Bạn có thể kiểm tra thuộc tính {{domxref("PromiseRejectionEvent.reason")}} của sự kiện để tìm hiểu lý do tại sao promise bị từ chối.

## Giá trị

{{jsxref("Promise")}} JavaScript đã bị từ chối, và việc từ chối không được xử lý.

## Ví dụ

Ví dụ này lắng nghe các promise chưa được xử lý và nếu {{domxref("PromiseRejectionEvent.reason", "reason")}} là một đối tượng có trường `code` chứa văn bản "Module not ready", nó thiết lập một idle callback sẽ thử lại tác vụ không thực thi được.

{{domxref("event.preventDefault()")}} được gọi để chỉ ra rằng promise đã được xử lý.

```js
window.onunhandledrejection = (event) => {
  if (event.reason?.code === "Module not ready") {
    requestIdleCallback((deadline) => {
      loadModule(event.reason.moduleName).then(performStartup);
    });
    event.preventDefault();
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện từ chối Promise](/en-US/docs/Web/JavaScript/Guide/Using_promises#promise_rejection_events)
- {{jsxref("Promise")}}
- {{domxref("PromiseRejectionEvent")}}
- {{domxref("Window.rejectionhandled_event", "rejectionhandled")}}
- {{domxref("Window.unhandledrejection_event", "unhandledrejection")}}
