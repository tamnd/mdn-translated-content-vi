---
title: "ServiceWorkerGlobalScope: sự kiện backgroundfetchabort"
short-title: backgroundfetchabort
slug: Web/API/ServiceWorkerGlobalScope/backgroundfetchabort_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.backgroundfetchabort_event
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`backgroundfetchabort`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi người dùng hoặc chính ứng dụng hủy một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API).

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("backgroundfetchabort", (event) => { })

onbackgroundfetchabort = (event) => { }
```

## Loại sự kiện

Một {{domxref("BackgroundFetchEvent")}}.

{{InheritanceDiagram("BackgroundFetchEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("ExtendableEvent")}}._

- {{domxref("BackgroundFetchEvent.registration")}}
  - : Trả về {{domxref("BackgroundFetchRegistration")}} cho fetch bị hủy.

## Mô tả

Trong background fetch API, trình duyệt hiển thị một phần tử UI cho người dùng để cho biết tiến trình của thao tác. Phần tử này cũng cho phép người dùng hủy fetch. Bản thân ứng dụng cũng có thể hủy fetch bằng cách gọi {{domxref("BackgroundFetchRegistration.abort()")}}.

Nếu fetch bị hủy, trình duyệt sẽ abort fetch, khởi động service worker nếu cần thiết, và kích hoạt sự kiện `backgroundfetchabort` trong phạm vi toàn cục của service worker.

Trong trình xử lý cho sự kiện này, service worker có thể dọn dẹp bất kỳ dữ liệu liên quan nào cho thao tác. Nó cũng có thể lấy và lưu trữ bất kỳ phản hồi thành công nào (ví dụ: sử dụng API {{domxref("Cache")}}). Để truy cập dữ liệu phản hồi, service worker sử dụng thuộc tính {{domxref("BackgroundFetchEvent/registration", "registration")}} của sự kiện.

## Ví dụ

### Dọn dẹp

Trình xử lý sự kiện này có thể thực hiện bất kỳ việc dọn dẹp dữ liệu nào liên quan đến fetch bị hủy.

```js
addEventListener("backgroundfetchabort", (event) => {
  // clean up any related data
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
