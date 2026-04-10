---
title: "IDBTransaction: thuộc tính mode"
short-title: mode
slug: Web/API/IDBTransaction/mode
page-type: web-api-instance-property
browser-compat: api.IDBTransaction.mode
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`mode`** của giao diện {{domxref("IDBTransaction")}} trả về chế độ hiện tại để truy cập dữ liệu trong các object store nằm trong phạm vi transaction, tức là chế độ chỉ đọc hay có ghi vào object store. Giá trị mặc định là `readonly`.

## Giá trị

Một chuỗi xác định chế độ để cô lập truy cập tới dữ liệu trong các object store hiện tại.
Các giá trị sau có sẵn:

- `readonly`
  - : Cho phép đọc dữ liệu nhưng không cho thay đổi.
- `readwrite`
  - : Cho phép đọc và ghi dữ liệu trong các kho dữ liệu hiện có.
- `versionchange`
  - : Cho phép thực hiện mọi thao tác, kể cả những thao tác xóa và tạo object store và index.
    Chế độ này dùng để cập nhật số phiên bản của transaction nếu phát hiện cần thiết khi gọi {{domxref("IDBFactory.open()")}}.
    Transaction ở chế độ này không thể chạy đồng thời với transaction khác.
    Transaction ở chế độ này được gọi là _upgrade transaction_.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một transaction đọc/ghi trên cơ sở dữ liệu và thêm dữ liệu vào object store. Lưu ý các hàm được gắn vào event handler của transaction để báo kết quả mở transaction trong trường hợp thành công hoặc thất bại. Cuối cùng, chúng ta ghi lại chế độ của transaction hiện tại bằng `mode`. Để xem ví dụ đầy đủ, hãy xem ứng dụng [To-do Notifications app](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

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
      "Transaction not opened due to error. Duplicate items not allowed.";
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

  // Trả về chế độ mà transaction này được mở với (trong trường hợp này phải là "readwrite")
  transaction.mode;
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
