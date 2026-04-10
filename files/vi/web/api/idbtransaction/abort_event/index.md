---
title: "IDBTransaction: sự kiện abort"
short-title: abort
slug: Web/API/IDBTransaction/abort_event
page-type: web-api-event
browser-compat: api.IDBTransaction.abort_event
---

{{APIRef("IndexedDB")}}

Sự kiện `abort` được phát khi một transaction `IndexedDB` bị hủy.

Việc này có thể xảy ra vì một trong các lý do sau:

- Request lỗi, ví dụ cố thêm cùng một khóa hai lần, hoặc put cùng một khóa index khi khóa đó có ràng buộc duy nhất.
- Gọi {{DOMxRef("IDBTransaction.abort", "abort()")}} trực tiếp.
- Một ngoại lệ không được bắt trong success/error handler của request.
- Lỗi I/O, ví dụ ghi xuống đĩa thất bại, chẳng hạn đĩa bị tháo hoặc lỗi OS/phần cứng khác.
- Vượt quá hạn mức.

Sự kiện không thể hủy này [nổi bọt](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling) lên đối tượng {{domxref("IDBDatabase")}} liên kết.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("abort", (event) => { })

onabort = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Nổi bọt

Sự kiện này nổi bọt lên {{domxref("IDBDatabase")}}. Thuộc tính `event.target` trỏ tới object {{domxref('IDBTransaction')}} đang nổi bọt lên.

Để biết thêm, xem [Event bubbling](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling).

## Ví dụ

Ví dụ này mở một cơ sở dữ liệu, tạo cơ sở dữ liệu nếu chưa tồn tại, rồi mở một transaction, thêm trình nghe cho sự kiện `abort`, sau đó hủy transaction để kích hoạt sự kiện.

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

  // xác định các mục dữ liệu mà objectStore sẽ chứa
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

  // thêm trình nghe cho `abort`
  transaction.addEventListener("abort", () => {
    console.log("Transaction was aborted");
  });

  // hủy transaction
  transaction.abort();
};
```

Cùng ví dụ đó, nhưng gán event handler vào thuộc tính `onabort`:

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

  // xác định các mục dữ liệu mà objectStore sẽ chứa
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

  // thêm trình nghe cho `abort`
  transaction.onabort = (event) => {
    console.log("Transaction was aborted");
  };

  // hủy transaction
  transaction.abort();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
