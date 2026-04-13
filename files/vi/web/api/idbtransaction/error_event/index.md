---
title: "IDBTransaction: sự kiện error"
short-title: error
slug: Web/API/IDBTransaction/error_event
page-type: web-api-event
browser-compat: api.IDBTransaction.error_event
---

{{APIRef("IndexedDB")}}

Sự kiện `error` được phát trên `IDBTransaction` khi một request trả về lỗi và sự kiện nổi bọt lên object transaction.

> [!NOTE]
> Để xử lý mọi cách mà transaction có thể thất bại, hãy cân nhắc nghe sự kiện {{domxref("IDBTransaction.abort_event", "abort")}} thay thế.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Nổi bọt

Sự kiện này nổi bọt lên {{domxref("IDBDatabase")}}. Thuộc tính `event.target` trỏ tới object {{domxref('IDBTransaction')}} đang nổi bọt lên.

Để biết thêm, xem [Event bubbling](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling).

## Ví dụ

Ví dụ này mở một cơ sở dữ liệu và cố thêm một bản ghi, đồng thời nghe sự kiện `error` cho thao tác `add()` (sẽ xảy ra nếu, chẳng hạn, một bản ghi với `taskTitle` đã cho đã tồn tại):

```js
// Mở cơ sở dữ liệu
const dBOpenRequest = window.indexedDB.open("toDoList", 4);

dBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  // Tạo objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định các mục dữ liệu mà objectStore sẽ chứa
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

dBOpenRequest.onsuccess = (event) => {
  const db = dBOpenRequest.result;

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

  transaction.addEventListener("error", () => {
    console.log(`Error adding new item: ${newItem.taskTitle}`);
  });

  const objectStoreRequest = objectStore.add(newItem);
};
```

Cùng ví dụ đó, nhưng dùng thuộc tính `onerror` thay cho `addEventListener()`:

```js
// Mở cơ sở dữ liệu
const dBOpenRequest = window.indexedDB.open("toDoList", 4);

dBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  // Tạo objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định các mục dữ liệu mà objectStore sẽ chứa
  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
};

dBOpenRequest.onsuccess = (event) => {
  const db = dBOpenRequest.result;

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

  transaction.onerror = () => {
    console.log(`Error adding new item: ${newItem.taskTitle}`);
  };

  const objectStoreRequest = objectStore.add(newItem);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
