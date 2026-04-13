---
title: "HTMLElement: phương thức showPopover()"
short-title: showPopover()
slug: Web/API/HTMLElement/showPopover
page-type: web-api-instance-method
browser-compat: api.HTMLElement.showPopover
---

{{APIRef("Popover API")}}

Phương thức **`showPopover()`** của giao diện {{domxref("HTMLElement")}} hiển thị phần tử {{domxref("Popover_API", "popover", "", "nocode")}} (nghĩa là phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) hợp lệ) bằng cách thêm nó vào {{glossary("top layer")}}.

Khi `showPopover()` được gọi trên một phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) hiện đang ẩn, một sự kiện {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}} sẽ được kích hoạt, tiếp theo là popover hiển thị, rồi sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} kích hoạt. Nếu phần tử đang hiển thị, một lỗi sẽ được ném ra.

## Cú pháp

```js-nolint
showPopover()
showPopover(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng có thể chứa các thuộc tính sau:
    - `source` {{optional_inline}}
      - : Tham chiếu {{domxref("HTMLElement")}}; xác định theo chương trình trình gọi của popover liên kết với hành động hiển thị, nghĩa là phần tử điều khiển của nó. Thiết lập mối quan hệ giữa popover và trình gọi bằng tùy chọn `source` có hai hiệu ứng hữu ích:
        - Trình duyệt đặt popover ở một vị trí hợp lý trong thứ tự điều hướng tiêu điểm bàn phím khi hiển thị. Điều này làm cho popover dễ tiếp cận hơn với người dùng bàn phím (xem thêm [Các tính năng tiếp cận của Popover](/en-US/docs/Web/API/Popover_API/Using#popover_accessibility_features)).
        - Trình duyệt tạo tham chiếu neo ngầm giữa hai phần tử, giúp định vị popover tương đối với các điều khiển bằng [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) trở nên rất tiện lợi. Xem [Định vị neo Popover](/en-US/docs/Web/API/Popover_API/Using#popover_anchor_positioning) để biết thêm chi tiết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu popover đang hiển thị.

## Ví dụ

Ví dụ sau cung cấp chức năng hiển thị popover bằng cách nhấn một phím cụ thể trên bàn phím.

Đầu tiên, một số HTML:

```html
<div id="mypopover" popover>
  <h2>Help!</h2>

  <p>You can use the following commands to control the app</p>

  <ul>
    <li>Press <ins>C</ins> to order cheese</li>
    <li>Press <ins>T</ins> to order tofu</li>
    <li>Press <ins>B</ins> to order bacon</li>
  </ul>
  <hr />
  <ul>
    <li>Say "Service" to summon the robot waiter to take your order</li>
    <li>Say "Escape" to engage the ejector seat</li>
  </ul>
</div>
```

Và bây giờ là JavaScript để kết nối chức năng:

```js
const popover = document.getElementById("mypopover");

document.addEventListener("keydown", (event) => {
  if (event.key === "h") {
    popover.showPopover();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Popover](/en-US/docs/Web/API/Popover_API)
