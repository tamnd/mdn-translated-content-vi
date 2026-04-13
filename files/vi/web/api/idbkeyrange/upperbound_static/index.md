---
title: "IDBKeyRange: phương thức tĩnh upperBound()"
short-title: upperBound()
slug: Web/API/IDBKeyRange/upperBound_static
page-type: web-api-static-method
browser-compat: api.IDBKeyRange.upperBound_static
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức tĩnh **`upperBound()`** của giao diện {{domxref("IDBKeyRange")}} tạo một phạm vi khóa mới chỉ có giới hạn trên. Mặc định, nó bao gồm giá trị ở đầu mút trên và là phạm vi đóng.

## Cú pháp

```js-nolint
IDBKeyRange.upperBound(upper)
IDBKeyRange.upperBound(upper, open)
```

### Tham số

- `upper`
  - : Chỉ định giới hạn trên của phạm vi khóa mới.
- `open` {{optional_inline}}
  - : Cho biết giới hạn trên có loại trừ giá trị đầu mút hay không. Mặc định là `false`.

### Giá trị trả về

{{domxref("IDBKeyRange")}}: Phạm vi khóa vừa được tạo.

### Ngoại lệ

- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu khóa gắn với tham số `upper` không phải là một khóa hợp lệ.

## Ví dụ

Ví dụ sau minh họa cách dùng phạm vi khóa chỉ có giới hạn trên. Ở đây chúng ta khai báo `keyRangeValue = IDBKeyRange.upperBound("F");` - một phạm vi bao gồm giá trị `"F"` và mọi giá trị trước nó. Chúng ta mở một transaction (dùng {{domxref("IDBTransaction")}}) và một object store, rồi mở một cursor bằng {{domxref("IDBObjectStore.openCursor")}}, với `keyRangeValue` là giá trị phạm vi khóa tùy chọn.

Nếu dùng `IDBKeyRange.upperBound("F", true);`, thì phạm vi sẽ loại trừ `"F"` và chỉ gồm các giá trị trước nó.

> [!NOTE]
> Để có ví dụ đầy đủ hơn cho phép bạn thử nghiệm phạm vi khóa, hãy xem repo [IDBKeyRange-example](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/) nữa).

```js
function displayData() {
  const keyRangeValue = IDBKeyRange.upperBound("F");

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
