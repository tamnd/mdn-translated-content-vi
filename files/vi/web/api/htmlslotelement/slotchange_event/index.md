---
title: "HTMLSlotElement: sự kiện slotchange"
short-title: slotchange
slug: Web/API/HTMLSlotElement/slotchange_event
page-type: web-api-event
browser-compat: api.HTMLSlotElement.slotchange_event
---

{{APIRef("Web Components")}}

Sự kiện **`slotchange`** được phát trên một thực thể {{DOMxRef("HTMLSlotElement")}} (phần tử {{HTMLElement("slot")}}) khi các nút chứa trong slot đó thay đổi.

> [!NOTE]
> Sự kiện `slotchange` không được phát nếu các phần tử con của một nút đã được gán slot thay đổi - chỉ khi bạn thay đổi (ví dụ: thêm hoặc xóa) chính các nút đó.

Để kích hoạt sự kiện **slotchange**, cần đặt hoặc xóa thuộc tính `slot`.

Sự kiện này không thể bị hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("slotchange", (event) => { })

onslotchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

```js
element.setAttribute("slot", slotName);
// element.assignedSlot = $slot
element.removeAttribute("slot");
// element.assignedSlot = null
```

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

Ở đây chúng ta lấy tham chiếu đến tất cả các `<slot>`, rồi thêm trình nghe sự kiện `slotchange` cho slot thứ hai của template - chính là slot có nội dung thay đổi trong ví dụ.

Mỗi khi phần tử được chèn vào slot thay đổi, chúng ta ghi một báo cáo ra console, cho biết slot nào đã thay đổi và nút mới bên trong slot là gì.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

{{domxref("HTMLSlotElement")}}
