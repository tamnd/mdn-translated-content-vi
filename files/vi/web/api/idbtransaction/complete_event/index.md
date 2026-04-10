---
title: "IDBTransaction: sự kiện complete"
short-title: complete
slug: Web/API/IDBTransaction/complete_event
page-type: web-api-event
browser-compat: api.IDBTransaction.complete_event
---

{{APIRef("IndexedDB")}}

Sự kiện **`complete`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) được phát khi transaction đã commit thành công, tức là sau khi bạn gọi trực tiếp {{domxref("IDBTransaction.commit()")}} hoặc khi mọi request đã hoàn tất thành công và không có request mới nào được đặt sau khi xử lý kết quả của chúng. Xem {{domxref("IDBTransaction")}} để biết thêm.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("complete", (event) => { })

oncomplete = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Dùng {{DOMxRef("EventTarget.addEventListener", "addEventListener()")}}:

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

  // thêm trình nghe cho `complete`
  transaction.addEventListener("complete", (event) => {
    console.log("Transaction was completed");
  });

  const objectStore = transaction.objectStore("toDoList");
  const newItem = {
    taskTitle: "my task",
    hours: 10,
    minutes: 10,
    day: 10,
    month: "January",
    year: 2019,
  };
  const objectStoreRequest = objectStore.add(newItem);

  objectStoreRequest.onsuccess = () => {
    // Phát một request thứ hai trong handler onsuccess,
    // để request này chạy sau khi request đầu tiên hoàn tất,
    // nhưng vẫn dùng cùng transaction
    const getAllRequest = objectStore.getAll();

    getAllRequest.onsuccess = () => {
      // Không còn request nào nữa, nên transaction sẽ hoàn tất sau khi chạy xong handler này
      console.log(getAllRequest.result);
    };
  };
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
