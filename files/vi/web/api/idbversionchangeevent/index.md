---
title: IDBVersionChangeEvent
slug: Web/API/IDBVersionChangeEvent
page-type: web-api-interface
browser-compat: api.IDBVersionChangeEvent
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBVersionChangeEvent`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) cho biết rằng phiên bản của cơ sở dữ liệu đã thay đổi, là kết quả của hàm xử lý sự kiện {{domxref("IDBOpenDBRequest.upgradeneeded_event", "onupgradeneeded")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("IDBVersionChangeEvent.IDBVersionChangeEvent", "IDBVersionChangeEvent()")}}
  - : Tạo và trả về một đối tượng `IDBVersionChangeEvent` mới được sử dụng để đại diện cho khi phiên bản của cơ sở dữ liệu đã thay đổi.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

- {{ domxref("IDBVersionChangeEvent.oldVersion") }} {{ReadOnlyInline}}
  - : Trả về phiên bản cũ của cơ sở dữ liệu.
- {{ domxref("IDBVersionChangeEvent.newVersion") }} {{ReadOnlyInline}}
  - : Trả về phiên bản mới của cơ sở dữ liệu.

## Phương thức phiên bản

_Không có phương thức đặc thù, nhưng kế thừa các phương thức từ giao diện cha, {{domxref("Event")}}._

## Ví dụ

Trong đoạn code sau, chúng ta thực hiện một yêu cầu mở cơ sở dữ liệu và bao gồm các trình xử lý cho các trường hợp thành công và lỗi. Sau sự kiện thay đổi phiên bản (sau sự kiện `upgradeneeded`), sự kiện `success` sẽ triển khai giao diện `IDBVersionChangeEvent`. Để có ví dụ hoạt động đầy đủ, xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const note = document.querySelector("ul");

// Hãy mở phiên bản 4 của cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này hoạt động khi cơ sở dữ liệu được mở thành công hoặc không
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Error loading database.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db. Điều này được sử dụng nhiều về sau, để mở giao dịch và những thứ tương tự.
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
