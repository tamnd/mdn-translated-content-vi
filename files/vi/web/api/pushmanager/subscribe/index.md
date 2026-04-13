---
title: "PushManager: phương thức subscribe()"
short-title: subscribe()
slug: Web/API/PushManager/subscribe
page-type: web-api-instance-method
browser-compat: api.PushManager.subscribe
---

{{ApiRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`subscribe()`** của giao diện {{domxref("PushManager")}} đăng ký với một dịch vụ đẩy.

Phương thức này trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PushSubscription")}} chứa chi tiết của subscription đẩy. Một subscription đẩy mới sẽ được tạo nếu service worker hiện tại chưa có subscription nào.

## Cú pháp

```js-nolint
subscribe(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object chứa các tham số cấu hình tùy chọn. Nó có thể có các thuộc tính sau:
    - `userVisibleOnly`
      - : Một giá trị boolean cho biết subscription đẩy trả về sẽ chỉ được dùng cho các thông điệp có hiệu ứng được hiển thị cho người dùng.
    - `applicationServerKey`
      - : Một chuỗi được mã hóa Base64 hoặc {{jsxref("ArrayBuffer")}} chứa một public key [ECDSA](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm) P-256 mà push server sẽ dùng để xác thực máy chủ ứng dụng của bạn. Nếu được chỉ định, mọi thông điệp từ máy chủ ứng dụng của bạn phải dùng lược đồ xác thực [VAPID](https://datatracker.ietf.org/doc/html/rfc8292) và bao gồm một JWT được ký bằng private key tương ứng. Khóa này **_KHÔNG_** giống với khóa ECDH mà bạn dùng để mã hóa dữ liệu. Để biết thêm thông tin, xem "[Using VAPID with WebPush](https://blog.mozilla.org/services/2016/04/04/using-vapid-with-webpush/)".

    > [!NOTE]
    > Tham số này là bắt buộc trong một số trình duyệt như Chrome và Edge. Chúng sẽ từ chối Promise nếu `userVisibleOnly` không được đặt thành `true`.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PushSubscription")}}.

## Ví dụ

```js
this.onpush = (event) => {
  console.log(event.data);
  // Từ đây chúng ta có thể ghi dữ liệu vào IndexedDB, gửi nó đến bất kỳ
  // cửa sổ nào đang mở, hiển thị thông báo, v.v.
};

navigator.serviceWorker.register("serviceworker.js");

// Dùng serviceWorker.ready để bảo đảm bạn có thể đăng ký push
navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
  const options = {
    userVisibleOnly: true,
    applicationServerKey,
  };
  serviceWorkerRegistration.pushManager.subscribe(options).then(
    (pushSubscription) => {
      console.log(pushSubscription.endpoint);
      // Các chi tiết đăng ký push cần cho máy chủ ứng dụng hiện đã
      // sẵn sàng và có thể được gửi tới đó bằng, chẳng hạn,
      // API fetch().
    },
    (error) => {
      // Trong quá trình phát triển, việc ghi lỗi ra console thường rất hữu ích.
      // Trong môi trường sản xuất, cũng có thể nên báo cáo thông tin lỗi
      // trở lại máy chủ ứng dụng.
      console.error(error);
    },
  );
});
```

### Phản hồi với cử chỉ của người dùng

Các lời gọi `subscribe()` nên được thực hiện để đáp lại một cử chỉ của người dùng, ví dụ như nhấn nút:

```js
btn.addEventListener("click", () => {
  serviceWorkerRegistration.pushManager
    .subscribe(options)
    .then((pushSubscription) => {
      // xử lý subscription
    });
});
```

Đây không chỉ là thực hành tốt nhất - bạn không nên làm phiền người dùng bằng những thông báo mà họ không đồng ý - mà trong tương lai trình duyệt sẽ còn chủ động chặn các thông báo không được kích hoạt bởi cử chỉ của người dùng. Firefox đã làm điều này từ phiên bản 72, chẳng hạn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
