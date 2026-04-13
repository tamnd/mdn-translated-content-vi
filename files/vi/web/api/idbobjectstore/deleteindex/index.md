---
title: "IDBObjectStore: phương thức deleteIndex()"
short-title: deleteIndex()
slug: Web/API/IDBObjectStore/deleteIndex
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.deleteIndex
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`deleteIndex()`** của giao diện {{domxref("IDBObjectStore")}} hủy index có tên được chỉ định trong cơ sở dữ liệu đã kết nối, được sử dụng trong quá trình nâng cấp phiên bản.

Lưu ý rằng phương thức này chỉ được gọi từ callback của chế độ giao dịch `VersionChange`. Lưu ý rằng phương thức này đồng bộ sửa đổi thuộc tính {{domxref("IDBObjectStore.indexNames")}}.

## Cú pháp

```js-nolint
deleteIndex(indexName)
```

### Tham số

- `indexName`
  - : Tên của index hiện có cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu phương thức không được gọi từ callback của chế độ giao dịch `versionchange`.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch mà {{domxref("IDBObjectStore")}} này thuộc về không hoạt động (ví dụ: đã bị xóa hoặc loại bỏ.)
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không có index nào có tên trùng khớp (có phân biệt hoa thường) trong cơ sở dữ liệu.

## Ví dụ

Trong ví dụ sau, bạn có thể thấy trình xử lý {{domxref("IDBOpenDBRequest.upgradeneeded_event", "onupgradeneeded")}} được sử dụng để cập nhật cấu trúc cơ sở dữ liệu nếu một cơ sở dữ liệu với số phiên bản cao hơn được tải. {{domxref("IDBObjectStore.createIndex")}} được sử dụng để tạo các index mới trên object store, sau đó chúng ta xóa các index cũ không cần thiết bằng `deleteIndex()`. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
let db;

// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này hoạt động khi cơ sở dữ liệu được mở thành công hoặc không
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Error loading database.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào biến db. Biến này được sử dụng nhiều ở dưới
  db = event.target.result;

  // Chạy hàm displayData() để điền danh sách tác vụ với tất cả dữ liệu danh sách việc cần làm đã có trong IDB
  displayData();
};

// Sự kiện này xử lý việc cần tạo phiên bản mới của cơ sở dữ liệu
// Hoặc là chưa từng tạo trước đó, hoặc số phiên bản mới đã được gửi qua dòng
// window.indexedDB.open ở trên
// nó chỉ được triển khai trong các trình duyệt gần đây
DBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Error loading database.";
  };

  // Tạo một objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định các mục dữ liệu mà objectStore sẽ chứa

  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });
  objectStore.createIndex("notified", "notified", { unique: false });

  objectStore.deleteIndex("seconds");
  objectStore.deleteIndex("contact");
};
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
