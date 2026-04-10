---
title: "TouchEvent: thuộc tính touches"
short-title: touches
slug: Web/API/TouchEvent/touches
page-type: web-api-instance-property
browser-compat: api.TouchEvent.touches
---

{{ APIRef("Touch Events") }}

**`touches`** là một {{ domxref("TouchList")}} chỉ đọc liệt kê
tất cả các đối tượng {{ domxref("Touch")}} cho các điểm chạm hiện đang tiếp xúc
với bề mặt cảm ứng, bất kể chúng đã thay đổi hay không và phần tử mục tiêu của chúng
là gì tại thời điểm {{domxref("Element/touchstart_event", "touchstart")}}.

Bạn có thể nghĩ đây là số lượng ngón tay riêng biệt có thể được xác định là đang chạm
vào màn hình.

> [!NOTE]
> Các thao tác chạm trong mảng không nhất thiết được sắp xếp theo thứ tự xảy ra (phần tử thứ i trong mảng là thao tác chạm thứ i xảy ra). Bạn không được giả định một thứ tự cụ thể. Để xác định thứ tự xảy ra của các thao tác chạm, hãy sử dụng ID của đối tượng `touch`.

## Giá trị

Một {{ domxref("TouchList")}} liệt kê tất cả các đối tượng {{ domxref("Touch")}} cho các điểm chạm vẫn đang tiếp xúc với bề mặt cảm ứng, bất kể chúng đã thay đổi hay không và phần tử mục tiêu của chúng là gì tại thời điểm `touchstart`.

## Ví dụ

Ví dụ này minh họa thuộc tính `TouchEvent.touches` của đối tượng {{domxref("TouchEvent")}}. Thuộc tính `TouchEvent.touches` là một đối tượng {{domxref("TouchList")}} và chứa danh sách các đối tượng {{domxref("Touch")}} cho mọi điểm tiếp xúc hiện đang chạm vào bề mặt.

Trong đoạn mã sau, trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} kiểm tra độ dài của danh sách `TouchEvent.touches` để xác định số lượng điểm chạm đã được kích hoạt và sau đó gọi các trình xử lý khác nhau tùy thuộc vào số lượng điểm chạm.

```js
someElement.addEventListener("touchstart", (e) => {
  // Invoke the appropriate handler depending on the
  // number of touch points.
  switch (e.touches.length) {
    case 1:
      handle_one_touch(e);
      break;
    case 2:
      handle_two_touches(e);
      break;
    case 3:
      handle_three_touches(e);
      break;
    default:
      console.log("Not supported");
      break;
  }
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
