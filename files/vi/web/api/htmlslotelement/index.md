---
title: HTMLSlotElement
slug: Web/API/HTMLSlotElement
page-type: web-api-interface
browser-compat: api.HTMLSlotElement
---

{{APIRef("Web Components")}}

Giao diện **`HTMLSlotElement`** của [Shadow DOM API](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) cho phép truy cập vào tên và các nút được gán của một phần tử HTML {{HTMLElement("slot")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref('HTMLSlotElement.name')}}
  - : Một chuỗi dùng để lấy và đặt tên của slot.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref('HTMLSlotElement.assign()')}}
  - : Đặt các nút được gán thủ công cho slot này thành các nút đã cho.
- {{domxref('HTMLSlotElement.assignedNodes()')}}
  - : Trả về một chuỗi các nút được gán cho slot này. Nếu tùy chọn `flatten` được đặt thành `true`, nó trả về một chuỗi gồm cả các nút được gán cho slot này và các nút được gán cho bất kỳ slot nào khác là phần tử con của slot này. Nếu không tìm thấy nút nào được gán, nó trả về nội dung dự phòng của slot.
- {{domxref('HTMLSlotElement.assignedElements()')}}
  - : Trả về một chuỗi các phần tử được gán cho slot này (và không có nút nào khác). Nếu tùy chọn `flatten` được đặt thành `true`, nó trả về một chuỗi gồm cả các phần tử được gán cho slot này và các phần tử được gán cho bất kỳ slot nào khác là phần tử con của slot này. Nếu không tìm thấy phần tử nào được gán, nó trả về nội dung dự phòng của slot.

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha, {{domxref("HTMLElement")}}._

Lắng nghe các sự kiện này bằng cách dùng {{DOMxRef("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref('HTMLSlotElement.slotchange_event', 'slotchange')}}
  - : Được phát trên một thực thể `HTMLSlotElement` ([`<slot>`](/en-US/docs/Web/HTML/Reference/Elements/slot) element) khi các nút chứa trong slot đó thay đổi.

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
