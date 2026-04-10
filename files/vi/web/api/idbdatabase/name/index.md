---
title: "IDBDatabase: thuộc tính name"
short-title: name
slug: Web/API/IDBDatabase/name
page-type: web-api-instance-property
browser-compat: api.IDBDatabase.name
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện `IDBDatabase` là một chuỗi chứa tên của cơ sở dữ liệu đang kết nối.

## Giá trị

Một chuỗi chứa tên của cơ sở dữ liệu đang kết nối.

## Ví dụ

Ví dụ này cho thấy một kết nối cơ sở dữ liệu được mở, đối tượng {{domxref("IDBDatabase")}} nhận được được lưu trong biến `db`, rồi thuộc tính tên được ghi ra console. Để xem ví dụ đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này hoạt động trên việc cơ sở dữ liệu
// được mở thành công hoặc không
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Lỗi khi tải cơ sở dữ liệu.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Cơ sở dữ liệu đã được khởi tạo.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db. Biến này sẽ được dùng rất nhiều về sau
  db = DBOpenRequest.result;

  // Dòng này sẽ ghi tên của cơ sở dữ liệu, lẽ ra là "toDoList"
  console.log(db.name);
};
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
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
