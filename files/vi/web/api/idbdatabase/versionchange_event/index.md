---
title: "IDBDatabase: sự kiện versionchange"
short-title: versionchange
slug: Web/API/IDBDatabase/versionchange_event
page-type: web-api-event
browser-compat: api.IDBDatabase.versionchange_event
---

{{APIRef("IndexedDB")}}

Sự kiện `versionchange` được kích hoạt khi một thay đổi cấu trúc cơ sở dữ liệu (sự kiện [`upgradeneeded`](/en-US/docs/Web/API/IDBOpenDBRequest/upgradeneeded_event) được gửi trên một [`IDBOpenDBRequest`](/en-US/docs/Web/API/IDBOpenDBRequest) hoặc [`IDBFactory.deleteDatabase`](/en-US/docs/Web/API/IDBFactory/deleteDatabase)) được yêu cầu ở nơi khác, thường là trong một cửa sổ/tab khác trên cùng máy tính.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("versionchange", (event) => { })

onversionchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

Ví dụ này mở một cơ sở dữ liệu và, khi thành công, thêm một trình nghe cho `versionchange`:

```js
// Mở cơ sở dữ liệu
const dBOpenRequest = window.indexedDB.open("Nonexistent", 4);

dBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;
  // Tạo objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định những mục dữ liệu mà objectStore sẽ chứa
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

dBOpenRequest.addEventListener("success", (event) => {
  const db = event.target.result;
  db.addEventListener("versionchange", (event) => {
    console.log("Phiên bản của cơ sở dữ liệu này đã thay đổi");
  });
});
```

Cùng ví dụ đó, dùng thuộc tính xử lý sự kiện `onversionchange`:

```js
// Mở cơ sở dữ liệu
const dBOpenRequest = window.indexedDB.open("Nonexistent", 4);

dBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;
  // Tạo objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định những mục dữ liệu mà objectStore sẽ chứa
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

dBOpenRequest.onsuccess = (event) => {
  const db = event.target.result;
  db.onversionchange = (event) => {
    console.log("Phiên bản của cơ sở dữ liệu này đã thay đổi");
  };
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
