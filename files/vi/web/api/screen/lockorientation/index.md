---
title: "Screen: phương thức lockOrientation()"
short-title: lockOrientation()
slug: Web/API/Screen/lockOrientation
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Screen.lockOrientation
---

{{APIRef("Screen Orientation API")}}{{Deprecated_Header}}

Phương thức **`lockOrientation()`** của giao diện {{DOMxRef("Screen")}} khóa màn hình vào một hướng được chỉ định.

> [!WARNING]
> Tính năng này đã lỗi thời và nên được tránh. Sử dụng phương thức {{DOMxRef("ScreenOrientation.lock()")}} thay thế.

> [!NOTE]
> Phương thức này chỉ hoạt động cho các ứng dụng Web đã cài đặt hoặc cho các trang Web ở [chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API).

## Cú pháp

```js-nolint
lockOrientation(orientation)
```

### Tham số

- `orientation`
  - : Hướng cần khóa màn hình vào. Đây có thể là một chuỗi hoặc một mảng các chuỗi. Truyền nhiều chuỗi cho phép màn hình chỉ xoay ở các hướng đã chọn.

    Các chuỗi sau đại diện cho các yêu cầu hướng có thể mà bạn có thể chỉ định:
    - `portrait-primary`
      - : Đại diện cho hướng của màn hình khi nó ở chế độ dọc chính. Một màn hình được coi là ở chế độ dọc chính nếu thiết bị được giữ ở vị trí bình thường và vị trí đó ở chế độ dọc, hoặc nếu vị trí bình thường của thiết bị ở chế độ ngang và thiết bị được xoay 90° theo chiều kim đồng hồ. Vị trí bình thường phụ thuộc vào thiết bị.

    - `portrait-secondary`
      - : Đại diện cho hướng của màn hình khi nó ở chế độ dọc phụ. Một màn hình được coi là ở chế độ dọc phụ nếu thiết bị được xoay 180° từ vị trí bình thường và vị trí đó ở chế độ dọc, hoặc nếu vị trí bình thường của thiết bị ở chế độ ngang và thiết bị được xoay 90° ngược chiều kim đồng hồ. Vị trí bình thường phụ thuộc vào thiết bị.
    - `landscape-primary`
      - : Đại diện cho hướng của màn hình khi nó ở chế độ ngang chính. Một màn hình được coi là ở chế độ ngang chính nếu thiết bị được giữ ở vị trí bình thường và vị trí đó ở chế độ ngang, hoặc nếu vị trí bình thường của thiết bị ở chế độ dọc và thiết bị được xoay 90° theo chiều kim đồng hồ. Vị trí bình thường phụ thuộc vào thiết bị.
    - `landscape-secondary`
      - : Đại diện cho hướng của màn hình khi nó ở chế độ ngang phụ. Một màn hình được coi là ở chế độ ngang phụ nếu thiết bị được xoay 180° từ vị trí bình thường và vị trí đó ở chế độ ngang, hoặc nếu vị trí bình thường của thiết bị ở chế độ dọc và thiết bị được xoay 90° ngược chiều kim đồng hồ. Vị trí bình thường phụ thuộc vào thiết bị.
    - `portrait`
      - : Đại diện cho cả `portrait-primary` và `portrait-secondary`.
    - `landscape`
      - : Đại diện cho cả `landscape-primary` và `landscape-secondary`.
    - `default`
      - : Đại diện cho `portrait-primary` hoặc `landscape-primary` tùy thuộc vào hướng tự nhiên của thiết bị. Ví dụ, nếu độ phân giải màn hình là 1280\*800, `default` sẽ đặt thành ngang, nếu độ phân giải là 800\*1280, `default` sẽ đặt thành dọc.

> [!NOTE]
> Có thể đặt nhiều khóa cùng lúc. Vì vậy, nếu khóa được đặt cho chỉ một hướng, hướng màn hình sẽ không bao giờ thay đổi cho đến khi hướng màn hình được mở khóa. Ngược lại, hướng màn hình sẽ thay đổi từ hướng này sang hướng khác miễn là các hướng nằm trong số các hướng mà thiết bị đã được khóa.

### Giá trị trả về

Trả về `true` nếu hướng được ủy quyền để khóa hoặc `false` nếu việc khóa hướng bị từ chối. Lưu ý rằng giá trị trả về không cho biết rằng hướng màn hình thực sự đã bị khóa: có thể có độ trễ.

## Ví dụ

### Sử dụng với tham số chuỗi

```js
screen.lockOrientationUniversal =
  screen.lockOrientation ||
  screen.mozLockOrientation ||
  screen.msLockOrientation;

if (screen.lockOrientationUniversal("landscape-primary")) {
  // Hướng đã được khóa
} else {
  // Khóa hướng thất bại
}
```

### Sử dụng với tham số `Array`

```js
screen.lockOrientationUniversal =
  screen.lockOrientation ||
  screen.mozLockOrientation ||
  screen.msLockOrientation;

if (
  screen.lockOrientationUniversal(["landscape-primary", "landscape-secondary"])
) {
  // Hướng đã được khóa
} else {
  // Khóa hướng thất bại
}
```

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của bất kỳ đặc tả kỹ thuật nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn.

Sử dụng {{domxref("ScreenOrientation.lock()")}} thay thế.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Screen.orientation")}}
- {{DOMxRef("Screen.unlockOrientation()")}}
- Sự kiện {{DOMxRef("Screen.orientationchange_event", "orientationchange")}}
- [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)
