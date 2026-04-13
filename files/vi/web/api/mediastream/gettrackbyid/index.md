---
title: "MediaStream: phương thức getTrackById()"
short-title: getTrackById()
slug: Web/API/MediaStream/getTrackById
page-type: web-api-instance-method
browser-compat: api.MediaStream.getTrackById
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getTrackById()`** của giao diện {{domxref("MediaStream")}} trả về một đối tượng {{domxref("MediaStreamTrack")}} đại diện cho track có chuỗi ID được chỉ định. Nếu không có track nào có ID được chỉ định, phương thức này trả về `null`.

## Cú pháp

```js-nolint
getTrackById(id)
```

### Tham số

- `id`
  - : Một chuỗi xác định track cần trả về.

### Giá trị trả về

Nếu một track được tìm thấy có {{domxref("MediaStreamTrack.id")}} khớp với chuỗi `id` được chỉ định, đối tượng {{domxref("MediaStreamTrack")}} đó được trả về. Ngược lại, giá trị trả về là `null`.

## Ví dụ

Ví dụ này kích hoạt track bình luận trên video bằng cách giảm mức âm thanh của track audio chính xuống 50%, sau đó bật track bình luận.

Ví dụ giả định rằng ID của hai track đã được biết (ví dụ, từ một lần gọi trước đó đến {{domxref("MediaStreamTrack.id")}}). Trong ứng dụng thực tế, bạn có thể lưu trữ các ID này khi lần đầu tiên lấy luồng, vì chúng được tạo ngẫu nhiên trong trình duyệt.

```js
const primaryAudioTrack = stream.getTrackById(
  "69f8520f-d94e-43f0-8a7c-77b1774f3b8f",
);
const commentaryTrack = stream.getTrackById(
  "b5410643-2549-491e-b0f7-f08a4ebe54b8",
);

primaryAudioTrack.applyConstraints({ volume: 0.5 });
commentaryTrack.enabled = true;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStream")}}
- {{domxref("MediaStreamTrack.id")}}
