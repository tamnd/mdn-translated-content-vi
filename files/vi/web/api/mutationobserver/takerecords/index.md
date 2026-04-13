---
title: "MutationObserver: phương thức takeRecords()"
short-title: takeRecords()
slug: Web/API/MutationObserver/takeRecords
page-type: web-api-instance-method
browser-compat: api.MutationObserver.takeRecords
---

{{APIRef("DOM WHATWG")}}

Phương thức {{domxref("MutationObserver")}} **`takeRecords()`** trả về một danh sách tất cả các thay đổi DOM khớp đã được phát hiện nhưng callback của observer vẫn chưa xử lý, để hàng đợi biến đổi được để trống.

Trường hợp sử dụng phổ biến nhất của phương thức này là lấy ngay tất cả các mutation record đang chờ ngay trước khi ngắt kết nối observer, যাতে mọi biến đổi đang chờ có thể được xử lý khi tắt observer.

## Cú pháp

```js-nolint
takeRecords()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("MutationRecord")}}, mỗi đối tượng mô tả một thay đổi được áp dụng cho phần của cây DOM của tài liệu đang được theo dõi.

> [!NOTE]
> Hàng đợi các biến đổi đã xảy ra nhưng chưa được gửi đến callback của observer sẽ được để trống sau khi gọi `takeRecords()`.

## Ví dụ

Trong ví dụ này, chúng ta minh họa cách xử lý bất kỳ {{domxref("MutationRecord")}} nào chưa được gửi bằng cách gọi `takeRecords()` ngay trước khi ngắt kết nối observer.

```js
const targetNode = document.querySelector("#someElement");
const observerOptions = {
  childList: true,
  attributes: true,
};

const observer = new MutationObserver(callback);
observer.observe(targetNode, observerOptions);

/* sau này, khi đến lúc dừng theo dõi… */

/* xử lý mọi biến đổi còn đang chờ */

let mutations = observer.takeRecords();

observer.disconnect();

if (mutations.length > 0) {
  callback(mutations);
}
```

Mã này lấy mọi mutation record chưa được xử lý, rồi gọi callback với các record đó để chúng có thể được xử lý. Việc này được thực hiện ngay trước khi gọi {{domxref("MutationObserver.disconnect", "disconnect()")}} để ngừng theo dõi DOM.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
