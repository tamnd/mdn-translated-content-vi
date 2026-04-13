---
title: "BackgroundFetchEvent: thuộc tính registration"
short-title: registration
slug: Web/API/BackgroundFetchEvent/registration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchEvent.registration
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`registration`** của giao diện {{domxref("BackgroundFetchEvent")}} trả về một đối tượng {{domxref("BackgroundFetchRegistration")}}.

## Giá trị

Một {{domxref("BackgroundFetchRegistration")}}.

## Ví dụ

Trong ví dụ này, nếu người dùng nhấp vào giao diện người dùng đang hiển thị tiến trình tải xuống, điều này sẽ kích hoạt sự kiện {{domxref("ServiceWorkerGlobalScope/backgroundfetchclick_event", "backgroundfetchclick")}}. {{domxref("BackgroundFetchRegistration")}} hiện tại được trả về bằng cách gọi `event.registration`.

```js
addEventListener("backgroundfetchclick", (event) => {
  console.log(event.registration);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
