---
title: "HTMLAudioElement: hàm khởi tạo Audio()"
short-title: Audio()
slug: Web/API/HTMLAudioElement/Audio
page-type: web-api-constructor
browser-compat: api.HTMLAudioElement.Audio
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`Audio()`** tạo và trả về {{domxref("HTMLAudioElement")}} mới có thể được gắn vào tài liệu để người dùng tương tác và/hoặc nghe, hoặc có thể được sử dụng ngoài màn hình để quản lý và phát âm thanh.

## Cú pháp

```js-nolint
new Audio()
new Audio(url)
```

### Tham số

- `url` {{optional_inline}}
  - : Chuỗi tùy chọn chứa URL của tệp âm thanh được liên kết với phần tử âm thanh mới.

### Giá trị trả về

Đối tượng {{domxref("HTMLAudioElement")}} mới, được cấu hình để sử dụng cho việc phát lại âm thanh từ tệp được chỉ định bởi `url`. Thuộc tính {{domxref("HTMLMediaElement.preload", "preload")}} của đối tượng mới được đặt thành `auto` và thuộc tính `src` của nó được đặt thành URL được chỉ định hoặc `null` nếu không có URL nào được cung cấp. Nếu URL được chỉ định, trình duyệt bắt đầu _không đồng bộ_ tải tài nguyên phương tiện trước khi trả về đối tượng mới.

## Ghi chú sử dụng

Bạn cũng có thể sử dụng các phương thức tạo phần tử khác, chẳng hạn như phương thức {{domxref("Document.createElement", "createElement()")}} của đối tượng {{domxref("document")}}, để xây dựng {{domxref("HTMLAudioElement")}} mới.

### Xác định khi nào có thể bắt đầu phát lại

Có ba cách để biết khi nào đủ tệp âm thanh đã được tải để cho phép phát lại bắt đầu:

- Kiểm tra giá trị của thuộc tính {{domxref("HTMLMediaElement.readyState", "readyState")}}. Nếu là `HTMLMediaElement.HAVE_FUTURE_DATA`, có đủ dữ liệu để bắt đầu phát lại. Nếu là `HTMLMediaElement.HAVE_ENOUGH_DATA`, thì có đủ dữ liệu để bạn có thể phát âm thanh đến hết mà không bị gián đoạn.
- Lắng nghe sự kiện {{domxref("HTMLMediaElement.canplay_event", "canplay")}}. Nó được gửi đến phần tử `<audio>` khi có đủ âm thanh để bắt đầu phát lại, mặc dù có thể xảy ra gián đoạn.
- Lắng nghe sự kiện {{domxref("HTMLMediaElement.canplaythrough_event", "canplaythrough")}}. Nó được gửi khi ước tính âm thanh có thể phát đến hết mà không bị gián đoạn.

Cách tiếp cận dựa trên sự kiện là tốt nhất:

```js
myAudioElement.addEventListener("canplaythrough", (event) => {
  /* the audio is now playable; play it if permissions allow */
  myAudioElement.play();
});
```

### Quản lý bộ nhớ

Nếu tất cả các tham chiếu đến phần tử âm thanh được tạo bằng hàm khởi tạo `Audio()` bị xóa, phần tử sẽ không bị xóa khỏi bộ nhớ bởi cơ chế thu gom rác của JavaScript runtime nếu việc phát lại đang diễn ra. Thay vào đó, âm thanh sẽ tiếp tục phát và đối tượng sẽ vẫn ở trong bộ nhớ cho đến khi việc phát lại kết thúc. Vào thời điểm đó, đối tượng trở thành đối tượng để thu gom rác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web media technologies](/en-US/docs/Web/Media)
- Phần tử HTML triển khai giao diện này: {{HTMLElement("audio")}}.
