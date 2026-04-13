---
title: ServiceWorker
slug: Web/API/ServiceWorker
page-type: web-api-interface
browser-compat: api.ServiceWorker
---

{{securecontext_header}}{{APIRef("Service Workers API")}}{{AvailableInWorkers}}

Giao diện **`ServiceWorker`** của [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) cung cấp một tham chiếu đến một service worker. Nhiều {{glossary("browsing context", "ngữ cảnh duyệt web")}} (ví dụ: các trang, worker, v.v.) có thể được liên kết với cùng một service worker, mỗi ngữ cảnh thông qua một đối tượng `ServiceWorker` duy nhất.

Đối tượng `ServiceWorker` khả dụng thông qua một số thuộc tính sau:

- {{domxref("ServiceWorkerRegistration.active")}}
- {{domxref("ServiceWorkerGlobalScope.serviceWorker")}}
- {{domxref("ServiceWorkerContainer.controller")}} — khi service worker ở trạng thái `activating` hoặc `activated`
- {{domxref("ServiceWorkerRegistration.installing")}} — khi service worker ở trạng thái `installing`
- {{domxref("ServiceWorkerRegistration.waiting")}} — khi service worker ở trạng thái `installed`

Thuộc tính {{domxref("ServiceWorker.state")}} và [sự kiện `statechange`](/en-US/docs/Web/API/ServiceWorker/statechange_event) có thể được sử dụng để kiểm tra và quan sát các thay đổi trong trạng thái vòng đời của service worker được liên kết với đối tượng.
Các sự kiện vòng đời liên quan, chẳng hạn như [`install`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event) và [`activate`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event) được gửi đến chính service worker.

Service worker cho phép nhập tĩnh các [mô-đun ECMAScript](/en-US/docs/Web/JavaScript/Guide/Modules), nếu được hỗ trợ, bằng cách sử dụng [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import).
Việc nhập động bị cấm theo đặc tả kỹ thuật — việc gọi [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) sẽ ném ra lỗi.

Service worker chỉ có thể được đăng ký trong phạm vi Window ở một số hoặc tất cả trình duyệt, vì đối tượng `ServiceWorker` không được hiển thị tới {{domxref("DedicatedWorkerGlobalScope")}} và {{domxref("SharedWorkerGlobalScope")}}.
Kiểm tra phần [tương thích trình duyệt](#browser_compatibility) để biết thông tin.

{{InheritanceDiagram}}

## Thuộc tính của instance

_Giao diện `ServiceWorker` kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("ServiceWorker.scriptURL")}} {{ReadOnlyInline}}
  - : Trả về URL tập lệnh đã được tuần tự hóa của `ServiceWorker` được định nghĩa như một phần của {{domxref("ServiceWorkerRegistration")}}. URL phải có cùng nguồn gốc với tài liệu đăng ký `ServiceWorker`.
- {{domxref("ServiceWorker.state")}} {{ReadOnlyInline}}
  - : Trả về trạng thái của service worker. Nó trả về một trong các giá trị sau: `parsed`, `installing`, `installed`, `activating`, `activated`, hoặc `redundant`.

## Phương thức của instance

_Giao diện `ServiceWorker` kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("ServiceWorker.postMessage()")}}
  - : Gửi một thông điệp — bao gồm bất kỳ đối tượng JavaScript nào có thể [sao chép theo cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) — đến service worker. Thông điệp được truyền đến service worker bằng cách sử dụng sự kiện {{domxref("ServiceWorkerGlobalScope.message_event", "message")}} trên phạm vi toàn cục của nó.

## Sự kiện

- {{domxref("ServiceWorker.statechange_event", "statechange")}}
  - : Được kích hoạt khi {{domxref("ServiceWorker.state")}} thay đổi.

- {{domxref("ServiceWorker.error_event", "error")}}
  - : Được kích hoạt khi xảy ra lỗi bên trong đối tượng `ServiceWorker`.

## Ví dụ

Đoạn mã này trích từ [mẫu sự kiện đăng ký service worker](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/registration-events/index.html) ([xem trực tiếp](https://googlechrome.github.io/samples/service-worker/registration-events/)). Mã lắng nghe mọi thay đổi trong {{domxref("ServiceWorker.state")}} và trả về giá trị của nó.

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("service-worker.js", {
      scope: "./",
    })
    .then((registration) => {
      let serviceWorker;
      if (registration.installing) {
        serviceWorker = registration.installing;
        document.querySelector("#kind").textContent = "installing";
      } else if (registration.waiting) {
        serviceWorker = registration.waiting;
        document.querySelector("#kind").textContent = "waiting";
      } else if (registration.active) {
        serviceWorker = registration.active;
        document.querySelector("#kind").textContent = "active";
      }
      if (serviceWorker) {
        // logState(serviceWorker.state);
        serviceWorker.addEventListener("statechange", (e) => {
          // logState(e.target.state);
        });
      }
    })
    .catch((error) => {
      // Something went wrong during registration. The service-worker.js file
      // might be unavailable or contain a syntax error.
    });
} else {
  // The current browser doesn't support service workers.
  // Perhaps it is too old or we are not in a Secure Context.
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [The Offline Cookbook](https://web.dev/articles/offline-cookbook) (service workers)
- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Mẫu mã service worker cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
