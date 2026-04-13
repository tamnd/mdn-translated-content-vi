---
title: "RTCEncodedVideoFrame: thuộc tính type"
short-title: type
slug: Web/API/RTCEncodedVideoFrame/type
page-type: web-api-instance-property
browser-compat: api.RTCEncodedVideoFrame.type
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("RTCEncodedVideoFrame")}} cho biết liệu khung này là khung chính (key frame), delta frame hay khung rỗng.

## Giá trị

Kiểu có thể có một trong các giá trị sau:

- `key`
  - : Đây là "khung chính" (key frame), chứa tất cả thông tin cần thiết để render một hình ảnh.
    Nó có thể được giải mã mà không cần tham chiếu đến bất kỳ khung nào khác.
- `delta`
  - : Đây là "delta frame", chứa các thay đổi đối với một hình ảnh so với một khung trước đó.
    Khung này không thể được giải mã nếu không có quyền truy cập vào các khung mà nó tham chiếu.
- `empty`
  - : Khung này không chứa dữ liệu.
    Giá trị này là không mong đợi, và có thể chỉ ra rằng transform đang giữ tham chiếu đến các khung sau khi chúng đã được transform và pipe đến {{domxref("RTCRtpScriptTransformer.writable")}} (sau khi chuyển trở lại đường ống WebRTC phía main-thread, đối tượng khung phía worker sẽ không có dữ liệu).

## Ví dụ

Việc triển khai hàm `transform()` trong một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) có thể xem xét `type` và sửa đổi code transform dựa trên việc nó đang xử lý key frame hay delta frame:

```js
const transformer = new TransformStream({
  async transform(encodedFrame, controller) {
    if (encodedFrame.type === "key") {
      // Apply key frame transformation
    } else if (encodedFrame.type === "delta") {
      // Apply delta frame transformation
    } else {
      // Empty
      // Check transform is not holding reference to frames after processing!
    }
    controller.enqueue(encodedFrame);
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
