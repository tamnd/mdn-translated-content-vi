---
title: IDBKeyRange
slug: Web/API/IDBKeyRange
page-type: web-api-interface
browser-compat: api.IDBKeyRange
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBKeyRange`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) đại diện cho một khoảng liên tục trên một kiểu dữ liệu nào đó được dùng làm khóa. Các bản ghi có thể được truy xuất từ các đối tượng {{domxref("IDBObjectStore")}} và {{domxref("IDBIndex")}} bằng khóa hoặc một phạm vi khóa. Bạn có thể giới hạn phạm vi bằng giới hạn dưới và giới hạn trên. Ví dụ, bạn có thể lặp qua tất cả các giá trị của một khóa trong khoảng A–Z.

Phạm vi khóa có thể là một giá trị đơn hoặc một khoảng có giới hạn trên và dưới, hoặc các đầu mút. Nếu phạm vi khóa có cả giới hạn trên và dưới, nó là _có giới hạn_; nếu không có giới hạn, nó là _không có giới hạn_. Một phạm vi khóa có giới hạn có thể là mở (các đầu mút bị loại trừ) hoặc đóng (các đầu mút được bao gồm). Để truy xuất mọi khóa trong một phạm vi nhất định, bạn có thể dùng các cấu trúc mã sau:

| Phạm vi                        | Mã                                     |
| ------------------------------ | -------------------------------------- |
| Tất cả khóa ≥ **x**            | `IDBKeyRange.lowerBound(x)`            |
| Tất cả khóa > **x**            | `IDBKeyRange.lowerBound(x, true)`      |
| Tất cả khóa ≤ **y**            | `IDBKeyRange.upperBound(y)`            |
| Tất cả khóa < **y**            | `IDBKeyRange.upperBound(y, true)`      |
| Tất cả khóa ≥ **x** && ≤ **y** | `IDBKeyRange.bound(x, y)`              |
| Tất cả khóa > **x** &&< **y**  | `IDBKeyRange.bound(x, y, true, true)`  |
| Tất cả khóa > **x** && ≤ **y** | `IDBKeyRange.bound(x, y, true, false)` |
| Tất cả khóa ≥ **x** &&< **y**  | `IDBKeyRange.bound(x, y, false, true)` |
| Khóa = **z**                   | `IDBKeyRange.only(z)`                  |

Một khóa nằm trong phạm vi khóa nếu các điều kiện sau đúng:

- Giá trị dưới của phạm vi khóa là một trong các trường hợp sau:
  - `undefined`
  - Nhỏ hơn giá trị khóa
  - Bằng giá trị khóa nếu `lowerOpen` là `false`.

- Giá trị trên của phạm vi khóa là một trong các trường hợp sau:
  - `undefined`
  - Lớn hơn giá trị khóa
  - Bằng giá trị khóa nếu `upperOpen` là `false`.

## Thuộc tính thể hiện

- {{domxref("IDBKeyRange.lower")}} {{ReadOnlyInline}}
  - : Giới hạn dưới của phạm vi khóa.
- {{domxref("IDBKeyRange.upper")}} {{ReadOnlyInline}}
  - : Giới hạn trên của phạm vi khóa.
- {{domxref("IDBKeyRange.lowerOpen")}} {{ReadOnlyInline}}
  - : Trả về `false` nếu giá trị giới hạn dưới được bao gồm trong phạm vi khóa.
- {{domxref("IDBKeyRange.upperOpen")}} {{ReadOnlyInline}}
  - : Trả về `false` nếu giá trị giới hạn trên được bao gồm trong phạm vi khóa.

## Phương thức tĩnh

- {{domxref("IDBKeyRange.bound_static", "IDBKeyRange.bound()")}}
  - : Tạo một phạm vi khóa mới có cả giới hạn trên và dưới.
- {{domxref("IDBKeyRange.only_static", "IDBKeyRange.only()")}}
  - : Tạo một phạm vi khóa mới chỉ chứa một giá trị.
- {{domxref("IDBKeyRange.lowerBound_static", "IDBKeyRange.lowerBound()")}}
  - : Tạo một phạm vi khóa mới chỉ có giới hạn dưới.
- {{domxref("IDBKeyRange.upperBound_static", "IDBKeyRange.upperBound()")}}
  - : Tạo một phạm vi khóa mới chỉ có giới hạn trên.

## Phương thức thể hiện

- {{domxref("IDBKeyRange.includes()")}}
  - : Trả về giá trị boolean cho biết một khóa được chỉ định có nằm trong phạm vi khóa hay không.

## Ví dụ

Ví dụ sau minh họa cách bạn có thể dùng một phạm vi khóa. Ở đây chúng ta khai báo `keyRangeValue` là một phạm vi giữa các giá trị `"A"` và `"F"`. Chúng ta mở một transaction (dùng {{domxref("IDBTransaction")}}) và một object store, rồi mở một cursor bằng {{domxref("IDBObjectStore.openCursor")}}, với `keyRangeValue` là giá trị phạm vi khóa tùy chọn. Điều này có nghĩa là cursor chỉ truy xuất các bản ghi có khóa nằm trong phạm vi đó. Phạm vi này bao gồm các giá trị `"A"` và `"F"`, vì chúng ta chưa khai báo rằng đó là các giới hạn mở.
Nếu dùng `IDBKeyRange.bound("A", "F", true, true);`, thì phạm vi sẽ không bao gồm `"A"` và `"F"`, mà chỉ gồm các giá trị ở giữa.

> [!NOTE]
> Để có ví dụ đầy đủ hơn và cho phép bạn thử nghiệm phạm vi khóa, hãy xem repo [IDBKeyRange-example](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/)).

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
- Truy xuất và sửa đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
