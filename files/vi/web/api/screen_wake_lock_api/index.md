---
title: Screen Wake Lock API
slug: Web/API/Screen_Wake_Lock_API
page-type: web-api-overview
browser-compat:
  - api.WakeLock
  - api.WakeLockSentinel
spec-urls: https://w3c.github.io/screen-wake-lock/
---

{{DefaultAPISidebar("Screen Wake Lock API")}}{{securecontext_header}}

**Screen Wake Lock API** cung cấp một cách để ngăn thiết bị làm mờ hoặc khóa màn hình khi ứng dụng cần tiếp tục chạy.

## Khái niệm và cách dùng

Phần lớn thiết bị theo mặc định sẽ tắt màn hình sau một khoảng thời gian nhất định để kéo dài tuổi thọ phần cứng. Thiết bị hiện đại cũng làm vậy để tiết kiệm pin. Dù đây là một tính năng hữu ích, một số ứng dụng cần màn hình luôn sáng để hoạt động tốt nhất.

Screen Wake Lock API ngăn màn hình tắt, mờ đi hoặc bị khóa. Nó cung cấp một giải pháp dựa trên nền tảng rất đơn giản cho các tài liệu đang hiển thị (active) để lấy khóa đánh thức màn hình của nền tảng.

Có rất nhiều trường hợp cần giữ màn hình bật, bao gồm đọc sách điện tử, điều hướng bản đồ, theo công thức, trình bày trước khán giả, quét QR/barcode hoặc các ứng dụng dùng điều khiển bằng giọng nói hay cử chỉ thay vì nhập liệu cảm ứng (cách mặc định để giữ màn hình sáng).

Bạn lấy được một đối tượng {{DOMxRef("WakeLockSentinel")}} bằng cách gọi phương thức dựa trên {{jsxref('Promise')}} {{domxref('WakeLock.request','navigator.wakeLock.request()')}}. Lời gọi này sẽ được giải quyết nếu nền tảng cho phép. Một yêu cầu có thể bị từ chối vì nhiều lý do, bao gồm thiết lập hệ thống (chẳng hạn chế độ tiết kiệm pin hoặc mức pin thấp) hoặc nếu tài liệu không hoạt động hay không hiển thị.
Thực hành tốt là lưu tham chiếu tới đối tượng sentinel để ứng dụng có thể chủ động giải phóng nó sau này.

Sentinel được gắn với khóa đánh thức màn hình của hệ thống bên dưới. Nó có thể bị hệ thống giải phóng, cũng trong trường hợp pin quá thấp hoặc tài liệu không hoạt động hay không hiển thị. Nó cũng có thể được giải phóng thủ công thông qua phương thức {{domxref('WakeLockSentinel.release()')}}.
Sau khi bị giải phóng, `WakeLockSentinel` không thể tiếp tục dùng được nữa. Nếu cần khóa đánh thức màn hình trở lại, ứng dụng sẽ phải yêu cầu một đối tượng mới.

Screen Wake Lock API nên được dùng để giữ màn hình bật nhằm cải thiện khả năng sử dụng. Nên có một số phản hồi trên giao diện để cho biết khóa đánh thức đang hoạt động hay không, và một cách để người dùng tắt nó nếu họ muốn.

## Giao diện

- {{domxref("WakeLock")}}
  - : Ngăn màn hình thiết bị bị mờ hoặc khóa khi ứng dụng cần tiếp tục chạy.
- {{domxref("WakeLockSentinel")}}
  - : Cung cấp một handle tới khóa đánh thức của nền tảng bên dưới và, nếu còn được tham chiếu, có thể được giải phóng và yêu cầu lại bằng tay. Lấy một thể hiện của đối tượng này bằng cách gọi {{domxref('WakeLock.request')}}.

### Mở rộng các giao diện khác

- {{domxref("Navigator.wakeLock")}} {{ReadOnlyInline}}
  - : Trả về một thể hiện đối tượng {{domxref("WakeLock")}}, từ đó có thể truy cập toàn bộ chức năng khác.

