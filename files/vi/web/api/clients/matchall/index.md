---
title: "Clients: phương thức matchAll()"
short-title: matchAll()
slug: Web/API/Clients/matchAll
page-type: web-api-instance-method
browser-compat: api.Clients.matchAll
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`matchAll()`** của giao diện {{domxref("Clients")}}
trả về một {{jsxref("Promise")}} cho danh sách các đối tượng {{domxref("Client")}}
của service worker. Hãy thêm tham số `options` để trả về mọi client service worker
có cùng origin với origin của service worker liên kết. Nếu không truyền `options`,
phương thức chỉ trả về các client service worker đang được service worker đó kiểm soát.

## Cú pháp

```js-nolint
matchAll()
matchAll(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn cho phép bạn đặt các tùy chọn cho thao tác đối sánh. Các
    tùy chọn hiện có là:
    - `includeUncontrolled`
      - : Một giá trị boolean. Nếu đặt thành
        `true`, thao tác đối sánh sẽ trả về mọi client service worker
        có cùng origin với service worker hiện tại. Nếu không, nó chỉ trả về
        các client service worker đang được service worker hiện tại kiểm soát. Giá trị
        mặc định là `false`.
    - `type`
      - : Đặt kiểu client mà bạn muốn đối sánh. Các giá trị
        hiện có là `"window"`, `"worker"`, `"sharedworker"` và
        `"all"`. Mặc định là `"window"`.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành một mảng các đối tượng {{domxref("Client")}}. Trong
Chrome 46/Firefox 54 trở lên, phương thức này trả về các client theo thứ tự
được lấy tiêu điểm gần đây nhất, đúng theo đặc tả.

## Ví dụ

```js
clients.matchAll(options).then((clientList) => {
  for (const client of clientList) {
    if (client.url === "index.html") {
      clients.openWindow(client);
      // or do something else involving the matching client
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
