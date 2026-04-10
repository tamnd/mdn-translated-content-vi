---
title: "IDBCursor: phương thức continuePrimaryKey()"
short-title: continuePrimaryKey()
slug: Web/API/IDBCursor/continuePrimaryKey
page-type: web-api-instance-method
browser-compat: api.IDBCursor.continuePrimaryKey
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`continuePrimaryKey()`** của giao diện {{domxref("IDBCursor")}} đưa con trỏ đến mục có khóa khớp với tham số khóa, đồng thời khóa chính khớp với tham số khóa chính.

Một trường hợp sử dụng điển hình là tiếp tục vòng lặp tại vị trí mà một con trỏ trước đó đã bị đóng, mà không cần so sánh từng khóa một.

Việc gọi phương thức này nhiều hơn một lần trước khi dữ liệu con trỏ mới được tải - ví dụ gọi `continuePrimaryKey()` hai lần từ cùng một trình xử lý `onsuccess` - sẽ dẫn đến ngoại lệ `InvalidStateError` ở lần gọi thứ hai vì cờ got value của con trỏ đã bị bỏ đặt.

Phương thức này chỉ hợp lệ cho các con trỏ lấy từ một index. Nếu dùng cho con trỏ lấy từ object store, nó sẽ ném lỗi.

## Cú pháp

```js-nolint
continuePrimaryKey(key, primaryKey)
```

### Tham số

- `key`
  - : Khóa để đặt vị trí con trỏ.
- `primaryKey`
  - : Khóa chính để đặt vị trí con trỏ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Phương thức này có thể ném ra một {{domxref("DOMException")}} thuộc một trong các kiểu sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu transaction của `IDBCursor` này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số khóa có bất kỳ điều kiện nào sau đây:
    - Khóa không phải là một khóa hợp lệ.
    - Khóa nhỏ hơn hoặc bằng vị trí hiện tại của con trỏ, và hướng của con trỏ là `next` hoặc `nextunique`.
    - Khóa lớn hơn hoặc bằng vị trí hiện tại của con trỏ, và hướng của con trỏ là `prev` hoặc `prevunique`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu con trỏ đang được duyệt hoặc đã duyệt quá phần cuối.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu hướng của con trỏ không phải `prev` hoặc `next`.

## Ví dụ

Đây là cách bạn có thể tiếp tục duyệt tất cả bài viết được gắn thẻ `"javascript"` kể từ lần ghé thăm gần nhất:

```js
let request = articleStore.index("tag").openCursor();
let count = 0;
let unreadList = [];
request.onsuccess = (event) => {
  let cursor = event.target.result;
  if (!cursor) {
    return;
  }
  let lastPrimaryKey = getLastIteratedArticleId();
  if (lastPrimaryKey > cursor.primaryKey) {
    cursor.continuePrimaryKey("javascript", lastPrimaryKey);
    return;
  }
  // cập nhật lastIteratedArticleId
  setLastIteratedArticleId(cursor.primaryKey);
  // nạp trước 5 bài viết vào danh sách chưa đọc;
  unreadList.push(cursor.value);
  if (++count < 5) {
    cursor.continue();
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Sử dụng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Tham chiếu ví dụ: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
