---
title: "IDBFactory: phương thức databases()"
short-title: databases()
slug: Web/API/IDBFactory/databases
page-type: web-api-instance-method
browser-compat: api.IDBFactory.databases
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`databases`** của giao diện {{domxref("IDBFactory")}} trả về một {{jsxref("Promise")}} được fulfill với một mảng các đối tượng chứa tên và phiên bản của tất cả các cơ sở dữ liệu hiện có.

Đây là một ảnh chụp nhanh của các cơ sở dữ liệu, chủ yếu nhằm cho phép ứng dụng web kiểm tra xem những cơ sở dữ liệu nào đã được tạo, để ví dụ như dọn dẹp các cơ sở dữ liệu do những phiên bản trước của mã ứng dụng tạo ra.

## Cú pháp

```js-nolint
databases()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfill với một mảng các đối tượng đại diện cho ảnh chụp nhanh của các cơ sở dữ liệu hiện có, hoặc bị reject với lỗi/ngoại lệ bên dưới.

Mỗi đối tượng trong mảng có các thuộc tính sau:

- `name`
  - : Tên cơ sở dữ liệu.
- `version`
  - : Phiên bản cơ sở dữ liệu.

Lưu ý rằng thứ tự của các đối tượng được trả về là không xác định.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu phương thức được gọi từ một [origin mờ đục](https://stackoverflow.com/questions/42239643/when-do-browsers-send-the-origin-header-when-do-browsers-set-the-origin-to-null/42242802#42242802) hoặc người dùng đã tắt lưu trữ.

- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu không thể xác định tập hợp các cơ sở dữ liệu hiện có vì bất kỳ lý do gì.

## Ví dụ

### Tạo và liệt kê cơ sở dữ liệu

Ví dụ này tạo/mở một số cơ sở dữ liệu.
Khi mỗi cơ sở dữ liệu khởi tạo thành công, nó sẽ liệt kê tất cả các cơ sở dữ liệu hiện có.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```css hidden
#log {
  height: 240px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Trước tiên chúng ta định nghĩa hàm được dùng để lấy và ghi log các cơ sở dữ liệu hiện có.
Hàm này chờ promise do `indexedDB.databases()` trả về rồi lặp qua mảng và ghi lại giá trị của từng phần tử:

```js
async function getDb() {
  const databases = await indexedDB.databases();
  log("Danh sách cơ sở dữ liệu:");
  databases.forEach((element) => {
    log(`name: ${element.name}, version: ${element.version}`);
  });
}
```

Để minh họa cách dùng hàm trên, bên dưới chúng ta tạo hai cơ sở dữ liệu.
Với mỗi cơ sở dữ liệu, chúng ta ghi log ngay trước khi mở nó.
Chúng ta cũng ghi log khi khởi tạo thành công (hoặc lỗi), rồi tiếp tục ghi log các cơ sở dữ liệu hiện có.

```js
// Tạo cơ sở dữ liệu có tên toDoList với phiên bản mặc định (1)
const dbName1 = "toDoList";
log(`Đang mở: ${dbName1}`);
let DBOpenRequest = window.indexedDB.open(dbName1);

DBOpenRequest.addEventListener("error", (event) => {
  log(`Lỗi khi mở: ${dbName1}`);
  getDb();
});

DBOpenRequest.addEventListener("success", (event) => {
  log(`Đã khởi tạo: ${dbName1}`);
  getDb();
});

// Tạo cơ sở dữ liệu "AnotherDb"
const dbName2 = "AnotherDb";
log(`Đang mở ${dbName2}`);
DBOpenRequest = window.indexedDB.open(dbName2, 2);

DBOpenRequest.addEventListener("error", (event) => {
  log(`Lỗi khi mở: ${dbName2}`);
  getDb();
});

DBOpenRequest.addEventListener("success", (event) => {
  log(`Đã khởi tạo: ${dbName2}`);
  getDb();
});
```

#### Kết quả

Kết quả được hiển thị bên dưới. Lưu ý rằng thời gian cần để lấy danh sách cơ sở dữ liệu và thứ tự của chúng là không xác định.

{{EmbedLiveSample('Create and list databases', '100%', '280px')}}

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
