---
title: "MediaQueryList: thuộc tính media"
short-title: media
slug: Web/API/MediaQueryList/media
page-type: web-api-instance-property
browser-compat: api.MediaQueryList.media
---

{{APIRef("CSSOM view API")}}

Thuộc tính chỉ đọc **`media`** của giao diện {{DOMxRef("MediaQueryList")}} là một chuỗi đại diện cho media query đã được tuần tự hóa.

## Giá trị

Một chuỗi đại diện cho media query đã được tuần tự hóa.

## Ví dụ

Ví dụ này chạy media query `(width <= 600px)` và hiển thị giá trị thuộc tính `media` của `MediaQueryList` kết quả trong một {{HTMLElement("span")}}.

### JavaScript

```js
let mql = window.matchMedia("(width <= 600px)");

document.querySelector(".mq-value").innerText = mql.media;
```

Đoạn mã JavaScript truyền media query cần khớp vào {{DOMxRef("Window.matchMedia", "matchMedia()")}} để biên dịch, sau đó đặt {{DOMxRef("HTMLElement.innerText", "innerText")}} của `<span>` thành giá trị thuộc tính `media` của kết quả.

### HTML

```html
<span class="mq-value"></span>
```

Một `<span>` để nhận đầu ra.

```css hidden
.mq-value {
  font:
    18px "Arial",
    sans-serif;
  font-weight: bold;
  color: #8888ff;
  padding: 0.4em;
  border: 1px solid #ddddee;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", "60")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Sử dụng media query từ code](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
- {{DOMxRef("window.matchMedia()")}}
- {{DOMxRef("MediaQueryList")}}
- {{DOMxRef("MediaQueryListEvent")}}
