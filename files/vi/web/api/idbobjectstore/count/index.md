---
title: "IDBObjectStore: phương thức count()"
short-title: count()
slug: Web/API/IDBObjectStore/count
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.count
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`count()`** của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, trả về tổng số bản ghi khớp với khóa hoặc {{domxref("IDBKeyRange")}} được cung cấp. Nếu không cung cấp đối số, nó trả về tổng số bản ghi trong store.

## Cú pháp

```js-nolint
count()
count(query)
```

### Tham số

- `query` {{optional_inline}}
  - : Một khóa hoặc đối tượng {{domxref("IDBKeyRange")}} chỉ định phạm vi bản ghi bạn muốn đếm.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là số lượng bản ghi khớp với truy vấn đã cho.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} này đã bị xóa.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu khóa hoặc phạm vi khóa được chỉ định không hợp lệ.

## Ví dụ

Trong đoạn mã đơn giản này, chúng ta tạo một giao dịch, truy xuất một object store, sau đó đếm số lượng bản ghi trong store bằng `count()` — khi trình xử lý success được kích hoạt, chúng ta ghi giá trị count (một số nguyên) ra console.

```js
const transaction = db.transaction(["fThings"], "readonly");
const objectStore = transaction.objectStore("fThings");

const countRequest = objectStore.count();
countRequest.onsuccess = () => {
  console.log(countRequest.result);
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
