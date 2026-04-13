---
title: "ExtendableEvent: phương thức waitUntil()"
short-title: waitUntil()
slug: Web/API/ExtendableEvent/waitUntil
page-type: web-api-instance-method
browser-compat: api.ExtendableEvent.waitUntil
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`ExtendableEvent.waitUntil()`** thông báo cho bộ phát sự kiện rằng công việc đang diễn ra. Nó cũng có thể được sử dụng để phát hiện xem công việc đó có thành công hay không. Trong service workers, `waitUntil()` thông báo cho trình duyệt rằng công việc đang diễn ra cho đến khi promise ổn định, và nó không nên chấm dứt service worker nếu muốn công việc đó hoàn thành.

Các sự kiện {{domxref("ServiceWorkerGlobalScope/install_event", "install")}} trong [service workers](/en-US/docs/Web/API/ServiceWorkerGlobalScope) sử dụng `waitUntil()` để giữ service worker trong giai đoạn {{domxref("ServiceWorkerRegistration.installing", "installing")}} cho đến khi các tác vụ hoàn thành. Nếu promise được truyền vào `waitUntil()` bị từ chối, quá trình cài đặt được coi là thất bại và service worker đang cài đặt bị loại bỏ.

Các sự kiện {{domxref("ServiceWorkerGlobalScope/activate_event", "activate")}} trong [service workers](/en-US/docs/Web/API/ServiceWorkerGlobalScope) sử dụng `waitUntil()` để đệm các sự kiện chức năng như `fetch` và `push` cho đến khi promise được truyền vào `waitUntil()` ổn định. Điều này cung cấp cho service worker thời gian để cập nhật lược đồ cơ sở dữ liệu và xóa {{domxref("Cache", "caches")}} lỗi thời, để các sự kiện khác có thể dựa vào trạng thái được nâng cấp hoàn toàn.

Phương thức `waitUntil()` phải được gọi ban đầu trong callback sự kiện, nhưng sau đó có thể được gọi nhiều lần, cho đến khi tất cả các promise được truyền vào nó ổn định.

## Cú pháp

```js-nolint
waitUntil(promise)
```

### Tham số

- `promise`
  - : Một {{jsxref("Promise")}} mở rộng vòng đời của sự kiện.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Sử dụng `waitUntil()` trong sự kiện `install` của service worker:

```js
addEventListener("install", (event) => {
  const preCache = async () => {
    const cache = await caches.open("static-v1");
    return cache.addAll(["/", "/about/", "/static/styles.css"]);
  };
  event.waitUntil(preCache());
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