- [`Permissions-Policy: screen-wake-lock`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/screen-wake-lock)
  - : Việc truy cập API này được kiểm soát bởi chỉ thị [`Permissions-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) `screen-wake-lock`.
    Xem [Lưu ý về bảo mật](#security_considerations) bên dưới.

## Ví dụ

### Phát hiện tính năng

Đoạn mã này kiểm tra hỗ trợ khóa đánh thức và cập nhật giao diện người dùng tương ứng.

```js
if ("wakeLock" in navigator) {
  isSupported = true;
  statusElem.textContent = "Screen Wake Lock API supported!";
} else {
  wakeButton.disabled = true;
  statusElem.textContent = "Wake lock is not supported by this browser.";
}
```

### Yêu cầu khóa đánh thức

Ví dụ sau minh họa cách yêu cầu một đối tượng {{domxref('WakeLockSentinel')}}. Phương thức {{domxref('WakeLock.request')}} dựa trên {{jsxref('Promise')}} nên ta có thể tạo một hàm bất đồng bộ, rồi cập nhật giao diện để phản ánh rằng khóa đánh thức đang hoạt động.

```js
// Tạo một tham chiếu cho Wake Lock.
let wakeLock = null;

// tạo một hàm async để yêu cầu khóa đánh thức
try {
  wakeLock = await navigator.wakeLock.request("screen");
  statusElem.textContent = "Wake Lock is active!";
} catch (err) {
  // Yêu cầu Wake Lock đã thất bại - thường là do hệ thống, chẳng hạn pin.
  statusElem.textContent = `${err.name}, ${err.message}`;
}
```

### Giải phóng khóa đánh thức

Ví dụ sau cho thấy cách giải phóng khóa đánh thức đã được cấp trước đó.

```js
wakeLock.release().then(() => {
  wakeLock = null;
});
```

### Lắng nghe việc khóa đánh thức bị giải phóng

Ví dụ này cập nhật giao diện nếu khóa đánh thức đã bị giải phóng vì bất kỳ lý do gì (chẳng hạn rời khỏi cửa sổ/tab đang hoạt động).

```js
wakeLock.addEventListener("release", () => {
  // khóa đánh thức đã được giải phóng
  statusElem.textContent = "Wake Lock has been released";
});
```

### Yêu cầu lại khóa đánh thức

Đoạn mã sau sẽ yêu cầu lại khóa đánh thức nếu khả năng hiển thị của tài liệu thay đổi và khóa đánh thức đã bị giải phóng.

```js
document.addEventListener("visibilitychange", async () => {
  if (wakeLock !== null && document.visibilityState === "visible") {
    wakeLock = await navigator.wakeLock.request("screen");
  }
});
```

### Ghép tất cả lại

Bạn có thể tìm thấy [mã hoàn chỉnh trên GitHub tại đây](https://github.com/mdn/dom-examples/tree/main/screen-wake-lock-api). [Bản demo](https://mdn.github.io/dom-examples/screen-wake-lock-api/) dùng một nút để xin khóa đánh thức và cũng để giải phóng nó, từ đó cập nhật giao diện. Giao diện cũng được cập nhật nếu khóa đánh thức bị giải phóng tự động vì bất kỳ lý do gì. Có một ô chọn mà khi được bật sẽ tự động yêu cầu lại khóa đánh thức nếu trạng thái hiển thị của tài liệu thay đổi rồi trở nên hiển thị lại.

## Lưu ý về hiệu năng

- Hãy giải phóng khóa đánh thức màn hình khi người dùng kết thúc hoạt động cần màn hình luôn bật. Ví dụ, một ứng dụng bán vé dùng mã QR để truyền thông tin vé có thể xin khóa đánh thức khi mã QR được hiển thị (để mã được quét thành công) nhưng giải phóng sau đó. Một ứng dụng trình chiếu có thể chỉ giữ khóa khi bài trình chiếu đang hoạt động, không giữ khi đang chỉnh sửa.
- Nếu ứng dụng của bạn đang tải xuống dài hạn, hãy cân nhắc dùng background fetch.
- Nếu ứng dụng của bạn đang đồng bộ dữ liệu từ máy chủ từ xa, hãy cân nhắc dùng background sync.
- Chỉ các tài liệu đang hoạt động mới có thể lấy khóa đánh thức màn hình, và các khóa đã cấp trước đó sẽ tự động được giải phóng khi tài liệu trở nên không hoạt động. Vì vậy, hãy bảo đảm yêu cầu lại khóa đánh thức nếu cần khi tài liệu hoạt động trở lại (nghe sự kiện [visibilitychange](/en-US/docs/Web/API/Document/visibilitychange_event)).

## Lưu ý bảo mật

Quyền truy cập vào Screen Wake Lock API được kiểm soát bởi chỉ thị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/screen-wake-lock","screen-wake-lock")}}.

Khi dùng [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), danh sách cho phép mặc định cho `screen-wake-lock` là `self`.
Điều này cho phép dùng khóa trong các khung lồng cùng origin nhưng ngăn nội dung bên thứ ba dùng khóa.
Việc dùng bởi bên thứ ba có thể được bật nếu máy chủ trước tiên đặt header `Permissions-Policy` để cấp quyền cho một origin bên thứ ba cụ thể.

```http
Permissions-Policy: screen-wake-lock=(self b.example.com)
```

Sau đó, thuộc tính `allow="screen-wake-lock"` phải được thêm vào phần tử chứa frame cho các nguồn từ origin đó:

```html
<iframe src="https://b.example.com" allow="screen-wake-lock"></iframe>
```

Trình duyệt cũng có thể chặn khóa màn hình trong một tài liệu cụ thể vì lý do triển khai, chẳng hạn thiết lập của người dùng hoặc nền tảng.
Chúng được kỳ vọng sẽ cung cấp một cơ chế kín đáo để thông báo cho người dùng khi khóa đánh thức đang hoạt động, và cho người dùng khả năng gỡ bỏ khóa màn hình của ứng dụng.

Quyền `screen-wake-lock` của [Permissions API](/en-US/docs/Web/API/Permissions_API) có thể được dùng để kiểm tra xem quyền truy cập dùng khóa màn hình là `granted`, `denied` hay `prompt` (cần người dùng xác nhận lời nhắc).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/) on developer.chrome.com
