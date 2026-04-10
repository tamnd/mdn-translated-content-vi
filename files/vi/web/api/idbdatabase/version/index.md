---
title: "IDBDatabase: thuộc tính version"
short-title: version
slug: Web/API/IDBDatabase/version
page-type: web-api-instance-property
browser-compat: api.IDBDatabase.version
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính **`version`** của giao diện {{domxref("IDBDatabase")}} là một số nguyên 64 bit chứa phiên bản của cơ sở dữ liệu đang kết nối. Khi cơ sở dữ liệu mới được tạo, thuộc tính này là một chuỗi rỗng.

## Giá trị

Một số nguyên chứa phiên bản của cơ sở dữ liệu đang kết nối.

## Ví dụ

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

  // Dòng này sẽ ghi phiên bản của cơ sở dữ liệu đang kết nối, lẽ ra là "4"
  console.log(db.version);
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
