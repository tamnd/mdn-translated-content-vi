---
title: "Cache: phương thức keys()"
short-title: keys()
slug: Web/API/Cache/keys
page-type: web-api-instance-method
browser-compat: api.Cache.keys
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`keys()`** của giao diện {{domxref("Cache")}} trả về một
{{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("Request")}}
biểu diễn các khóa của {{domxref("Cache")}}.

Các yêu cầu được trả về theo thứ tự chúng được chèn vào.

> [!NOTE]
> Các yêu cầu có URL trùng lặp nhưng tiêu đề khác nhau có thể được
> trả về nếu phản hồi của chúng có tiêu đề `VARY` được đặt.

## Cú pháp

```js-nolint
keys()
keys(request)
keys(request, options)
```

### Tham số

- `request` {{optional_inline}}
  - : {{domxref("Request")}} bạn muốn trả về, nếu muốn một khóa cụ thể. Đây có thể là
    một đối tượng `Request` hoặc một URL.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính kiểm soát cách so khớp được thực hiện trong thao tác
    `keys`. Các tùy chọn có sẵn là:
    - `ignoreSearch`
      - : Một giá trị boolean chỉ định xem quá trình
        so khớp có nên bỏ qua chuỗi truy vấn trong URL hay không. Nếu đặt thành
        `true`, phần `?value=bar` của
        `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp.
        Giá trị mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean, khi đặt thành
        `true`, ngăn các thao tác so khớp xác thực phương thức
        {{domxref("Request")}} `HTTP` (thường chỉ `GET`
        và `HEAD` được cho phép). Giá trị mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean, khi đặt thành
        `true`, yêu cầu thao tác so khớp không thực hiện so khớp tiêu đề
        `VARY`. Nói cách khác, nếu URL khớp bạn sẽ nhận được kết quả
        bất kể đối tượng {{domxref("Response")}} có tiêu đề `VARY`
        hay không. Giá trị mặc định là `false`.
    - `cacheName`
      - : Một chuỗi biểu diễn một bộ nhớ đệm
        cụ thể để tìm kiếm trong đó. Lưu ý rằng tùy chọn này bị
        `Cache.keys()` bỏ qua.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("Request")}}.

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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
