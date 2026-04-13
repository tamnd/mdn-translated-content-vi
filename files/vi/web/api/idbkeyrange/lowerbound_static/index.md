---
title: "IDBKeyRange: phương thức tĩnh lowerBound()"
short-title: lowerBound()
slug: Web/API/IDBKeyRange/lowerBound_static
page-type: web-api-static-method
browser-compat: api.IDBKeyRange.lowerBound_static
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức tĩnh **`lowerBound()`** của giao diện {{domxref("IDBKeyRange")}} tạo một phạm vi khóa mới chỉ có giới hạn dưới. Mặc định, nó bao gồm giá trị ở đầu mút dưới và là phạm vi đóng.

## Cú pháp

```js-nolint
IDBKeyRange.lowerBound(lower)
IDBKeyRange.lowerBound(lower, open)
```

### Tham số

- `lower`
  - : Chỉ định giới hạn dưới của phạm vi khóa mới.
- `open` {{optional_inline}}
  - : Cho biết giới hạn dưới có loại trừ giá trị đầu mút hay không. Mặc định là `false`.

### Giá trị trả về

{{domxref("IDBKeyRange")}}: Phạm vi khóa vừa được tạo.

### Ngoại lệ

- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu khóa gắn với tham số `lower` không phải là một khóa hợp lệ.

## Ví dụ

Ví dụ sau minh họa cách dùng phạm vi khóa chỉ có giới hạn dưới. Ở đây chúng ta khai báo `keyRangeValue = IDBKeyRange.lowerBound("F", false);` - một phạm vi bao gồm giá trị `"F"` và mọi giá trị sau nó. Chúng ta mở một transaction (dùng {{domxref("IDBTransaction")}}) và một object store, rồi mở một cursor bằng {{domxref("IDBObjectStore.openCursor")}}, với `keyRangeValue` là giá trị phạm vi khóa tùy chọn. Điều này có nghĩa là cursor chỉ truy xuất bản ghi có giá trị khóa `"F"` và tất cả các giá trị sau đó. Nếu dùng `IDBKeyRange.lowerBound("F", true);`, thì phạm vi sẽ không bao gồm `"F"` mà chỉ gồm các giá trị sau nó.

> [!NOTE]
> Để có ví dụ đầy đủ hơn cho phép bạn thử nghiệm phạm vi khóa, hãy xem repo [IDBKeyRange-example](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/) nữa).

```js
function displayData() {
  const keyRangeValue = IDBKeyRange.lowerBound("F");

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
