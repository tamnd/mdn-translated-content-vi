---
title: "PushManager: phương thức hasPermission()"
short-title: hasPermission()
slug: Web/API/PushManager/hasPermission
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PushManager.hasPermission
---

{{ApiRef("Push API")}}{{deprecated_header}}{{non-standard_header}}{{AvailableInWorkers}}

Phương thức **`PushManager.hasPermission()`** của giao diện {{domxref("PushManager")}} trả về một {{jsxref("Promise")}} giải quyết thành `PushPermissionStatus` của webapp yêu cầu, một trong các giá trị `granted`, `denied` hoặc `default`.

> [!NOTE]
> Tính năng này đã được thay thế bởi phương thức {{domxref("PushManager.permissionState()")}}.

## Cú pháp

```js-nolint
hasPermission()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành `PushPermissionStatus`.

## Ví dụ

```js
// TBD
```

## Thông số kỹ thuật

Tính năng này không còn thuộc bất kỳ đặc tả nào nữa. Nó không còn nằm trong lộ trình để trở thành một tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}
