---
title: "ServiceWorkerGlobalScope: sự kiện backgroundfetchfail"
short-title: backgroundfetchfail
slug: Web/API/ServiceWorkerGlobalScope/backgroundfetchfail_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.backgroundfetchfail_event
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`backgroundfetchfail`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) đã thất bại: nghĩa là, khi ít nhất một yêu cầu mạng trong fetch không hoàn thành thành công.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("backgroundfetchfail", (event) => { })

onbackgroundfetchfail = (event) => { }
```

## Loại sự kiện

Một {{domxref("BackgroundFetchUpdateUIEvent")}}.

{{InheritanceDiagram("BackgroundFetchUpdateUIEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("BackgroundFetchEvent")}}._

- {{domxref("BackgroundFetchUpdateUIEvent.updateUI()")}}
  - : Cập nhật UI của phần tử mà trình duyệt hiển thị để cho biết tiến trình của thao tác fetch.

## Mô tả

Khi một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) thất bại (nghĩa là ít nhất một trong các yêu cầu mạng riêng lẻ không hoàn thành thành công), trình duyệt khởi động service worker nếu cần thiết, và kích hoạt sự kiện `backgroundfetchfail` trong phạm vi toàn cục của service worker.

Trong background fetch API, trình duyệt hiển thị một phần tử UI cho người dùng để cho biết tiến trình của thao tác. Trong trình xử lý `backgroundfetchfail`, service worker có thể cập nhật UI đó để cho thấy thao tác đã thất bại. Để làm điều này, trình xử lý gọi phương thức {{domxref("BackgroundFetchUpdateUIEvent/updateUI", "updateUI()")}} của sự kiện, truyền vào một tiêu đề và/hoặc biểu tượng mới.

Trong trình xử lý cho `backgroundfetchfail` này, service worker cũng có thể dọn dẹp bất kỳ dữ liệu liên quan nào cho thao tác. Nó cũng có thể lấy và lưu trữ bất kỳ phản hồi thành công nào (ví dụ: sử dụng API {{domxref("Cache")}}). Để truy cập dữ liệu phản hồi, service worker sử dụng thuộc tính {{domxref("BackgroundFetchEvent/registration", "registration")}} của sự kiện.

## Ví dụ

### Cập nhật UI

Trình xử lý sự kiện này cập nhật UI để cho người dùng biết thao tác đã thất bại.

```js
addEventListener("backgroundfetchfail", (event) => {
  event.updateUI({ title: "Could not complete download" });
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
