---
title: "MediaTrackSettings: screenPixelRatio property"
short-title: screenPixelRatio
slug: Web/API/MediaTrackSettings/screenPixelRatio
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.getSettings.return_object_property_screenPixelRatio
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`screenPixelRatio`** của từ điển {{domxref("MediaTrackSettings")}} là số đại diện cho tỷ lệ kích thước vật lý của một pixel trên bề mặt hiển thị được chụp (hiển thị ở độ phân giải vật lý) so với kích thước logic của một pixel CSS trên màn hình chụp (hiển thị ở độ phân giải logic). Không thể dùng làm ràng buộc hoặc khả năng.

Thuộc tính này cho phép các ứng dụng sử dụng [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API) tiết kiệm tài nguyên bằng cách gửi video chụp màn hình ở độ phân giải logic hoặc độc lập với thiết bị.

## Giá trị

Số đại diện cho tỷ lệ pixel màn hình.

Giá trị này được tính bằng cách chia kích thước của {{glossary("CSS pixel")}} ở mức thu phóng trang `1.0` và sử dụng hệ số tỷ lệ `1.0` trên màn hình chụp cho kích thước dọc của một pixel từ [bề mặt hiển thị](/en-US/docs/Web/API/MediaTrackConstraints/displaySurface) được chụp.

## Mô tả

Màn hình thường có tính năng thu phóng được áp dụng qua hệ điều hành (OS), ví dụ khi màn hình có độ phân giải cao và bạn muốn đồ họa được hiển thị cùng kích thước vật lý như trên màn hình độ phân giải tiêu chuẩn. Độ phân giải trước khi áp dụng thu phóng được gọi là **độ phân giải logic**, và độ phân giải sau khi áp dụng thu phóng được gọi là **độ phân giải vật lý**.

Nếu màn hình được chụp của người gửi được phóng to, thì độ phân giải vật lý lớn hơn độ phân giải logic, và ứng dụng hội nghị truyền hình do đó có thể tiết kiệm băng thông và CPU bằng cách:

1. Loại bỏ thu phóng được áp dụng cho bề mặt hiển thị được chụp bởi hệ điều hành.
2. Gửi video chụp màn hình ở độ phân giải logic.
3. Áp dụng lại thu phóng sau khi nhận nó trên máy khách từ xa để điều chỉnh lại kích thước về độ phân giải vật lý.

Thuộc tính `screenPixelRatio` mô tả tỷ lệ kích thước vật lý của một pixel so với kích thước logic của một pixel CSS, và do đó cho phép ứng dụng tính toán mức độ thu phóng đã được áp dụng, và sau đó giới hạn video về kích thước logic.

Ví dụ:

- Nếu bề mặt hiển thị được chụp đang được hiển thị trên màn hình độ phân giải tiêu chuẩn nơi kích thước pixel vật lý gần giống với kích thước pixel CSS, `screenPixelRatio` sẽ trả về giá trị `1`.
- Tuy nhiên, nếu bề mặt hiển thị được chụp đang được hiển thị trên màn hình độ phân giải cao nơi kích thước pixel vật lý gấp đôi kích thước pixel CSS, `screenPixelRatio` sẽ trả về giá trị `2`.

## Ví dụ

### Cách sử dụng `screenPixelRatio` cơ bản

Trong ví dụ này, ứng dụng định nghĩa hằng số `RESOLUTION_LIMIT`, đại diện cho hệ số tỷ lệ mà vượt quá đó ứng dụng gửi nên gửi video ở độ phân giải logic thay vì độ phân giải vật lý.

Khi `screenPixelRatio` vượt quá giới hạn này, ứng dụng sử dụng giá trị `screenPixelRatio` để tính độ phân giải logic từ độ phân giải vật lý, sau đó giới hạn {{domxref("MediaStreamTrack")}} được chụp về độ phân giải logic.

```js
const RESOLUTION_LIMIT = 1.5;

async function startCapture() {
  const stream = await navigator.mediaDevices.getDisplayMedia({
    video: true,
  });
  const track = stream.getVideoTracks()[0];
  const settings = track.getSettings();
  const capabilities = track.getCapabilities();

  if (settings.screenPixelRatio > RESOLUTION_LIMIT) {
    const physicalWidth = capabilities.width.max;
    const physicalHeight = capabilities.height.max;
    const logicalWidth = physicalWidth / settings.screenPixelRatio;
    const logicalHeight = physicalHeight / settings.screenPixelRatio;
    await track.applyConstraints({
      width: logicalWidth,
      height: logicalHeight,
    });
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackSettings")}}
