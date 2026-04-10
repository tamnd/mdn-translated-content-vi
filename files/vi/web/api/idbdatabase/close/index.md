---
title: "IDBDatabase: phương thức close()"
short-title: close()
slug: Web/API/IDBDatabase/close
page-type: web-api-instance-method
browser-compat: api.IDBDatabase.close
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("IDBDatabase")}} trả về ngay lập tức và đóng kết nối trong một luồng riêng.

Kết nối sẽ không thực sự được đóng cho tới khi tất cả transaction được tạo bằng kết nối này hoàn tất. Không thể tạo transaction mới cho kết nối này sau khi phương thức này được gọi. Các phương thức tạo transaction sẽ ném ngoại lệ nếu một thao tác đóng đang chờ xử lý.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4); // mở một cơ sở dữ liệu.

// Tạo trình xử lý sự kiện cho cả thành công và thất bại
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Lỗi khi tải cơ sở dữ liệu.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Cơ sở dữ liệu đã được khởi tạo.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db.
  db = DBOpenRequest.result;

  // giờ hãy đóng cơ sở dữ liệu lại!
  db.close();
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
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
