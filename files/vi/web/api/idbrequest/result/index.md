---
title: "IDBRequest: thuộc tính result"
short-title: result
slug: Web/API/IDBRequest/result
page-type: web-api-instance-property
browser-compat: api.IDBRequest.result
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("IDBRequest")}} trả về kết quả của request.

## Giá trị

any

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra khi cố truy cập thuộc tính trong lúc request chưa hoàn tất, nên kết quả chưa khả dụng.

## Ví dụ

Ví dụ sau yêu cầu một tiêu đề bản ghi nhất định, `onsuccess` lấy bản ghi liên quan từ {{domxref("IDBObjectStore")}} (có sẵn dưới dạng `objectStoreTitleRequest.result`), cập nhật một thuộc tính của bản ghi, rồi đưa bản ghi đã cập nhật trở lại object store. Để xem một ví dụ hoạt động đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const title = "Walk dog";

// Mở transaction như bình thường
const objectStore = db
  .transaction(["toDoList"], "readwrite")
  .objectStore("toDoList");

// Lấy object trong to-do list có tiêu đề này
const objectStoreTitleRequest = objectStore.get(title);

objectStoreTitleRequest.onsuccess = () => {
  // Lấy object dữ liệu được trả về như kết quả
  const data = objectStoreTitleRequest.result;

  // Cập nhật giá trị notified trong object thành "yes"
  data.notified = "yes";

  // Tạo một request khác để chèn mục
  // trở lại cơ sở dữ liệu
  const updateTitleRequest = objectStore.put(data);

  // Khi request mới này thành công, chạy lại hàm displayData()
  // để cập nhật hiển thị
  updateTitleRequest.onsuccess = () => {
    displayData();
  };
};
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
