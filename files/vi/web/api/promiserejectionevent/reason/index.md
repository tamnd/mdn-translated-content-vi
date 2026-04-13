---
title: "PromiseRejectionEvent: reason property"
short-title: reason
slug: Web/API/PromiseRejectionEvent/reason
page-type: web-api-instance-property
browser-compat: api.PromiseRejectionEvent.reason
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`reason`** của {{domxref("PromiseRejectionEvent")}} là bất kỳ giá trị hoặc {{jsxref("Object")}} JavaScript nào cung cấp lý do được truyền vào {{jsxref("Promise.reject()")}}. Về lý thuyết, điều này cung cấp thông tin về lý do tại sao promise bị từ chối.

## Giá trị

Giá trị hoặc đối tượng cung cấp thông tin để hiểu tại sao promise bị từ chối. Đây có thể là bất cứ thứ gì từ mã lỗi đến đối tượng với văn bản, liên kết và bất kỳ thứ gì khác bạn muốn đưa vào.

## Ví dụ

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

- {{jsxref("Promise")}}
- {{domxref("PromiseRejectionEvent")}}
- {{domxref("Window.rejectionhandled_event", "rejectionhandled")}}
- {{domxref("Window.unhandledrejection_event", "unhandledrejection")}}
