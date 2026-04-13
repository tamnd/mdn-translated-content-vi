---
title: Remote Playback API
slug: Web/API/Remote_Playback_API
page-type: web-api-overview
browser-compat: api.RemotePlayback
spec-urls: https://w3c.github.io/remote-playback/
---

{{DefaultAPISidebar("Remote Playback API")}}

**Remote Playback API** mở rộng {{domxref("HTMLMediaElement")}} để cho phép kiểm soát phương tiện được phát trên thiết bị từ xa.

## Khái niệm và cách sử dụng

Thiết bị phát lại từ xa là các thiết bị kết nối như TV, máy chiếu hoặc loa. API này tính đến các thiết bị có dây được kết nối qua HDMI hoặc DVI, và các thiết bị không dây, ví dụ Chromecast hoặc AirPlay.

API này cho phép một trang web, có phần tử media như video hoặc tệp âm thanh, khởi tạo và kiểm soát việc phát lại phương tiện đó trên thiết bị từ xa được kết nối. Ví dụ: phát video trên TV được kết nối.

> [!NOTE]
> Safari cho iOS có một số API cho phép phát lại từ xa trên AirPlay. Chi tiết có thể tìm trong [ghi chú phát hành Safari 9.0](https://developer.apple.com/library/archive/releasenotes/General/WhatsNewInSafari/Articles/Safari_9_0.html#//apple_ref/doc/uid/TP40014305-CH9-SW16).
>
> Các phiên bản Android của Firefox và Chrome cũng chứa một số tính năng phát lại từ xa. Các thiết bị này sẽ hiển thị nút Cast nếu có thiết bị Cast trong mạng cục bộ.

## Giao diện

- {{domxref("RemotePlayback")}}
  - : Cho phép trang web phát hiện sự khả dụng của thiết bị phát lại từ xa, sau đó kết nối và kiểm soát việc phát trên các thiết bị đó.

### Mở rộng các giao diện khác

- {{domxref("HTMLMediaElement.disableRemotePlayback")}}
  - : Một giá trị boolean đặt hoặc trả về trạng thái phát lại từ xa, cho biết liệu phần tử media có được phép có giao diện người dùng phát lại từ xa hay không.
- {{domxref("HTMLMediaElement.remote")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("RemotePlayback")}} được liên kết với phần tử media.

## Ví dụ

Ví dụ sau đây minh họa một trình phát với điều khiển tùy chỉnh hỗ trợ phát lại từ xa. Ban đầu nút dùng để chọn thiết bị bị ẩn.

```html
<video id="videoElement" src="https://example.org/media.ext">
  <button id="deviceBtn" class="hidden">Pick device</button>
</video>
```

```css
.hidden {
  display: none;
}
```

Phương thức {{domxref("RemotePlayback.watchAvailability()")}} theo dõi các thiết bị phát lại từ xa có sẵn. Nếu có thiết bị, sử dụng callback để hiển thị nút.

```js
const deviceBtn = document.getElementById("deviceBtn");
const videoElem = document.getElementById("videoElement");

function availabilityCallback(available) {
  // Hiển thị hoặc ẩn nút chọn thiết bị tùy thuộc vào sự khả dụng của thiết bị.
  if (available) {
    deviceBtn.classList.remove("hidden");
  } else {
    deviceBtn.classList.add("hidden");
  }
}

videoElem.remote.watchAvailability(availabilityCallback).catch(() => {
  // Nếu thiết bị không thể liên tục theo dõi sự khả dụng,
  // hiển thị nút để cho phép người dùng thử nhắc kết nối.
  deviceBtn.style.display = "inline";
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
