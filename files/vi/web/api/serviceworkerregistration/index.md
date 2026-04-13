---
title: ServiceWorkerRegistration
slug: Web/API/ServiceWorkerRegistration
page-type: web-api-interface
browser-compat: api.ServiceWorkerRegistration
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Giao diện **`ServiceWorkerRegistration`** của [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) đại diện cho việc đăng ký service worker. Bạn đăng ký một service worker để kiểm soát một hoặc nhiều trang chia sẻ cùng nguồn gốc.

Thời gian tồn tại của một đăng ký service worker vượt xa các đối tượng `ServiceWorkerRegistration` đại diện cho chúng trong thời gian tồn tại của các client service worker tương ứng. Trình duyệt duy trì một danh sách bền vững các đối tượng `ServiceWorkerRegistration` đang hoạt động.

{{InheritanceDiagram}}

## Thuộc tính instance

_Cũng kế thừa các thuộc tính từ giao diện cha,_ {{domxref("EventTarget")}}.

- {{domxref("ServiceWorkerRegistration.active")}} {{ReadOnlyInline}}
  - : Trả về một service worker có trạng thái là `activating` hoặc `activated`. Ban đầu được đặt thành `null`. Một worker đang hoạt động sẽ kiểm soát một {{domxref("Client")}} nếu URL của client nằm trong phạm vi của đăng ký (tùy chọn `scope` được đặt khi {{domxref("ServiceWorkerContainer.register")}} được gọi lần đầu tiên.)
- {{domxref("ServiceWorkerRegistration.backgroundFetch")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("BackgroundFetchManager")}}, quản lý các hoạt động fetch nền.
- {{domxref("ServiceWorkerRegistration.cookies")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến giao diện {{domxref("CookieStoreManager")}}, cho phép đăng ký và hủy đăng ký các sự kiện thay đổi cookie.
- {{domxref("ServiceWorkerRegistration.index")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến giao diện {{domxref("ContentIndex")}}, để quản lý nội dung đã lập chỉ mục cho xem ngoại tuyến.
- {{domxref("ServiceWorkerRegistration.installing")}} {{ReadOnlyInline}}
  - : Trả về một service worker có trạng thái là `installing`. Ban đầu được đặt thành `null`.
- {{domxref("ServiceWorkerRegistration.navigationPreload")}} {{ReadOnlyInline}}
  - : Trả về thể hiện của {{domxref("NavigationPreloadManager")}} được liên kết với đăng ký service worker hiện tại.
- {{domxref("ServiceWorkerRegistration.paymentManager")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một thể hiện {{domxref("PaymentManager")}} của ứng dụng thanh toán, được sử dụng để quản lý các chức năng khác nhau của ứng dụng thanh toán.
- {{domxref("ServiceWorkerRegistration.periodicSync")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến giao diện {{domxref("PeriodicSyncManager")}}, cho phép đăng ký các tác vụ chạy ở các khoảng thời gian cụ thể.
- {{domxref("ServiceWorkerRegistration.pushManager")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến giao diện {{domxref("PushManager")}} để quản lý các đăng ký push bao gồm đăng ký, lấy đăng ký đang hoạt động, và truy cập trạng thái quyền push.
- {{domxref("ServiceWorkerRegistration.scope")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho một URL xác định phạm vi đăng ký của service worker; đó là, phạm vi URL mà service worker có thể kiểm soát.
- {{domxref("ServiceWorkerRegistration.sync")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến giao diện {{domxref("SyncManager")}}, quản lý các quá trình đồng bộ hóa nền.
- {{domxref("ServiceWorkerRegistration.updateViaCache")}} {{ReadOnlyInline}}
  - : Trả về giá trị của cài đặt được sử dụng để xác định các trường hợp mà trình duyệt sẽ tham vấn bộ nhớ đệm HTTP khi cố gắng cập nhật service worker hoặc bất kỳ tập lệnh nào được nhập qua {{domxref("WorkerGlobalScope.importScripts", "importScripts()")}}. Nó có thể là một trong các giá trị sau: `imports`, `all`, hoặc `none`.
- {{domxref("ServiceWorkerRegistration.waiting")}} {{ReadOnlyInline}}
  - : Trả về một service worker có trạng thái là `installed`. Ban đầu được đặt thành `null`.

## Phương thức instance

_Cũng kế thừa các phương thức từ giao diện cha,_ {{domxref("EventTarget")}}.

- {{domxref("ServiceWorkerRegistration.getNotifications()")}}
  - : Trả về một danh sách các thông báo theo thứ tự chúng được tạo từ nguồn gốc hiện tại thông qua đăng ký service worker hiện tại.
- {{domxref("ServiceWorkerRegistration.showNotification()")}}
  - : Hiển thị thông báo với tiêu đề được yêu cầu.
- {{domxref("ServiceWorkerRegistration.unregister()")}}
  - : Hủy đăng ký service worker và trả về một {{jsxref("Promise")}}. Service worker sẽ hoàn thành bất kỳ hoạt động nào đang diễn ra trước khi bị hủy đăng ký.
- {{domxref("ServiceWorkerRegistration.update()")}}
  - : Kiểm tra máy chủ cho phiên bản cập nhật của service worker mà không tham vấn bộ nhớ đệm.

## Sự kiện

- {{domxref("ServiceWorkerRegistration.updatefound_event", "updatefound")}}
  - : Được kích hoạt bất cứ khi nào thuộc tính {{domxref("ServiceWorkerRegistration.installing")}} có được một service worker mới.

## Ví dụ

Trong ví dụ này, mã trước tiên kiểm tra xem trình duyệt có hỗ trợ service workers không và nếu có thì đăng ký một cái. Tiếp theo, nó thêm một trình lắng nghe `updatefound` trong đó nó sử dụng đăng ký service worker để lắng nghe các thay đổi tiếp theo về trạng thái của service worker. Nếu service worker không thay đổi kể từ lần đăng ký cuối cùng, thì sự kiện `updatefound` sẽ không được kích hoạt.

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("/sw.js")
    .then((registration) => {
      registration.addEventListener("updatefound", () => {
        // If updatefound is fired, it means that there's
        // a new service worker being installed.
        const installingWorker = registration.installing;
        console.log(
          "A new service worker is being installed:",
          installingWorker,
        );

        // You can listen for changes to the installing service worker's
        // state via installingWorker.onstatechange
      });
    })
    .catch((error) => {
      console.error(`Service worker registration failed: ${error}`);
    });
} else {
  console.error("Service workers are not supported.");
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
