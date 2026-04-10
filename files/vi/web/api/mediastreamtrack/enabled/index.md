---
title: "MediaStreamTrack: thuộc tính enabled"
short-title: enabled
slug: Web/API/MediaStreamTrack/enabled
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.enabled
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`enabled`** của giao diện
{{domxref("MediaStreamTrack")}} là một giá trị Boolean có giá trị
`true` nếu track được phép hiển thị luồng nguồn hoặc
`false` nếu nó không được phép. Điều này có thể được sử dụng để cố ý tắt tiếng một
track.

Khi được bật, dữ liệu của track được xuất từ nguồn đến
đích; nếu không, các khung trống được xuất.

Trong trường hợp âm thanh, một track bị tắt sẽ tạo ra các khung im lặng (tức là các khung trong
đó giá trị của mọi mẫu là 0). Đối với track video, mọi khung được lấp đầy hoàn toàn bằng
các pixel đen.

Giá trị của `enabled`, về bản chất, đại diện cho những gì người dùng điển hình sẽ
coi là trạng thái tắt tiếng cho một track, trong khi thuộc tính {{domxref("MediaStreamTrack.muted", "muted")}}
cho biết trạng thái mà track tạm thời không thể xuất
dữ liệu, chẳng hạn như tình huống các khung bị mất trong quá trình truyền.

> [!NOTE]
> Nếu track đã bị ngắt kết nối, giá trị của thuộc tính này
> có thể được thay đổi, nhưng không có hiệu lực.

## Giá trị

Khi là `true`, `enabled` cho biết track được phép
hiển thị phương tiện thực tế của nó đến đầu ra. Khi `enabled` được đặt thành
`false`, track chỉ tạo ra các khung trống.

Các khung âm thanh trống có giá trị của mọi mẫu được đặt thành 0. Các khung video trống có mọi
pixel được đặt thành màu đen.

> [!NOTE]
> Khi triển khai tính năng tắt/bật tiếng, bạn nên sử dụng
> thuộc tính `enabled`.

## Ghi chú sử dụng

Nếu {{domxref("MediaStreamTrack")}} đại diện cho đầu vào video từ một máy ảnh,
việc tắt track bằng cách đặt `enabled` thành `false` cũng cập nhật
các chỉ báo hoạt động của thiết bị để hiển thị rằng máy ảnh hiện không đang ghi hoặc
phát trực tuyến. Ví dụ: đèn "đang sử dụng" màu xanh lá cây bên cạnh máy ảnh trên máy iMac và MacBook
tắt trong khi track bị tắt tiếng theo cách này.

## Ví dụ

Ví dụ này minh họa một trình xử lý sự kiện {{domxref("Element/click_event", "click")}} cho một nút tạm dừng.

```js
pauseButton.onclick = (evt) => {
  const newState = !myAudioTrack.enabled;

  pauseButton.innerHTML = newState ? "&#x25B6;&#xFE0F;" : "&#x23F8;&#xFE0F;";
  myAudioTrack.enabled = newState;
};
```

Điều này tạo ra một biến `newState`, là giá trị ngược lại với giá trị hiện tại
của `enabled`, sau đó sử dụng giá trị đó để chọn ký tự Emoji cho
biểu tượng "phát" hoặc ký tự cho biểu tượng "tạm dừng" làm
{{domxref("Element.innerHTML", "innerHTML")}} mới của phần tử nút tạm dừng.

Cuối cùng, giá trị mới của `enabled` được lưu, làm cho thay đổi có hiệu lực.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [API Media Capture and Streams](/vi/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaStream")}}
- {{domxref("MediaStreamTrack")}}
- [WebRTC](/vi/docs/Web/API/WebRTC_API)
