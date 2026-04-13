---
title: PushManager
slug: Web/API/PushManager
page-type: web-api-interface
browser-compat: api.PushManager
---

{{ApiRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`PushManager`** của [Push API](/en-US/docs/Web/API/Push_API) cung cấp một cách để nhận thông báo từ các máy chủ bên thứ ba cũng như yêu cầu các URL cho thông báo đẩy.

Giao diện này được truy cập thông qua thuộc tính {{domxref("ServiceWorkerRegistration.pushManager")}}.

## Thuộc tính tĩnh

- [`PushManager.supportedContentEncodings`](/en-US/docs/Web/API/PushManager/supportedContentEncodings_static)
  - : Trả về một mảng các content coding được hỗ trợ có thể dùng để mã hóa payload của một thông điệp đẩy.

## Phương thức thể hiện

- {{domxref("PushManager.getSubscription()")}}
  - : Truy xuất một đăng ký đẩy hiện có. Phương thức này trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PushSubscription")}} chứa chi tiết của đăng ký hiện có. Nếu không có đăng ký hiện có, giá trị giải quyết là `null`.
- {{domxref("PushManager.permissionState()")}}
  - : Trả về một {{jsxref("Promise")}} giải quyết thành trạng thái quyền của `PushManager` hiện tại, một trong các giá trị `'granted'`, `'denied'` hoặc `'prompt'`.
- {{domxref("PushManager.subscribe()")}}
  - : Đăng ký một dịch vụ đẩy. Phương thức này trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PushSubscription")}} chứa chi tiết của đăng ký đẩy. Một đăng ký đẩy mới sẽ được tạo nếu service worker hiện tại chưa có đăng ký nào.

### Phương thức lỗi thời

- {{domxref("PushManager.hasPermission()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Trả về một {{jsxref("Promise")}} giải quyết thành `PushPermissionStatus` của webapp yêu cầu, một trong các giá trị `granted`, `denied` hoặc `default`. Được thay thế bởi {{domxref("PushManager.permissionState()")}}.
- {{domxref("PushManager.register()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Đăng ký một subscription đẩy. Được thay thế bởi {{domxref("PushManager.subscribe()")}}.
- {{domxref("PushManager.registrations()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Truy xuất các subscription đẩy hiện có. Được thay thế bởi {{domxref("PushManager.getSubscription()")}}.
- {{domxref("PushManager.unregister()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Hủy đăng ký và xóa một endpoint subscription đã chỉ định. Trong API mới, một subscription được hủy bằng cách gọi phương thức {{domxref("PushSubscription.unsubscribe()")}}.

## Ví dụ

```js
this.onpush = (event) => {
  console.log(event.data);
  // Từ đây chúng ta có thể ghi dữ liệu vào IndexedDB, gửi nó đến bất kỳ
  // cửa sổ nào đang mở, hiển thị thông báo, v.v.
};

navigator.serviceWorker
  .register("serviceworker.js")
  .then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager.subscribe().then(
      (pushSubscription) => {
        console.log(pushSubscription.endpoint);
        // Các chi tiết đăng ký đẩy cần cho máy chủ ứng dụng hiện đã
        // sẵn sàng và có thể được gửi tới đó bằng, chẳng hạn,
        // API fetch().
      },
      (error) => {
        console.error(error);
      },
    );
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Push API](/en-US/docs/Web/API/Push_API)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
