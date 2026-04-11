---
title: "Touch: thuộc tính force"
short-title: force
slug: Web/API/Touch/force
page-type: web-api-instance-property
browser-compat: api.Touch.force
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`Touch.force`** trả về lực ấn mà người dùng đang tác dụng lên bề mặt cảm ứng cho điểm {{ domxref("Touch") }}.

## Giá trị

Giá trị `float` đại diện cho lực ấn của người dùng lên bề mặt cảm ứng. Đây là giá trị trong khoảng `0.0` (không có lực) đến `1.0` (lực tối đa mà phần cứng có thể nhận biết). Giá trị `0.0` được trả về nếu không có thông tin (ví dụ thiết bị cảm ứng không hỗ trợ thuộc tính này). Trong các môi trường có thể đo lực, áp suất tuyệt đối và độ nhạy có thể khác nhau tùy thiết bị.

## Ví dụ

Ví dụ này minh họa cách sử dụng thuộc tính `Touch.force` của giao diện {{domxref("Touch")}}. Đây là giá trị tương đối của lực ấn, trong khoảng `0.0` đến `1.0`, với `0.0` là không có lực và `1.0` là lực tối đa thiết bị có thể cảm nhận.

Trong đoạn mã sau, trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} duyệt qua danh sách `targetTouches` và ghi lại giá trị `force` của từng điểm chạm, nhưng cũng có thể xử lý khác nhau tùy giá trị.

```js
someElement.addEventListener("touchstart", (e) => {
  // Duyệt qua danh sách điểm chạm và ghi lại lực ấn của từng điểm.
  for (let i = 0; i < e.targetTouches.length; i++) {
    // Thêm code xử lý dựa trên giá trị force. Ví dụ,
    // lực tối thiểu và lực tối đa có thể dẫn đến xử lý khác nhau.
    console.log(`targetTouches[${i}].force = ${e.targetTouches[i].force}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
