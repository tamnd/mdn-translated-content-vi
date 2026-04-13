---
title: Communication with embedded frames
slug: Web/API/Fenced_frame_API/Communication_with_embedded_frames
page-type: guide
---

{{DefaultAPISidebar("Fenced Frame API")}}

Bài viết này cung cấp thông tin về cách giao tiếp khác nhau giữa trình nhúng và nội dung được nhúng bên trong các loại frame khác nhau (tức là `<iframe>` và `<fencedframe>`), và cách dữ liệu được truyền có thể được lưu trữ.

## Giao tiếp giữa trình nhúng và `<iframe>`

![Sơ đồ minh họa sự khác biệt giữa local storage và shared storage và giao tiếp với iframe, như giải thích bên dưới](iframe-storage-communication.png)

Khi mã bên thứ ba được nhúng trong `<iframe>`, `<iframe>` và trình nhúng có thể gửi tin nhắn tự do cho nhau để yêu cầu dữ liệu được ghi vào [bộ nhớ chia sẻ](/en-US/docs/Web/API/Shared_Storage_API) phía client của họ. Trình nhúng có thể gửi yêu cầu đến `<iframe>` đó để ghi dữ liệu vào bộ nhớ của bên thứ ba của nó bằng kênh giao tiếp liên tài liệu sử dụng {{domxref("Window.postMessage()")}}. Bên thứ ba cũng có thể gửi yêu cầu `postMessage()` đến trình nhúng.

Từ `<iframe>`, bạn có thể lắng nghe sự kiện [`message`](/en-US/docs/Web/API/Window/message_event) đến từ trình nhúng. Khi trình nhúng gửi tin nhắn đến `<iframe>` bằng `postMessage()`, `<iframe>` có thể lấy dữ liệu đó và lưu trữ trong bộ nhớ chia sẻ phía client của nó. Ngược lại, `<iframe>` có thể gửi tin nhắn mà trình nhúng có thể lắng nghe và phản hồi bằng cách ghi dữ liệu vào bộ nhớ chia sẻ của nó.

## Giao tiếp giữa trình nhúng và `<fencedframe>`

Fenced frame được thiết kế để sử dụng cho các trường hợp như hiển thị quảng cáo được nhắm mục tiêu được chọn qua [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience) và {{domxref("WindowSharedStorage.selectURL()")}}. Giao tiếp giữa `<fencedframe>` và các trang khác ngoài `<fencedframe>` trên trang được cố ý giới hạn, nhưng một phương pháp giao tiếp giữa trình nhúng và các worklet bộ nhớ chia sẻ tồn tại là {{domxref("FencedFrameConfig.setSharedStorageContext()")}}.

> [!NOTE]
> Trong cùng cây `<fencedframe>`, giao tiếp giữa các frame được cho phép. Ví dụ, một `<fencedframe>` gốc có thể gửi tin nhắn đến `<iframe>` con trong cây của nó, và `<iframe>` con có thể gửi tin nhắn đến `<fencedframe>` cha.

Hãy xem xét một ví dụ phức tạp hơn sử dụng thao tác cổng đầu ra Select URL để hiển thị quảng cáo trong `<fencedframe>`.

![Tình huống nhúng phức tạp với trình nhúng đang nhúng iframe, nhúng fencedframe, nhúng iframe](multiple-embed-levels.png)

Trong ví dụ này, một nhà xuất bản yêu cầu nhà cung cấp nội dung bên thứ ba hiển thị một số nội dung trên trang. Nội dung được chọn với {{domxref("WindowSharedStorage.selectURL()")}} được hiển thị trong `<fencedframe>`, và nội dung chứa `<iframe>` từ nhà cung cấp đo lường.

Để truyền dữ liệu vào `<fencedframe>` để sử dụng trong worklet bộ nhớ chia sẻ, trình nhúng có thể đặt dữ liệu trong {{domxref("FencedFrameConfig")}}. Giá trị đó sẽ có sẵn như {{domxref("WorkletSharedStorage.context")}} bên trong worklet bộ nhớ chia sẻ. Dữ liệu này không có sẵn bên ngoài worklet và chỉ có thể được truy cập bên trong môi trường an toàn và riêng tư mà worklet bộ nhớ chia sẻ cung cấp.

![Nhà xuất bản tạo FencedFrameConfig bằng selectURL, có thể đặt dữ liệu ngữ cảnh bằng setSharedStorageContext sẽ có sẵn trong worklet bộ nhớ chia sẻ](share-contextual-data.png)

Khi lệnh gọi `selectURL()` trả về `FencedFrameConfig`, trình nhúng frame có thể truyền dữ liệu bằng cách gọi `setSharedStorageContext(data)`:

```js
const fencedFrameConfig = await window.sharedStorage.selectURL(
  "creative-rotation",
  urls,
  {
    // …
    resolveToConfig: true,
  },
);

fencedFrameConfig.setSharedStorageContext("some-data");

// Điều hướng fenced frame đến config.
document.getElementById("my-fenced-frame").config = fencedFrameConfig;
```

`setSharedStorageContext(data)` phải được gọi trên `fencedFrameConfig` trước khi phần tử `<fencedframe>` nhận được có thuộc tính `config` được đặt thành `fencedFrameConfig`, vì điều này kích hoạt frame để điều hướng.

Bên trong worklet bộ nhớ chia sẻ, `WorkletSharedStorage.context` có thể được truy cập để lấy dữ liệu:

```js
class ReportingOperation {
  async run() {
    sharedStorage.set("some-data-from-embedder", sharedStorage.context);
  }
}
register("send-report", ReportingOperation);
```
