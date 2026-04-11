---
title: "HTMLElement: thuộc tính popover"
short-title: popover
slug: Web/API/HTMLElement/popover
page-type: web-api-instance-property
browser-compat: api.HTMLElement.popover
---

{{APIRef("Popover API")}}

Thuộc tính **`popover`** của giao diện {{domxref("HTMLElement")}} lấy và đặt trạng thái popover của phần tử qua JavaScript (`"auto"`, `"hint"` hoặc `"manual"`), và có thể được dùng để phát hiện tính năng.

Nó phản ánh giá trị của thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover).

## Giá trị

Một giá trị liệt kê; các giá trị có thể là:

- `"auto"`
  - : Các popover [`auto`](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss) có thể "đóng nhẹ" - nghĩa là bạn có thể ẩn popover bằng cách nhấp ngoài nó hoặc nhấn phím <kbd>Esc</kbd>.

    Thường, chỉ có thể hiển thị một popover `auto` tại một thời điểm - hiển thị popover thứ hai khi một popover đang hiển thị sẽ ẩn popover đầu tiên. Ngoại lệ cho quy tắc này là khi bạn có các popover auto lồng nhau. Xem [Popover lồng nhau](/en-US/docs/Web/API/Popover_API/Using#nested_popovers) để biết thêm chi tiết.

- `"hint"`
  - : Các popover [`hint`](/en-US/docs/Web/API/Popover_API/Using#using_hint_popover_state) không đóng các popover `auto` khi chúng được hiển thị, nhưng sẽ đóng các popover hint khác.
    Chúng có thể đóng nhẹ và sẽ phản hồi các yêu cầu đóng.

    Thường chúng được hiển thị và ẩn để phản hồi các sự kiện JavaScript không phải nhấp chuột như [`mouseover`](/en-US/docs/Web/API/Element/mouseover_event)/[`mouseout`](/en-US/docs/Web/API/Element/mouseout_event) và [`focus`](/en-US/docs/Web/API/Element/focus_event)/[`blur`](/en-US/docs/Web/API/Element/blur_event).
    Nhấp vào nút để mở popover `hint` sẽ khiến popover `auto` đang mở đóng nhẹ.

- `"manual"`
  - : Các popover [`manual`](/en-US/docs/Web/API/Popover_API/Using#using_manual_popover_state) không thể "đóng nhẹ" và không tự động đóng. Các popover phải được hiển thị và đóng một cách rõ ràng bằng cách dùng các nút hiển thị/ẩn/bật-tắt khai báo hoặc JavaScript. Nhiều popover `manual` độc lập có thể được hiển thị đồng thời.

## Ví dụ

### Phát hiện tính năng

Bạn có thể dùng thuộc tính `popover` để phát hiện tính năng của [API Popover](/en-US/docs/Web/API/Popover_API):

```js
function supportsPopover() {
  return Object.hasOwn(HTMLElement.prototype, "popover");
}
```

### Thiết lập popover theo chương trình

```js
const popover = document.getElementById("mypopover");
const toggleBtn = document.getElementById("toggleBtn");

const popoverSupported = supportsPopover();

if (popoverSupported) {
  popover.popover = "auto";
  toggleBtn.popoverTargetElement = popover;
  toggleBtn.popoverTargetAction = "toggle";
} else {
  console.log("Popover API not supported.");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- [API Popover](/en-US/docs/Web/API/Popover_API)
