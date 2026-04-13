---
title: "IDBKeyRange: phương thức includes()"
short-title: includes()
slug: Web/API/IDBKeyRange/includes
page-type: web-api-instance-method
browser-compat: api.IDBKeyRange.includes
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức `includes()` của giao diện {{domxref("IDBKeyRange")}} trả về một giá trị boolean cho biết một khóa được chỉ định có nằm trong phạm vi khóa hay không.

## Cú pháp

```js-nolint
includes(key)
```

### Tham số

- `key`
  - : Khóa bạn muốn kiểm tra trong phạm vi khóa. Có thể là bất kỳ kiểu nào.

### Giá trị trả về

Một giá trị boolean.

### Ngoại lệ

- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu khóa được cung cấp không phải là một khóa hợp lệ.

## Ví dụ

```js
const keyRangeValue = IDBKeyRange.bound("A", "K", false, false);

keyRangeValue.includes("F");
// Returns true

keyRangeValue.includes("W");
// Returns false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và sửa đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
