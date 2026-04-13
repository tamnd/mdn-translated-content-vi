---
title: "Lock: mode property"
short-title: mode
slug: Web/API/Lock/mode
page-type: web-api-instance-property
browser-compat: api.Lock.mode
---

{{APIRef("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`mode`** của giao diện {{domxref("Lock")}} trả về chế độ truy cập được truyền vào {{domxref('LockManager.request()')}} khi khóa được yêu cầu.
Chế độ có thể là `"exclusive"` (mặc định) hoặc `"shared"`.

## Giá trị

Một trong hai giá trị `"exclusive"` hoặc `"shared"`.

## Ví dụ

Các ví dụ sau đây minh họa cách thuộc tính mode được truyền vào lời gọi {{domxref('LockManager.request()')}}.
{{domxref('LockManager')}} là đối tượng được trả về bởi {{domxref('navigator.locks')}}.

```js
// Should show "exclusive" (the default)
navigator.locks.request("my_resource", showLockProperties);

// Should show "exclusive"
navigator.locks.request(
  "my_resource",
  { mode: "exclusive" },
  showLockProperties,
);

// Should show "shared"
navigator.locks.request("my_resource", { mode: "shared" }, showLockProperties);

function showLockProperties(lock) {
  console.log(`The lock name is: ${lock.name}`);
  console.log(`The lock mode is: ${lock.mode}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
