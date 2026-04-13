---
title: "ServiceWorkerRegistration: phương thức update()"
short-title: update()
slug: Web/API/ServiceWorkerRegistration/update
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerRegistration.update
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

**`update()`** là phương thức của giao diện {{domxref("ServiceWorkerRegistration")}} cố gắng cập nhật service worker. Nó lấy URL của tập lệnh worker, và nếu worker mới không giống hệt từng byte với worker hiện tại, nó sẽ cài đặt worker mới. Việc tải tập lệnh worker sẽ bỏ qua mọi bộ nhớ đệm của trình duyệt nếu lần tải trước đó đã xảy ra cách đây hơn 24 giờ.

## Cú pháp

```js-nolint
update()
```

### Tham số

Không.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành một đối tượng {{domxref("ServiceWorkerRegistration")}}.

## Ví dụ

Ví dụ đơn giản sau đăng ký một service worker rồi thêm một trình xử lý sự kiện vào nút để bạn có thể cập nhật service worker một cách tường minh bất cứ khi nào muốn:

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("/sw.js", { scope: "/" })
    .then((registration) => {
      // đăng ký thành công
      console.log("Registration succeeded.");
      button.onclick = () => {
        registration.update();
      };
    })
    .catch((error) => {
      // đăng ký thất bại
      console.error(`Registration failed with ${error}`);
    });
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
