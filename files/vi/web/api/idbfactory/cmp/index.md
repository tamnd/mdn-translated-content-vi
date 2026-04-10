---
title: "IDBFactory: phương thức cmp()"
short-title: cmp()
slug: Web/API/IDBFactory/cmp
page-type: web-api-instance-method
browser-compat: api.IDBFactory.cmp
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`cmp()`** của giao diện {{domxref("IDBFactory")}} so sánh hai giá trị như các khóa để xác định tính bằng nhau và thứ tự cho các thao tác IndexedDB, chẳng hạn như lưu trữ và duyệt lặp.

> [!NOTE]
> Không dùng phương thức này để so sánh các giá trị JavaScript tùy ý, vì nhiều giá trị JavaScript hoặc không phải là khóa hợp lệ của IndexedDB (ví dụ boolean và object), hoặc được xem là các khóa IndexedDB tương đương (ví dụ, IndexedDB bỏ qua các mảng có thuộc tính không phải số và coi chúng là mảng rỗng, nên mọi mảng có thuộc tính không phải số sẽ được xem là tương đương). Phương thức này sẽ ném ngoại lệ nếu một trong hai giá trị không phải là khóa hợp lệ.

## Cú pháp

```js-nolint
cmp(first, second)
```

### Tham số

- `first`
  - : Khóa đầu tiên cần so sánh.
- `second`
  - : Khóa thứ hai cần so sánh.

### Giá trị trả về

Một số nguyên biểu thị kết quả của phép so sánh; bảng dưới đây liệt kê các giá trị có thể có và ý nghĩa của chúng:

| Giá trị trả về | Mô tả                              |
| -------------- | ---------------------------------- |
| -1             | Khóa thứ nhất nhỏ hơn khóa thứ hai |
| 0              | Khóa thứ nhất bằng khóa thứ hai    |
| 1              | Khóa thứ nhất lớn hơn khóa thứ hai |

### Ngoại lệ

- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu một trong các khóa được cung cấp không phải là khóa hợp lệ.

## Ví dụ

```js
const a = 1;
const b = 2;
const result = window.indexedDB.cmp(a, b);
console.log(`Kết quả so sánh: ${result}`);
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
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
