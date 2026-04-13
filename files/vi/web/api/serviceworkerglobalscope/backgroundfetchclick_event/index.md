---
title: "ServiceWorkerGlobalScope: sự kiện backgroundfetchclick"
short-title: backgroundfetchclick
slug: Web/API/ServiceWorkerGlobalScope/backgroundfetchclick_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.backgroundfetchclick_event
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`backgroundfetchclick`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi người dùng nhấp vào UI mà trình duyệt cung cấp để hiển thị cho người dùng tiến trình của thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API).

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("backgroundfetchclick", (event) => { })

onbackgroundfetchclick = (event) => { }
```

## Loại sự kiện

Một {{domxref("BackgroundFetchEvent")}}.

{{InheritanceDiagram("BackgroundFetchEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("ExtendableEvent")}}._

- {{domxref("BackgroundFetchEvent.registration")}}
  - : Trả về {{domxref("BackgroundFetchRegistration")}} có hộp thoại tiến trình mà người dùng đã nhấp vào.

## Mô tả

Khi một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) bắt đầu, trình duyệt hiển thị một phần tử UI cho người dùng để cho biết tiến trình của thao tác. Nếu người dùng nhấp vào phần tử này, trình duyệt khởi động service worker nếu cần thiết, và kích hoạt sự kiện `backgroundfetchclick` trong phạm vi toàn cục của service worker.

Một tác vụ phổ biến cho trình xử lý trong tình huống này là mở một cửa sổ cung cấp cho người dùng thêm chi tiết về thao tác fetch.

## Ví dụ

### Mở cửa sổ với thêm chi tiết

Trình xử lý sự kiện này sử dụng thuộc tính toàn cục {{domxref("ServiceWorkerGlobalScope.clients", "clients")}} để mở một cửa sổ cung cấp cho người dùng thêm chi tiết về fetch. Nó mở một cửa sổ khác tùy thuộc vào việc fetch đã hoàn thành hay chưa.

```js
addEventListener("backgroundfetchclick", (event) => {
  const registration = event.registration;

  if (registration.result === "success") {
    clients.openWindow("/play-movie");
  } else {
    clients.openWindow("/movie-download-progress");
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
