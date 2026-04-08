---
title: prefers-reduced-motion
slug: Web/CSS/Reference/At-rules/@media/prefers-reduced-motion
page-type: css-media-feature
browser-compat: css.at-rules.media.prefers-reduced-motion
sidebar: cssref
---

> [!WARNING]
> Một ví dụ nhúng ở cuối trang này có chuyển động co giãn có thể gây khó chịu cho một số độc giả. Những độc giả mắc rối loạn tiền đình do chuyển động có thể muốn bật tính năng giảm chuyển động trên thiết bị của họ trước khi xem hoạt ảnh.

Đặc trưng media CSS **`prefers-reduced-motion`** được dùng để phát hiện xem người dùng có bật cài đặt trên thiết bị của họ để giảm thiểu lượng chuyển động không cần thiết hay không. Cài đặt này được dùng để thông báo cho trình duyệt trên thiết bị rằng người dùng thích giao diện loại bỏ, giảm thiểu hoặc thay thế các hoạt ảnh dựa trên chuyển động.

Những hoạt ảnh như vậy có thể gây khó chịu cho những người mắc [rối loạn tiền đình do chuyển động](https://www.a11yproject.com/posts/understanding-vestibular-disorders/). Các hoạt ảnh như co giãn hoặc xoay chuyển các đối tượng lớn có thể là tác nhân kích hoạt rối loạn tiền đình.

## Cú pháp

- `no-preference`
  - : Cho biết người dùng chưa bày tỏ sở thích trên thiết bị. Giá trị từ khóa này được đánh giá là false.
- `reduce`
  - : Cho biết người dùng đã bật cài đặt trên thiết bị của họ để giảm chuyển động. Giá trị từ khóa `reduce` được đánh giá là true; do đó, `@media (prefers-reduced-motion)` tương đương với `@media (prefers-reduced-motion: reduce)`.

## Tùy chọn người dùng

Đối với Firefox, yêu cầu `reduce` được chấp nhận nếu:

- Trong GTK/GNOME: Cài đặt > Trợ năng > Nhìn > Giảm hoạt ảnh được bật.
  - Trong các phiên bản GNOME cũ hơn, GNOME Tweaks > tab Chung (hoặc Giao diện, tùy phiên bản) > Hoạt ảnh bị tắt.
  - Ngoài ra, thêm `gtk-enable-animations = false` vào khối `[Settings]` của [tệp cấu hình GTK 3](https://wiki.archlinux.org/title/GTK#Configuration).
  - Ngoài ra, hãy thử chạy `gsettings set org.gnome.desktop.interface enable-animations false` để Firefox (và các chương trình khác dựa vào GTK phiên bản 4) tuân theo cài đặt `reduce`.

- Trong Plasma/KDE: Cài đặt hệ thống > Hành vi không gian làm việc -> Hành vi chung > "Tốc độ hoạt ảnh" được đặt hết về bên phải thành "Tức thì".
  - Ngoài ra, thêm `AnimationDurationFactor=0` vào khối `[KDE]` của `~/.config/kdeglobals`.
  - Hoặc chỉ cần chạy `kwriteconfig6 --key AnimationDurationFactor 0` trong terminal.
- Trong Windows 10: Cài đặt > Trợ năng > Hiển thị > Hiển thị hoạt ảnh trong Windows.
- Trong Windows 11: Cài đặt > Trợ năng > Hiệu ứng hình ảnh > Hiệu ứng hoạt ảnh
- Trong macOS: Cài đặt hệ thống > Trợ năng > Hiển thị > Giảm chuyển động.
- Trong iOS: Cài đặt > Trợ năng > Chuyển động.
- Trong Android 9+: Cài đặt > Trợ năng > Xóa hoạt ảnh.
- Trong Firefox `about:config`: Thêm tùy chọn số gọi là `ui.prefersReducedMotion` và đặt giá trị thành `0` để hoạt ảnh đầy đủ hoặc `1` để chỉ định sở thích giảm chuyển động. Các thay đổi đối với tùy chọn này có hiệu lực ngay lập tức.

## Ví dụ

Ví dụ này sử dụng hoạt ảnh co giãn để minh họa `prefers-reduced-motion`. Nếu bạn bật cài đặt giảm chuyển động trong tùy chọn trợ năng trên thiết bị của mình, media query `prefers-reduced-motion` sẽ phát hiện sở thích của bạn và CSS trong các quy tắc giảm chuyển động, với cùng [độ ưu tiên](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) nhưng đến sau trong [thứ tự nguồn CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#source_order), sẽ được ưu tiên. Kết quả là, [hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations/Using) trên hộp sẽ chuyển thành hoạt ảnh `dissolve` (mờ dần), là hoạt ảnh nhẹ nhàng hơn và không phải là tác nhân kích hoạt rối loạn tiền đình.

### Giảm nhẹ hoạt ảnh co giãn

#### HTML

```html
<div class="animation">animated box</div>
```

#### CSS

```css
.animation {
  animation: pulse 1s linear infinite both;
  background-color: purple;
}

/* Tone down the animation to avoid vestibular motion triggers. */
@media (prefers-reduced-motion: reduce) {
  .animation {
    animation: dissolve 4s linear infinite both;
    background-color: green;
    text-decoration: overline;
  }
}
```

```css hidden
.animation {
  color: white;
  font: 1.2em sans-serif;
  width: 10em;
  padding: 1em;
  border-radius: 1em;
  text-align: center;
}

@keyframes pulse {
  0% {
    transform: scale(1);
  }
  25% {
    transform: scale(0.9);
  }
  50% {
    transform: scale(1);
  }
  75% {
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
  }
}

@keyframes dissolve {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0.3;
  }
  100% {
    opacity: 1;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Toning down the animation scaling")}}

Bạn có thể bật cài đặt giảm chuyển động trên [thiết bị của mình](#user_preferences) để xem sự thay đổi trong co giãn hoạt ảnh. Ví dụ này sử dụng màu nền và đường kẻ trên văn bản để làm nổi bật trực quan khi hoạt ảnh keyframe chuyển đổi khi bật hoặc tắt cài đặt.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- HTTP Header {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}} [User Agent Client Hint](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints)
- [Giới thiệu về media query giảm chuyển động](https://css-tricks.com/introduction-reduced-motion-media-query/) trên CSS-Tricks (2019)
- [Thiết kế đáp ứng cho chuyển động](https://webkit.org/blog/7551/responsive-design-for-motion/) trên WebKit Blog (2017)
