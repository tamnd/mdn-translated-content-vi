---
title: "IDBRequest: sự kiện success"
short-title: success
slug: Web/API/IDBRequest/success_event
page-type: web-api-event
browser-compat: api.IDBRequest.success_event
---

{{APIRef("IndexedDB")}}

Sự kiện `success` được kích hoạt khi một `IDBRequest` thành công. Trong trình xử lý sự kiện `success`, bạn có thể truy cập kết quả của request, cũng như thêm các request khác vào cùng transaction.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("success", (event) => { })

onsuccess = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này cố mở một cơ sở dữ liệu và lắng nghe sự kiện `success` bằng `addEventListener()`:

```js
// Mở cơ sở dữ liệu
const openRequest = window.indexedDB.open("toDoList", 4);

openRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = () => {
    console.log("Error creating database");
  };

  // Tạo objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // định nghĩa các mục dữ liệu objectStore sẽ chứa
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

openRequest.addEventListener("success", (event) => {
  console.log("Database opened successfully!");
});
```

Cùng ví dụ đó, nhưng dùng thuộc tính trình xử lý sự kiện `onsuccess`:

```js
// Mở cơ sở dữ liệu
const openRequest = window.indexedDB.open("toDoList", 4);

openRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = () => {
    console.log("Error creating database");
  };

  // Tạo objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // định nghĩa các mục dữ liệu objectStore sẽ chứa
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

openRequest.onsuccess = (event) => {
  console.log("Database opened successfully!");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
