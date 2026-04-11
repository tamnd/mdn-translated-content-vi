---
title: "HTMLElement: phương thức togglePopover()"
short-title: togglePopover()
slug: Web/API/HTMLElement/togglePopover
page-type: web-api-instance-method
browser-compat: api.HTMLElement.togglePopover
---

{{APIRef("Popover API")}}

Phương thức **`togglePopover()`** của giao diện {{domxref("HTMLElement")}} bật/tắt phần tử {{domxref("Popover_API", "popover", "", "nocode")}} (nghĩa là phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) hợp lệ) giữa các trạng thái ẩn và hiển thị.

Khi `togglePopover()` được gọi trên một phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover):

1. Một sự kiện {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}} được kích hoạt.
2. Popover bật/tắt giữa ẩn và hiển thị:
   1. Nếu ban đầu đang hiển thị, nó chuyển sang ẩn.
   2. Nếu ban đầu đang ẩn, nó chuyển sang hiển thị.
3. Một sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} được kích hoạt.

## Cú pháp

```js-nolint
togglePopover()
togglePopover(force)
togglePopover(options)
```

### Tham số

Một boolean (`force`) hoặc một đối tượng tùy chọn:

- `force` {{optional_inline}}
  - : Một boolean, khiến `togglePopover()` hoạt động như {{domxref("HTMLElement.showPopover", "showPopover()")}} hoặc {{domxref("HTMLElement.hidePopover", "hidePopover()")}}, ngoại trừ nó không ném ngoại lệ nếu popover đã ở trạng thái mục tiêu.
    - Nếu đặt thành `true`, popover được hiển thị nếu ban đầu ẩn. Nếu ban đầu đang hiển thị, không có gì xảy ra.
    - Nếu đặt thành `false`, popover bị ẩn nếu ban đầu đang hiển thị. Nếu ban đầu đang ẩn, không có gì xảy ra.
- `options` {{optional_inline}}
  - : Một đối tượng có thể chứa các thuộc tính sau:
    - `force` {{optional_inline}}
      - : Một boolean; xem mô tả `force` ở trên.
    - `source` {{optional_inline}}
      - : Tham chiếu {{domxref("HTMLElement")}}; xác định theo chương trình trình gọi của popover liên kết với hành động bật/tắt, nghĩa là phần tử điều khiển của nó. Thiết lập mối quan hệ giữa popover và trình gọi bằng tùy chọn `source` có hai hiệu ứng hữu ích:
        - Trình duyệt đặt popover ở một vị trí hợp lý trong thứ tự điều hướng tiêu điểm bàn phím khi hiển thị. Điều này làm cho popover dễ tiếp cận hơn với người dùng bàn phím (xem thêm [Các tính năng tiếp cận của Popover](/en-US/docs/Web/API/Popover_API/Using#popover_accessibility_features)).
        - Trình duyệt tạo tham chiếu neo ngầm giữa hai phần tử, giúp định vị popover tương đối với các điều khiển bằng [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) trở nên rất tiện lợi. Xem [Định vị neo Popover](/en-US/docs/Web/API/Popover_API/Using#popover_anchor_positioning) để biết thêm chi tiết.

### Giá trị trả về

`true` nếu popup đang mở sau khi gọi, và `false` trong trường hợp còn lại.

Trong các phiên bản trình duyệt cũ hơn có thể trả về không có giá trị ({{jsxref("undefined")}}) (xem [tương thích trình duyệt](#browser_compatibility)).

## Ví dụ

Xem [trang đích ví dụ API Popover](https://mdn.github.io/dom-examples/popover-api/) để truy cập bộ sưu tập đầy đủ các ví dụ popover MDN.

### Popup tự động đơn giản

Đây là phiên bản sửa đổi nhẹ của [Ví dụ Toggle Help UI Popover](https://mdn.github.io/dom-examples/popover-api/toggle-help-ui/).
Ví dụ bật/tắt popover bằng cách nhấn một phím cụ thể trên bàn phím (khi cửa sổ ví dụ có tiêu điểm).

HTML cho ví dụ được hiển thị bên dưới.
Phần tử đầu tiên xác định hướng dẫn về cách gọi popup, điều này cần thiết vì popup mặc định bị ẩn.

```html
<p id="instructions">
  Press "h" to toggle a help screen (select example window first).
</p>
```

Sau đó, chúng ta xác định phần tử `<div>` là popup.
Nội dung thực sự không quan trọng, nhưng lưu ý rằng chúng ta cần thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) để biến `<div>` thành popover nên nó bị ẩn theo mặc định (hoặc chúng ta có thể đặt phần tử này trong JavaScript).

```html
<div id="mypopover" popover>
  <h2>Help!</h2>

  <p>You can use the following commands to control the app</p>

  <ul>
    <li>Press <ins>C</ins> to order cheese</li>
    <li>Press <ins>T</ins> to order tofu</li>
    <li>Press <ins>B</ins> to order bacon</li>
  </ul>
</div>
```

JavaScript cho ví dụ được hiển thị bên dưới.
Đầu tiên, chúng ta kiểm tra xem popover có được hỗ trợ không, và nếu không, chúng ta ẩn `div` popover để nó không hiển thị nội tuyến.

```js
const instructions = document.getElementById("instructions");
const popover = document.getElementById("mypopover");

if (!Object.hasOwn(HTMLElement.prototype, "popover")) {
  popover.innerText = "";
  instructions.innerText = "Popovers not supported";
}
```

Nếu popover được hỗ trợ, chúng ta thêm trình lắng nghe cho phím `h` được nhấn, và dùng đó để kích hoạt mở popup.
Chúng ta cũng ghi nhật ký xem popup có mở hay đóng sau khi gọi, nhưng chỉ khi `true` hoặc `false` được trả về.

```js
if (Object.hasOwn(HTMLElement.prototype, "popover")) {
  document.addEventListener("keydown", (event) => {
    if (event.key === "h") {
      const popupOpened = popover.togglePopover();

      // Check if popover is opened or closed on supporting browsers
      if (popupOpened !== undefined) {
        instructions.innerText +=
          popupOpened === true ? `\nOpened` : `\nClosed`;
      }
    }
  });
}
```

Bạn có thể kiểm tra điều này bằng ví dụ trực tiếp bên dưới.

{{EmbedLiveSample('Examples', 700, 290)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- [API Popover](/en-US/docs/Web/API/Popover_API)
