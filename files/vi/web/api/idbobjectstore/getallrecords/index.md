---
title: "IDBObjectStore: phương thức getAllRecords()"
short-title: getAllRecords()
slug: Web/API/IDBObjectStore/getAllRecords
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.IDBObjectStore.getAllRecords
---

{{ APIRef("IndexedDB") }}{{SeeCompatTable}}

Phương thức **`getAllRecords()`** của giao diện {{domxref("IDBObjectStore")}} truy xuất tất cả bản ghi (bao gồm khóa chính và giá trị) từ object store.

`getAllRecords()` kết hợp hiệu quả chức năng của {{domxref("IDBObjectStore.getAllKeys", "getAllKeys()")}} và {{domxref("IDBObjectStore.getAll", "getAll()")}} bằng cách liệt kê đồng thời cả khóa chính và giá trị. Thao tác kết hợp này cho phép một số mẫu truy xuất dữ liệu đạt tốc độ nhanh hơn đáng kể so với các phương án thay thế như lặp bằng con trỏ.

## Cú pháp

```js-nolint
getAllRecords()
getAllRecords(options)
```

### Tham số

Một đối tượng options có các thuộc tính có thể bao gồm:

- `query` {{optional_inline}}
  - : Một khóa hoặc một {{domxref("IDBKeyRange")}} xác định các bản ghi cần truy xuất. Nếu giá trị này là `null` hoặc không được chỉ định, trình duyệt sẽ sử dụng một phạm vi khóa không giới hạn.
- `count` {{optional_inline}}
  - : Số lượng bản ghi cần trả về. Nếu giá trị này vượt quá số lượng bản ghi trong truy vấn, trình duyệt sẽ chỉ truy xuất các bản ghi đã truy vấn. Nếu giá trị nhỏ hơn `0` hoặc lớn hơn `2^32 - 1`, một ngoại lệ {{jsxref("TypeError")}} sẽ được ném.
- `direction` {{optional_inline}}
  - : Một giá trị liệt kê chỉ định hướng mà các bản ghi được duyệt qua, từ đó xác định thứ tự chúng được trả về. Các giá trị có thể là:
    - `next`
      - : Các bản ghi được duyệt từ đầu, theo thứ tự khóa tăng dần. Đây là giá trị mặc định.
    - `nextunique`
      - : Các bản ghi được duyệt từ đầu, theo thứ tự khóa tăng dần. Điều này sẽ tạo ra cùng các bản ghi như `next`, vì các khóa trùng lặp không được phép trong `IDBObjectStore`.
    - `prev`
      - : Các bản ghi được duyệt từ cuối, theo thứ tự khóa giảm dần.
    - `prevunique`
      - : Các bản ghi được duyệt từ cuối, theo thứ tự khóa giảm dần. Điều này sẽ tạo ra cùng các bản ghi như `prev`, vì các khóa trùng lặp không được phép trong `IDBObjectStore`.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là một {{jsxref("Array", "mảng")}} các đối tượng đại diện cho tất cả bản ghi khớp với truy vấn đã cho, tối đa bằng số lượng được chỉ định bởi `count` (nếu được cung cấp).

Mỗi đối tượng chứa các thuộc tính sau:

- `key`
  - : Một giá trị đại diện cho khóa của bản ghi.
- `primaryKey`
  - : Khóa của bản ghi; giống hệt thuộc tính `key`.
- `value`
  - : Một giá trị đại diện cho giá trị của bản ghi.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc các loại sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} đã bị xóa hoặc loại bỏ.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- {{jsxref("TypeError")}} {{domxref("DOMException")}}
  - : Được ném nếu tham số [`count`](#count) không nằm trong khoảng từ `0` đến `2^32 - 1`, bao gồm cả hai đầu mút.

## Ví dụ

```js
const query = IDBKeyRange.lowerBound("myKey", true);
const objectStore = transaction.objectStore("contactsList");

const myRecords = (objectStore.getAllRecords({
  query,
  count: "100",
  direction: "prev",
}).onsuccess = (event) => {
  console.log("Records successfully retrieved");
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("IDBObjectStore.getAll()")}}, {{domxref("IDBObjectStore.getAllKeys()")}}
- [Sử dụng IndexedDB](/vi/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Thiết lập phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- [Ví dụ về getAllRecords() - Đọc IndexedDB nhanh hơn](https://microsoftedge.github.io/Demos/idb-getallrecords/) từ Microsoft, 2025
