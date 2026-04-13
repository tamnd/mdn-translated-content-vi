---
title: "BackgroundFetchRegistration: match() method"
short-title: match()
slug: Web/API/BackgroundFetchRegistration/match
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.match
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`match()`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về {{domxref("BackgroundFetchRecord")}} khớp đầu tiên.

## Cú pháp

```js-nolint
match(request)
match(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} mà bạn đang cố tìm các bản ghi tương ứng.
    Tham số này có thể là một đối tượng {{domxref("Request")}} hoặc một URL.
- `options` {{optional_inline}}
  - : Một đối tượng thiết lập các tùy chọn cho thao tác `match`. Các tùy chọn khả dụng là:
    - `ignoreSearch` {{optional_inline}}
      - : Một giá trị boolean cho biết có bỏ qua chuỗi truy vấn trong URL hay không. Ví dụ, nếu đặt thành `true` thì phần `?value=bar` của `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp. Mặc định là `false`.
    - `ignoreMethod` {{optional_inline}}
      - : Một giá trị boolean. Khi là `true`, thao tác so khớp sẽ không kiểm tra phương thức `http` của {{domxref("Request")}}. Nếu là `false` (mặc định) thì chỉ cho phép `GET` và `HEAD`.
    - `ignoreVary` {{optional_inline}}
      - : Một giá trị boolean. Khi là `true`, nó cho biết nên bỏ qua header {{HTTPHeader("Vary")}}. Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{domxref("BackgroundFetchRecord")}} đầu tiên khớp với yêu cầu, hoặc {{jsxref("undefined")}} nếu không tìm thấy kết quả khớp nào.

> [!NOTE]
> `BackgroundFetchRegistration.match()` về cơ bản giống hệt {{domxref("BackgroundFetchRegistration.matchAll()")}}, ngoại trừ việc thay vì phân giải thành một mảng gồm mọi bản ghi khớp, nó chỉ phân giải thành bản ghi khớp đầu tiên.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu bạn gọi `match()` khi không có lượt tìm nạp nào đang diễn ra. Trạng thái này sẽ được phản ánh bằng việc {{domxref("BackgroundFetchRegistration.recordsAvailable")}} được đặt thành `false`.

## Ví dụ

Trong ví dụ này, chúng ta tìm một bản ghi có URL là `"/ep-5.mp3"`. Nếu tìm thấy một {{domxref("BackgroundFetchRecord")}}, chúng ta có thể trả về một số thông tin về nó.

```js
bgFetch.match("/ep-5.mp3").then(async (record) => {
  if (!record) {
    console.log("No record found");
    return;
  }

  console.log(`Here's the request`, record.request);
  const response = await record.responseReady;
  console.log(`And here's the response`, response);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
