---
title: "IDBKeyRange: phương thức tĩnh bound()"
short-title: bound()
slug: Web/API/IDBKeyRange/bound_static
page-type: web-api-static-method
browser-compat: api.IDBKeyRange.bound_static
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức tĩnh **`bound()`** của giao diện {{domxref("IDBKeyRange")}} tạo một phạm vi khóa mới với các giới hạn trên và dưới đã chỉ định. Các giới hạn có thể là mở, tức là loại trừ giá trị ở đầu mút, hoặc đóng, tức là bao gồm giá trị ở đầu mút. Mặc định, các giới hạn là đóng.

## Cú pháp

```js-nolint
IDBKeyRange.bound(lower, upper)
IDBKeyRange.bound(lower, upper, lowerOpen)
IDBKeyRange.bound(lower, upper, lowerOpen, upperOpen)
```

### Tham số

- `lower`
  - : Chỉ định giới hạn dưới của phạm vi khóa mới.
- `upper`
  - : Chỉ định giới hạn trên của phạm vi khóa mới.
- `lowerOpen` {{optional_inline}}
  - : Cho biết giới hạn dưới có loại trừ giá trị đầu mút hay không. Mặc định là `false`.
- `upperOpen` {{optional_inline}}
  - : Cho biết giới hạn trên có loại trừ giá trị đầu mút hay không. Mặc định là `false`.

### Giá trị trả về

{{domxref("IDBKeyRange")}}: Phạm vi khóa vừa được tạo.

### Ngoại lệ

- `DataError` {{domxref("DOMException")}}
  - : Được ném ra khi một trong các điều kiện sau xảy ra:
    - Tham số `lower` hoặc `upper` không phải là khóa hợp lệ.
    - Khóa dưới lớn hơn khóa trên.
    - Khóa dưới và khóa trên bằng nhau và một trong hai giới hạn là mở.

## Ví dụ

Ví dụ sau minh họa cách dùng một phạm vi khóa có giới hạn. Ở đây chúng ta khai báo `keyRangeValue = IDBKeyRange.bound("A", "F");` - một phạm vi giữa `"A"` và `"F"`. Chúng ta mở một transaction (dùng {{domxref("IDBTransaction")}}) và một object store, rồi mở một cursor bằng {{domxref("IDBObjectStore.openCursor")}}, với `keyRangeValue` là giá trị phạm vi khóa tùy chọn. Điều này có nghĩa là cursor chỉ truy xuất các bản ghi có khóa nằm trong phạm vi đó. Phạm vi này bao gồm các giá trị `"A"` và `"F"`, vì chúng ta chưa khai báo rằng đó là các giới hạn mở. Nếu dùng `IDBKeyRange.bound("A", "F", true, true);`, thì phạm vi sẽ không bao gồm `"A"` và `"F"`, mà chỉ gồm các giá trị ở giữa.

> [!NOTE]
> Để có ví dụ đầy đủ hơn cho phép bạn thử nghiệm phạm vi khóa, hãy xem thư mục `idbkeyrange` trong repo [indexeddb-examples](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange). ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/) nữa.

```js
function displayData() {
  const keyRangeValue = IDBKeyRange.bound("A", "F");

  const transaction = db.transaction(["fThings"], "readonly");
  const objectStore = transaction.objectStore("fThings");

  objectStore.openCursor(keyRangeValue).onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.fThing}, ${cursor.value.fRating}`;
      list.appendChild(listItem);

      cursor.continue();
    } else {
      console.log("Entries all displayed.");
    }
  };
}
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
