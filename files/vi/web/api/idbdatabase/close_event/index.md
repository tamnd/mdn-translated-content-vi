---
title: "IDBDatabase: sự kiện close"
short-title: close
slug: Web/API/IDBDatabase/close_event
page-type: web-api-event
browser-compat: api.IDBDatabase.close_event
---

{{ APIRef("IndexedDB") }}

Sự kiện `close` được kích hoạt trên `IDBDatabase` khi kết nối cơ sở dữ liệu bị đóng bất ngờ. Điều này có thể xảy ra, chẳng hạn, nếu bộ nhớ lưu trữ nền bị xóa hoặc nếu người dùng xóa cơ sở dữ liệu trong các tùy chọn lịch sử của trình duyệt.

Lưu ý rằng sự kiện này không được kích hoạt nếu kết nối cơ sở dữ liệu được đóng theo cách bình thường bằng [`IDBDatabase.close()`](/en-US/docs/Web/API/IDBDatabase/close).

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("close", (event) => { })

onclose = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

Ví dụ này mở một cơ sở dữ liệu và lắng nghe sự kiện `close`:

```js
// Mở cơ sở dữ liệu
const dBOpenRequest = window.indexedDB.open("toDoList", 4);

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
  const db = dBOpenRequest.result;
  db.addEventListener("close", () => {
    console.log("Kết nối cơ sở dữ liệu đã đóng");
  });
};
```

Cùng ví dụ đó, dùng thuộc tính `onclose` thay cho `addEventListener()`:

```js
// Mở cơ sở dữ liệu
const dBOpenRequest = window.indexedDB.open("toDoList", 4);

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
  const db = dBOpenRequest.result;
  db.onclose = () => {
    console.log("Kết nối cơ sở dữ liệu đã đóng");
  };
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
