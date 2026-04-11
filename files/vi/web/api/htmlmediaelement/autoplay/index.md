---
title: "HTMLMediaElement: thuộc tính autoplay"
short-title: autoplay
slug: Web/API/HTMLMediaElement/autoplay
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.autoplay
---

{{APIRef("HTML DOM")}}

**`HTMLMediaElement.autoplay`**
thuộc tính phản ánh thuộc tính HTML [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay), biểu thị
việc phát lại có tự động bắt đầu ngay khi có đủ phương tiện để thực hiện hay không
như vậy không bị gián đoạn.

Phần tử phương tiện có nguồn là {{domxref("MediaStream")}} và có
Thuộc tính `autoplay` là `true` sẽ bắt đầu phát lại khi nó trở thành
hoạt động (nghĩa là khi {{domxref("MediaStream.active")}} trở thành `true`).

> [!NOTE]
> Các trang web tự động phát âm thanh (hoặc video có âm thanh
> track) có thể là một trải nghiệm khó chịu cho người dùng, vì vậy cần tránh khi
> khả thi. Nếu bạn phải cung cấp chức năng tự động phát, bạn nên chọn tham gia
> (yêu cầu người dùng kích hoạt nó một cách cụ thể). Tuy nhiên, tính năng tự động phát có thể hữu ích khi
> tạo các phần tử phương tiện có nguồn sẽ được đặt sau, dưới sự kiểm soát của người dùng.

Để có cái nhìn sâu hơn về tự động phát, chặn tự động phát và cách phản hồi khi
tính năng tự động phát bị chặn bởi trình duyệt của người dùng, hãy xem bài viết của chúng tôi [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay).

## Giá trị

Giá trị boolean là `true` nếu phần tử phương tiện sẽ
bắt đầu phát lại ngay khi đã tải đủ nội dung để cho phép phát lại mà không cần
gián đoạn.

> [!NOTE]
> Một số trình duyệt cung cấp cho người dùng khả năng ghi đè
> `autoplay` để ngăn âm thanh hoặc video bị gián đoạn khi phát
> mà không được phép hoặc trong nền. Thực ra đừng dựa vào `autoplay`
> bắt đầu phát lại và thay vào đó hãy sử dụng {{domxref("HTMLMediaElement.play_event", 'play')}}
> sự kiện.

## Ví dụ

```html
<video id="video" controls>
  <source
    src="https://player.vimeo.com/external/250688977.sd.mp4?s=d14b1f1a971dde13c79d6e436b88a6a928dfe26b&profile_id=165" />
</video>
```

```js
// Disable autoplay (recommended)
// false is the default value
document.querySelector("#video").autoplay = false;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.autoplay`
- {{HTMLElement("audio")}}, {{HTMLElement("video")}}
