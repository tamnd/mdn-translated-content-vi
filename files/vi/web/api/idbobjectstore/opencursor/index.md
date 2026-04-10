---
title: "IDBObjectStore: phương thức openCursor()"
short-title: openCursor()
slug: Web/API/IDBObjectStore/openCursor
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.openCursor
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`openCursor()`** của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, trả về một đối tượng {{domxref("IDBCursorWithValue")}} mới. Được sử dụng để lặp qua một object store bằng con trỏ.

## Cú pháp

```js-nolint
openCursor()
openCursor(query)
openCursor(query, direction)
```

### Tham số

- `query` {{optional_inline}}
  - : Một khóa hoặc {{domxref("IDBKeyRange")}} cần truy vấn. Nếu một khóa hợp lệ duy nhất được truyền, mặc định sẽ là một phạm vi chỉ chứa khóa đó. Nếu không truyền gì, mặc định sẽ là một phạm vi khóa chọn tất cả bản ghi trong object store này.
- `direction` {{optional_inline}}
  - : Một chuỗi cho biết con trỏ sẽ di chuyển theo hướng nào. Mặc định là `next`. Các giá trị hợp lệ là:
    - `next`
      - : Con trỏ được mở ở đầu store; sau đó, con trỏ trả về tất cả bản ghi, kể cả trùng lặp, theo thứ tự khóa tăng dần.
    - `nextunique`
      - : Con trỏ được mở ở đầu store; sau đó, con trỏ trả về tất cả bản ghi không trùng lặp, theo thứ tự khóa tăng dần.
    - `prev`
      - : Con trỏ được mở ở cuối store; sau đó, con trỏ trả về tất cả bản ghi, kể cả trùng lặp, theo thứ tự khóa giảm dần.
    - `prevunique`
      - : Con trỏ được mở ở cuối store; sau đó, con trỏ trả về tất cả bản ghi không trùng lặp, theo thứ tự khóa giảm dần.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là:

- một đối tượng {{domxref("IDBCursorWithValue")}} trỏ đến bản ghi đầu tiên khớp với truy vấn đã cho
- `null` nếu không tìm thấy bản ghi khớp nào.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} hoặc {{domxref("IDBIndex")}} này đã bị xóa.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu khóa hoặc phạm vi khóa được chỉ định không hợp lệ.

## Ví dụ

Trong đoạn mã đơn giản này, chúng ta tạo một giao dịch, truy xuất một object store, sau đó sử dụng một con trỏ để lặp qua tất cả bản ghi trong object store:

```js
const transaction = db.transaction("name", "readonly");
const objectStore = transaction.objectStore("name");
const request = objectStore.openCursor();
request.onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // cursor.value chứa bản ghi hiện tại đang được lặp qua
    // đây là nơi bạn sẽ làm gì đó với kết quả
    cursor.continue();
  } else {
    // không còn kết quả nào
  }
};
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
