---
title: "IDBFactory: phương thức open()"
short-title: open()
slug: Web/API/IDBFactory/open
page-type: web-api-instance-method
browser-compat: api.IDBFactory.open
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`open()`** của giao diện {{domxref("IDBFactory")}} yêu cầu mở một [kết nối tới cơ sở dữ liệu](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#database_connection).

Phương thức này ngay lập tức trả về một đối tượng {{domxref("IDBOpenDBRequest")}} và thực hiện thao tác mở một cách bất đồng bộ.
Nếu thao tác thành công, một sự kiện `success` sẽ được kích hoạt trên đối tượng yêu cầu được trả về từ phương thức này, với thuộc tính `result` được đặt thành đối tượng {{domxref("IDBDatabase")}} mới cho kết nối đó.

Có thể kích hoạt các sự kiện `upgradeneeded`, `blocked` hoặc `versionchange`.

## Cú pháp

```js-nolint
open(name)
open(name, version)
```

### Tham số

- `name`
  - : Tên của cơ sở dữ liệu.
- `version` {{optional_inline}}
  - : Tùy chọn. Phiên bản dùng để mở cơ sở dữ liệu. Nếu không cung cấp phiên bản và cơ sở dữ liệu đã tồn tại, thì một kết nối đến cơ sở dữ liệu sẽ được mở mà không thay đổi phiên bản của nó.
    Nếu không cung cấp phiên bản và cơ sở dữ liệu chưa tồn tại, thì nó sẽ được tạo với phiên bản `1`.

### Giá trị trả về

Một đối tượng {{domxref("IDBOpenDBRequest")}} mà trên đó các sự kiện tiếp theo liên quan đến yêu cầu này sẽ được kích hoạt.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của yêu cầu là một đối tượng {{domxref("IDBDatabase")}} đại diện cho kết nối tới cơ sở dữ liệu.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu giá trị của `version` không phải là số lớn hơn `0`.

## Ví dụ

Ví dụ gọi `open` với tham số `version` theo đặc tả hiện tại:

```js
const request = window.indexedDB.open("toDoList", 4);
```

Trong đoạn mã sau, chúng ta tạo một yêu cầu mở cơ sở dữ liệu và thêm các trình xử lý cho trường hợp thành công và lỗi.
Để xem ví dụ hoàn chỉnh đang hoạt động, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const note = document.querySelector("ul");

// Hãy mở phiên bản 4 của cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này xử lý việc cơ sở dữ liệu được mở
// thành công hoặc không
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Lỗi khi tải cơ sở dữ liệu.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Cơ sở dữ liệu đã được khởi tạo.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db
  // Biến này sẽ được dùng nhiều về sau, cho việc mở
  // transaction và các tác vụ tương tự.
  db = DBOpenRequest.result;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- [Hạn mức lưu trữ của trình duyệt và tiêu chí loại bỏ dữ liệu](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria).
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
