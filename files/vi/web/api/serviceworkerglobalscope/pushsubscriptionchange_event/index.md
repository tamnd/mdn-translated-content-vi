---
title: "ServiceWorkerGlobalScope: sự kiện pushsubscriptionchange"
short-title: pushsubscriptionchange
slug: Web/API/ServiceWorkerGlobalScope/pushsubscriptionchange_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.pushsubscriptionchange_event
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`pushsubscriptionchange`** được gửi đến [phạm vi toàn cục](/en-US/docs/Web/API/ServiceWorkerGlobalScope) của một {{domxref("ServiceWorker")}} để cho biết một thay đổi trong đăng ký đẩy đã được kích hoạt ngoài sự kiểm soát của ứng dụng.

Điều này có thể xảy ra nếu đăng ký được làm mới bởi trình duyệt, nhưng nó cũng có thể xảy ra nếu đăng ký đã bị thu hồi hoặc mất.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("pushsubscriptionchange", (event) => { })

onpushsubscriptionchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} tổng quát.

## Ghi chú sử dụng

Mặc dù các ví dụ minh họa cách chia sẻ thông tin liên quan đến đăng ký với máy chủ ứng dụng có xu hướng sử dụng {{domxref("WorkerGlobalScope/fetch", "fetch()")}}, đây không nhất thiết là lựa chọn tốt nhất cho sử dụng thực tế, vì nó sẽ không hoạt động nếu ứng dụng ngoại tuyến, ví dụ.

Hãy xem xét sử dụng một phương pháp khác để đồng bộ hóa thông tin đăng ký giữa service worker và máy chủ ứng dụng của bạn, hoặc đảm bảo mã sử dụng `fetch()` đủ mạnh để xử lý các trường hợp cố gắng trao đổi dữ liệu thất bại.

> [!NOTE]
> Trong các bản nháp trước của đặc tả kỹ thuật, sự kiện này được định nghĩa là được gửi khi một {{domxref("PushSubscription")}} đã hết hạn.

## Ví dụ

Ví dụ này, chạy trong ngữ cảnh của một service worker, lắng nghe một sự kiện `pushsubscriptionchange` và đăng ký lại đăng ký đã hết hạn.

```js
self.addEventListener("pushsubscriptionchange", (event) => {
  const conv = (val) =>
    self.btoa(String.fromCharCode.apply(null, new Uint8Array(val)));
  const getPayload = (subscription) => ({
    endpoint: subscription.endpoint,
    publicKey: conv(subscription.getKey("p256dh")),
    authToken: conv(subscription.getKey("auth")),
  });

  const subscription = self.registration.pushManager
    .subscribe(event.oldSubscription.options)
    .then((subscription) =>
      fetch("register", {
        method: "post",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          old: getPayload(event.oldSubscription),
          new: getPayload(subscription),
        }),
      }),
    );
  event.waitUntil(subscription);
});
```

Khi một sự kiện `pushsubscriptionchange` đến, cho biết rằng đăng ký đã hết hạn, chúng ta đăng ký lại bằng cách gọi phương thức {{domxref("PushManager.subscribe", "subscribe()")}} của push manager. Khi promise được trả về được giải quyết, chúng ta nhận được đăng ký mới. Điều này được chuyển đến máy chủ ứng dụng bằng cách sử dụng lệnh gọi {{domxref("WorkerGlobalScope/fetch", "fetch()")}} để đăng một phiên bản định dạng {{Glossary("JSON")}} của {{domxref("PushSubscription.endpoint", "endpoint")}} của đăng ký đến máy chủ ứng dụng.

Bạn cũng có thể sử dụng thuộc tính trình xử lý sự kiện `onpushsubscriptionchange` để thiết lập trình xử lý sự kiện:

```js
self.onpushsubscriptionchange = (event) => {
  event.waitUntil(
    self.registration.pushManager
      .subscribe(event.oldSubscription.options)
      .then((subscription) => {
        /* ... */
      }),
  );
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Push API](/en-US/docs/Web/API/Push_API)
