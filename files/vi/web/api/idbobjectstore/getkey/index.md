---
title: "IDBObjectStore: phương thức getKey()"
short-title: getKey()
slug: Web/API/IDBObjectStore/getKey
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.getKey
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`getKey()`** của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, trả về khóa được chọn theo truy vấn được chỉ định. Phương thức này dùng để truy xuất các bản ghi cụ thể từ một object store.

Nếu một khóa được tìm thấy thành công, thì một bản sao có cấu trúc của nó được tạo và đặt làm kết quả của đối tượng request.

## Cú pháp

```js-nolint
getKey(key)
```

### Tham số

- `key`
  - : Khóa hoặc phạm vi khóa xác định bản ghi cần truy xuất.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là khóa của bản ghi đầu tiên khớp với khóa hoặc phạm vi khóa đã cho.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} đã bị xóa hoặc loại bỏ.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu khóa hoặc phạm vi khóa được cung cấp chứa một khóa không hợp lệ.

## Ví dụ

```js
let openRequest = indexedDB.open("telemetry");
openRequest.onsuccess = (event) => {
  let db = event.target.result;
  let store = db.transaction("net-logs").objectStore("net-logs");

  let today = new Date();
  let yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);
  let request = store.getKey(IDBKeyRange(yesterday, today));
  request.onsuccess = (event) => {
    let when = event.target.result;
    alert(`The 1st activity in last 24 hours was occurred at ${when}`);
  };
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
