---
title: "IDBRequest: thuộc tính readyState"
short-title: readyState
slug: Web/API/IDBRequest/readyState
page-type: web-api-instance-property
browser-compat: api.IDBRequest.readyState
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readyState`** của giao diện {{domxref("IDBRequest")}} trả về trạng thái của request.

Mọi request đều bắt đầu ở trạng thái `pending`. Trạng thái sẽ chuyển thành `done` khi request hoàn tất thành công hoặc khi xảy ra lỗi.

## Giá trị

Một trong các chuỗi sau:

- `pending`
  - : Trả về nếu request vẫn đang tiếp diễn.
- `done`
  - : Trả về nếu request đã hoàn tất.

## Ví dụ

Ví dụ sau yêu cầu một tiêu đề bản ghi nhất định, `onsuccess` lấy bản ghi liên quan từ {{domxref("IDBObjectStore")}} (có sẵn dưới dạng `objectStoreTitleRequest.result`), cập nhật một thuộc tính của bản ghi, rồi đưa bản ghi đã cập nhật trở lại object store trong một request khác. `readyState` của request thứ hai được ghi ra console của nhà phát triển. Để xem một ví dụ hoạt động đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

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

  // Ghi lại readyState của request này
  console.log(
    `Trạng thái readyState của request này là ${updateTitleRequest.readyState}`,
  );

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
