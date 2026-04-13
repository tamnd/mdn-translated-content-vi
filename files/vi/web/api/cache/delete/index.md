---
title: "Cache: phương thức delete()"
short-title: delete()
slug: Web/API/Cache/delete
page-type: web-api-instance-method
browser-compat: api.Cache.delete
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("Cache")}} tìm mục {{domxref("Cache")}} có khóa là yêu cầu đó, và nếu tìm thấy, xóa mục {{domxref("Cache")}} đó rồi trả về một {{jsxref("Promise")}} phân giải thành `true`.
Nếu không tìm thấy mục {{domxref("Cache")}} nào, promise sẽ phân giải thành `false`.

## Cú pháp

```js-nolint
delete(request)
delete(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} bạn muốn xóa.
    Đây có thể là một đối tượng `Request` hoặc một URL.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính kiểm soát cách so khớp được thực hiện trong thao tác
    `delete`. Các tùy chọn có sẵn là:
    - `ignoreSearch`
      - : Một giá trị boolean chỉ định xem quá trình so khớp có nên bỏ qua chuỗi truy vấn trong URL hay không.
        Nếu đặt thành `true`, phần `?value=bar` của `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp.
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
      - : Một chuỗi biểu diễn một bộ nhớ đệm cụ thể để tìm kiếm trong đó. Lưu ý rằng tùy chọn này bị `Cache.delete()` bỏ qua.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `true` nếu mục bộ nhớ đệm được
xóa, hoặc `false` trong trường hợp ngược lại.

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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
