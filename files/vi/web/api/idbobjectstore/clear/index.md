---
title: "IDBObjectStore: phương thức clear()"
short-title: clear()
slug: Web/API/IDBObjectStore/clear
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.clear
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`clear()`** của giao diện {{domxref("IDBObjectStore")}} tạo và trả về ngay lập tức một đối tượng {{domxref("IDBRequest")}}, đồng thời xóa sạch object store này trong một luồng riêng biệt. Phương thức này dùng để xóa tất cả dữ liệu hiện có khỏi một object store.

Việc xóa một object store bao gồm loại bỏ tất cả bản ghi khỏi object store và loại bỏ tất cả bản ghi trong các index tham chiếu đến object store đó. Để chỉ xóa một số bản ghi trong store, hãy sử dụng {{domxref("IDBObjectStore.delete")}} truyền vào một khóa hoặc {{domxref("IDBKeyRange")}}.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là `undefined`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu object store đã bị xóa.
- `ReadOnlyError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch liên quan đến thao tác này đang ở [chế độ](/vi/docs/Web/API/IDBTransaction/mode) chỉ đọc.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một giao dịch read/write trên cơ sở dữ liệu và xóa tất cả dữ liệu hiện có khỏi object store bằng `clear()`. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này được sử dụng nhiều ở dưới
  db = DBOpenRequest.result;

  // Xóa tất cả dữ liệu từ object store
  clearData();
};

function clearData() {
  // mở một giao dịch db read/write, sẵn sàng để xóa dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");

  // báo cáo về việc giao dịch hoàn tất thành công
  transaction.oncomplete = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction completed.";
  };

  transaction.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      `Transaction not opened due to error: ${transaction.error}`;
  };

  // tạo một object store trên giao dịch
  const objectStore = transaction.objectStore("toDoList");

  // Gửi yêu cầu xóa tất cả dữ liệu khỏi object store
  const objectStoreRequest = objectStore.clear();

  objectStoreRequest.onsuccess = (event) => {
    // báo cáo sự thành công của yêu cầu
    note.appendChild(document.createElement("li")).textContent =
      "Request successful.";
  };
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng IndexedDB](/vi/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Thiết lập phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
