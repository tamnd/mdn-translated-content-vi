---
title: "EventTarget: phương thức removeEventListener()"
short-title: removeEventListener()
slug: Web/API/EventTarget/removeEventListener
page-type: web-api-instance-method
browser-compat: api.EventTarget.removeEventListener
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`removeEventListener()`** của giao diện {{domxref("EventTarget")}}
xóa một bộ lắng nghe sự kiện đã được đăng ký trước đó bằng {{domxref("EventTarget.addEventListener()")}} khỏi đích.
Bộ lắng nghe sự kiện cần xóa được xác định bằng tổ hợp của kiểu sự kiện,
bản thân hàm bộ lắng nghe sự kiện, và các tùy chọn bổ sung khác có thể ảnh hưởng đến quá trình khớp;
xem [Khớp bộ lắng nghe sự kiện để xóa](#matching_event_listeners_for_removal).

Gọi `removeEventListener()` với các đối số không xác định được bất kỳ
[bộ lắng nghe sự kiện](/en-US/docs/Web/API/EventTarget/addEventListener#the_event_listener_callback) nào hiện đang được đăng ký trên `EventTarget` sẽ không có
tác dụng.

Nếu một [bộ lắng nghe sự kiện](/en-US/docs/Web/API/EventTarget/addEventListener#the_event_listener_callback) bị xóa khỏi một {{domxref("EventTarget")}} trong khi một bộ lắng nghe khác của đích đó đang xử lý một sự kiện, nó sẽ không được kích hoạt bởi sự kiện đó. Tuy nhiên, nó có thể được gắn lại.

> [!WARNING]
> Nếu một bộ lắng nghe được đăng ký hai lần, một lần với cờ _capture_ được bật và một lần không bật, bạn phải xóa từng bản sao riêng biệt. Việc xóa một bộ lắng nghe capture không ảnh hưởng tới phiên bản không capture của cùng bộ lắng nghe, và ngược lại.

Bộ lắng nghe sự kiện cũng có thể được xóa bằng cách truyền một {{domxref("AbortSignal")}} vào {{domxref("EventTarget/addEventListener()", "addEventListener()")}} rồi sau đó gọi {{domxref("AbortController/abort()", "abort()")}} trên controller sở hữu signal đó.

## Cú pháp

```js-nolint
removeEventListener(type, listener)
removeEventListener(type, listener, options)
removeEventListener(type, listener, useCapture)
```

### Tham số

- `type`
  - : Một chuỗi chỉ định kiểu sự kiện mà bạn muốn xóa bộ lắng nghe cho nó.
- `listener`
  - : Hàm [bộ lắng nghe sự kiện](/en-US/docs/Web/API/EventTarget/addEventListener#the_event_listener_callback) của bộ xử lý sự kiện cần được xóa khỏi
    đích sự kiện.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chỉ định các đặc điểm của bộ lắng nghe sự kiện.

    Các tùy chọn có sẵn là:
    - `capture`: Một giá trị boolean chỉ định liệu [bộ lắng nghe sự kiện](/en-US/docs/Web/API/EventTarget/addEventListener#the_event_listener_callback) cần xóa có được đăng ký là bộ lắng nghe capture hay không. Nếu tham số này không có, giá trị mặc định `false` được giả định.

- `useCapture` {{optional_inline}}
  - : Một giá trị boolean chỉ định liệu [bộ lắng nghe sự kiện](/en-US/docs/Web/API/EventTarget/addEventListener#the_event_listener_callback) cần xóa có được đăng ký là bộ lắng nghe capture hay không. Nếu tham số này không có, giá trị mặc định `false` được giả định.

### Giá trị trả về

Không có.

### Khớp bộ lắng nghe sự kiện để xóa

Giả sử một bộ lắng nghe sự kiện đã được thêm trước đó bằng cách gọi
{{domxref("EventTarget.addEventListener", "addEventListener()")}}, cuối cùng bạn có thể
đến lúc cần xóa nó. Rõ ràng, bạn cần chỉ định đúng các tham số
`type` và `listener` cho
`removeEventListener()`. Nhưng còn các tham số `options`
hoặc `useCapture` thì sao?

Trong khi `addEventListener()` cho phép bạn thêm cùng một bộ lắng nghe nhiều hơn một lần
cho cùng kiểu sự kiện nếu các tùy chọn khác nhau, tùy chọn duy nhất mà
`removeEventListener()` kiểm tra là cờ `capture`/`useCapture`. Giá trị của nó
phải khớp thì `removeEventListener()` mới khớp, còn các giá trị khác thì không.

Ví dụ, hãy xét lời gọi `addEventListener()` này:

```js
element.addEventListener("mousedown", handleMouseDown, true);
```

Bây giờ xét hai lời gọi `removeEventListener()` sau:

```js
element.removeEventListener("mousedown", handleMouseDown, false); // Thất bại
element.removeEventListener("mousedown", handleMouseDown, true); // Thành công
```

Lời gọi đầu tiên thất bại vì giá trị của `useCapture` không khớp. Lời gọi
thứ hai thành công, vì `useCapture` khớp.

Bây giờ xét trường hợp này:

```js
element.addEventListener("mousedown", handleMouseDown, { passive: true });
```

Ở đây, chúng ta chỉ định một đối tượng `options` trong đó
`passive` được đặt thành `true`, còn các tùy chọn khác giữ ở
giá trị mặc định `false`.

Bây giờ xem từng lời gọi `removeEventListener()` sau đây. Bất kỳ lời gọi nào
mà `capture` hoặc `useCapture` là
`true` đều thất bại; các trường hợp khác đều thành công.

Chỉ riêng cài đặt `capture` là có ý nghĩa đối với `removeEventListener()`.

```js
element.removeEventListener("mousedown", handleMouseDown, { passive: true }); // Thành công
element.removeEventListener("mousedown", handleMouseDown, { capture: false }); // Thành công
element.removeEventListener("mousedown", handleMouseDown, { capture: true }); // Thất bại
element.removeEventListener("mousedown", handleMouseDown, { passive: false }); // Thành công
element.removeEventListener("mousedown", handleMouseDown, false); // Thành công
element.removeEventListener("mousedown", handleMouseDown, true); // Thất bại
```

Cần lưu ý rằng một số bản phát hành trình duyệt đã có hành vi không nhất quán về điểm này, và trừ khi
bạn có lý do cụ thể khác, tốt nhất nên dùng cùng giá trị như khi gọi
`addEventListener()` lúc gọi `removeEventListener()`.

## Ví dụ

Ví dụ này cho thấy cách thêm một bộ lắng nghe sự kiện dựa trên `mouseover` để
xóa một bộ lắng nghe sự kiện dựa trên `click`.

```js
const body = document.querySelector("body");
const clickTarget = document.getElementById("click-target");
const mouseOverTarget = document.getElementById("mouse-over-target");

let toggle = false;
function makeBackgroundYellow() {
  body.style.backgroundColor = toggle ? "white" : "yellow";

  toggle = !toggle;
}

clickTarget.addEventListener("click", makeBackgroundYellow);

mouseOverTarget.addEventListener("mouseover", () => {
  clickTarget.removeEventListener("click", makeBackgroundYellow);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventTarget.addEventListener()")}}
