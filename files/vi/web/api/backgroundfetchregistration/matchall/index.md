---
title: "BackgroundFetchRegistration: matchAll() method"
short-title: matchAll()
slug: Web/API/BackgroundFetchRegistration/matchAll
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.matchAll
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`matchAll()`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về một mảng các đối tượng {{domxref("BackgroundFetchRecord")}} khớp.

## Cú pháp

```js-nolint
matchAll()
matchAll(request)
matchAll(request,options)
```

### Tham số

- `request` {{optional_inline}}
  - : {{domxref("Request")}} mà bạn đang cố tìm các bản ghi tương ứng.
    Tham số này có thể là một đối tượng {{domxref("Request")}} hoặc một URL. Nếu bỏ qua tham số này thì mọi bản ghi đều sẽ được đưa vào kết quả.
- `options` {{optional_inline}}
  - : Một đối tượng thiết lập các tùy chọn cho thao tác `match`. Các tùy chọn khả dụng là:
    - `ignoreSearch` {{optional_inline}}
      - : Một giá trị boolean cho biết có bỏ qua chuỗi truy vấn trong URL hay không. Ví dụ, nếu đặt thành `true` thì phần `?value=bar` của `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp. Mặc định là `false`.
    - `ignoreMethod` {{optional_inline}}
      - : Một giá trị boolean. Khi là `true`, thao tác so khớp sẽ không kiểm tra phương thức `http` của {{domxref("Request")}}. Nếu là `false` (mặc định) thì chỉ cho phép `GET` và `HEAD`.
    - `ignoreVary` {{optional_inline}}
      - : Một giá trị boolean. Khi là `true`, nó cho biết nên bỏ qua header {{HTTPHeader("Vary")}}. Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một mảng gồm tất cả các đối tượng {{domxref("BackgroundFetchRecord")}} khớp.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu cờ {{domxref("BackgroundFetchRegistration.recordsAvailable","recordsAvailable")}} là `false`, cho biết không có lượt tìm nạp nào đang diễn ra.

## Ví dụ

Dùng `matchAll()` mà không có tham số để trả về mọi bản ghi trong một tác vụ tìm nạp nền.

```js
const records = await bgFetch.matchAll();
console.log(records); // an array of BackgroundFetchRecord objects
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
