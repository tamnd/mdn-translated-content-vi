---
title: "IDBKeyRange: phương thức tĩnh only()"
short-title: only()
slug: Web/API/IDBKeyRange/only_static
page-type: web-api-static-method
browser-compat: api.IDBKeyRange.only_static
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức tĩnh **`only()`** của giao diện {{domxref("IDBKeyRange")}} tạo một phạm vi khóa mới chỉ chứa một giá trị duy nhất.

## Cú pháp

```js-nolint
IDBKeyRange.only(value)
```

### Tham số

- `value`
  - : Giá trị cho phạm vi khóa mới.

### Giá trị trả về

{{domxref("IDBKeyRange")}}: Phạm vi khóa vừa được tạo.

### Ngoại lệ

- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `value` không phải là một khóa hợp lệ.

## Ví dụ

Ví dụ sau minh họa cách dùng phạm vi khóa chỉ chứa một giá trị. Ở đây chúng ta khai báo `keyRangeValue = IDBKeyRange.only("A");` - một phạm vi chỉ bao gồm giá trị `"A"`. Chúng ta mở một transaction (dùng {{domxref("IDBTransaction")}}) và một object store, rồi mở một cursor bằng {{domxref("IDBObjectStore.openCursor")}}, với `keyRangeValue` là giá trị phạm vi khóa tùy chọn. Điều này có nghĩa là cursor chỉ truy xuất bản ghi có giá trị khóa `"A"`.

> [!NOTE]
> Để có ví dụ đầy đủ hơn cho phép bạn thử nghiệm phạm vi khóa, hãy xem repo [IDBKeyRange](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/) nữa.

```js
function displayData() {
  const keyRangeValue = IDBKeyRange.only("A");

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
