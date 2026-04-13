---
title: "IDBVersionChangeEvent: thuộc tính newVersion"
short-title: newVersion
slug: Web/API/IDBVersionChangeEvent/newVersion
page-type: web-api-instance-property
browser-compat: api.IDBVersionChangeEvent.newVersion
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`newVersion`** của giao diện {{domxref("IDBVersionChangeEvent")}} trả về số phiên bản mới của cơ sở dữ liệu.

## Giá trị

Một số là số nguyên 64-bit hoặc null nếu cơ sở dữ liệu đang bị xóa.

## Ví dụ

Trong đoạn code sau, chúng ta thực hiện một yêu cầu mở cơ sở dữ liệu và bao gồm các trình xử lý cho các trường hợp thành công và lỗi. Các sự kiện này được kích hoạt thông qua giao diện tùy chỉnh `IDBVersionChangeEvent`. Để có ví dụ hoạt động đầy đủ, xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const note = document.querySelector("ul");

// Hãy mở phiên bản 4 của cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này hoạt động khi cơ sở dữ liệu được mở
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Error loading database.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Điều này được sử dụng nhiều về sau, để mở giao dịch và những thứ tương tự.
  const db = DBOpenRequest.result;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Đặt phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
