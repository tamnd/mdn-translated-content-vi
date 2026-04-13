---
title: ServiceWorkerGlobalScope
slug: Web/API/ServiceWorkerGlobalScope
page-type: web-api-interface
browser-compat: api.ServiceWorkerGlobalScope
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Giao diện **`ServiceWorkerGlobalScope`** của [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) đại diện cho ngữ cảnh thực thi toàn cục của một service worker.

Các nhà phát triển nên lưu ý rằng trạng thái ServiceWorker không được duy trì qua chu kỳ kết thúc/khởi động lại, vì vậy mỗi trình xử lý sự kiện nên giả định nó được gọi với trạng thái toàn cục mặc định, trống.

Sau khi đăng ký thành công, service worker có thể và sẽ bị kết thúc khi nhàn rỗi để tiết kiệm bộ nhớ và sức mạnh xử lý. Một service worker đang hoạt động được tự động khởi động lại để phản hồi các sự kiện, chẳng hạn như {{domxref("ServiceWorkerGlobalScope.fetch_event", "fetch")}} hoặc {{domxref("ServiceWorkerGlobalScope.message_event", "message")}}.

Ngoài ra, các yêu cầu đồng bộ không được phép từ bên trong service worker — chỉ các yêu cầu không đồng bộ, như những yêu cầu được khởi tạo qua phương thức {{domxref("WorkerGlobalScope/fetch", "fetch()")}}, mới có thể được sử dụng.

Giao diện này kế thừa từ giao diện {{domxref("WorkerGlobalScope")}}, và giao diện cha {{domxref("EventTarget")}} của nó.

{{InheritanceDiagram}}

## Thuộc tính của instance

_Giao diện này kế thừa các thuộc tính từ giao diện {{domxref("WorkerGlobalScope")}}, và giao diện cha {{domxref("EventTarget")}} của nó._

- {{domxref("ServiceWorkerGlobalScope.clients")}} {{ReadOnlyInline}}
  - : Chứa đối tượng {{domxref("Clients")}} được liên kết với service worker.
- {{domxref("ServiceWorkerGlobalScope.cookieStore")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("CookieStore")}} được liên kết với service worker.
- {{domxref("ServiceWorkerGlobalScope.registration")}} {{ReadOnlyInline}}
  - : Chứa đối tượng {{domxref("ServiceWorkerRegistration")}} đại diện cho việc đăng ký của service worker.
- {{domxref("ServiceWorkerGlobalScope.serviceWorker")}} {{ReadOnlyInline}}
  - : Chứa đối tượng {{domxref("ServiceWorker")}} đại diện cho service worker.

## Phương thức của instance

_Giao diện này kế thừa các phương thức từ giao diện {{domxref("WorkerGlobalScope")}}, và giao diện cha {{domxref("EventTarget")}} của nó._

- {{domxref("ServiceWorkerGlobalScope.skipWaiting()")}}
  - : Cho phép đăng ký service worker hiện tại tiến từ trạng thái waiting sang trạng thái active trong khi các client service worker đang sử dụng nó.

## Sự kiện

Lắng nghe sự kiện này bằng cách sử dụng {{domxref("EventTarget/addEventListener()", "addEventListener()")}} hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("ServiceWorkerGlobalScope/activate_event", "activate")}}
  - : Xảy ra khi một {{domxref("ServiceWorkerRegistration")}} có một worker {{domxref("ServiceWorkerRegistration.active")}} mới.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchabort_event", "backgroundfetchabort")}} {{Experimental_Inline}}
  - : Được kích hoạt khi một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) đã bị hủy bởi người dùng hoặc ứng dụng.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchclick_event", "backgroundfetchclick")}} {{Experimental_Inline}}
  - : Được kích hoạt khi người dùng nhấp vào UI cho một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API).
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchfail_event", "backgroundfetchfail")}} {{Experimental_Inline}}
  - : Được kích hoạt khi ít nhất một yêu cầu trong một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) đã thất bại.
- {{domxref("ServiceWorkerGlobalScope/backgroundfetchsuccess_event", "backgroundfetchsuccess")}} {{Experimental_Inline}}
  - : Được kích hoạt khi tất cả các yêu cầu trong một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) đã thành công.
- {{domxref("ServiceWorkerGlobalScope/canmakepayment_event", "canmakepayment")}} {{Experimental_Inline}}
  - : Được kích hoạt trên service worker của ứng dụng thanh toán để kiểm tra xem nó đã sẵn sàng xử lý thanh toán chưa. Cụ thể, nó được kích hoạt khi trang web merchant gọi phương thức khởi tạo {{domxref("PaymentRequest.PaymentRequest", "PaymentRequest()")}}.
