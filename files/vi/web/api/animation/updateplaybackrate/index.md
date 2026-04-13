---
title: "Animation: phương thức updatePlaybackRate()"
short-title: updatePlaybackRate()
slug: Web/API/Animation/updatePlaybackRate
page-type: web-api-instance-method
browser-compat: api.Animation.updatePlaybackRate
---

{{APIRef("Web Animations")}}

Phương thức **`updatePlaybackRate()`** của giao diện {{domxref("Animation")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) đặt tốc độ của một hoạt ảnh sau khi trước hết đồng bộ hóa vị trí phát của nó.

Trong một số trường hợp, hoạt ảnh có thể chạy trên một luồng hoặc tiến trình riêng và sẽ tiếp tục cập nhật ngay cả khi JavaScript chạy lâu làm trì hoãn luồng chính. Trong trường hợp như vậy, việc đặt trực tiếp {{domxref("Animation.playbackRate", "playbackRate")}} trên hoạt ảnh có thể khiến vị trí phát của hoạt ảnh bị nhảy do vị trí phát trên luồng chính đã lệch so với vị trí phát tại nơi nó đang thực sự chạy.

`updatePlaybackRate()` là một phương thức bất đồng bộ đặt tốc độ của hoạt ảnh sau khi đồng bộ với vị trí phát hiện tại của nó, bảo đảm rằng thay đổi tốc độ tạo ra sẽ không gây ra bước nhảy đột ngột. Sau khi gọi `updatePlaybackRate()`, {{domxref("Animation.playbackRate", "playbackRate")}} của hoạt ảnh sẽ _không_ được cập nhật ngay lập tức. Nó sẽ được cập nhật khi promise {{domxref("Animation.ready", "ready")}} của hoạt ảnh được giải quyết.

## Cú pháp

```js-nolint
updatePlaybackRate(playbackRate)
```

### Tham số

- `playbackRate`
  - : Tốc độ mới cần đặt. Đây có thể là số dương (để tăng hoặc giảm tốc hoạt ảnh), số âm (để làm cho hoạt ảnh phát ngược lại), hoặc 0 (để tạm dừng hoạt ảnh về mặt hiệu quả).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Một thành phần chọn tốc độ sẽ hưởng lợi từ việc cập nhật mượt bằng `updatePlaybackRate()`, như minh họa bên dưới:

```js
speedSelector.addEventListener("input", (evt) => {
  cartoon.updatePlaybackRate(parseFloat(evt.target.value));
  cartoon.ready.then(() => {
    console.log(`Playback rate set to ${cartoon.playbackRate}`);
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation.playbackRate")}} để đọc lại tốc độ phát hiện tại hoặc đặt nó theo cách đồng bộ.
- {{domxref("Animation.reverse()")}} để đảo ngược tốc độ phát và khởi động lại việc phát nếu cần.
- {{domxref("Animation")}} chứa các phương thức và thuộc tính khác mà bạn có thể dùng để điều khiển hoạt ảnh trên trang web.
