---
title: InputDeviceCapabilities API
slug: Web/API/InputDeviceCapabilities_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.InputDeviceCapabilities
---

{{DefaultAPISidebar("Input Device Capabilities API")}}{{SeeCompatTable}}

InputDeviceCapabilities API cung cấp chi tiết về các nguồn cơ bản của các sự kiện đầu vào. API cố gắng mô tả cách thiết bị hoạt động thay vì là gì. Ví dụ, phiên bản đầu tiên của API cho biết thiết bị có kích hoạt các sự kiện chạm hay không thay vì liệu nó có phải là màn hình cảm ứng hay không.

## Khái niệm và cách sử dụng

Vì các sự kiện DOM trừu tượng hóa đầu vào thiết bị, chúng không cung cấp cách để tìm hiểu thiết bị nào hoặc loại thiết bị nào đã kích hoạt sự kiện. Điều này có thể dẫn đến các trường hợp cùng một hành động kích hoạt nhiều trình xử lý sự kiện. Để xử lý điều này, các nhà phát triển đưa ra các giả định và sử dụng các heuristic để chuẩn hóa hành vi trên các trang web.

InputDeviceCapabilities API giải quyết vấn đề này bằng cách trừu tượng hóa các khả năng của thiết bị đầu vào. Ví dụ, giả sử chúng ta có trang web triển khai cả sự kiện `touchstart` và `mousedown`. Chúng ta có thể giả định rằng nếu sự kiện touchstart được kích hoạt thì thiết bị của người dùng có giao diện cảm ứng. Còn khi sự kiện mousedown được kích hoạt? Sẽ hữu ích khi biết liệu sự kiện `touchstart` cũng có được kích hoạt không để chúng ta không thực hiện cùng một hành động hai lần. Chúng ta có thể làm điều này bằng cách kiểm tra thuộc tính sourceCapabilities của {{domxref("UIEvent")}}.

```js
myButton.addEventListener("mousedown", (e) => {
  // Touch event case handled above, don't change the style again on tap.
  if (!e.sourceCapabilities.firesTouchEvents) myButton.classList.add("pressed");
});
```

## Các giao diện

- {{domxref("InputDeviceCapabilities")}} {{Experimental_Inline}}
  - : Cung cấp thông tin logic về thiết bị đầu vào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
