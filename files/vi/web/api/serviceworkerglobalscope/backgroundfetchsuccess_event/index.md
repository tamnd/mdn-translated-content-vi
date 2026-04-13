---
title: "ServiceWorkerGlobalScope: sự kiện backgroundfetchsuccess"
short-title: backgroundfetchsuccess
slug: Web/API/ServiceWorkerGlobalScope/backgroundfetchsuccess_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.backgroundfetchsuccess_event
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`backgroundfetchsuccess`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) đã hoàn thành thành công: nghĩa là, khi tất cả các yêu cầu mạng trong fetch đã hoàn thành thành công.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("backgroundfetchsuccess", (event) => { })

onbackgroundfetchsuccess = (event) => { }
```

## Loại sự kiện

Một {{domxref("BackgroundFetchUpdateUIEvent")}}.

{{InheritanceDiagram("BackgroundFetchUpdateUIEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("BackgroundFetchEvent")}}._

- {{domxref("BackgroundFetchUpdateUIEvent.updateUI()")}}
  - : Cập nhật UI của phần tử mà trình duyệt hiển thị để cho biết tiến trình của thao tác fetch.

## Mô tả

Khi một thao tác [background fetch](/en-US/docs/Web/API/Background_Fetch_API) hoàn thành thành công (nghĩa là tất cả các yêu cầu mạng riêng lẻ đã hoàn thành thành công), trình duyệt khởi động service worker nếu cần thiết, và kích hoạt sự kiện `backgroundfetchsuccess` trong phạm vi toàn cục của service worker.

Trong trình xử lý cho sự kiện này, service worker có thể lấy và lưu trữ các phản hồi (ví dụ: sử dụng API {{domxref("Cache")}}). Để truy cập dữ liệu phản hồi, service worker sử dụng thuộc tính {{domxref("BackgroundFetchEvent/registration", "registration")}} của sự kiện.

Trong background fetch API, trình duyệt hiển thị một phần tử UI cho người dùng để cho biết tiến trình của thao tác. Trong trình xử lý `backgroundfetchsuccess`, service worker có thể cập nhật UI đó để cho thấy thao tác đã hoàn thành thành công. Để làm điều này, trình xử lý gọi phương thức {{domxref("BackgroundFetchUpdateUIEvent/updateUI", "updateUI()")}} của sự kiện, truyền vào một tiêu đề và/hoặc biểu tượng mới.

## Ví dụ

### Lưu trữ phản hồi và cập nhật UI

Trình xử lý sự kiện này lưu trữ tất cả phản hồi trong bộ nhớ đệm, và cập nhật UI.

```js
addEventListener("backgroundfetchsuccess", (event) => {
  const registration = event.registration;

  event.waitUntil(async () => {
    // Open a cache
    const cache = await caches.open("movies");
    // Get all the records
    const records = await registration.matchAll();
    // Cache all responses
    const cachePromises = records.map(async (record) => {
      const response = await record.responseReady;
      await cache.put(record.request, response);
    });

    // Wait for caching to finish
    await Promise.all(cachePromises);

    // Update the browser's UI
    event.updateUI({ title: "Move download complete" });
  });
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
