---
title: "MediaStreamTrack: phương thức stop()"
short-title: stop()
slug: Web/API/MediaStreamTrack/stop
page-type: web-api-instance-method
browser-compat: api.MediaStreamTrack.stop
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`stop()`** của giao diện {{domxref("MediaStreamTrack")}} dừng track.

## Cú pháp

```js-nolint
stop()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Gọi `stop()` báo cho {{glossary("user agent")}} biết rằng nguồn của track—dù nguồn đó là gì, bao gồm tệp, luồng mạng, hoặc máy ảnh hay micro cục bộ—không còn cần thiết bởi {{domxref("MediaStreamTrack")}}. Vì nhiều track có thể sử dụng cùng một nguồn (ví dụ: nếu hai tab đang sử dụng micro của thiết bị), bản thân nguồn không nhất thiết phải dừng ngay lập tức. Thay vào đó, nó bị ngắt kết nối khỏi track và đối tượng track được dừng. Khi không còn track phương tiện nào sử dụng nguồn, nguồn đó có thể thực sự bị dừng hoàn toàn.

Ngay sau khi gọi `stop()`, thuộc tính
{{domxref("MediaStreamTrack.readyState", "readyState")}} được đặt thành
`ended`. Lưu ý rằng sự kiện [`ended`](/vi/docs/Web/API/MediaStreamTrack/ended_event) sẽ không được kích hoạt trong tình huống này.

## Ví dụ

### Dừng một luồng video

Trong ví dụ này, chúng ta thấy một hàm dừng một luồng video bằng cách gọi
`stop()` trên mọi track của một {{HTMLElement("video")}} nhất định.

```js
function stopStreamedVideo(videoElem) {
  const stream = videoElem.srcObject;
  const tracks = stream.getTracks();

  tracks.forEach((track) => {
    track.stop();
  });

  videoElem.srcObject = null;
}
```

Điều này hoạt động bằng cách lấy luồng của phần tử video từ thuộc tính
{{domxref("HTMLMediaElement.srcObject", "srcObject")}} của nó. Sau đó, danh sách track của luồng
được lấy bằng cách gọi phương thức {{domxref("MediaStream.getTracks", "getTracks()")}} của nó. Từ đó, tất cả những gì còn lại là lặp qua danh sách track bằng
{{jsxref("Array.forEach", "forEach()")}} và gọi phương thức `stop()` của mỗi track.

Cuối cùng, `srcObject` được đặt thành `null` để ngắt liên kết đến đối tượng
{{domxref("MediaStream")}} để nó có thể được giải phóng.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStreamTrack")}}, giao diện mà nó thuộc về.
- {{domxref("MediaStreamTrack.readyState")}}
- {{domxref("MediaStreamTrack/ended_event", "ended")}}
