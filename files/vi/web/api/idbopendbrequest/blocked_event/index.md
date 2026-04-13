---
title: "IDBOpenDBRequest: blocked event"
short-title: blocked
slug: Web/API/IDBOpenDBRequest/blocked_event
page-type: web-api-event
browser-compat: api.IDBOpenDBRequest.blocked_event
---

{{APIRef("IndexedDB")}}

Trình xử lý `blocked` được thực thi khi một kết nối mở đến cơ sở dữ liệu đang chặn giao dịch `versionchange` trên cùng cơ sở dữ liệu.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("blocked", (event) => { })

onblocked = (event) => { }
```

## Loại sự kiện

Một {{domxref("IDBVersionChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("IDBVersionChangeEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

- {{ domxref("IDBVersionChangeEvent.oldVersion") }} {{ReadOnlyInline}}
  - : Trả về phiên bản cũ của cơ sở dữ liệu.
- {{ domxref("IDBVersionChangeEvent.newVersion") }} {{ReadOnlyInline}}
  - : Trả về phiên bản mới của cơ sở dữ liệu.

## Ví dụ

Sử dụng `addEventListener()`:

```js
// Open the database
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = () => {
    console.log("Error creating database");
  };

  // Create an objectStore for this database
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // define what data items the objectStore will contain
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

DBOpenRequest.onsuccess = (event) => {
  // Let's try to open the same database with a higher revision version
  const req2 = indexedDB.open("toDoList", 5);

  // In this case the onblocked handler will be executed
  req2.addEventListener("blocked", () => {
    console.log("Request was blocked");
  });
};
```

Sử dụng thuộc tính `onblocked`:

```js
// Open the database
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = () => {
    console.log("Error creating database");
  };

  // Create an objectStore for this database
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // define what data items the objectStore will contain
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

DBOpenRequest.onsuccess = (event) => {
  // Let's try to open the same database with a higher revision version
  const req2 = indexedDB.open("toDoList", 5);

  // In this case the onblocked handler will be executed
  req2.onblocked = () => {
    console.log("Request was blocked");
  };
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
