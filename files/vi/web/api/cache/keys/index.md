---
title: "Cache: phương thức keys()"
short-title: keys()
slug: Web/API/Cache/keys
page-type: web-api-instance-method
browser-compat: api.Cache.keys
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`keys()`** của giao diện {{domxref("Cache")}} trả về một
{{jsxref("Promise")}} được giải quyết thành một mảng các đối tượng {{domxref("Request")}}
đại diện cho các khóa của {{domxref("Cache")}}.

Các yêu cầu được trả về theo đúng thứ tự mà chúng đã được chèn vào.

> [!NOTE]
> Những yêu cầu có URL trùng nhau nhưng khác header vẫn có thể được
> trả về nếu phản hồi của chúng có đặt header `VARY`.

## Cú pháp

```js-nolint
keys()
keys(request)
keys(request, options)
```

### Tham số

- `request` {{optional_inline}}
  - : {{domxref("Request")}} cần được trả về, nếu muốn một khóa cụ thể. Đây có thể là
    một đối tượng `Request` hoặc một URL.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính điều khiển cách đối sánh được thực hiện trong thao tác `keys`.
    Các tùy chọn sẵn có là:
    - `ignoreSearch`
      - : Giá trị boolean chỉ định liệu quá trình
        đối sánh có nên bỏ qua chuỗi truy vấn trong URL hay không. Nếu đặt thành
        `true`, phần `?value=bar` của
        `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện đối sánh.
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
      - : Một chuỗi biểu diễn một
        cache cụ thể để tìm kiếm bên trong. Lưu ý rằng tùy chọn này bị
        `Cache.keys()` bỏ qua.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một mảng các đối tượng {{domxref("Request")}}.

## Ví dụ

```js
caches
  .open("v1")
  .then((cache) => cache.keys())
  .then((keys) => {
    keys.forEach((request, index, array) => {
      cache.delete(request);
    });
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
