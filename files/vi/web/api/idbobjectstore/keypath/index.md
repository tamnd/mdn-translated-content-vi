---
title: "IDBObjectStore: thuộc tính keyPath"
short-title: keyPath
slug: Web/API/IDBObjectStore/keyPath
page-type: web-api-instance-property
browser-compat: api.IDBObjectStore.keyPath
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`keyPath`** của giao diện {{domxref("IDBObjectStore")}} trả về [đường dẫn khóa](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) của object store này.

Nếu thuộc tính này là null, ứng dụng phải cung cấp một khóa cho mỗi thao tác sửa đổi.

## Giá trị

Bất kỳ kiểu giá trị nào.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một giao dịch read/write trên cơ sở dữ liệu và thêm một số dữ liệu vào object store bằng `add()`. Sau khi object store được tạo, chúng ta ghi `objectStore.keyPath` ra console. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này được sử dụng nhiều ở dưới
  db = DBOpenRequest.result;

  // Chạy hàm addData() để thêm dữ liệu vào cơ sở dữ liệu
  addData();
};

function addData() {
  // Tạo một đối tượng mới sẵn sàng chèn vào IDB
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

  // mở một giao dịch db read/write, sẵn sàng để thêm dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");

  // báo cáo về việc giao dịch hoàn tất thành công
  transaction.oncomplete = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction completed.";
  };

  transaction.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction not opened due to error. Duplicate items not allowed.";
  };

  // tạo một object store trên giao dịch
  const objectStore = transaction.objectStore("toDoList");
  console.log(objectStore.keyPath);

  // Gửi yêu cầu thêm đối tượng newItem vào object store
  const objectStoreRequest = objectStore.add(newItem[0]);

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
