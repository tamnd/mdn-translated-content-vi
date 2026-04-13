---
title: "MediaSession: phương thức setPositionState()"
short-title: setPositionState()
slug: Web/API/MediaSession/setPositionState
page-type: web-api-instance-method
browser-compat: api.MediaSession.setPositionState
---

{{APIRef("Media Session API")}}

Phương thức **`setPositionState()`** của giao diện {{domxref("MediaSession")}} được sử dụng để cập nhật vị trí phát lại và tốc độ phương tiện của tài liệu hiện tại để hiển thị bởi thiết bị người dùng trong bất kỳ loại giao diện nào cung cấp thông tin chi tiết về phương tiện đang phát. Điều này đặc biệt hữu ích nếu mã của bạn triển khai trình phát cho loại phương tiện không được trình duyệt hỗ trợ trực tiếp.

Gọi phương thức này trên đối tượng {{domxref("navigator.mediaSession", "mediaSession")}} của đối tượng `navigator`.

## Cú pháp

```js-nolint
setPositionState()
setPositionState(stateDict)
```

### Tham số

- `stateDict` {{optional_inline}}
  - : Một đối tượng cung cấp thông tin cập nhật về vị trí phát lại và tốc độ của phương tiện đang phát của tài liệu. Nếu đối tượng rỗng, thông tin trạng thái phát lại hiện có sẽ bị xóa. Đối tượng này có thể chứa các tham số sau:
    - `duration` {{optional_inline}}
      - : Giá trị dấu phẩy động cho biết tổng thời lượng của phương tiện hiện tại tính bằng giây. Luôn phải là số dương, với vô cực dương ({{jsxref("Infinity")}}) cho biết phương tiện không có điểm kết thúc xác định, chẳng hạn như luồng trực tiếp.
    - `playbackRate` {{optional_inline}}
      - : Giá trị dấu phẩy động cho biết tốc độ phát lại phương tiện, theo tỷ lệ so với tốc độ phát lại bình thường. Giá trị 1 là phát ở tốc độ bình thường, 2 là phát ở tốc độ gấp đôi, v.v. Giá trị âm cho biết phương tiện đang phát ngược; -1 cho biết phát ở tốc độ bình thường nhưng ngược lại, -2 là tốc độ gấp đôi theo chiều ngược lại, v.v.
    - `position` {{optional_inline}}
      - : Giá trị dấu phẩy động cho biết vị trí phát lại được báo cáo gần nhất của phương tiện tính bằng giây. Phải luôn là giá trị dương.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Lỗi này có thể xảy ra trong một số trường hợp:
    - `duration` của đối tượng được chỉ định bị thiếu, âm hoặc `null`.
    - `position` của nó là âm hoặc lớn hơn `duration`.
    - `playbackRate` của nó bằng không.

## Ví dụ

Dưới đây là hàm cập nhật trạng thái vị trí của bài hát {{domxref('MediaSession')}} hiện tại.

```js
function updatePositionState() {
  navigator.mediaSession.setPositionState({
    duration: audioEl.duration,
    playbackRate: audioEl.playbackRate,
    position: audioEl.currentTime,
  });
}
```

Chúng ta có thể sử dụng hàm này khi cập nhật {{domxref('MediaMetadata')}} và trong các callback cho các hành động, chẳng hạn như dưới đây.

```js
navigator.mediaSession.setActionHandler("seekbackward", (details) => {
  // our time to skip
  const skipTime = details.seekOffset || 10;

  // set our position
  audioEl.currentTime = Math.max(audioEl.currentTime - skipTime, 0);
  updatePositionState();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
