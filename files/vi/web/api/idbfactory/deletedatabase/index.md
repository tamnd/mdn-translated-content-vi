---
title: "IDBFactory: phương thức deleteDatabase()"
short-title: deleteDatabase()
slug: Web/API/IDBFactory/deleteDatabase
page-type: web-api-instance-method
browser-compat: api.IDBFactory.deleteDatabase
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`deleteDatabase()`** của giao diện {{DOMxRef("IDBFactory")}} yêu cầu xóa một cơ sở dữ liệu. Phương thức này ngay lập tức trả về một đối tượng {{DOMxRef("IDBOpenDBRequest")}} và thực hiện thao tác xóa một cách bất đồng bộ.

Nếu cơ sở dữ liệu được xóa thành công, một sự kiện `success` sẽ được kích hoạt trên đối tượng yêu cầu được trả về từ phương thức này, với `result` được đặt thành `undefined`. Nếu xảy ra lỗi trong khi cơ sở dữ liệu đang bị xóa, một sự kiện `error` sẽ được kích hoạt trên đối tượng yêu cầu được trả về từ phương thức này.

Khi `deleteDatabase()` được gọi, mọi kết nối đang mở khác tới cơ sở dữ liệu cụ thể này sẽ nhận được sự kiện [versionchange](/en-US/docs/Web/API/IDBDatabase/versionchange_event).

## Cú pháp

```js-nolint
// Với chuẩn hiện tại:
deleteDatabase(name)

// Với phiên bản thử nghiệm có `options` (xem bên dưới):
deleteDatabase(name)
deleteDatabase(name, options)
```

### Tham số

- `name`
  - : Tên của cơ sở dữ liệu bạn muốn xóa. Lưu ý rằng việc cố xóa một cơ sở dữ liệu không tồn tại sẽ không ném ra ngoại lệ, trái ngược với {{DOMxRef("IDBDatabase.deleteObjectStore()")}}, vốn sẽ ném ngoại lệ nếu object store được đặt tên không tồn tại.
- `options` {{optional_inline}} {{Non-standard_Inline}}
  - : Trong Gecko, kể từ [phiên bản 26](/en-US/docs/Mozilla/Firefox/Releases/26), bạn có thể thêm một tham số lưu trữ tùy chọn không chuẩn để chỉ định bạn muốn xóa IndexedDB `permanent` (giá trị mặc định) hay một IndexedDB trong bộ nhớ `temporary` (còn gọi là shared pool).

### Giá trị trả về

Một {{DOMxRef("IDBOpenDBRequest")}} mà trên đó các sự kiện tiếp theo liên quan đến yêu cầu này sẽ được kích hoạt.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của yêu cầu là `null`.

## Ví dụ

```js
const DBDeleteRequest = window.indexedDB.deleteDatabase("toDoList");

DBDeleteRequest.onerror = (event) => {
  console.error("Lỗi khi xóa cơ sở dữ liệu.");
};

DBDeleteRequest.onsuccess = (event) => {
  console.log("Cơ sở dữ liệu đã được xóa thành công");

  console.log(event.result); // nên là undefined
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{DOMxRef("IDBDatabase")}}
- Dùng transaction: {{DOMxRef("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{DOMxRef("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{DOMxRef("IDBObjectStore")}}
- Dùng cursor: {{DOMxRef("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
