---
title: "IDBVersionChangeEvent: thuộc tính oldVersion"
short-title: oldVersion
slug: Web/API/IDBVersionChangeEvent/oldVersion
page-type: web-api-instance-property
browser-compat: api.IDBVersionChangeEvent.oldVersion
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`oldVersion`** của giao diện {{domxref("IDBVersionChangeEvent")}} trả về số phiên bản cũ của cơ sở dữ liệu.

Khi cơ sở dữ liệu được mở chưa tồn tại, giá trị của `oldVersion` là 0.

## Giá trị

Một số chứa số nguyên 64-bit.

## Ví dụ

```js
const dbName = "sampleDB";
const dbVersion = 2;
const request = indexedDB.open(dbName, dbVersion);

request.onupgradeneeded = (e) => {
  const db = request.result;
  if (e.oldVersion < 1) {
    db.createObjectStore("store1");
  }

  if (e.oldVersion < 2) {
    db.deleteObjectStore("store1");
    db.createObjectStore("store2");
  }

  // v.v. cho phiên bản < 3, 4…
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Đặt phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
