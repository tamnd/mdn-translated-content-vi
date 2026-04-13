---
title: "CloseWatcher: phương thức requestClose()"
short-title: requestClose()
slug: Web/API/CloseWatcher/requestClose
page-type: web-api-instance-method
browser-compat: api.CloseWatcher.requestClose
---

{{APIRef("HTML DOM")}}

Phương thức **`requestClose()`** của giao diện {{domxref("CloseWatcher")}} kích hoạt một sự kiện `cancel` và nếu sự kiện đó không bị hủy bằng {{domxref("Event.preventDefault()")}}, sẽ tiếp tục kích hoạt một sự kiện `close`, rồi cuối cùng vô hiệu hóa close watcher như thể `destroy()` đã được gọi.

## Cú pháp

```js-nolint
requestClose()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dùng phương thức `requestClose()`

Trong ví dụ này, bạn có một thành phần UI của riêng mình (một picker), và bạn muốn hỗ trợ cả phương thức đóng mặc định của nền tảng (ví dụ: phím <kbd>Esc</kbd>) lẫn phương thức đóng tùy chỉnh của bạn (một nút đóng).

Trình xử lý `onclick` của thành phần UI có thể gọi `requestClose` để yêu cầu đóng và định tuyến yêu cầu đóng của bạn qua cùng trình xử lý `onclose` mà phương thức đóng của nền tảng sử dụng.

```js
const watcher = new CloseWatcher();
const picker = setUpAndShowPickerDOMElement();
let chosenValue = null;

watcher.onclose = () => {
  chosenValue = picker.querySelector("input").value;
  picker.remove();
};

picker.querySelector(".close-button").onclick = () => {
  watcher.requestClose();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
