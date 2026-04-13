---
title: "IDBDatabase: phương thức deleteObjectStore()"
short-title: deleteObjectStore()
slug: Web/API/IDBDatabase/deleteObjectStore
page-type: web-api-instance-method
browser-compat: api.IDBDatabase.deleteObjectStore
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`deleteObjectStore()`** của giao diện {{domxref("IDBDatabase")}} phá hủy object store có tên đã cho trong cơ sở dữ liệu đang kết nối, cùng với mọi index tham chiếu đến nó.

Giống như {{ domxref("IDBDatabase.createObjectStore") }}, phương thức này _chỉ_ có thể được gọi trong một transaction [`versionchange`](/en-US/docs/Web/API/IDBDatabase/versionchange_event).

## Cú pháp

```js-nolint
deleteObjectStore(name)
```

### Tham số

- `name`
  - : Tên của object store bạn muốn xóa. Tên phân biệt hoa thường.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu phương thức không được gọi từ callback của transaction `versionchange`.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu một request được thực hiện trên cơ sở dữ liệu nguồn không tồn tại, ví dụ đã bị xóa hoặc gỡ bỏ.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra khi cố xóa một object store không tồn tại.

## Ví dụ

```js
const dbName = "sampleDB";
const dbVersion = 2;
const request = indexedDB.open(dbName, dbVersion);

request.onupgradeneeded = (event) => {
  const db = request.result;
  if (event.oldVersion < 1) {
    db.createObjectStore("store1");
  }

  if (event.oldVersion < 2) {
    db.deleteObjectStore("store1");
    db.createObjectStore("store2");
  }

  // v.v. cho version < 3, 4…
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một dải khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
