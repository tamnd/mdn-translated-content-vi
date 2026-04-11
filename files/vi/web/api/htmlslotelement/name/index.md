---
title: "HTMLSlotElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLSlotElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLSlotElement.name
---

{{APIRef("Shadow DOM API")}}

Thuộc tính **`name`** của giao diện {{domxref("HTMLSlotElement")}} trả về hoặc đặt tên của slot. Slot là một phần giữ chỗ bên trong web component mà người dùng có thể điền bằng đánh dấu của riêng họ.

## Giá trị

Một chuỗi.

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [slotchange](https://github.com/mdn/web-components-examples/tree/main/slotchange) của chúng ta ([xem bản chạy thử tại đây](https://mdn.github.io/web-components-examples/slotchange/)).

```js
let slots = this.shadowRoot.querySelectorAll("slot");
slots[1].addEventListener("slotchange", (e) => {
  let nodes = slots[1].assignedNodes();
  console.log(
    `Element in Slot "${slots[1].name}" changed to "${nodes[0].outerHTML}".`,
  );
});
```

Ở đây chúng ta lấy tham chiếu đến tất cả các slot, rồi thêm trình nghe sự kiện `slotchange` cho slot thứ hai trong template - chính là slot liên tục thay đổi nội dung trong ví dụ.

Mỗi khi phần tử được chèn vào slot thay đổi, chúng ta ghi một báo cáo ra console, cho biết slot nào đã thay đổi và nút mới bên trong slot là gì.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
