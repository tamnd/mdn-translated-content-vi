---
title: "DocumentPictureInPicture: requestWindow() method"
short-title: requestWindow()
slug: Web/API/DocumentPictureInPicture/requestWindow
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.DocumentPictureInPicture.requestWindow
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestWindow()`** của giao diện
{{domxref("DocumentPictureInPicture")}} mở cửa sổ Picture-in-Picture cho ngữ cảnh duyệt web chính hiện tại. Nó trả về {{jsxref("Promise")}} hoàn thành với phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ Picture-in-Picture.

Phương thức `requestWindow()` yêu cầu [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation), tức là nó phải được gọi để phản hồi hành động người dùng như nhấp chuột hoặc nhấn nút.

## Cú pháp

```js-nolint
requestWindow()
requestWindow(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Đối tượng tùy chọn chứa các thuộc tính sau:
    - `disallowReturnToOpener` {{optional_inline}}
      - : Giá trị boolean. Khi đặt là `true`, tùy chọn này gợi ý cho trình duyệt rằng nó không nên hiển thị điều khiển giao diện cho phép người dùng quay lại tab gốc và đóng cửa sổ Picture-in-Picture. Mặc định là `false`.

        Ví dụ, trong triển khai tính năng này của Chrome, điều khiển giao diện được cung cấp là nút "back to tab" trong thanh trên cùng của cửa sổ Picture-in-Picture:

        ![browser window containing an embedded video player and multiple control buttons, with a back to tab button in the top bar, highlighted with a red box](back-to-tab-button.png)

    - `height` {{optional_inline}}
      - : Số không âm đại diện cho chiều cao cần đặt cho viewport của cửa sổ Picture-in-Picture, tính bằng pixel. Mặc định là `0`.
    - `preferInitialWindowPlacement` {{optional_inline}}
      - : Giá trị boolean, mặc định là `false`. Khi đặt là `true`, cửa sổ Picture-in-Picture sẽ luôn xuất hiện trở lại ở vị trí và kích thước ban đầu khi được mở lần đầu, sau khi được đóng và mở lại. Ngược lại, nếu `preferInitialWindowPlacement` là `false`, kích thước và vị trí của cửa sổ Picture-in-Picture sẽ được ghi nhớ khi đóng và mở lại.

    - `width` {{optional_inline}}
      - : Số không âm đại diện cho chiều rộng cần đặt cho viewport của cửa sổ Picture-in-Picture, tính bằng pixel. Mặc định là `0`.

> [!NOTE]
> Nếu một trong `height` hoặc `width` được chỉ định, giá trị kia cũng phải được chỉ định, nếu không sẽ xảy ra lỗi. Nếu cả hai giá trị không được chỉ định, được chỉ định là 0, hoặc quá lớn, trình duyệt sẽ kẹp hoặc bỏ qua các giá trị khi thích hợp để cung cấp trải nghiệm người dùng hợp lý. Kích thước bị kẹp sẽ thay đổi tùy thuộc vào triển khai, kích thước màn hình và các yếu tố khác.

### Giá trị trả về

{{jsxref("Promise")}} hoàn thành với phiên bản đối tượng {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ Picture-in-Picture.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu API đã bị tắt rõ ràng (ví dụ: qua cài đặt trình duyệt).
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - `requestWindow()` không được gọi từ đối tượng `window` cấp cao nhất.
    - `requestWindow()` được gọi từ đối tượng `window` của cửa sổ Picture-in-Picture (tức là {{domxref("DocumentPictureInPicture.window")}}).
    - `requestWindow()` được gọi mà không có {{Glossary("Transient_activation", "kích hoạt tạm thời")}}.
- `RangeError` {{domxref("DOMException")}}
  - : Được ném ra nếu chỉ một trong `height` và `width` được đặt, hoặc nếu `height` và `width` được đặt với giá trị âm.

## Ví dụ

```js
const videoPlayer = document.getElementById("player");

// …

// Open a Picture-in-Picture window with all options set
const pipWindow = await window.documentPictureInPicture.requestWindow({
  width: videoPlayer.clientWidth,
  height: videoPlayer.clientHeight,
  disallowReturnToOpener: true,
  preferInitialWindowPlacement: true,
});

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}}
- [Sử dụng Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using)
