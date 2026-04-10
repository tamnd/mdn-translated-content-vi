---
title: "PushManager: phương thức getSubscription()"
short-title: getSubscription()
slug: Web/API/PushManager/getSubscription
page-type: web-api-instance-method
browser-compat: api.PushManager.getSubscription
---

{{ApiRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`PushManager.getSubscription()`** của giao diện {{domxref("PushManager")}} truy xuất một subscription đẩy hiện có.

Phương thức này trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PushSubscription")}} chứa chi tiết của một subscription hiện có. Nếu không có subscription nào, giá trị giải quyết là `null`.

## Cú pháp

```js-nolint
getSubscription()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PushSubscription")}} hoặc `null`.

## Ví dụ

Đoạn mã này được lấy từ một [mẫu push messaging và notification](https://github.com/GoogleChrome/samples/tree/gh-pages/push-messaging-and-notifications). Không có bản demo trực tiếp.

```js
// Chúng ta cần đăng ký service worker để kiểm tra subscription
navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
  // Chúng ta đã có subscription cho push message chưa?
  serviceWorkerRegistration.pushManager
    .getSubscription()
    .then((subscription) => {
      // Bật mọi UI dùng để đăng ký/hủy đăng ký
      // push messages.
      const pushButton = document.querySelector(".js-push-button");
      pushButton.disabled = false;

      if (!subscription) {
        // Chưa đăng ký push, nên hãy cấu hình UI
        // để cho phép người dùng bật push
        return;
      }

      // Đồng bộ máy chủ của bạn với subscriptionId mới nhất
      sendSubscriptionToServer(subscription);

      showCurlCommand(subscription);

      // Đặt UI để cho thấy rằng họ đã đăng ký
      // nhận push messages
      pushButton.textContent = "Disable Push Messages";
      isPushEnabled = true;
    })
    .catch((err) => {
      console.error(`Error during getSubscription(): ${err}`);
    });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
