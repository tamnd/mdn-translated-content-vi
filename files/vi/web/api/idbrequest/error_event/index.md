---
title: "IDBRequest: sự kiện error"
short-title: error
slug: Web/API/IDBRequest/error_event
page-type: web-api-event
browser-compat: api.IDBRequest.error_event
---

{{APIRef("IndexedDB")}}

Trình xử lý `error` được thực thi khi một lỗi làm request thất bại. Trong trình xử lý sự kiện `error`, bạn có thể truy cập lỗi của request, cũng như thêm các request khác vào cùng transaction.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này mở một cơ sở dữ liệu và cố gắng thêm một bản ghi, lắng nghe sự kiện `error` cho thao tác `add()` (điều này sẽ xảy ra nếu, chẳng hạn, một bản ghi với `taskTitle` đã cho đã tồn tại):

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.addEventListener("upgradeneeded", (event) => {
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
});

DBOpenRequest.addEventListener("success", (event) => {
  const db = DBOpenRequest.result;

  // mở transaction đọc/ghi, sẵn sàng để thêm dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");
  const objectStore = transaction.objectStore("toDoList");
  const newItem = {
    taskTitle: "my task",
    hours: 10,
    minutes: 10,
    day: 10,
    month: "January",
    year: 2020,
  };

  const objectStoreRequest = objectStore.add(newItem);
  objectStoreRequest.addEventListener("error", () => {
    console.log(`Lỗi khi thêm mục mới: ${newItem.taskTitle}`);
  });
});
```

Cùng ví dụ đó, nhưng dùng thuộc tính `onerror` thay vì `addEventListener()`:

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onupgradeneeded = (event) => {
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

DBOpenRequest.onsuccess = (event) => {
  const db = DBOpenRequest.result;

  // mở transaction đọc/ghi, sẵn sàng để thêm dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");
  const objectStore = transaction.objectStore("toDoList");
  const newItem = {
    taskTitle: "my task",
    hours: 10,
    minutes: 10,
    day: 10,
    month: "January",
    year: 2020,
  };

  const objectStoreRequest = objectStore.add(newItem);
  objectStoreRequest.onerror = () => {
    console.log(`Lỗi khi thêm mục mới: ${newItem.taskTitle}`);
  };
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
