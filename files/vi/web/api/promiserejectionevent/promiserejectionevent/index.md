---
title: "PromiseRejectionEvent: PromiseRejectionEvent() constructor"
short-title: PromiseRejectionEvent()
slug: Web/API/PromiseRejectionEvent/PromiseRejectionEvent
page-type: web-api-constructor
browser-compat: api.PromiseRejectionEvent.PromiseRejectionEvent
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Hàm khởi tạo **`PromiseRejectionEvent()`** trả về một đối tượng {{domxref("PromiseRejectionEvent")}} mới, đại diện cho các sự kiện được kích hoạt khi một {{jsxref("Promise")}} JavaScript bị từ chối.

Với các sự kiện từ chối promise, có thể phát hiện và báo cáo các promise thất bại mà sự thất bại không được chú ý. Nó cũng giúp dễ dàng hơn khi viết một trình xử lý toàn cục cho lỗi.

Có hai loại `PromiseRejectionEvent`: {{domxref("Window.unhandledrejection_event", "unhandledrejection")}} được gửi bởi JavaScript runtime khi một promise bị từ chối nhưng việc từ chối không được xử lý. Sự kiện {{domxref("Window.rejectionhandled_event", "rejectionhandled")}} được phát ra nếu một promise bị từ chối nhưng việc từ chối được bắt bởi một trình xử lý từ chối.

## Cú pháp

```js-nolint
new PromiseRejectionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt giá trị là `rejectionhandled` hoặc `unhandledrejection`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `promise`
      - : {{jsxref("Promise")}} đã bị từ chối.
    - `reason`
      - : Bất kỳ giá trị hoặc {{jsxref("Object")}} nào đại diện cho lý do promise bị từ chối. Đây có thể là bất cứ thứ gì từ mã lỗi số đến chuỗi lỗi hoặc đối tượng chứa thông tin chi tiết mô tả tình huống dẫn đến việc promise bị từ chối.

### Giá trị trả về

Một đối tượng `PromiseRejectionEvent` mới được cấu hình theo các tham số đã chỉ định.

## Ví dụ

Ví dụ này tạo một sự kiện {{domxref("Window.unhandledrejection_event", "unhandledrejection")}} mới cho promise `myPromise` với lý do là chuỗi "My house is on fire". `reason` cũng có thể là một số, hoặc thậm chí một đối tượng với thông tin chi tiết.

```js
let myRejectionEvent = new PromiseRejectionEvent("unhandledrejection", {
  promise: myPromise,
  reason: "My house is on fire",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng promises](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- {{jsxref("Promise")}}
- {{domxref("PromiseRejectionEvent")}}
