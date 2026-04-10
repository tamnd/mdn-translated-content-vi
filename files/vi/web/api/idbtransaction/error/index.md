---
title: "IDBTransaction: thuộc tính error"
short-title: error
slug: Web/API/IDBTransaction/error
page-type: web-api-instance-property
browser-compat: api.IDBTransaction.error
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính **`IDBTransaction.error`** của giao diện {{domxref("IDBTransaction")}} trả về loại lỗi khi transaction thất bại.

## Giá trị

Một {{domxref("DOMException")}} chứa lỗi liên quan, hoặc `null` nếu không có lỗi nào.

Nó có thể là tham chiếu đến cùng lỗi với object request đã gây ra nó, hoặc là lỗi transaction, ví dụ `QuotaExceededError`.

Thuộc tính này là `null` nếu transaction chưa kết thúc, hoặc đã kết thúc và được commit thành công.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một transaction đọc/ghi trên cơ sở dữ liệu và thêm dữ liệu vào object store. Lưu ý các hàm được gắn vào event handler của transaction để báo kết quả mở transaction trong trường hợp thành công hoặc thất bại. Chú ý khối `transaction.onerror = (event) => { };`, nơi dùng `transaction.error` để hỗ trợ báo cáo lỗi đã xảy ra khi transaction thất bại. Để xem ví dụ đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const note = document.getElementById("notifications");

// một thể hiện của object db để lưu dữ liệu IDB vào
let db;

// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này sẽ được dùng rất nhiều về sau
  db = DBOpenRequest.result;

  // Chạy hàm addData() để thêm dữ liệu vào cơ sở dữ liệu
  addData();
};

function addData() {
  // Tạo một object mới để chèn vào IDB
  const newItem = [
    {
      taskTitle: "Walk dog",
      hours: 19,
      minutes: 30,
      day: 24,
      month: "December",
      year: 2013,
      notified: "no",
    },
  ];

  // mở transaction đọc/ghi, sẵn sàng để thêm dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");

  // báo cáo về kết quả mở transaction
  transaction.oncomplete = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction completed: database modification finished.";
  };

  transaction.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      `Transaction not opened due to error: ${transaction.error}`;
  };

  // tạo object store trên transaction
  const objectStore = transaction.objectStore("toDoList");

  // thêm object newItem vào object store
  const objectStoreRequest = objectStore.add(newItem[0]);

  objectStoreRequest.onsuccess = (event) => {
    // báo cáo thành công của request (điều này không có nghĩa là mục
    // đã được lưu thành công trong DB - để làm vậy bạn cần transaction.onsuccess)
    note.appendChild(document.createElement("li")).textContent =
      "Request successful.";
  };
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một dải khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