- {{domxref("ServiceWorkerGlobalScope/contentdelete_event", "contentdelete")}} {{Experimental_Inline}}
  - : Xảy ra khi một mục bị xóa khỏi {{domxref("ContentIndex")}}.
- {{domxref("ServiceWorkerGlobalScope/cookiechange_event", "cookiechange")}}
  - : Được kích hoạt khi một thay đổi cookie xảy ra khớp với danh sách đăng ký thay đổi cookie của service worker.
- {{domxref("ServiceWorkerGlobalScope/fetch_event", "fetch")}}
  - : Xảy ra khi một {{domxref("WorkerGlobalScope/fetch", "fetch()")}} được gọi.
- {{domxref("ServiceWorkerGlobalScope/install_event", "install")}}
  - : Xảy ra khi một {{domxref("ServiceWorkerRegistration")}} có một worker {{domxref("ServiceWorkerRegistration.installing")}} mới.
- {{domxref("ServiceWorkerGlobalScope/message_event", "message")}}
  - : Xảy ra khi các thông điệp đến được nhận. Các trang được điều khiển có thể sử dụng phương thức {{domxref("MessagePort.postMessage()")}} để gửi thông điệp đến service workers.
- {{domxref("ServiceWorkerGlobalScope/messageerror_event", "messageerror")}}
  - : Xảy ra khi các thông điệp đến không thể được giải tuần tự hóa.
- {{domxref("ServiceWorkerGlobalScope/notificationclick_event", "notificationclick")}}
  - : Xảy ra khi người dùng nhấp vào một thông báo đã hiển thị.
- {{domxref("ServiceWorkerGlobalScope/notificationclose_event", "notificationclose")}}
  - : Xảy ra khi người dùng đóng một thông báo đã hiển thị.
- {{domxref("ServiceWorkerGlobalScope/paymentrequest_event", "paymentrequest")}} {{Experimental_Inline}}
  - : Được kích hoạt trên một ứng dụng thanh toán khi một luồng thanh toán đã được khởi tạo trên trang web merchant thông qua phương thức {{domxref("PaymentRequest.show()")}}.
- {{domxref("ServiceWorkerGlobalScope/sync_event", "sync")}}
  - : Được kích hoạt khi một lệnh gọi đến {{domxref("SyncManager.register")}} được thực hiện từ một trang client service worker. Lần thử đồng bộ được thực hiện ngay lập tức nếu mạng khả dụng hoặc ngay khi mạng trở nên khả dụng.
- {{domxref("ServiceWorkerGlobalScope/periodicsync_event", "periodicsync")}} {{Experimental_Inline}}
  - : Xảy ra ở các khoảng thời gian định kỳ, được chỉ định khi đăng ký một {{domxref("PeriodicSyncManager")}}.
- {{domxref("ServiceWorkerGlobalScope/push_event", "push")}}
  - : Xảy ra khi một thông báo đẩy từ máy chủ được nhận.
- {{domxref("ServiceWorkerGlobalScope/pushsubscriptionchange_event", "pushsubscriptionchange")}}
  - : Xảy ra khi một đăng ký đẩy đã bị vô hiệu hóa, hoặc sắp bị vô hiệu hóa (ví dụ: khi dịch vụ đẩy đặt thời gian hết hạn).

## Ví dụ

Đoạn mã này trích từ [mẫu prefetch service worker](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/prefetch/service-worker.js) (xem [ví dụ prefetch trực tiếp](https://googlechrome.github.io/samples/service-worker/prefetch/).) Trình xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.fetch_event", "onfetch")}} lắng nghe sự kiện `fetch`. Khi được kích hoạt, mã trả về một promise giải quyết thành yêu cầu khớp đầu tiên trong đối tượng {{domxref("Cache")}}. Nếu không tìm thấy khớp, mã sẽ lấy phản hồi từ mạng.

Mã cũng xử lý các ngoại lệ được ném ra từ thao tác {{domxref("WorkerGlobalScope/fetch", "fetch()")}}. Lưu ý rằng một phản hồi lỗi HTTP (ví dụ: 404) sẽ không kích hoạt ngoại lệ. Nó sẽ trả về một đối tượng phản hồi bình thường có mã lỗi thích hợp được thiết lập.

```js
self.addEventListener("fetch", (event) => {
  console.log("Handling fetch event for", event.request.url);

  event.respondWith(
    caches.match(event.request).then((response) => {
      if (response) {
        console.log("Found response in cache:", response);

        return response;
      }
      console.log("No response found in cache. About to fetch from network…");

      return fetch(event.request).then(
        (response) => {
          console.log("Response from network is:", response);

          return response;
        },
        (error) => {
          console.error("Fetching failed:", error);

          throw error;
        },
      );
    }),
  );
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Mẫu mã service workers cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
