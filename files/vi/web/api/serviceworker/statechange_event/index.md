---
title: "ServiceWorker: sự kiện statechange"
short-title: statechange
slug: Web/API/ServiceWorker/statechange_event
page-type: web-api-event
browser-compat: api.ServiceWorker.statechange_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện `statechange` được kích hoạt bất cứ khi nào {{domxref("ServiceWorker.state")}} thay đổi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Đoạn mã này trích từ [mẫu sự kiện đăng ký service worker](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/registration-events/index.html) ([xem trực tiếp](https://googlechrome.github.io/samples/service-worker/registration-events/)). Mã lắng nghe mọi thay đổi trong {{domxref("ServiceWorker.state")}}
và trả về giá trị của nó.

```js
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
  logState(serviceWorker.state);
  serviceWorker.addEventListener("statechange", (e) => {
    logState(e.target.state);
  });
}
```

Lưu ý rằng khi `statechange` được kích hoạt, các tham chiếu của service worker có thể đã
thay đổi. Ví dụ:

```js
navigator.serviceWorker.register("/sw.js").then((swr) => {
  swr.installing.state = "installing";
  swr.installing.onstatechange = () => {
    swr.installing = null;
    // Tại thời điểm này, swr.waiting HOẶC swr.active có thể là true. Điều này là do sự kiện statechange
    // được đưa vào hàng đợi, trong khi đó worker cơ bản có thể đã chuyển sang trạng thái waiting
    // và sẽ được kích hoạt ngay lập tức nếu có thể.
  };
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
