---
title: "ServiceWorker: thuộc tính state"
short-title: state
slug: Web/API/ServiceWorker/state
page-type: web-api-instance-property
browser-compat: api.ServiceWorker.state
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`state`** của
giao diện {{domxref("ServiceWorker")}} trả về một chuỗi đại diện cho trạng thái hiện tại
của service worker. Nó có thể là một trong các giá trị sau: `parsed`, `installing`,
`installed`, `activating`, `activated`, hoặc
`redundant`.

## Giá trị

Một {{jsxref("String")}} có thể nhận một trong các giá trị sau:

- `"parsed"`
  - : Trạng thái ban đầu của service worker sau khi được tải xuống và xác nhận có thể chạy được.
    Service worker không bao giờ được cập nhật lên trạng thái này, nên đây sẽ không bao giờ là giá trị của sự kiện {{DOMxRef("ServiceWorker.statechange_event", "statechange")}}.
- `"installing"`
  - : Service worker ở trạng thái này được coi là một worker đang cài đặt. Trong trạng thái này, {{DOMxRef("ExtendableEvent.waitUntil()")}} có thể được gọi bên trong trình xử lý sự kiện `install` để kéo dài vòng đời của worker đang cài đặt cho đến khi promise được truyền giải quyết thành công. Điều này chủ yếu được sử dụng để đảm bảo service worker không hoạt động cho đến khi tất cả các bộ nhớ đệm cốt lõi được điền.
- `"installed"`
  - : Service worker ở trạng thái này được coi là một worker đang chờ đợi.
- `"activating"`
  - : Service worker ở trạng thái này được coi là một worker đang kích hoạt. Trong trạng thái này, {{DOMxRef("ExtendableEvent.waitUntil()")}} có thể được gọi bên trong trình xử lý sự kiện `onactivate` để kéo dài vòng đời của worker đang kích hoạt cho đến khi promise được truyền giải quyết thành công. Không có sự kiện chức năng nào được gửi cho đến khi trạng thái chuyển thành activated.
- `"activated"`
  - : Service worker ở trạng thái này được coi là một worker đang hoạt động sẵn sàng xử lý các sự kiện chức năng.
- `"redundant"`
  - : Một service worker mới đang thay thế service worker hiện tại, hoặc service worker hiện tại đang bị loại bỏ do cài đặt thất bại.

## Ví dụ

Đoạn mã này trích từ [mẫu sự kiện đăng ký service worker](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/registration-events/index.html) ([xem trực tiếp](https://googlechrome.github.io/samples/service-worker/registration-events/)). Mã lắng nghe mọi thay đổi trong `ServiceWorker.state`
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
