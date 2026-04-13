---
title: "Event: thuộc tính cancelable"
short-title: cancelable
slug: Web/API/Event/cancelable
page-type: web-api-instance-property
browser-compat: api.Event.cancelable
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`cancelable`** của giao diện {{domxref("Event")}} cho biết sự kiện có thể bị hủy hay không, và do đó có thể bị ngăn như thể sự kiện chưa từng xảy ra.

Nếu sự kiện _không_ thể bị hủy, thì thuộc tính `cancelable` của nó sẽ là `false` và bộ lắng nghe sự kiện sẽ không thể ngăn sự kiện xảy ra.

Phần lớn các sự kiện gốc do trình duyệt tạo ra và có thể bị hủy là những sự kiện phát sinh từ việc người dùng tương tác với trang. Việc hủy các sự kiện {{domxref("Element/click_event", "click")}},
{{domxref("Element/wheel_event", "wheel")}}, hoặc
{{domxref("Window/beforeunload_event", "beforeunload")}} sẽ ngăn người dùng nhấp vào một thứ gì đó, cuộn trang bằng bánh xe chuột, hoặc rời khỏi trang, tương ứng.

[Sự kiện tổng hợp](/en-US/docs/Web/API/Event/Event) do mã JavaScript khác tạo ra sẽ xác định xem chúng có thể bị hủy hay không ngay khi chúng được tạo.

Để hủy một sự kiện, hãy gọi phương thức {{domxref("event.preventDefault", "preventDefault()")}} trên sự kiện. Điều này ngăn phần cài đặt thực thi hành động mặc định gắn với sự kiện.

Các bộ lắng nghe sự kiện xử lý nhiều loại sự kiện có thể muốn kiểm tra `cancelable` trước khi gọi phương thức {{domxref("event.preventDefault", "preventDefault()")}} của chúng.

## Giá trị

Một giá trị boolean, là `true` nếu sự kiện có thể bị hủy.

## Ví dụ

Ví dụ, các nhà cung cấp trình duyệt đang đề xuất rằng sự kiện {{domxref("Element/wheel_event", "wheel")}} chỉ có thể bị hủy [trong lần đầu tiên bộ lắng nghe được gọi](https://github.com/WICG/interventions/issues/33) - mọi sự kiện `wheel` tiếp theo sẽ không thể bị hủy.

```js
function preventScrollWheel(event) {
  if (typeof event.cancelable !== "boolean" || event.cancelable) {
    // Sự kiện có thể bị hủy, nên chúng ta hủy nó.
    event.preventDefault();
  } else {
    // Sự kiện không thể bị hủy, nên không an toàn
    // khi gọi preventDefault() trên nó.
    console.warn(`Không thể hủy sự kiện sau:`);
    console.dir(event);
  }
}

document.addEventListener("wheel", preventScrollWheel);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
