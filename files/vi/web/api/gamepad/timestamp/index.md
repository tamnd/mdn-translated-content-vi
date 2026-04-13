---
title: "Gamepad: thuộc tính timestamp"
short-title: timestamp
slug: Web/API/Gamepad/timestamp
page-type: web-api-instance-property
browser-compat: api.Gamepad.timestamp
---

{{APIRef("Gamepad API")}}

Thuộc tính **`Gamepad.timestamp`** của giao diện {{domxref("Gamepad")}} trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm gần nhất dữ liệu của gamepad này được cập nhật.

Ý tưởng ở đây là cho phép nhà phát triển xác định liệu dữ liệu `axes` và `button` có được cập nhật từ phần cứng hay chưa. Giá trị phải tương đối so với thuộc tính `navigationStart` của giao diện {{domxref("PerformanceTiming")}}. Các giá trị tăng dần theo thời gian, nghĩa là có thể so sánh để xác định thứ tự cập nhật, vì giá trị mới hơn sẽ luôn lớn hơn hoặc bằng giá trị cũ hơn.

> [!NOTE]
> Thuộc tính này hiện không được hỗ trợ ở bất kỳ đâu.

## Giá trị

Một đối tượng {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

```js
const gp = navigator.getGamepads()[0];
console.log(gp.timestamp);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

[Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
