---
title: IDBFactory
slug: Web/API/IDBFactory
page-type: web-api-interface
browser-compat: api.IDBFactory
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBFactory`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) cho phép ứng dụng truy cập bất đồng bộ vào các cơ sở dữ liệu được lập chỉ mục. Đối tượng triển khai giao diện này là `window.indexedDB`. Bạn mở, tức là tạo và truy cập, cũng như xóa một cơ sở dữ liệu bằng đối tượng này, chứ không trực tiếp bằng `IDBFactory`.

## Phương thức thể hiện

- {{domxref("IDBFactory.open()")}}
  - : Yêu cầu mở [kết nối tới cơ sở dữ liệu](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#database_connection).
- {{domxref("IDBFactory.deleteDatabase()")}}
  - : Yêu cầu xóa một cơ sở dữ liệu.
- {{domxref("IDBFactory.cmp()")}}
  - : So sánh hai khóa và trả về kết quả cho biết khóa nào có giá trị lớn hơn.
- {{domxref("IDBFactory.databases()")}}
  - : Trả về một promise được fulfill với một mảng chứa tất cả cơ sở dữ liệu hiện có, bao gồm tên và phiên bản của chúng.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một yêu cầu mở cơ sở dữ liệu và thêm các trình xử lý cho trường hợp thành công và lỗi. Để xem ví dụ hoàn chỉnh đang hoạt động, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem trực tiếp ví dụ](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Hãy mở phiên bản 4 của cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này xử lý việc cơ sở dữ liệu được mở thành công hoặc không
DBOpenRequest.onerror = (event) => {
  console.error("Lỗi khi tải cơ sở dữ liệu.");
};

DBOpenRequest.onsuccess = (event) => {
  console.info("Cơ sở dữ liệu đã được khởi tạo.");

  // lưu kết quả mở cơ sở dữ liệu vào biến db. Biến này sẽ được dùng nhiều về sau, cho việc mở transaction và các tác vụ tương tự.
  db = DBOpenRequest.result;
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
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
