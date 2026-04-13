---
title: "IDBOpenDBRequest: upgradeneeded event"
short-title: upgradeneeded
slug: Web/API/IDBOpenDBRequest/upgradeneeded_event
page-type: web-api-event
browser-compat: api.IDBOpenDBRequest.upgradeneeded_event
---

{{APIRef("IndexedDB")}}

Sự kiện `upgradeneeded` được kích hoạt khi có nỗ lực mở cơ sở dữ liệu với số phiên bản cao hơn phiên bản hiện tại của nó.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("upgradeneeded", (event) => { })

onupgradeneeded = (event) => { }
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

Ví dụ này mở một cơ sở dữ liệu và xử lý sự kiện `upgradeneeded` bằng cách thực hiện các cập nhật cần thiết cho object store.

```js
// Open the database
const dBOpenRequest = window.indexedDB.open("toDoList", 4);

dBOpenRequest.addEventListener("upgradeneeded", (event) => {
  const db = event.target.result;
  console.log(`Upgrading to version ${db.version}`);

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
});
```

Ví dụ này tương tự, nhưng sử dụng thuộc tính trình xử lý sự kiện onupgradeneeded.

```js
// Open the database
const dBOpenRequest = window.indexedDB.open("toDoList", 4);

dBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;
  console.log(`Upgrading to version ${db.version}`);

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
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
