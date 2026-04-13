---
title: "IDBObjectStore: phương thức getAllKeys()"
short-title: getAllKeys()
slug: Web/API/IDBObjectStore/getAllKeys
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.getAllKeys
---

{{ APIRef("IndexedDB") }}

Phương thức `getAllKeys()` của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}} truy xuất các khóa bản ghi cho tất cả đối tượng trong object store khớp với tham số được chỉ định hoặc tất cả đối tượng trong store nếu không cung cấp tham số.

Nếu một giá trị được tìm thấy thành công, thì một bản sao có cấu trúc của nó được tạo và đặt làm kết quả của đối tượng request.

Phương thức này tạo ra cùng kết quả cho:

- một bản ghi không tồn tại trong cơ sở dữ liệu
- một bản ghi có giá trị undefined

Để phân biệt các trường hợp này, bạn cần gọi phương thức {{domxref("IDBObjectStore.openCursor","openCursor()")}} với cùng khóa. Phương thức đó cung cấp một con trỏ nếu bản ghi tồn tại, và không có con trỏ nếu nó không tồn tại.

## Cú pháp

```js-nolint
getAllKeys()
getAllKeys(query)
getAllKeys(query, count)
getAllKeys(options)
```

### Tham số

Phương thức `getAllKeys()` có thể nhận các tham số riêng lẻ hoặc một đối tượng options duy nhất chứa các tham số làm thuộc tính.

Các tham số có thể bao gồm:

- `query` {{optional_inline}}
  - : Một giá trị là hoặc phân giải thành một {{domxref("IDBKeyRange")}}. Nếu giá trị này không được chỉ định, mặc định sẽ là một phạm vi khóa chọn tất cả bản ghi trong object store này.
- `count` {{optional_inline}}
  - : Chỉ định số lượng giá trị cần trả về nếu tìm thấy nhiều hơn một. Nếu nó nhỏ hơn `0` hoặc lớn hơn `2^32 - 1`, một ngoại lệ {{jsxref("TypeError")}} sẽ được ném.

Nếu một đối tượng parameter được chỉ định, các thuộc tính của nó có thể bao gồm:

- `query` {{optional_inline}}
  - : Xem định nghĩa [`query`](#query) ở trên.
- `count` {{optional_inline}}
  - : Xem định nghĩa [`count`](#count) ở trên.
- `direction` {{optional_inline}}
  - : Một giá trị liệt kê chỉ định hướng mà các đối tượng được duyệt qua. Các giá trị có thể là:
    - `next`
      - : Các đối tượng được duyệt từ đầu, theo thứ tự khóa tăng dần. Đây là giá trị mặc định.
    - `nextunique`
      - : Các đối tượng được duyệt từ đầu, theo thứ tự khóa tăng dần. Điều này sẽ tạo ra cùng các khóa như `next`, vì các khóa trùng lặp không được phép trong `IDBObjectStore`.
    - `prev`
      - : Các đối tượng được duyệt từ cuối, theo thứ tự khóa giảm dần.
    - `prevunique`
      - : Các đối tượng được duyệt từ cuối, theo thứ tự khóa giảm dần. Điều này sẽ tạo ra cùng các khóa như `prev`, vì các khóa trùng lặp không được phép trong `IDBObjectStore`.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là một {{jsxref("Array")}} chứa các khóa của tất cả bản ghi khớp với truy vấn đã cho, tối đa bằng giá trị của `count`, nếu `count` được cung cấp.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu khóa hoặc phạm vi khóa được cung cấp chứa một khóa không hợp lệ hoặc là null.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} đã bị xóa hoặc loại bỏ.
- {{jsxref("TypeError")}} {{domxref("DOMException")}}
  - : Được ném nếu tham số [`count`](#count) không nằm trong khoảng từ `0` đến `2^32 - 1`, bao gồm cả hai đầu mút.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng IndexedDB](/vi/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Thiết lập phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
