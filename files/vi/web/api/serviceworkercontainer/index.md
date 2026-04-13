---
title: ServiceWorkerContainer
slug: Web/API/ServiceWorkerContainer
page-type: web-api-interface
browser-compat: api.ServiceWorkerContainer
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`ServiceWorkerContainer`** của [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) cung cấp một đối tượng đại diện cho service worker như một đơn vị tổng thể trong hệ sinh thái mạng, bao gồm các chức năng để đăng ký, hủy đăng ký và cập nhật service workers, cũng như truy cập trạng thái của service workers và các registration của chúng.

Quan trọng nhất, nó hiển thị phương thức {{domxref("ServiceWorkerContainer.register()")}} dùng để đăng ký service workers, và thuộc tính {{domxref("ServiceWorkerContainer.controller")}} dùng để xác định xem trang hiện tại có đang được kiểm soát hay không.

Các đối tượng `ServiceWorkerContainer` được hiển thị trong phạm vi Window thông qua {{domxref("Navigator.serviceWorker")}} và trong workers sử dụng {{domxref("WorkerNavigator.serviceWorker")}} (nếu được hỗ trợ — hãy kiểm tra [tương thích trình duyệt](#browser_compatibility)).

{{InheritanceDiagram}}

## Thuộc tính instance

- {{domxref("ServiceWorkerContainer.controller")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("ServiceWorker")}} đại diện cho service worker đang hoạt động kiểm soát trang hiện tại hoặc `null` nếu trang không có service worker đang hoạt động hoặc đang kích hoạt.
- {{domxref("ServiceWorkerContainer.ready")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref('Promise')}} sẽ resolve với {{domxref("ServiceWorkerRegistration")}} liên kết với trang hiện tại, nhưng chỉ khi có một service worker đang hoạt động.
    Điều này cung cấp một cơ chế để trì hoãn việc thực thi mã cho đến khi service worker hoạt động.

## Phương thức instance

- {{domxref("ServiceWorkerContainer.getRegistration()")}}
  - : Lấy một đối tượng {{domxref("ServiceWorkerRegistration")}} có scope phù hợp với URL tài liệu được cung cấp. Phương thức trả về một {{jsxref("Promise")}} resolve thành một {{domxref("ServiceWorkerRegistration")}} hoặc `undefined`.
- {{domxref("ServiceWorkerContainer.getRegistrations()")}}
  - : Trả về tất cả các đối tượng {{domxref("ServiceWorkerRegistration")}} liên kết với `ServiceWorkerContainer` trong một mảng. Phương thức trả về một {{jsxref("Promise")}} resolve thành một mảng các {{domxref("ServiceWorkerRegistration")}}.
- {{domxref("ServiceWorkerContainer.register()")}}
  - : Tạo hoặc cập nhật một {{domxref("ServiceWorkerRegistration")}} cho `scriptURL` đã cho.
- {{domxref("ServiceWorkerContainer.startMessages()")}}
  - : Khởi động rõ ràng luồng tin nhắn được phân phối từ service worker đến các trang thuộc quyền kiểm soát của nó (ví dụ: được gửi qua {{domxref("Client.postMessage()")}}). Điều này có thể được sử dụng để phản hồi các tin nhắn đã gửi sớm hơn, ngay cả khi nội dung của trang đó chưa tải xong.

## Sự kiện

- {{domxref("ServiceWorkerContainer/controllerchange_event", "controllerchange")}}
  - : Được kích hoạt khi {{domxref("ServiceWorkerRegistration")}} liên kết với tài liệu có được một worker {{domxref("ServiceWorkerRegistration.active","active")}} mới.
- {{domxref("ServiceWorkerContainer/message_event", "message")}}
  - : Được kích hoạt khi các tin nhắn đến được nhận bởi đối tượng `ServiceWorkerContainer` (ví dụ: thông qua lệnh gọi {{domxref("MessagePort.postMessage()")}}).
- {{domxref("ServiceWorkerContainer/messageerror_event", "messageerror")}}
  - : Được kích hoạt khi các tin nhắn đến không thể được giải tuần tự hóa bởi đối tượng `ServiceWorkerContainer` (ví dụ: thông qua lệnh gọi {{domxref("MessagePort.postMessage()")}}).

## Ví dụ

Ví dụ dưới đây trước tiên kiểm tra xem trình duyệt có hỗ trợ service workers không. Nếu được hỗ trợ, mã sẽ đăng ký service worker và xác định xem trang có đang được service worker kiểm soát tích cực không. Nếu không, nó sẽ nhắc người dùng tải lại trang để service worker có thể kiểm soát. Mã cũng báo cáo mọi lỗi đăng ký.

```js
if ("serviceWorker" in navigator) {
  // Register a service worker hosted at the root of the
  // site using the default scope.
  navigator.serviceWorker
    .register("/sw.js")
    .then((registration) => {
      console.log("Service worker registration succeeded:", registration);

      // At this point, you can optionally do something
      // with registration. See https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration
    })
    .catch((error) => {
      console.error(`Service worker registration failed: ${error}`);
    });

  // Independent of the registration, let's also display
  // information about whether the current page is controlled
  // by an existing service worker, and when that
  // controller changes.

  // First, do a one-off check if there's currently a
  // service worker in control.
  if (navigator.serviceWorker.controller) {
    console.log(
      "This page is currently controlled by:",
      navigator.serviceWorker.controller,
    );
  }

  // Then, register a handler to detect when a new or
  // updated service worker takes control.
  navigator.serviceWorker.oncontrollerchange = () => {
    console.log(
      "This page is now controlled by",
      navigator.serviceWorker.controller,
    );
  };
} else {
  console.log("Service workers are not supported.");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
