---
title: "Lock: name property"
short-title: name
slug: Web/API/Lock/name
page-type: web-api-instance-property
browser-compat: api.Lock.name
---

{{APIRef("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("Lock")}} trả về _tên_ được truyền vào {{domxref('LockManager.request')}} khi khóa được yêu cầu.

Tên của khóa được truyền bởi script khi khóa được yêu cầu. Tên này do nhà phát triển chọn để đại diện cho một tài nguyên trừu tượng mà việc sử dụng cần được phối hợp giữa nhiều tab, worker hoặc các đoạn code khác trong cùng origin. Ví dụ, nếu chỉ một tab của ứng dụng web nên đồng bộ tài nguyên mạng với cơ sở dữ liệu ngoại tuyến, nó có thể sử dụng tên khóa như `"net_db_sync"`.

## Giá trị

Một chuỗi.

## Ví dụ

Các ví dụ sau đây minh họa cách thuộc tính name được truyền vào lời gọi {{domxref('LockManager.request()')}}. {{domxref('LockManager')}} là đối tượng được trả về bởi {{domxref('navigator.locks')}}.

```js
navigator.locks.request("net_db_sync", showLockProperties);

function showLockProperties(lock) {
  console.log(`The lock name is: ${lock.name}`);
  console.log(`The lock mode is: ${lock.mode}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
