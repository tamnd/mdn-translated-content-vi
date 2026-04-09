---
title: BackgroundFetchUpdateUIEvent
slug: Web/API/BackgroundFetchUpdateUIEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BackgroundFetchUpdateUIEvent
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Giao diện **`BackgroundFetchUpdateUIEvent`** của {{domxref('Background Fetch API','','',' ')}} là kiểu sự kiện cho các sự kiện {{domxref("ServiceWorkerGlobalScope.backgroundfetchsuccess_event", "backgroundfetchsuccess")}} và {{domxref("ServiceWorkerGlobalScope.backgroundfetchfail_event", "backgroundfetchfail")}}, đồng thời cung cấp một phương thức để cập nhật tiêu đề và biểu tượng của ứng dụng nhằm thông báo cho người dùng về việc một thao tác tìm nạp nền thành công hay thất bại.

{{InheritanceDiagram}}

## Constructor

- {{domxref("BackgroundFetchUpdateUIEvent.BackgroundFetchUpdateUIEvent()", "BackgroundFetchUpdateUIEvent()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `BackgroundFetchUIEvent` mới. Hàm tạo này thường không được dùng trực tiếp, vì trình duyệt tự tạo các đối tượng này cho các sự kiện {{domxref("ServiceWorkerGlobalScope.backgroundfetchsuccess_event", "backgroundfetchsuccess")}} và {{domxref("ServiceWorkerGlobalScope.backgroundfetchfail_event", "backgroundfetchfail")}}.

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ cha của nó, {{domxref("BackgroundFetchEvent")}}._

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ cha của nó, {{domxref("BackgroundFetchEvent")}}._

- {{domxref("BackgroundFetchUpdateUIEvent.updateUI()")}} {{Experimental_Inline}}
  - : Cập nhật tiêu đề và biểu tượng trong giao diện người dùng để hiển thị trạng thái của một thao tác tìm nạp nền. Được giải quyết bằng một {{jsxref("Promise")}}.

## Ví dụ

Trong ví dụ này, sự kiện `backgroundfetchsuccess` được lắng nghe, cho biết một thao tác tìm nạp đã hoàn tất thành công. Sau đó, phương thức {{domxref("BackgroundFetchUpdateUIEvent.updateUI()", "updateUI()")}} được gọi với một thông báo để cho người dùng biết tập mà họ tải xuống đã sẵn sàng.

```js
addEventListener("backgroundfetchsuccess", (event) => {
  const bgFetch = event.registration;

  event.waitUntil(
    (async () => {
      // Create/open a cache.
      const cache = await caches.open("downloads");
      // Get all the records.
      const records = await bgFetch.matchAll();
      // Copy each request/response across.
      const promises = records.map(async (record) => {
        const response = await record.responseReady;
        await cache.put(record.request, response);
      });

      // Wait for the copying to complete.
      await Promise.all(promises);

      // Update the progress notification.
      event.updateUI({ title: "Episode 5 ready to listen!" });
    })(),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
