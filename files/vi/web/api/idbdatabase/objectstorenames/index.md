---
title: "IDBDatabase: thuộc tính objectStoreNames"
short-title: objectStoreNames
slug: Web/API/IDBDatabase/objectStoreNames
page-type: web-api-instance-property
browser-compat: api.IDBDatabase.objectStoreNames
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`objectStoreNames`** của giao diện {{domxref("IDBDatabase")}} là một {{ domxref("DOMStringList") }} chứa danh sách tên của các [object store](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#object_store) hiện có trong cơ sở dữ liệu đang kết nối.

## Giá trị

Một {{ domxref("DOMStringList") }} chứa danh sách tên của các [object store](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#object_store) hiện có trong cơ sở dữ liệu đang kết nối.

## Ví dụ

```js
// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này hoạt động trên việc cơ sở dữ liệu được mở thành công hoặc không
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Lỗi khi tải cơ sở dữ liệu.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Cơ sở dữ liệu đã được khởi tạo.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db. Biến này sẽ được dùng rất nhiều về sau
  db = DBOpenRequest.result;

  // Dòng này sẽ ghi tên các object store của cơ sở dữ liệu đang kết nối, lẽ ra sẽ là
  // một object trông giống như { ['my-store-name'] }
  console.log(db.objectStoreNames);
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
