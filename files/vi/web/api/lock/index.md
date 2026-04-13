---
title: Lock
slug: Web/API/Lock
page-type: web-api-interface
browser-compat: api.Lock
---

{{APIRef("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

Giao diện **`Lock`** của [Web Locks API](/en-US/docs/Web/API/Web_Locks_API) cung cấp tên và chế độ của một khóa.
Đây có thể là một khóa mới được yêu cầu và nhận trong hàm callback của {{domxref('LockManager.request','LockManager.request()')}}, hoặc là bản ghi của một khóa đang hoạt động hoặc đang chờ được trả về bởi {{domxref('LockManager.query()')}}.

## Thuộc tính phiên bản

- {{domxref('Lock.mode')}} {{ReadOnlyInline}}
  - : Trả về chế độ truy cập được truyền vào {{domxref('LockManager.request()')}} khi khóa được yêu cầu.
    Chế độ có thể là `"exclusive"` (mặc định) hoặc `"shared"`.
- {{domxref('Lock.name')}} {{ReadOnlyInline}}
  - : Trả về tên được truyền vào {{domxref('LockManager.request()')}} khi khóa được yêu cầu.

## Ví dụ

Các ví dụ sau đây minh họa cách các thuộc tính mode và name được truyền vào lời gọi {{domxref('LockManager.request()')}}.
{{domxref('LockManager')}} là đối tượng được trả về bởi {{domxref('navigator.locks')}}.

```js
navigator.locks.request("net_db_sync", showLockProperties);
navigator.locks.request("another_lock", { mode: "shared" }, showLockProperties);

function showLockProperties(lock) {
  console.log(`The lock name is: ${lock.name}`);
  console.log(`The lock mode is: ${lock.mode}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
