---
title: "Cache: phương thức matchAll()"
short-title: matchAll()
slug: Web/API/Cache/matchAll
page-type: web-api-instance-method
browser-compat: api.Cache.matchAll
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`matchAll()`** của giao diện {{domxref("Cache")}}
trả về một {{jsxref("Promise")}} được giải quyết thành một mảng gồm mọi
phản hồi khớp trong đối tượng {{domxref("Cache")}}.

## Cú pháp

```js-nolint
matchAll()
matchAll(request)
matchAll(request, options)
```

### Tham số

- `request` {{optional_inline}}
  - : {{domxref("Request")}} mà bạn đang cố tìm các phản hồi tương ứng trong
    {{domxref("Cache")}}. Đây có thể là một đối tượng `Request` hoặc một URL. Nếu
    đối số này bị bỏ qua, bạn sẽ nhận được một bản sao của mọi phản hồi trong cache này.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn cho phép bạn đặt các tùy chọn điều khiển cụ thể cho quá trình đối sánh
    được thực hiện. Các tùy chọn sẵn có là:
    - `ignoreSearch`
      - : Giá trị boolean chỉ định liệu quá trình
        đối sánh có nên bỏ qua chuỗi truy vấn trong URL hay không. Nếu đặt thành
        `true`, phần `?value=bar` của
        `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện đối sánh.
        Mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean mà khi được đặt thành
        `true`, sẽ ngăn thao tác đối sánh xác thực phương thức `http` của
        {{domxref("Request")}} (thông thường chỉ cho phép `GET`
        và `HEAD`). Mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean mà khi được đặt thành
        `true`, sẽ yêu cầu thao tác đối sánh không thực hiện đối sánh header `VARY`
        — tức là, nếu URL khớp thì bạn sẽ nhận được kết quả khớp bất kể
        đối tượng {{domxref("Response")}} có header `VARY` hay không. Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một mảng gồm mọi phản hồi khớp trong
đối tượng {{domxref("Cache")}}.

> [!NOTE]
> {{domxref("Cache.match()")}} về cơ bản gần như giống hệt
> `Cache.matchAll()`, ngoại trừ việc thay vì được giải quyết với một mảng gồm mọi
> phản hồi khớp, nó chỉ được giải quyết với phản hồi khớp đầu tiên (tức là
> `response[0]`).

## Ví dụ

Ví dụ sau truy xuất mọi phản hồi trong cache `v1` khớp với URL `/`, kể cả khi có các tham số truy vấn tiềm năng. Bằng cách dùng `{ ignoreSearch: true }`, việc dùng `matchAll` sẽ truy xuất cả `/` lẫn `/?value=bar`.

Sau đó nó ghi log số lượng phản hồi khớp.

```js
caches
  .open("v1")
  .then((cache) => cache.matchAll("/", { ignoreSearch: true }))
  .then((responses) => {
    console.log(`Found ${responses.length} matching responses`);
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
