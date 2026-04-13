---
title: "Cache: phương thức matchAll()"
short-title: matchAll()
slug: Web/API/Cache/matchAll
page-type: web-api-instance-method
browser-compat: api.Cache.matchAll
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`matchAll()`** của giao diện {{domxref("Cache")}}
trả về một {{jsxref("Promise")}} phân giải thành một mảng chứa tất cả các
phản hồi khớp trong đối tượng {{domxref("Cache")}}.

## Cú pháp

```js-nolint
matchAll()
matchAll(request)
matchAll(request, options)
```

### Tham số

- `request` {{optional_inline}}
  - : {{domxref("Request")}} mà bạn đang cố tìm phản hồi trong
    {{domxref("Cache")}}. Đây có thể là một đối tượng `Request` hoặc một URL. Nếu đối số
    này bị bỏ qua, bạn sẽ nhận được bản sao của tất cả phản hồi trong bộ nhớ đệm này.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn cho phép bạn đặt các tùy chọn kiểm soát cụ thể cho việc
    so khớp. Các tùy chọn có sẵn là:
    - `ignoreSearch`
      - : Một giá trị boolean chỉ định xem quá trình
        so khớp có nên bỏ qua chuỗi truy vấn trong URL hay không. Nếu đặt thành
        `true`, phần `?value=bar` của
        `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp.
        Giá trị mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean, khi đặt thành
        `true`, ngăn các thao tác so khớp xác thực phương thức
        {{domxref("Request")}} `http` (thường chỉ `GET`
        và `HEAD` được cho phép). Giá trị mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean, khi đặt thành
        `true`, yêu cầu thao tác so khớp không thực hiện so khớp tiêu đề
        `VARY` — tức nếu URL khớp bạn sẽ nhận được kết quả bất kể
        đối tượng {{domxref("Response")}} có tiêu đề `VARY` hay không. Giá trị
        mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một mảng chứa tất cả các phản hồi khớp trong đối tượng
{{domxref("Cache")}}.

> [!NOTE]
> {{domxref("Cache.match()")}} về cơ bản giống với
> `Cache.matchAll()`, ngoại trừ việc thay vì phân giải thành một mảng chứa tất cả
> các phản hồi khớp, nó chỉ phân giải thành phản hồi khớp đầu tiên (tức là
> `response[0]`).

## Ví dụ

Ví dụ sau truy xuất tất cả các phản hồi trong bộ nhớ đệm `v1` khớp với URL `/`, bao gồm cả các tham số truy vấn tiềm năng. Bằng cách dùng `{ ignoreSearch: true }`, `matchAll` sẽ truy xuất cả `/` lẫn `/?value=bar`.

Sau đó nó ghi lại số lượng phản hồi khớp.

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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
