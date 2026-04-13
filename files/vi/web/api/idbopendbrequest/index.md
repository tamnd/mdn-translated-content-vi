---
title: IDBOpenDBRequest
slug: Web/API/IDBOpenDBRequest
page-type: web-api-interface
browser-compat: api.IDBOpenDBRequest
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBOpenDBRequest`** của IndexedDB API cung cấp quyền truy cập vào kết quả của các yêu cầu mở hoặc xóa cơ sở dữ liệu (được thực hiện bằng {{domxref("IDBFactory.open")}} và {{domxref("IDBFactory.deleteDatabase")}}), sử dụng các thuộc tính trình xử lý sự kiện cụ thể.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ các thực thể cha {{domxref("IDBRequest")}} và {{domxref("EventTarget")}}_.

## Phương thức phiên bản

_Không có phương thức, nhưng kế thừa các phương thức từ các thực thể cha {{domxref("IDBRequest")}} và {{domxref("EventTarget")}}._

## Sự kiện

_Các sự kiện được định nghĩa trên giao diện cha, {{DOMxRef("IDBRequest")}} và {{DOMxRef("EventTarget")}}, cũng có thể được gửi trên các đối tượng `IDBOpenDBRequest`._

Lắng nghe các sự kiện chung và cụ thể này bằng `addEventListener()` hoặc bằng cách gán trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này.

Các sự kiện cụ thể cho giao diện này là:

- [`blocked`](/en-US/docs/Web/API/IDBOpenDBRequest/blocked_event)
  - : Kích hoạt khi một kết nối mở đến cơ sở dữ liệu đang chặn giao dịch `versionchange` trên cùng cơ sở dữ liệu. Cũng có sẵn qua thuộc tính [`onblocked`](/en-US/docs/Web/API/IDBOpenDBRequest/blocked_event).
- [`upgradeneeded`](/en-US/docs/Web/API/IDBOpenDBRequest/upgradeneeded_event)
  - : Kích hoạt khi có nỗ lực mở cơ sở dữ liệu với số phiên bản cao hơn phiên bản hiện tại của nó. Cũng có sẵn qua thuộc tính [`onupgradeneeded`](/en-US/docs/Web/API/IDBOpenDBRequest/upgradeneeded_event).

## Ví dụ

Trong ví dụ sau, bạn có thể thấy trình xử lý onupgradeneeded được sử dụng để cập nhật cấu trúc cơ sở dữ liệu nếu cơ sở dữ liệu có số phiên bản cao hơn được tải. Để xem ví dụ đầy đủ, xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/).)

```js
let db;

// Let us open our database
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// these event handlers act on the database being opened.
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Error loading database.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // store the result of opening the database in the db
  // variable. This is used a lot below
  db = DBOpenRequest.result;

  // Run the displayData() function to populate the task
  // list with all the to-do list data already in the IDB
  displayData();
};

// This event handles the event whereby a new version of
// the database needs to be created Either one has not
// been created before, or a new version number has been
// submitted via the window.indexedDB.open line above
// it is only implemented in recent browsers
DBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Error loading database.";
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
  objectStore.createIndex("notified", "notified", { unique: false });
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Đặt phạm vi khóa: {{domxref("IDBKeyRange")}}
- Lấy và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham chiếu: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
