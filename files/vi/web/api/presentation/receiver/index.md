---
title: "Presentation: thuộc tính receiver"
short-title: receiver
slug: Web/API/Presentation/receiver
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Presentation.receiver
---

{{APIRef("Presentation")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính **chỉ đọc** `receiver` của {{domxref("Presentation")}}, chỉ có sẵn trong các ngữ cảnh trình duyệt đang **nhận** một trình bày, trả về đối tượng {{domxref("PresentationReceiver")}} có thể được sử dụng để truy cập và giao tiếp với ngữ cảnh trình duyệt kiểm soát trình bày. Thuộc tính này luôn là `null` khi được truy cập từ bên ngoài ngữ cảnh trình duyệt đang nhận một trình bày.

## Giá trị

Nếu mã đang chạy trong một ngữ cảnh đang nhận một trình bày, giá trị được trả về là một {{domxref("PresentationReceiver")}} có thể được sử dụng để giao tiếp với ngữ cảnh là nguồn của trình bày.

Nếu ngữ cảnh hiện tại không nhận trình bày, `receiver` là `null`.

## Ví dụ

### Xác định liệu ngữ cảnh có đang nhận trình bày hay không

Bạn có thể dễ dàng xác định liệu ngữ cảnh có phải là receiver cho một trình bày hay không bằng cách kiểm tra giá trị của `navigator.presentation.receiver`. Nếu nó là giá trị khác null, thì ngữ cảnh đang nhận một trình bày. Nếu là `null`, không có trình bày đến.

```js
footer.textContent = navigator.presentation.receiver
  ? "Receiving presentation"
  : "(idle)";
```

### Truy cập danh sách kết nối

Ví dụ này sử dụng `receiver` để truy cập danh sách các kết nối đến và xây dựng, hiển thị danh sách các chuỗi ID của các kết nối đó.

```js
const listElem = document.getElementById("connection-view");

navigator.presentation.receiver.connectionList.then((connections) => {
  connections.forEach((connection) => {
    listElem.appendChild(document.createElement("li")).textContent =
      connection.id;
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Presentation API
- {{domxref("Presentation")}}
- {{domxref("PresentationReceiver")}}
