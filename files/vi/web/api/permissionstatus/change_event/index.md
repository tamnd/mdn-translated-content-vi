---
title: "PermissionStatus: change event"
short-title: change
slug: Web/API/PermissionStatus/change_event
page-type: web-api-event
browser-compat: api.PermissionStatus.change_event
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}

Sự kiện **`change`** của giao diện {{domxref("PermissionStatus")}} kích hoạt mỗi khi thuộc tính {{domxref("PermissionStatus.state")}} thay đổi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

```js
navigator.permissions
  .query({ name: "geolocation" })
  .then((permissionStatus) => {
    console.log(`geolocation permission state is ${permissionStatus.state}`);
    permissionStatus.onchange = () => {
      console.log(
        `geolocation permission state has changed to ${permissionStatus.state}`,
      );
    };
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
