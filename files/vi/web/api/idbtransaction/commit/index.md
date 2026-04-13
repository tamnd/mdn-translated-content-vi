---
title: "IDBTransaction: phương thức commit()"
short-title: commit()
slug: Web/API/IDBTransaction/commit
page-type: web-api-instance-method
browser-compat: api.IDBTransaction.commit
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`commit()`** của giao diện {{domxref("IDBTransaction")}} sẽ commit transaction nếu nó được gọi trên một transaction đang active.

Lưu ý rằng bình thường `commit()` không _cần_ phải gọi; transaction sẽ tự động commit khi mọi request đang chờ đã được xử lý và không có request mới nào được tạo. `commit()` có thể dùng để bắt đầu quá trình commit mà không cần chờ sự kiện từ các request đang chờ được phát ra.

Nếu gọi trên một transaction không active, phương thức này sẽ ném `InvalidStateError` {{domxref("DOMException")}}.

## Cú pháp

```js-nolint
commit()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái của transaction không active.

## Ví dụ

```js
const note = document.getElementById("notifications");

// mở transaction đọc/ghi, sẵn sàng để thêm dữ liệu
const transaction = db.transaction(["myDB"], "readwrite");

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
const objectStore = transaction.objectStore("myObjStore");

// thêm object newItem vào object store
const objectStoreRequest = objectStore.add(newItem[0]);

objectStoreRequest.onsuccess = (event) => {
  // báo cáo thành công của request (điều này không có nghĩa là mục
  // đã được lưu thành công trong DB - để làm vậy bạn cần transaction.onsuccess)
  note.appendChild(document.createElement("li")).textContent =
    "Request successful.";
};

// Buộc các thay đổi được commit vào cơ sở dữ liệu càng sớm càng tốt
transaction.commit();
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
