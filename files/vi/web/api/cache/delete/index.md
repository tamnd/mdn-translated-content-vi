---
title: "Cache: phương thức delete()"
short-title: delete()
slug: Web/API/Cache/delete
page-type: web-api-instance-method
browser-compat: api.Cache.delete
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("Cache")}} tìm mục {{domxref("Cache")}} có khóa là yêu cầu, và nếu tìm thấy, xóa mục {{domxref("Cache")}} đó rồi trả về một {{jsxref("Promise")}} được giải quyết thành `true`.
Nếu không tìm thấy mục {{domxref("Cache")}} nào, promise được giải quyết thành `false`.

## Cú pháp

```js-nolint
delete(request)
delete(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} mà bạn muốn xóa.
    Đây có thể là một đối tượng `Request` hoặc một URL.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính điều khiển cách đối sánh được thực hiện trong thao tác `delete`.
    Các tùy chọn sẵn có là:
    - `ignoreSearch`
      - : Giá trị boolean chỉ định liệu quá trình đối sánh có nên bỏ qua chuỗi truy vấn trong URL hay không.
        Nếu được đặt thành `true`, phần `?value=bar` của `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện đối sánh.
        Mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean mà khi được đặt thành
        `true`, sẽ ngăn thao tác đối sánh xác thực phương thức `HTTP` của
        {{domxref("Request")}} (thông thường chỉ cho phép `GET`
        và `HEAD`). Mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean mà khi được đặt thành
        `true`, sẽ yêu cầu thao tác đối sánh không thực hiện đối sánh header `VARY`.
        Nói cách khác, nếu URL khớp thì bạn sẽ nhận được kết quả khớp
        bất kể đối tượng {{domxref("Response")}} có header `VARY`
        hay không. Mặc định là `false`.
    - `cacheName`
      - : Một chuỗi biểu diễn một cache cụ thể để tìm kiếm bên trong. Lưu ý rằng tùy chọn này bị `Cache.delete()` bỏ qua.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành `true` nếu mục cache bị
xóa, hoặc `false` nếu không.

## Ví dụ

```js
caches
  .open("v1")
  .then((cache) => cache.delete("/images/image.png"))
  .then((response) => {
    someUIUpdateFunction();
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
