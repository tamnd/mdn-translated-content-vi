---
title: "Screen: phương thức unlockOrientation()"
short-title: unlockOrientation()
slug: Web/API/Screen/unlockOrientation
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Screen.unlockOrientation
---

{{APIRef("Screen Orientation API")}}{{Deprecated_Header}}

Phương thức **`Screen.unlockOrientation()`** xóa tất cả các khóa màn hình trước đó được đặt bởi trang/app. Nên sử dụng phương thức {{DOMxRef("ScreenOrientation.unlock()")}} thay thế.

> [!WARNING]
> Tính năng này đã lỗi thời và nên được tránh. Sử dụng phương thức {{DOMxRef("ScreenOrientation.unlock()")}} thay thế.

> [!NOTE]
> Phương thức này chỉ hoạt động cho các ứng dụng Web đã cài đặt hoặc cho các trang Web ở [chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API).

## Cú pháp

```js-nolint
unlockOrientation()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu hướng đã được mở khóa thành công hoặc `false` nếu việc mở khóa hướng thất bại.

## Ví dụ

```js
const unlockOrientation =
  screen.unlockOrientation ||
  screen.mozUnlockOrientation ||
  screen.msUnlockOrientation ||
  (screen.orientation && screen.orientation.unlock);

if (unlockOrientation()) {
  // hướng đã được mở khóa
} else {
  // mở khóa hướng thất bại
}
```

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của bất kỳ đặc tả kỹ thuật nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn.

Sử dụng {{domxref("ScreenOrientation.unlock()")}} thay thế.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Screen.orientation")}}
- {{DOMxRef("Screen.lockOrientation()")}}
- Sự kiện {{DOMxRef("Screen.orientationchange_event", "orientationchange")}}
- [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)
