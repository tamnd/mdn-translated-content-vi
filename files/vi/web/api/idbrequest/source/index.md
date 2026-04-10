---
title: "IDBRequest: thuộc tính source"
short-title: source
slug: Web/API/IDBRequest/source
page-type: web-api-instance-property
browser-compat: api.IDBRequest.source
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`source`** của giao diện {{domxref("IDBRequest")}} trả về nguồn của request, chẳng hạn một Index hoặc một object store. Nếu không có nguồn nào tồn tại, ví dụ khi gọi {{domxref("IDBFactory.open")}}, thuộc tính này trả về `null`.

## Giá trị

Một object biểu thị nguồn của request, chẳng hạn {{domxref("IDBIndex")}}, {{domxref("IDBObjectStore")}} hoặc {{domxref("IDBCursor")}}.

## Ví dụ

Ví dụ sau yêu cầu một tiêu đề bản ghi nhất định, `onsuccess` lấy bản ghi liên quan từ {{domxref("IDBObjectStore")}} (có sẵn dưới dạng `objectStoreTitleRequest.result`), cập nhật một thuộc tính của bản ghi, rồi đưa bản ghi đã cập nhật trở lại object store trong một request khác. Nguồn của request thứ hai được ghi ra console của nhà phát triển. Để xem một ví dụ hoạt động đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

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

  // Ghi lại nguồn của request này
  console.log(`Nguồn của request này là ${updateTitleRequest.source}`);
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
