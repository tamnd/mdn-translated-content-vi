---
title: "HTMLSlotElement: phương thức assignedNodes()"
short-title: assignedNodes()
slug: Web/API/HTMLSlotElement/assignedNodes
page-type: web-api-instance-method
browser-compat: api.HTMLSlotElement.assignedNodes
---

{{APIRef("Shadow DOM API")}}

Phương thức **`assignedNodes()`** của giao diện {{domxref("HTMLSlotElement")}} trả về một chuỗi các nút được gán cho slot này.

Nếu tùy chọn `flatten` được đặt thành `true`, nó trả về một chuỗi gồm cả các nút được gán cho slot này và các nút được gán cho bất kỳ slot nào khác là phần tử con của slot này. Nếu không tìm thấy nút nào được gán, nó trả về nội dung dự phòng của slot.

## Cú pháp

```js-nolint
assignedNodes()
assignedNodes(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng đặt các tùy chọn cho các nút sẽ được trả về. Các tùy chọn khả dụng là:
    - `flatten`
      - : Một giá trị logic cho biết có trả về các nút được gán của bất kỳ phần tử `<slot>` con nào hiện có (`true`) hay không (`false`). Mặc định là `false`.

### Giá trị trả về

Một mảng các nút.

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
